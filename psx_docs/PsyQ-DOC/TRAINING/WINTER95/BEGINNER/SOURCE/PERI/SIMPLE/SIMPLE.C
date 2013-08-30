/*
 * File:simple.c
 * メモリカードへのリードとライトのサンプル
*/
/* 非同期アクセスの場合はこのマクロを定義する */
/*#define NOWAIT */

#include <kernel.h>
#include <sys/file.h>

/* テスト用ファイルの名称とサイズ（スロット単位） */
char name[]="bu00:test001";
#define SIZE 3

unsigned long ev0,ev1,ev2,ev3;
unsigned char buf[SIZE*0x2000],data[SIZE*0x2000],cbuf[2][34];


main()
{
    long i,fd,ret,max;
    unsigned char *p;

    /* カードとコントローラの初期化 */
    /*他のライブラリとの同時運用ではChangeClearPAD()が必須*/
    /*また他のライブラリを先に初期するかResetCakkback()を最初に実行する*/
#ifdef GRAPHIC
    ResetCallback();
#endif
    cbuf[0][0] = cbuf[1][0] = 0xff;
    InitPAD(&cbuf[0][0],34,&cbuf[1][0],34);
    StartPAD();
    InitCARD(1);
    StartCARD();
    _bu_init();
#ifdef GRAPHIC
    ChangeClearPAD(0);
#endif
		
    /* イベントの初期化 */
    ev0 = OpenEvent(SwCARD, EvSpIOE, EvMdNOINTR, NULL);
    ev1 = OpenEvent(SwCARD, EvSpERROR, EvMdNOINTR, NULL);
    ev2 = OpenEvent(SwCARD, EvSpTIMOUT, EvMdNOINTR, NULL);
    ev3 = OpenEvent(SwCARD, EvSpNEW, EvMdNOINTR, NULL);
    EnableEvent(ev0);  EnableEvent(ev1);  EnableEvent(ev2);  EnableEvent(ev3);
	
    /* データの初期化 */
    for(i=0;i<SIZE*0x2000;i++) {
        data[i] = i/128;    buf[i] = 0xff;
    }

    /* ここのカードの存在とフォーマットテストを置くべき*/

    /* テスト用ファイルの消去 */
    delete(name);

    /* テスト用ファイルの生成 */
    fd = open(name,O_CREAT|SIZE<<16);
    close(fd);

    printf("write\n");
    /* ライト*/
#ifdef NOWAIT
    fd = open(name,O_WRONLY|O_NOWAIT);
    for(i=0,p=data;i<SIZE*0x2000/512;i++,p+=512) {
        _clear_event();
        while(write(fd,p,512)==0)
            ;
        if((ret = _card_event())==1)  break;
    }
    close(fd); max = i; printf("max:%d\n",max);
#else
    fd = open(name,O_WRONLY);
    write(fd,data,SIZE*0x2000);
    close(fd);
#endif

    printf("read\n");
    /* リード */
#ifdef NOWAIT
    fd = open(name,O_RDONLY|O_NOWAIT);
    for(i=0,p=buf;i<max;i++,p+=512) {
        _clear_event();
        while(read(fd,p,512)==0)
            ;
        if((ret = _card_event())==1)  break;
        lseek(fd,128,SEEK_CUR);                  /* バグ対策 */
    }
    close(fd);  max = i;  printf("max:%d\n",max);
#else
    fd = open(name,O_RDONLY);
    read(fd,buf,SIZE*0x2000);
    close(fd);
#endif

    /* 比較 */
    for(i=0;i<max*512;i++) {
        if(data[i]!=buf[i]) {
            printf("error\n");  break;
        }
/*      printf("(%04x:%02x:%02x)\n",i,data[i],buf[i]);*/
    }
    if(i>=max*512)  printf("correct\n");

    /* 後処理 */
eoj:
    CloseEvent(ev0);  CloseEvent(ev1);  CloseEvent(ev2);  CloseEvent(ev3);
    printf("end of test\n");
}

/* イベントのテスト（ブロック型） */
_card_event()
{
    while(1) {
        if(TestEvent(ev0)==1)         /* IOE */
            return 0;
        if(TestEvent(ev1)==1)         /* ERROR */
            return 1;
        if(TestEvent(ev2)==1)         /* TIMEOUT */
            return 2;
        if(TestEvent(ev3)==1)         /* NEW CARD */
            return 3;
    }
}

/* イベントのクリア */
_clear_event()
{
    TestEvent(ev0);  TestEvent(ev1);  TestEvent(ev2);  TestEvent(ev3);
}
 
