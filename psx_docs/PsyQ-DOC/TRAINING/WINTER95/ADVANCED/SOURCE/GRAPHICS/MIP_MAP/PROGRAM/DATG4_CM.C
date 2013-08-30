/*
 *  divide routine for POLY_GT4
 *
 *      ADVANCED DEVELOPMENT SEMINAR VERSION
 *			Nov,  10, 1995
 *
 *  This sample contains three topics using DM(Direct Mapping) method
 *   1 active sub divide
 *   2 polygon juction
 *   3 selecting Z sort point
 *
 *		Copyright (C) 1995  Sony Computer Entertainment
 *		All rights Reserved
 */

#include <sys/types.h>
#include <libetc.h>
#include <libgte.h>
#include <inline.h>
#include <gtemac.h>
#include <libgpu.h>
#include <libgs.h>
#include <asm.h>		/* use DM , must includes */
extern int DivideMode,DivideNumber,SukimaMode;

/* MIN(x1,x2,x3,x4) = x5 , MAX(x1,x2,x3,x4) = x6 */
#define minmax4(x1,x2,x3,x4,x5,x6) x1>x2?(x6=x1,x5=x2):(x5=x1,x6=x2),\
                                   x3>x6?x6=x3:x3<x5?x5=x3:0,\
                                   x4>x6?x6=x4:x4<x5?x5=x4:0

#define MAX_POLY_WIDTH (1023/2)	/* max polygon distance X */
#define MAX_POLY_HIGHT (511/2)	/* max polygon distance Y */

typedef struct
{
  u_short mode0,mode1;		/* for debugging */
  u_long limit;			/* divide limit */
  long   hwd,vwd;		/* dummy */
  int    shift;			/* OT bit shift */
  u_long  *org;			/* OT org */
  u_long   *pk;			/* packet base */
  long     otz;			/* gte sz */
  long   adivz;			/* dummy */
  long    flg0;			/* gte flag */
  long     flg;			/* gte flag */
  short  minx,miny,maxx,maxy;	/* polygon distance min-max */
  short  hwd0,vwd0;		/* resolution of screen (center orign) */
  long    nearz;                /* nearz = PROJECTION/2 */
  u_long   *tag;		/* work temprly for addPrim */
  long    sz4[4];		/* work sz */
  POLY_GT4  si;			/* work packet */
} ADIV_GT4;

/* arguments for recursive call */
typedef struct {
  VERTC   vt[4];		/* 4 vertex with color & UV */
} ADIV_P_GT4;

/* global clut & tpage */
extern u_short clut,tpage;

long NEARZ;			/* projection/2 */

/* setting VERTC macro only for POLY_GT4 */
#define set_xyzuvrgb(in,x,y,z,u,v,r0,g0,b0) in.vx=x,in.vy=y,in.vz=z,\
in.tu = u,in.tv = v,in.col.r = r0,in.col.g=g0,in.col.b=b0,in.col.cd = 0x3c


/*
 * 1 texture gour polygon for active sub divide
 * pk : packet base address
 * shift: OT bit shift
 * ot:  pointer of OT handler
 * scratch : data cache address
 */
