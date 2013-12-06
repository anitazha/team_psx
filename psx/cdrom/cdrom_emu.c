
#define BCM2708_PERI_BASE 0x20000000
#define GPIO_BASE         (BCM2708_PERI_BASE + 0x200000) /* GPIO controller */

#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <fcntl.h>
#include <sys/mman.h>
#include <unistd.h>

#define PAGE_SIZE  (4*1024)
#define BLOCK_SIZE (4*1024)

#define CLK_IN  1
#define CMD_00  2
#define CMD_01  3
#define CMD_02  4
#define CMD_03  5
#define DAT_00  6
#define DAT_01  7
#define DAT_02  8
#define DAT_03  9
#define DAT_04 10 
#define DAT_05 11
#define DAT_06 12
#define DAT_07 13
#define CMD_EN 14
#define DAT_EN 15

int mem_fd;
void *gpio_map;

// I/O Access
volatile unsigned *gpio;

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

int main (int argc, char **argv)
{
  int g, rep;
  int i, j;

  // Setup gpio pointer for firect register access
  setup_io();

  INP_GPIO(10);
  //OUT_GPIO(10);

  FILE* fp = fopen("/mnt/usb/game_rom.bin", "r");

  printf("Starting up... \n");

  bool clk = (GPIO_LEV & (1<<10)) != 0;
  bool prev_clk = clk;

  /* Main Loop */
  while (count_lo < 1000)
    {
      clk = (GPIO_LEV & (1<<10)) != 0;
      
      /* look for clock edges */
      if (clk != prev_clk)
	{
	  /* @ posedge */
	  if (clk)
	    {
	      /* start receiving commands if CMD_EN is high */
	      if (GPIO_LEV & (1<<CMD_EN))
		{
		  
		}
	    }
	  /* @ negedge */
	  else
	    {
	      
	    }
	}

      prev_clk = clk;
    }
  
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
