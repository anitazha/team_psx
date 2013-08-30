/*
 * File:cs2.c
 * Memory Card Server ( Event Driven )    Version 2.0
 * オリジナルイベントでカードの挿入をメインフローに通知する。
*/

#include <r3000.h>
#include <asm.h>
#include <kernel.h>

/*
        ステータスマシン仕様
       =======================================================================
        イベント    ステータス   内部動作
       ------------------------------------------------------------------------
        IOE         0            return;
                                 UnDeliverEvent(SwCARD,all);
                    1            DeliverEvent(DescUEV|0x0001, MyEvSpREADY|chan);
                    2            _card_load(chan);
                                 return; 
                    end          st++; 
        ------------------------------------------------------------------------
         NEW        0            return;
                                 UnDeliverEvent(SwCARD,all);
                    1            _card_clear();
                    2            ReEntry(); return;
                    3            DeliverEvent(DescUEV|0x0001, MyEvSpUNF|chan); 
                                 return; 
                    end          st++; 
        ------------------------------------------------------------------------
         TIMOUT     0            return;
                    other        UnDeliverEvent(SwCARD,all);
                                 return ReEntry();
        ------------------------------------------------------------------------
         ERROR      0            return;
                    other        UnDeliverEvent(SwCARD,all);
                                 return ReEntry();
        ------------------------------------------------------------------------


         ステータス (long stの値)
        ==============================
         st  Contents
        -------------------------------
         0   idle
         1   _card_info()
         2   _card_clear()
         3   _card_load()
        -------------------------------


        API
       ===============================
        function        Content
       -------------------------------
        CsInit()        Cold start
        CsHotStart()    Hot start
       -------------------------------


        オリジナルイベント ( DescUEV|0x1000 )
       ==============================================================
        Spec.           ステータス       通知される状態
       --------------------------------------------------------------
        MyEvSpREADY     working          old card
        MyEvSpNEW       stop             first access
        MyEvSpUNF       stop             unformatted card detected
       --------------------------------------------------------------

*/

#define MyEvSpREADY 0x1000
#define MyEvSpNEW   0x2000
#define MyEvSpUNF   0x4000

static _clear_event();
static _ioe_handler();
static _new_handler();
static _timeout_handler();
static _error_handler();
static ReEntry();
static _work1();

/* HwCARD関連 */
static _deliver_sw0(),_deliver_sw1(),_deliver_sw2();
static unsigned long ev10,ev11,ev12;
long hw;	/* HwCARD処理スイッチ（SwCARDとの２重処理を調停する） */

/* SwCARD関連 */
static unsigned long ev0,ev1,ev2,ev3;

/* ステータスマシン */
static unsigned long st,chan;


/* ホットスタートAPI */
CsHotStart()
{
	_clear_event();
	ReEntry();
}


/* サーバ停止API */
CsStop()
{
	st = 0;
	_clear_event();
}


/* イベントのクリア（HwCARDを無効にする。） */
static
_clear_event()
{
 	UnDeliverEvent(SwCARD,EvSpIOE);
 	UnDeliverEvent(SwCARD,EvSpERROR);
 	UnDeliverEvent(SwCARD,EvSpNEW);
 	UnDeliverEvent(SwCARD,EvSpTIMOUT);
 	UnDeliverEvent(HwCARD,EvSpIOE);
 	UnDeliverEvent(HwCARD,EvSpERROR);
 	UnDeliverEvent(HwCARD,EvSpTIMOUT);
	hw = 0;
}


/* SwCARDイベントハンドラ群 */
static
_ioe_handler()
{
	if(st==0) return;
	_clear_event();
	switch(st) {
	case 2: 	if(_card_load(chan)==0) goto eoj;
			break;
	case 1: 	DeliverEvent(DescUEV|0x0001, MyEvSpREADY|chan);
			goto eoj;
	case 3:	DeliverEvent(DescUEV|0x0001, MyEvSpNEW|chan);
			return;	/* stop server during main flow ope. */
eoj:
	default:	return ReEntry();
	}		
	st++; 
	return;
}


static
_new_handler()
{
	if(st==0) return;
	_clear_event();
	switch(st) {
	case 1:	if(_card_clear(chan)==0) goto error;
			hw = 1;
			break;
	case 3:	DeliverEvent(DescUEV|0x0001, MyEvSpUNF|chan); 
			return;	/* stop server during main flow ope. */
	default:		
error:		return ReEntry();
	}
	st++; 
	return;
}


static
_timeout_handler()
{
	_copy_back();     /* タイムアウト対策 */
	if(st==0) return;
	_clear_event();
	return ReEntry();
}


static
_error_handler()
{
	_copy_back();     /* タイムアウト対策 */
	if(st==0)	return;
	_clear_event();
	return ReEntry();
}


/* HwCARDイベントハンドラ群 */
static
_deliver_sw0()
{
	if(hw==0) return;
	DeliverEvent(SwCARD,EvSpIOE);
}


static
_deliver_sw1()
{
	if(hw==0) return;
	DeliverEvent(SwCARD,EvSpERROR);
}


static
_deliver_sw2()
{
	if(hw==0) return;
	DeliverEvent(SwCARD,EvSpTIMOUT);
}


/* 初期化API */
CsInit()
{
	ev0 = OpenEvent(SwCARD, EvSpIOE, EvMdINTR, _ioe_handler);
	ev1 = OpenEvent(SwCARD, EvSpERROR, EvMdINTR, _error_handler);
	ev2 = OpenEvent(SwCARD, EvSpTIMOUT, EvMdINTR, _timeout_handler);
	ev3 = OpenEvent(SwCARD, EvSpNEW, EvMdINTR, _new_handler);
	ev10 = OpenEvent(HwCARD, EvSpIOE, EvMdINTR, _deliver_sw0);
	ev11 = OpenEvent(HwCARD, EvSpERROR, EvMdINTR, _deliver_sw1);
	ev12 = OpenEvent(HwCARD, EvSpTIMOUT, EvMdINTR, _deliver_sw2);

	_init_pad();
	InitCARD(1);
	StartCARD();
	_bu_init();
	ChangeClearPAD(0);

	hw = 0;

	EnableEvent(ev0);
	EnableEvent(ev1);
	EnableEvent(ev2);
	EnableEvent(ev3);
	EnableEvent(ev10);
	EnableEvent(ev11);
	EnableEvent(ev12);

	return _work1(chan=0x00); 
}


/* 内部関数群 */
static
ReEntry()
{
 	return _work1((chan=0x10-chan)); 
}


static
_work1(ch)
long ch;
{
 	if(_card_info(ch)==1)
		return (st=1); 
	return(st=0);
}


/* コントローラ処理部 */
/* 受信バッファ（待避領域を含む） */
static unsigned char _c_buf[4][34];

/* コントローラ初期化API */
_init_pad()
{
	InitPAD(&_c_buf[0][0],34,&_c_buf[1][0],34);
	_c_buf[2][0] = _c_buf[3][0] = 0xff;
	StartPAD();
}

/* コントローラ読み取りAPI */
_get_cont(chan)
long chan;
{
	unsigned long w;

	if(_c_buf[chan][0]==0xff)   return 0x8000ffff;
	memcpy(&_c_buf[chan+2], &_c_buf[chan], 34);
	w = (unsigned long)_c_buf[chan][2];
	return (long)( (w<<8) | (unsigned long)_c_buf[chan][3] );
}

/* メモリカード・コントローラ間の干渉対策 */
_copy_back()
{
		memcpy(&_c_buf[0], &_c_buf[2], 34);
		memcpy(&_c_buf[1], &_c_buf[3], 34);
}