long sort_tg_plane(pk,shift,ot,scratch)
PACKET *pk;
int  shift;
GsOT   *ot;
u_long *scratch;
{
  register ADIV_GT4  *ifo;	/* work on data cache */
  register ADIV_P_GT4 *p1;	/* parameter of Adiv_gt4 */
  static void Adiv_gt4();	/* active divide fuctions for gour texture */

  ifo = (ADIV_GT4 *)scratch;	/* allocate work on data cache */
  scratch += sizeof(ADIV_GT4)/4;
  p1  = (ADIV_P_GT4 *)scratch;	/* allocate ADIV_P_GT4 on data cache */
  ifo->limit    = DivideNumber;	/* recursive call max limit */
  ifo->hwd0     = HWD0/2;	/* screen resolution x (center orign) */
  ifo->vwd0     = VWD0/2;	/* screen resolution y (center orign) */
  ifo->org      = (u_long *)ot->org;
  ifo->shift    = shift;	/* gte otz shift */
  ifo->pk       = (u_long *)pk;	/* packet base address */
  ifo->mode0    = (u_short)DivideMode;
  ifo->mode1    = (u_short)SukimaMode;
  ifo->nearz    = NEARZ;	/* set prjection/2 */
  ifo->hwd      = 0;		/* DEBUG : counter of polygons */
  setPolyGT4(&ifo->si);
  
  /* quad polygon parameter difinition */
  set_xyzuvrgb(p1->vt[0],-1000,-1000,1000,0,0,0xff,0x00,0x0);
  set_xyzuvrgb(p1->vt[1],1000,-1000,1000,255,0,0x00,0xff,0x0);
  set_xyzuvrgb(p1->vt[2],-1000,1000,1000,0,255,0x00,0x00,0xff);
  set_xyzuvrgb(p1->vt[3],1000,1000,1000,255,255,0xff,0xff,0xff);
  
  ifo->si.clut  = clut;
  ifo->si.tpage = tpage;
  Adiv_gt4(scratch,ifo,0);	/* active sub divide */
  pk = (PACKET *)ifo->pk;	/* write back packet base */
  
/*  return (u_long *)pk;*/
  return (long)ifo->hwd;
}

/*
 * scratch : pointer of paramter on data cache
 * info: pointer of work on data cache
 * level : recursive level
 */
