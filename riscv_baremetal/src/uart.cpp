//#include "conf_sc.h"
//#include "rv_uart.h"
#include<stdint-gcc.h>


typedef uint64_t va_t;
typedef uint64_t pa_t;
volatile uint64_t  tohost;
volatile uint64_t  fromhost;
volatile uint64_t  magic_mem[8];
volatile char      printchar;


//extern RunTimeData run_time_data;

void sting_putc_fesvr(const char c)
{
    printchar = c;

    magic_mem[0] = 64;
    magic_mem[1] = 1;
    magic_mem[2] = (va_t)(&printchar);
    magic_mem[3] = 1;

    tohost = (va_t)magic_mem;

    while (fromhost == 0)
        ;
    fromhost = 0;

}

void sting_puts_fesvr(const char* buffer, uint32_t len)
{
    // printchar = c;

    magic_mem[0] = 64;
    magic_mem[1] = 1;
    magic_mem[2] = (va_t)(buffer);
    magic_mem[3] = len;

    tohost = (va_t)magic_mem;

    while (fromhost == 0)
        ;
    fromhost = 0;
    
}



void print(const char* c)
{
    int i;
    for(i=0;c[i]!='\0';++i);
    sting_puts_fesvr(c,i);
}

void print(uint64_t a)
{
  char c[100];
  int i=0;
  if(a==0)
  {
      c[i] = 48;
      i++;
  }
  while(a!=0)
  {
    //print(c);
    c[i] = (a%10) +48;
    a = a/10;
    i++;
    //sting_putc_fesvr(c[i]);
  }
  for(int j=0;j<i/2;++j)
  {
      char temp;
      temp = c[j];
      c[j] = c[i-1-j];
      c[i-1-j] = temp;
  }
  c[i] = '\0';
  print(c); 
}

void printhex(int a)
{
   char c[20];
   int i=0;
   int q,r;
   while(a!=0)
   {
     q = a/16;
     r = a%16;
     if(r>9)
       c[i] = r + 55;
     else 
       c[i] = r + 48;
     a = q;
     i++;
   }
   for(int j=0;j<i/2;++j)
   {
      char temp;
      temp = c[j];
      c[j] = c[i-1-j];
      c[i-1-j] = temp;
   }
   c[i] = '\0';
   print(c);
}

extern "C" void sting_exit_fesvr()
{
    magic_mem[0] = 93;
    magic_mem[1] = 1;

    tohost = (va_t)magic_mem;
    while (fromhost == 0);
    fromhost = 0;

    while(1);
}

extern "C" void uart(uint64_t a)
{
      //print("This is cpu id:");
      print(a);
      //print("\n");
   //print("Hello\n");
   //print(1234);
   //print("\n");
   //printhex(1234);
   //print("\n");
}

/*void sting_exit_fesvr()
{
    magic_mem[0] = 93;
    magic_mem[1] = 0;

    if (run_time_data.test_status == TestStatus::TEST_PASS)
        magic_mem[1] = 0;
    else
        magic_mem[1] = 1;

    tohost = (va_t)magic_mem;
    while (fromhost == 0);
    fromhost = 0;

    while(1);
}

void __attribute__((weak)) default_uart_init()
{
}

void __attribute__((weak)) default_uart_putc(const char c)
{
    sting_putc_fesvr(c);

    if(c == 0x4)
        sting_exit_fesvr();
}

void uart_puts(const char* buffer, uint32_t len)
{

    sting_puts_fesvr(buffer, len);
}

void __attribute__((weak)) default_exit_sim()
{
    sting_exit_fesvr();
}
*/