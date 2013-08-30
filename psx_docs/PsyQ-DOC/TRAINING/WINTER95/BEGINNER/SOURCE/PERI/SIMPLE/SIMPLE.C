/*
 * File:simple.c
 * �������J�[�h�ւ̃��[�h�ƃ��C�g�̃T���v��
*/
/* �񓯊��A�N�Z�X�̏ꍇ�͂��̃}�N�����`���� */
/*#define NOWAIT */

#include <kernel.h>
#include <sys/file.h>

/* �e�X�g�p�t�@�C���̖��̂ƃT�C�Y�i�X���b�g�P�ʁj */
char name[]="bu00:test001";
#define SIZE 3

unsigned long ev0,ev1,ev2,ev3;
unsigned char buf[SIZE*0x2000],data[SIZE*0x2000],cbuf[2][34];


main()
{
    long i,fd,ret,max;
    unsigned char *p;

    /* �J�[�h�ƃR���g���[���̏����� */
    /*���̃��C�u�����Ƃ̓����^�p�ł�ChangeClearPAD()���K�{*/
    /*�܂����̃��C�u�������ɏ������邩ResetCakkback()���ŏ��Ɏ��s����*/
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
		
    /* �C�x���g�̏����� */
    ev0 = OpenEvent(SwCARD, EvSpIOE, EvMdNOINTR, NULL);
    ev1 = OpenEvent(SwCARD, EvSpERROR, EvMdNOINTR, NULL);
    ev2 = OpenEvent(SwCARD, EvSpTIMOUT, EvMdNOINTR, NULL);
    ev3 = OpenEvent(SwCARD, EvSpNEW, EvMdNOINTR, NULL);
    EnableEvent(ev0);  EnableEvent(ev1);  EnableEvent(ev2);  EnableEvent(ev3);
	
    /* �f�[�^�̏����� */
    for(i=0;i<SIZE*0x2000;i++) {
        data[i] = i/128;    buf[i] = 0xff;
    }

    /* �����̃J�[�h�̑��݂ƃt�H�[�}�b�g�e�X�g��u���ׂ�*/

    /* �e�X�g�p�t�@�C���̏��� */
    delete(name);

    /* �e�X�g�p�t�@�C���̐��� */
    fd = open(name,O_CREAT|SIZE<<16);
    close(fd);

    printf("write\n");
    /* ���C�g*/
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
    /* ���[�h */
#ifdef NOWAIT
    fd = open(name,O_RDONLY|O_NOWAIT);
    for(i=0,p=buf;i<max;i++,p+=512) {
        _clear_event();
        while(read(fd,p,512)==0)
            ;
        if((ret = _card_event())==1)  break;
        lseek(fd,128,SEEK_CUR);                  /* �o�O�΍� */
    }
    close(fd);  max = i;  printf("max:%d\n",max);
#else
    fd = open(name,O_RDONLY);
    read(fd,buf,SIZE*0x2000);
    close(fd);
#endif

    /* ��r */
    for(i=0;i<max*512;i++) {
        if(data[i]!=buf[i]) {
            printf("error\n");  break;
        }
/*      printf("(%04x:%02x:%02x)\n",i,data[i],buf[i]);*/
    }
    if(i>=max*512)  printf("correct\n");

    /* �㏈�� */
eoj:
    CloseEvent(ev0);  CloseEvent(ev1);  CloseEvent(ev2);  CloseEvent(ev3);
    printf("end of test\n");
}

/* �C�x���g�̃e�X�g�i�u���b�N�^�j */
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

/* �C�x���g�̃N���A */
_clear_event()
{
    TestEvent(ev0);  TestEvent(ev1);  TestEvent(ev2);  TestEvent(ev3);
}
 
