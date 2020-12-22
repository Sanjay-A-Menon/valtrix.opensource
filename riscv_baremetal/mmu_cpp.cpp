#include<stdint.h>
typedef uint64_t  page[512];
page  pg_lvl[10] __attribute__ ((aligned (4096)));



extern "C" void pg_populate()
{
   uint64_t temp;
   temp = (uint64_t)&pg_lvl[1][0];
   pg_lvl[0][3] = temp >> 2;
   pg_lvl[0][3] |= 0x00000e1;
   //pg_lvl[0][3] = 0x200000ef;
   temp = (uint64_t)&pg_lvl[2][0];
   pg_lvl[1][0] = temp >> 2;
   pg_lvl[1][0] |= 0x00000e1;
   pg_lvl[2][0] = 0x200000ef;
}
   
