// ***************************************************************************
// ***************************************************************************
// ***************************************************************************
// ***************************************************************************

#include <stdio.h>
#include "platform.h"
#include "xbasic_types.h"
#include "xstatus.h"
#include "xil_io.h"
#include "xparameters.h"
#include "xuartlite_l.h"
#include "cf_adv7511_vc707.h"

#define CFV_BASEADDR        XPAR_AXI_HDMI_TX_36B_0_BASEADDR
#define CFA_BASEADDR        XPAR_AXI_SPDIF_TX_0_BASEADDR
#define CFC_BASEADDR        XPAR_AXI_CLKGEN_0_BASEADDR
#define DDR_BASEADDR        XPAR_DDR3_SDRAM_S_AXI_BASEADDR
#define VDMA_BASEADDR       XPAR_AXI_VDMA_0_BASEADDR
#define ADMA_BASEADDR       XPAR_AXI_DMA_0_BASEADDR
#define IIC_BASEADDR        XPAR_AXI_IIC_0_BASEADDR
#define UART_BASEADDR       XPAR_RS232_UART_1_BASEADDR

#define H_STRIDE(m)         (((m) == 1) ? 1280 : 1920)
#define H_COUNT(m)          (((m) == 1) ? 1650 : 2200)
#define H_ACTIVE(m)         (((m) == 1) ? 1280 : 1920)
#define H_WIDTH(m)          (((m) == 1) ?   40 :   44)
#define H_FP(m)             (((m) == 1) ?  110 :   88)
#define H_BP(m)             (((m) == 1) ?  220 :  148)
#define V_COUNT(m)          (((m) == 1) ?  750 : 1125)
#define V_ACTIVE(m)         (((m) == 1) ?  720 : 1080)
#define V_WIDTH(m)          (((m) == 1) ?    5 :    5)
#define V_FP(m)             (((m) == 1) ?    5 :    4)
#define V_BP(m)             (((m) == 1) ?   20 :   36)

#define H_DE_MIN(m)         (H_WIDTH(m) + H_BP(m))
#define H_DE_MAX(m)         (H_WIDTH(m) + H_BP(m) + H_ACTIVE(m))
#define V_DE_MIN(m)         (V_WIDTH(m) + V_BP(m))
#define V_DE_MAX(m)         (V_WIDTH(m) + V_BP(m) + V_ACTIVE(m))
#define VIDEO_LENGTH(m)     (H_ACTIVE(m) * V_ACTIVE(m))
#define AUDIO_LENGTH        (AUDIO_FS/AUDIO_F)
#define VIDEO_BASEADDR      DDR_BASEADDR + 0x2000000
#define AUDIO_BASEADDR      DDR_BASEADDR + 0x1000000

// ***************************************************************************
// ***************************************************************************

char inbyte(void);
void xil_printf(const char *ctrl1, ...);
void microblaze_flush_dcache(void);
void microblaze_invalidate_dcache(void);

void delay_ms(u32 ms_count) {
  u32 count;
  for (count = 0; count < ((ms_count * 100000) + 1); count++) {
    asm("nop");
  }
}

u32 user_exit(void) {
  while (!XUartLite_IsReceiveEmpty(UART_BASEADDR)) {
    if (XUartLite_RecvByte(UART_BASEADDR) == 'q') {
      return(1);
    }
  }
  return(0);
}

void iic_select(u32 sel) {
  u32 rdata;
  Xil_Out32((IIC_BASEADDR + 0x124), 0x000); // reset iic mux
  Xil_Out32((IIC_BASEADDR + 0x124), 0x001); // reset iic mux
  Xil_Out32((IIC_BASEADDR + 0x100), 0x002); // reset tx fifo
  Xil_Out32((IIC_BASEADDR + 0x100), 0x001); // enable iic
  Xil_Out32((IIC_BASEADDR + 0x108), 0x1e8); // mux select
  Xil_Out32((IIC_BASEADDR + 0x108), (0x200 | sel)); // enable selected device
  while ((Xil_In32(IIC_BASEADDR + 0x104) & 0x80) == 0x00) {delay_ms(1);}
  delay_ms(10);
  Xil_Out32((IIC_BASEADDR + 0x100), 0x002); // reset tx fifo
  Xil_Out32((IIC_BASEADDR + 0x100), 0x001); // enable iic
  Xil_Out32((IIC_BASEADDR + 0x108), 0x1e9); // mux select
  Xil_Out32((IIC_BASEADDR + 0x108), 0x201); // read back data
  while ((Xil_In32(IIC_BASEADDR + 0x104) & 0x40) == 0x40) {delay_ms(1);}
  rdata = Xil_In32(IIC_BASEADDR + 0x10c) & 0xff;
  xil_printf("iic_select: %02x\n\r", rdata);
}

