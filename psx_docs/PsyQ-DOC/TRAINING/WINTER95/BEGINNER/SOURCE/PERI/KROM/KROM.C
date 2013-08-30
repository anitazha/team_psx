/*
 * 関数_get_font()は指定されたシフトJISコードに対応するフォントパタン
 * をVRAMに転送して16ビットテクスチャとして使用できる形式に展開したも
 * のを返します。
/*

unsigned long
_get( sjis )
unsigned char *sjis;
{
        unsigned short sjiscode;

        sjiscode = *sjis << 8 | *(sjis+1);
        return Krom2RawAdd(sjiscode);  /* 漢字フォントパタンアドレスの取得 */
}

#define COLOR 0x4210
#define BLACK 0x3000

_get_font( s, data )
char *s;
unsigned short *data;
{
        unsigned short *p, *d, w;
        long i,j;

        if((p=(unsigned short *)_get(s))!=-1) {
                d = data;
                for(i=0;i<15;i++) {
                       for(j=7;j>=0;j--)
                                *d++ = (((*p>>j)&0x01)==0x01)?COLOR:BLACK;
                       for(j=15;j>=8;j--)
                                *d++ = (((*p>>j)&0x01)==0x01)?COLOR:BLACK;
                        p++;
                               }
                else {
                        for(d=data,i=0;i<2*16*16;i++)
                                *d++ = BLACK;
                }
        }
}
