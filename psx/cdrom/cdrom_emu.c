
#define BCM2708_PERI_BASE 0x20000000
#define GPIO_BASE         (BCM2708_PERI_BASE + 0x200000) /* GPIO controller */

#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <stdbool.h>
#include <fcntl.h>
#include <sys/mman.h>
#include <unistd.h>

#define PAGE_SIZE  (4*1024)
#define BLOCK_SIZE (4*1024)

/* CDROM Parameters */
#define SECT_SIZE 2352
#define SECS_SIZE 176400
#define MINS_SIZE 10231200

/* GPIO Pin Names */
#define CLK_IN  4
#define CMD_0   17
#define CMD_1   18
#define CMD_2   15
#define CMD_3   14
#define DAT_0   7
#define DAT_1   8
#define DAT_2   11
#define DAT_3   25
#define DAT_4   9 
#define DAT_5   10
#define DAT_6   24
#define DAT_7   23
#define CMD_EN  27
#define DAT_ACK 22

int mem_fd;
void *gpio_map;

// I/O Access
volatile unsigned *gpio;

#define GETBIT(d, b) ((d >> b) & 0x1)

#define WRITE(g, a) (a) ? (GPIO_SET = 1 << g) : (GPIO_CLR = 1 << g)
#define READ(g) (GPIO_LEV & (1 << g))
#define READ_END ((GPIO_LEV & (1 << CMD_00)) && (GPIO_LEV & (1 << CMD_01)) && (GPIO_LEV & (1 << CMD_02)) && (GPIO_LEV & (1 << CMD_03)))

// GPIO setup macros. Always use INP_GPIO(x) before using OUT_GPIO(x) or SET_GPIO_ALT(x,y)
#define INP_GPIO(g)       *(gpio+((g)/10)) &= ~(7<<(((g)%10)*3))
#define OUT_GPIO(g)       *(gpio+((g)/10)) |=  (1<<(((g)%10)*3))
#define SET_GPIO_ALT(g,a) *(gpio+((g)/10)) |=  (((a)<=3?(a)+4:(a)==4?3:2)<<(((g)%10)*3))

#define GPIO_SET *(gpio+7)   // sets   bits which are 1; ignores bits which are 0
#define GPIO_CLR *(gpio+10)  // clears bits which are 1; ignores bits which are 0
#define GPIO_LEV *(gpio+13)  // read   pin level: 0=LOW, 1=HIGH

/*#########################################*
 *  -- How to use GPIO --                  *  
 *  ~~~~~~~~~~~~~~~~~~~~~                  *
 *  GPIO_SET = 1 << (pin_number)           *
 *  GPIO_CLR = 1 << (pin_number)           *
 *  level = GPIO_LEV & (1 << pin_number)   *
 *#########################################*/

void setup_io();
uint8_t get_cmd();