u32 iic_read(u32 addr, u32 display) {
  u32 rdata;
  Xil_Out32((IIC_BASEADDR + 0x100), 0x002); // reset tx fifo
  Xil_Out32((IIC_BASEADDR + 0x100), 0x001); // enable iic
  Xil_Out32((IIC_BASEADDR + 0x108), (0x100 | 0x72)); // adv7511 select
  Xil_Out32((IIC_BASEADDR + 0x108), addr); // adv7511 address
  Xil_Out32((IIC_BASEADDR + 0x108), (0x101 | 0x72)); // adv7511 select
  Xil_Out32((IIC_BASEADDR + 0x108), 0x201); // adv7511 data
  while ((Xil_In32(IIC_BASEADDR + 0x104) & 0x40) == 0x40) {delay_ms(1);}
  delay_ms(10);
  rdata = Xil_In32(IIC_BASEADDR + 0x10c) & 0xff;
  if (display == 1) {
    xil_printf("iic_read: addr(%02x) data(%02x)\n\r", addr, rdata);
  }
  return(rdata);
}

void iic_write(u32 addr, u32 data) {
  Xil_Out32((IIC_BASEADDR + 0x100), 0x002); // reset tx fifo
  Xil_Out32((IIC_BASEADDR + 0x100), 0x001); // enable iic
  Xil_Out32((IIC_BASEADDR + 0x108), (0x100 | 0x72)); // adv7511 select
  Xil_Out32((IIC_BASEADDR + 0x108), addr); // adv7511 address
  Xil_Out32((IIC_BASEADDR + 0x108), (0x200 | data)); // adv7511 data
  while ((Xil_In32(IIC_BASEADDR + 0x104) & 0x80) == 0x00) {delay_ms(1);}
  delay_ms(10);
}

void ddr_video_wr(u32 d, u32 m) {

  u32 n;
  u32 p;
  u32 dcnt;

  dcnt = 0;

  if (d == 1) {
    xil_printf("ddr write started (length %d)\n\r", IMG_LENGTH);
    for (n = 0; n < IMG_LENGTH; n++) {
      for (p = 0; p < ((IMG_DATA[n]>>24) & 0xff); p++) {
        Xil_Out32((VIDEO_BASEADDR+(dcnt*4)), (IMG_DATA[n] & 0xffffff));
        dcnt = dcnt + 1;
      }
    }
  } else {
    xil_printf("ddr write started\n\r");
    for (n = 0; n < V_ACTIVE(m); n++) {
      for (p = 0; p < H_ACTIVE(m); p++) {
        Xil_Out32((VIDEO_BASEADDR + (n*H_STRIDE(m)*4) + (p*4)), dcnt);
        dcnt = dcnt + 1;
      }
    }
  }
  xil_printf("ddr write completed (total %d)\n\r", dcnt);
  microblaze_flush_dcache();
  microblaze_invalidate_dcache();
}

void ddr_audio_wr() {

  u32 n;
  u32 scnt;
  u32 sincr;

  xil_printf("ddr audio write started\n\r");
  scnt = 0;
  sincr = (65536*2)/AUDIO_LENGTH;
  for (n = 0; n < 32; n++) {
	  Xil_Out32((AUDIO_BASEADDR+(n*4)), 0x00); // init descriptors
  }
  Xil_Out32((AUDIO_BASEADDR+0x00), (AUDIO_BASEADDR + 0x40)); // next descriptor
  Xil_Out32((AUDIO_BASEADDR+0x08), (AUDIO_BASEADDR + 0x80)); // start address
  Xil_Out32((AUDIO_BASEADDR+0x40), (AUDIO_BASEADDR + 0x00)); // next descriptor
  Xil_Out32((AUDIO_BASEADDR+0x48), (AUDIO_BASEADDR + 0x80)); // start address
  Xil_Out32((AUDIO_BASEADDR+0x18), (0x8000000 | (AUDIO_LENGTH*8))); // no. of bytes
  Xil_Out32((AUDIO_BASEADDR+0x58), (0x4000000 | (AUDIO_LENGTH*8))); // no. of bytes
  Xil_Out32((AUDIO_BASEADDR+0x1c), 0x00); // status
  Xil_Out32((AUDIO_BASEADDR+0x5c), 0x00); // status
  for (n = 0; n < AUDIO_LENGTH; n++) {
    Xil_Out32((AUDIO_BASEADDR+0x80+(n*4)), ((scnt << 16) | scnt));
    scnt = (n > (AUDIO_LENGTH/2)) ? (scnt-sincr) : (scnt+sincr);
  }
  xil_printf("ddr audio write completed (total %d)\n\r", AUDIO_LENGTH);
  microblaze_flush_dcache();
  microblaze_invalidate_dcache();
}

