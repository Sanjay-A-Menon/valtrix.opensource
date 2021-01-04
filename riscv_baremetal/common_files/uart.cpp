#include<stdint-gcc.h>


typedef uint64_t va_t;
typedef uint64_t pa_t;
volatile uint64_t  tohost;
volatile uint64_t  fromhost;
volatile uint64_t  magic_mem[8];
volatile char      printchar;


void putc_spike(const char c)
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

void puts_spike(const char* buffer, uint32_t len)
{

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
    puts_spike(c,i);
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
    c[i] = (a%10) +48;
    a = a/10;
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

extern "C" void exit_spike()
{
    magic_mem[0] = 93;
    magic_mem[1] = 1;

    tohost = (va_t)magic_mem;
    while (fromhost == 0);
    fromhost = 0;

    while(1);
}

extern "C" void uart_spike(uint64_t a)
{
      print(a);
      print("\n");
}