static void Adiv_gt4(scratch,ifo,level)
u_long *scratch;
ADIV_GT4 *ifo;
int level;
{
  register ADIV_P_GT4 *in,*out;
  register POLY_GT4 *si;
  
  static void sukima();
  static int outline();
  static void bunCV();
  
  in  = (ADIV_P_GT4 *)scratch;
  scratch += (sizeof(ADIV_P_GT4)/4);
  out = (ADIV_P_GT4 *)scratch;	/* allocate next ADIV_P_GT4 on data cache*/
  
  /* load vertex 3 to the gte register */
  gte_ldv3(&in->vt[0].vx,&in->vt[1].vx,&in->vt[2].vx);
  gte_rtpt();			/* start gte caliculate three vertexis  */
  
  si = &ifo->si;
  *(u_short *)&si->u0 = *(u_short *)&in->vt[0].tu; /* copy uv to packets */
  *(u_short *)&si->u1 = *(u_short *)&in->vt[1].tu;
  *(u_short *)&si->u2 = *(u_short *)&in->vt[2].tu;
  gte_stflg(&ifo->flg);		/* get the gte flag */
  
  gte_stsxy3_gt4((long *)si);	/* store the result of vertexis caliculation */
  
  gte_ldv0(&in->vt[3].vx);	/* load another vertex to the gte*/
  gte_rtps();			/* start gte caliculate one vertex */
  *(u_short *)&si->u3 = *(u_short *)&in->vt[3].tu; /* copy uv to packets */
  gte_stflg(&ifo->flg0);	/* get the flag of the last caliculation */
  /* merge first 3 vertex and 1 vertex caliculation flag */  
  ifo->flg |= ifo->flg0;
  gte_stsxy((long *)&si->x3);	/* store the result of vertex caliculation */

  gte_stsz4(&ifo->sz4[0],&ifo->sz4[1],&ifo->sz4[2],&ifo->sz4[3]);
				/* store thre result of each vertex's Z */
#if AVERAGEZ
  gte_avsz4();			/* average 4 Zs */
  gte_stszotz(&ifo->otz);	/* store the averate of 4 Zs */
#else
  minmax4(ifo->sz4[0],ifo->sz4[1],ifo->sz4[2],ifo->sz4[3],ifo->adivz,ifo->otz);
  ifo->otz>>=2;			/* sz and otz is differnt scale */
#endif
  
  if(outline(si,ifo))		/* clip out of screen */
    return;
  
  if(ifo->limit == level)	/* recursive call limit */
    if(ifo->flg >= 0)
      goto aaa;
    else
      return;
  
  /* if the flg is ok and polygon distance is ok make packets */
  if(ifo->flg>=0 && ifo->maxx-ifo->minx<MAX_POLY_WIDTH &&
     ifo->maxy-ifo->miny<MAX_POLY_HIGHT)
    {
    aaa:
      if(ifo->mode0)
	{		/* DEBUG : show divide area for contrast */
	  in->vt[0].col.r=in->vt[0].col.g=in->vt[0].col.b=40*level;
	  setPolyF4(ifo->pk);
	  setRGB0(((POLY_F4 *)ifo->pk),0,0,30*level);
	  *(ifo->pk+2) = *(u_long *)((u_long *)si+2);
	  *(ifo->pk+3) = *(u_long *)((u_long *)si+5);
	  *(ifo->pk+4) = *(u_long *)((u_long *)si+8);
	  *(ifo->pk+5) = *(u_long *)((u_long *)si+11);
	  ifo->tag = ifo->org+(ifo->otz>>ifo->shift);	  
	  *(u_long *)ifo->pk  = (*ifo->tag&0x00ffffff)|0x05000000;
	  *ifo->tag = (u_long)ifo->pk&0x00ffffff;
	  ifo->pk += sizeof(POLY_F4)/4;
	  ifo->hwd++;
	  return;
	}
      *ifo->pk = *(u_long *)si;	/* PACKET WRITE */
      *(ifo->pk+1) = *(u_long *)&in->vt[0].col.r;
      *(ifo->pk+2) = *(u_long *)((u_long *)si+2);
      *(ifo->pk+3) = *(u_long *)((u_long *)si+3);
      *(ifo->pk+4) = *(u_long *)&in->vt[1].col.r;
      *(ifo->pk+5) = *(u_long *)((u_long *)si+5);
      *(ifo->pk+6) = *(u_long *)((u_long *)si+6);
      *(ifo->pk+7) = *(u_long *)&in->vt[2].col.r;
      *(ifo->pk+8) = *(u_long *)((u_long *)si+8);
      *(ifo->pk+9) = *(u_long *)((u_long *)si+9);
      *(ifo->pk+10) = *(u_long *)&in->vt[3].col.r;
      *(ifo->pk+11) = *(u_long *)((u_long *)si+11);
      *(ifo->pk+12) = *(u_long *)((u_long *)si+12);
      ifo->tag = ifo->org+(ifo->otz>>ifo->shift);
      *(u_long *)ifo->pk  = (*ifo->tag&0x00ffffff)|0x0c000000;
      *ifo->tag = (u_long)ifo->pk&0x00ffffff;
      ifo->pk += sizeof(POLY_GT4)/4;
      ifo->hwd++;
      return;
    }
  
  level++;
  /* recursive call for divide */
  /********************** 1 st ***************************
   *  ---------
   *  |///|   |
   *  ---------
   *  |   |   |
   *  ---------
   */
  out->vt[0] = in->vt[0];
  bunCV(&out->vt[1],&in->vt[0],&in->vt[1]); /* bunCV is color and vertex divide two */
  bunCV(&out->vt[2],&in->vt[0],&in->vt[2]);
  bunCV(&out->vt[3],&in->vt[0],&in->vt[3]);
  
  Adiv_gt4(scratch,ifo,level);	/* recursive call */
  sukima(&in->vt[0],&in->vt[1],&out->vt[1],ifo); /* cover polygon juction */
  /********************** 2 nd ***************************
   *  ---------
   *  |   |///|
   *  ---------
   *  |   |   |
   *  ---------
   */
  out->vt[0]=in->vt[1];
  bunCV(&out->vt[2],&in->vt[1],&in->vt[3]);

  Adiv_gt4(scratch,ifo,level);
  sukima(&in->vt[1],&in->vt[3],&out->vt[2],ifo);    
  /********************** 3 rd ***************************
   *  ---------
   *  |   |   |
   *  ---------
   *  |   |///|
   *  ---------
   */
  out->vt[0]=in->vt[3];
  bunCV(&out->vt[1],&in->vt[3],&in->vt[2]);
  
  Adiv_gt4(scratch,ifo,level);
  sukima(&in->vt[3],&in->vt[2],&out->vt[1],ifo);  
  /********************** 4 th ***************************
   *  ---------
   *  |   |   |
   *  ---------
   *  |///|   |
   *  ---------
   */
  out->vt[0] =in->vt[2];
  bunCV(&out->vt[2],&in->vt[0],&in->vt[2]);
  
  Adiv_gt4(scratch,ifo,level);
  sukima(&in->vt[2],&in->vt[0],&out->vt[2],ifo);  
}