int main (int argc, char **argv)
{
  // Setup gpio pointer for direct register access
  setup_io();

  /* Prep GPIO */
  INP_GPIO(CLK_IN);
  INP_GPIO(CMD_0);
  INP_GPIO(CMD_1);
  INP_GPIO(CMD_2);
  INP_GPIO(CMD_3);
  INP_GPIO(DAT_0);
  INP_GPIO(DAT_1);
  INP_GPIO(DAT_2);
  INP_GPIO(DAT_3);
  INP_GPIO(DAT_4);
  INP_GPIO(DAT_5);
  INP_GPIO(DAT_6);
  INP_GPIO(DAT_7);
  INP_GPIO(CMD_ACK);
  INP_GPIO(DAT_ACK);
  OUTP_GPIO(DAT_0);
  OUTP_GPIO(DAT_1);
  OUTP_GPIO(DAT_2);
  OUTP_GPIO(DAT_3);
  OUTP_GPIO(DAT_4);
  OUTP_GPIO(DAT_5);
  OUTP_GPIO(DAT_6);
  OUTP_GPIO(DAT_7);
  OUTP_GPIO(DAT_ACK);

  /* Open ROM file for reading */
  FILE* fp = fopen("/mnt/usb/game_rom.bin", "r");
  printf("Starting up... \n");


  uint8_t cmd;
  uint8_t MODE_REG = 0;
  uint23_t offset;

  /* Main Loop */
  while (1)
    {

      cmd = get_cmd();      
      
      switch (cmd)
	{
	case 0x02:
	  /* Setloc */
	  // seek to the given target
	  
	  uint8_t amm = bcd_to_dec(get_cmd());
	  uint8_t ass = bcd_to_dec(get_cmd());
	  uint8_t asect = bcd_to_dec(get_cmd());

	  offset += asect * SECT_SIZE;
	  offset += (ass - 2) * SECS_SIZE;
	  offset += amm * MINS_SIZE;

	  break;
	case 0x06, 0x1B:
          /* ReadN, ReadS */
	  // read with retry (we are ignoring the retry */

	  uint32_t size;

	  if (MODE_REG & (1<<5)) // 2340 bytes
	    size = 2340;
	  else // 2048 bytes
	    size = 2040;


	  for (uint32_t i = 0; i < size; i++)
	    send_data(fgetc(FILE));
	      
          break;
	case 0x07:
          /* Standby */
          break;
	case 0x0A:
          /* Init */
	  // set MODE_REG to 0x00

	  MODE_REG = 0x00;

          break;
	case 0x0E:
          /* Setmode */
	  // load value into MODE_REG 

	  MODE_REG = get_cmd();

          break;
	case 0x0F:
          /* Getparam */
          break;
	case 0x10:
          /* GetlocL */
          break;
	case 0x11:
          /* GetlocP */
          break;
	case 0x13:
          /* GetTN */
          break;
	case 0x14:
          /* GetTD */
          break;
	case 0x15:
          /* SeekL */
	  // seek to location set in SeekL command

	  fseek(FILE, offset, SEEK_SET);

	  break;
	case 0x19:
          /* Test */
          break;
	case 0x1A:
          /* GetID */
          break;
	case 0x1C:
          /* Reset */

	  offset = 0;
	  MAIN_REG = 0;

          break;
	case 0x1D:
          /* GetQ */
          break;
	case 0x1E:
	  /* ReadTOC */
	  break;
	default:
	  /* Unknown/Nop */
	  break;
	}
      

      
    /*   clk = (GPIO_LEV & (1<<10)) != 0; */
      
    /*   /\* look for clock edges *\/ */
    /*   if (clk != prev_clk) */
    /* 	{ */
    /* 	  /\* @ posedge *\/ */
    /* 	  if (clk) */
    /* 	    { */
    /* 	      /\* start receiving commands if CMD_EN is high *\/ */
    /* 	      if (GPIO_LEV & (1<<CMD_EN)) */
    /* 		{ */
		  
    /* 		} */
    /* 	    } */
    /* 	  /\* @ negedge *\/ */
    /* 	  else */
    /* 	    { */
	      
    /* 	    } */
    /* 	} */

    /*   prev_clk = clk; */
    /* } */
  
  fclose(fp);
  return 0;
}

// 
// Setup memory regions to access GPIO
//
void setup_io()
{
  /* open /dev/mem */
  if ((mem_fd = open("/dev/mem", O_RDWR|O_SYNC) ) < 0) 
    {
      printf("can't open /dev/mem \n");
      exit(-1);
    }

  /* mmap GPIO */
  gpio_map = mmap (NULL,                 // Any address in out space will do
		   BLOCK_SIZE,           // Map length
		   PROT_READ|PROT_WRITE, // Enable reading & writing to mapped memory
		   MAP_SHARED,           // Shared with other processes
		   mem_fd,               // File to map
		   GPIO_BASE             // Offset to GPIO peripheral
		   );
  
  close(mem_fd); // No need to keep mem_fd open after map

  if (gpio_map == 0 && 0)
    {
      printf("mmap error %d\n", (int)gpio_map); // errno also set!
      exit(-1);
    }

  // Always use volatile pointer!
  gpio = (volatile unsigned *)gpio_map;
}

inline uint8_t get_cmd()
{
  uint8_t cmd = 0;

  /* Wait for CMD_EN */
  while ((volatile) ~READ(CMD_EN));

  /* Get lower bits and acknowledge */
  cmd = (((INP_GPIO(CMD_00) & 0x1)) |
	 ((INP_GPIO(CMD_01) & 0x1) << 1) |
	 ((INP_GPIO(CMD_00) & 0x1) << 2) |
	 ((INP_GPIO(CMD_00) & 0x1) << 3));

  WRITE(DAT_ACK, 1);

  /* Wait for it to go low then high again */
  while ((volatile) READ(CMD_EN));

  WRITE(DAT_ACK, 0);

  while ((volatile) ~READ(CMD_EN));

  /* Get lower bits and acknowledge */
  cmd = (((INP_GPIO(CMD_00) & 0x1) << 4) |
         ((INP_GPIO(CMD_01) & 0x1) << 5) |
         ((INP_GPIO(CMD_00) & 0x1) << 6) |
         ((INP_GPIO(CMD_00) & 0x1) << 7));

  WRITE(DAT_ACK, 1);

  /* Wait on end of the command */
  while ((volatile) READ(CMD_EN));

  WRITE(DAT_ACK, 0);

  return cmd;
}
 
inline uint8_t bcd_to_dec(uint8_t bcd)
{
  return ((val/16*10) + (val%16));
}

inline uint8_t send_data(uint8_t d)
{
  uint_8 end = 0;

  /* Set the bits */
  WRITE(DAT_00, GET_BIT(d, 0));
  WRITE(DAT_01, GET_BIT(d, 1));
  WRITE(DAT_02, GET_BIT(d, 2));
  WRITE(DAT_03, GET_BIT(d, 3));
  WRITE(DAT_04, GET_BIT(d, 4));
  WRITE(DAT_05, GET_BIT(d, 5));
  WRITE(DAT_06, GET_BIT(d, 6));
  WRITE(DAT_07, GET_BIT(d, 7));

  WRITE(DAT_ACK, 1);

  /* Wait on enable or end */
  while(((volatile) READ(CMD_EN)) || READ_END);

  if (READ(CMD_EN))
    {
      err = 1;
    }

  WRITE(DAT_ACK, 0);

  if (!err)
    {
      while((volatile) ~READ(CMD_EN));
    }

  return end;
}