// ***************************************************************************
// ***************************************************************************

int main() {

  u8  select;
  u32 data;
  u32 m;
  u32 t;
  u32 d;

  init_platform();
  xil_printf("Enter mode\n\r");
  xil_printf("  1080p Test(0), 1080p Ramp(1), 1080p Demo(2)\n\r");
  xil_printf("   720p Test(3),  720p Ramp(4):\n\r");
  select = inbyte();

  m = ((select == '3') || (select == '4')) ? 1 : 0; // 720p(1) or 1080p(0)
  t = ((select == '0') || (select == '3')) ? 1 : 0; // test(1) or normal(0)
  d = (select == '2') ? 1 : 0; // demo-image(1) or ramp-image(0)

  delay_ms(1);
  data = Xil_In32(CFC_BASEADDR + (0x1f*4));
  if ((data & 0x1) == 0x0) {
    xil_printf("pixel clock (148.5MHz) out of lock (0x%04x)\n\r", data);
    return(0);
  }

  if (m == 1) {
    Xil_Out32((CFC_BASEADDR + (0x01*4)), 0x0000);
    Xil_Out32((CFC_BASEADDR + (0x02*4)), 0x01c7);
    Xil_Out32((CFC_BASEADDR + (0x03*4)), 0x0000);
    Xil_Out32((CFC_BASEADDR + (0x04*4)), 0x2083);
    Xil_Out32((CFC_BASEADDR + (0x05*4)), 0x034d);
    Xil_Out32((CFC_BASEADDR + (0x06*4)), 0x0000);
    Xil_Out32((CFC_BASEADDR + (0x07*4)), 0x0177);
    Xil_Out32((CFC_BASEADDR + (0x08*4)), 0x7c01);
    Xil_Out32((CFC_BASEADDR + (0x09*4)), 0x7fe9);
    Xil_Out32((CFC_BASEADDR + (0x0a*4)), 0x9000);
    Xil_Out32((CFC_BASEADDR + (0x0b*4)), 0x0800);
    Xil_Out32((CFC_BASEADDR + (0x01*4)), 0x0001);
    delay_ms(1);
    data = Xil_In32(CFC_BASEADDR + (0x1f*4));
    if ((data & 0x1) == 0x0) {
      xil_printf("pixel clock (74.25MHz) out of lock (0x%04x)\n\r", data);
      return(0);
    }
  }

  ddr_video_wr(d, m);
  ddr_audio_wr();

  iic_select(0x20);

  Xil_Out32((VDMA_BASEADDR + 0x000), 0x4); // reset
  Xil_Out32((VDMA_BASEADDR + 0x000), 0x0); // reset
  Xil_Out32((VDMA_BASEADDR + 0x000), 0x3); // enable circular mode
  Xil_Out32((VDMA_BASEADDR + 0x05c), VIDEO_BASEADDR); // start address
  Xil_Out32((VDMA_BASEADDR + 0x060), VIDEO_BASEADDR); // start address
  Xil_Out32((VDMA_BASEADDR + 0x064), VIDEO_BASEADDR); // start address
  Xil_Out32((VDMA_BASEADDR + 0x058), (H_STRIDE(m)*4)); // h offset (2048 * 4) bytes
  Xil_Out32((VDMA_BASEADDR + 0x054), (H_ACTIVE(m)*4)); // h size (1920 * 4) bytes
  Xil_Out32((VDMA_BASEADDR + 0x050), V_ACTIVE(m)); // v size (1080)

  Xil_Out32((CFV_BASEADDR + 0x04), 0x0); // tpg & csc-bypass & enable
  Xil_Out32((CFV_BASEADDR + 0x08), ((H_WIDTH(m) << 16) | H_COUNT(m)));
  Xil_Out32((CFV_BASEADDR + 0x0c), ((H_DE_MIN(m) << 16) | H_DE_MAX(m)));
  Xil_Out32((CFV_BASEADDR + 0x10), ((V_WIDTH(m) << 16) | V_COUNT(m)));
  Xil_Out32((CFV_BASEADDR + 0x14), ((V_DE_MIN(m) << 16) | V_DE_MAX(m)));
  Xil_Out32((CFV_BASEADDR + 0x04), ((t == 1) ? 0x7 : 0x1)); // tpg & csc-bypass & enable

  Xil_Out32((CFA_BASEADDR + 0x04), 0x040); // sample frequency
  Xil_Out32((CFA_BASEADDR + 0x00), 0xc03); // clock ratio, data enable & signal enable

  // wait for hpd
  while ((iic_read(0x96, 0x01) & 0x80) != 0x80) {
    delay_ms(1);
  }

  iic_write(0x01, 0x00);
  iic_write(0x02, 0x18);
  iic_write(0x03, 0x00);
  iic_write(0x15, 0x00);
  iic_write(0x16, 0x20);
  iic_write(0x18, 0x46);
  iic_write(0x19, 0x62);
  iic_write(0x40, 0x80);
  iic_write(0x41, 0x10);
  iic_write(0x48, 0x00);
  iic_write(0x49, 0xa8);
  iic_write(0x4c, 0x00);
  iic_write(0x55, 0x00);
  iic_write(0x56, 0x08);
  iic_write(0x96, 0x20);
  iic_write(0x98, 0x03);
  iic_write(0x99, 0x02);
  iic_write(0x9a, 0xe0);
  iic_write(0x9c, 0x30);
  iic_write(0x9d, 0x61);
  iic_write(0xa2, 0xa4);
  iic_write(0xa3, 0xa4);
  iic_write(0xa5, 0x44);
  iic_write(0xab, 0x40);
  iic_write(0xaf, 0x06);
  iic_write(0xba, 0x00);
  iic_write(0xd0, 0x3c);
  iic_write(0xd1, 0xff);
  iic_write(0xde, 0x9c);
  iic_write(0xe0, 0xd0);
  iic_write(0xe4, 0x60);
  iic_write(0xf9, 0x00);
  iic_write(0xfa, 0x00);
  iic_write(0x17, 0x02);
  iic_write(0x0a, 0x10);
  iic_write(0x0b, 0x8e);
  iic_write(0x0c, 0x00);
  iic_write(0x73, 0x01);
  iic_write(0x14, 0x02);

  iic_read(0x42, 0x01);
  iic_read(0x4c, 0x01);
  iic_read(0xc8, 0x01);
  iic_read(0x9e, 0x01);
  iic_read(0x96, 0x01);
  iic_read(0x3e, 0x01);
  iic_read(0x3d, 0x01);
  iic_read(0x3c, 0x01);

  if (t == 1) {
    delay_ms(10);
    Xil_Out32((CFV_BASEADDR + 0x18), 0xff); // clear status
    for (data = 0; data < 5; data++) {
      xil_printf("hdmi_status(%04x)\n\r", Xil_In32(CFV_BASEADDR + 0x18));
      delay_ms(1000);
    }
  }

  xil_printf("generating audio clicks (enter 'q' to quit)\n\r");
  while (user_exit() == 0) {
    Xil_Out32((AUDIO_BASEADDR+0x1c), 0x00); // status
    Xil_Out32((AUDIO_BASEADDR+0x5c), 0x00); // status
    Xil_Out32((ADMA_BASEADDR + 0x00), 0); // clear dma operations
    Xil_Out32((ADMA_BASEADDR + 0x08), AUDIO_BASEADDR); // head descr.
	  Xil_Out32((ADMA_BASEADDR + 0x00), 1); // enable dma operations
    Xil_Out32((ADMA_BASEADDR + 0x10), (AUDIO_BASEADDR+0x40)); // tail descr.
    delay_ms(100);
  }

  xil_printf("done.\n\r");
  cleanup_platform();
  return(0);
}

// ***************************************************************************
// ***************************************************************************