/* cover polygon juction */
static void sukima(v0,v1,v2,ifo)
VERTC *v0,*v1,*v2;
ADIV_GT4 *ifo;
{
  POLY_GT3 *si;

  if(ifo->mode1==0)
    return;

  gte_ldv3(&v0->vx,&v1->vx,&v2->vx);
  gte_rtpt();
  si = (POLY_GT3 *)ifo->pk;
  *(u_long *)&si->r0 = *(u_long *)&v0->col.r;
  
  gte_stflg(&ifo->flg);
  
  if(ifo->flg<0)
    return;
  
  gte_nclip();
  setPolyGT3(si);
  gte_stopz(&ifo->otz);	/* back clip */
  if(ifo->otz==0)		/* �ʐςO */
    return;
  
  gte_avsz3();
  gte_stsxy3_gt3((long *)si);	/* set the three result to the si packet */
  gte_stotz(&ifo->otz);
  *(u_short *)&si->u0 = *(u_short *)&v0->tu;
  *(u_short *)&si->u1 = *(u_short *)&v1->tu;
  *(u_short *)&si->u2 = *(u_short *)&v2->tu;
  *(u_long *)&si->r1 = *(u_long *)&v1->col.r;
  *(u_long *)&si->r2 = *(u_long *)&v2->col.r;
  si->clut  = ifo->si.clut;
  si->tpage = ifo->si.tpage;
  ifo->tag = ifo->org+(ifo->otz>>ifo->shift);
  *(u_long *)si  = (*ifo->tag&0x00ffffff)|0x09000000;
  *ifo->tag = (u_long)si&0x00ffffff;
  ifo->pk += sizeof(POLY_GT3)/4;
}

/* clip out of screen */
static int outline(si,ifo)
POLY_GT4 *si;
ADIV_GT4 *ifo;
{
  if(ifo->sz4[0]<ifo->nearz && ifo->sz4[1]<ifo->nearz &&
     ifo->sz4[2]<ifo->nearz && ifo->sz4[3]<ifo->nearz)
    return 1;
  
  minmax4(si->x0,si->x1,si->x2,si->x3,ifo->minx,ifo->maxx);
  if((ifo->maxx<-ifo->hwd0) || (ifo->minx>ifo->hwd0)) /* W clip */
    return 1;
  minmax4(si->y0,si->y1,si->y2,si->y3,ifo->miny,ifo->maxy);
  if((ifo->maxy<-ifo->vwd0) || (ifo->miny>ifo->vwd0)) /* H clip */
    return 1;
  return 0;
}

/* divide two color and vertex */
static void bunCV(out,in1,in2)
VERTC *out,*in1,*in2;
{
  out->vx=(in1->vx+in2->vx)/2;
  out->vy=(in1->vy+in2->vy)/2;
  out->vz=(in1->vz+in2->vz)/2;
  
  out->col.r = (in1->col.r + in2->col.r)/2;
  out->col.g = (in1->col.g + in2->col.g)/2;
  out->col.b = (in1->col.b + in2->col.b)/2;
  out->col.cd = in1->col.cd;

  out->tu = (in1->tu+in2->tu)/2;
  out->tv = (in1->tv+in2->tv)/2;
}
