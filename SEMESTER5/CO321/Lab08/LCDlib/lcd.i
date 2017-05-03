# 1 "lcd.c"
# 1 "/home/e13175/Desktop/SEMESTER5/CO321/Lab08/LCDlib//"
# 1 "<command-line>"
# 1 "lcd.c"
# 25 "lcd.c"
# 1 "/usr/lib/avr/include/inttypes.h" 1 3
# 37 "/usr/lib/avr/include/inttypes.h" 3
# 1 "/usr/lib/gcc/avr/4.8.2/include/stdint.h" 1 3 4
# 9 "/usr/lib/gcc/avr/4.8.2/include/stdint.h" 3 4
# 1 "/usr/lib/avr/include/stdint.h" 1 3 4
# 121 "/usr/lib/avr/include/stdint.h" 3 4
typedef signed int int8_t __attribute__((__mode__(__QI__)));
typedef unsigned int uint8_t __attribute__((__mode__(__QI__)));
typedef signed int int16_t __attribute__ ((__mode__ (__HI__)));
typedef unsigned int uint16_t __attribute__ ((__mode__ (__HI__)));
typedef signed int int32_t __attribute__ ((__mode__ (__SI__)));
typedef unsigned int uint32_t __attribute__ ((__mode__ (__SI__)));

typedef signed int int64_t __attribute__((__mode__(__DI__)));
typedef unsigned int uint64_t __attribute__((__mode__(__DI__)));
# 142 "/usr/lib/avr/include/stdint.h" 3 4
typedef int16_t intptr_t;




typedef uint16_t uintptr_t;
# 159 "/usr/lib/avr/include/stdint.h" 3 4
typedef int8_t int_least8_t;




typedef uint8_t uint_least8_t;




typedef int16_t int_least16_t;




typedef uint16_t uint_least16_t;




typedef int32_t int_least32_t;




typedef uint32_t uint_least32_t;







typedef int64_t int_least64_t;






typedef uint64_t uint_least64_t;
# 213 "/usr/lib/avr/include/stdint.h" 3 4
typedef int8_t int_fast8_t;




typedef uint8_t uint_fast8_t;




typedef int16_t int_fast16_t;




typedef uint16_t uint_fast16_t;




typedef int32_t int_fast32_t;




typedef uint32_t uint_fast32_t;







typedef int64_t int_fast64_t;






typedef uint64_t uint_fast64_t;
# 273 "/usr/lib/avr/include/stdint.h" 3 4
typedef int64_t intmax_t;




typedef uint64_t uintmax_t;
# 10 "/usr/lib/gcc/avr/4.8.2/include/stdint.h" 2 3 4
# 38 "/usr/lib/avr/include/inttypes.h" 2 3
# 77 "/usr/lib/avr/include/inttypes.h" 3
typedef int32_t int_farptr_t;



typedef uint32_t uint_farptr_t;
# 26 "lcd.c" 2
# 1 "/usr/lib/avr/include/avr/io.h" 1 3
# 99 "/usr/lib/avr/include/avr/io.h" 3
# 1 "/usr/lib/avr/include/avr/sfr_defs.h" 1 3
# 100 "/usr/lib/avr/include/avr/io.h" 2 3
# 222 "/usr/lib/avr/include/avr/io.h" 3
# 1 "/usr/lib/avr/include/avr/iom328p.h" 1 3
# 223 "/usr/lib/avr/include/avr/io.h" 2 3
# 432 "/usr/lib/avr/include/avr/io.h" 3
# 1 "/usr/lib/avr/include/avr/portpins.h" 1 3
# 433 "/usr/lib/avr/include/avr/io.h" 2 3

# 1 "/usr/lib/avr/include/avr/common.h" 1 3
# 435 "/usr/lib/avr/include/avr/io.h" 2 3

# 1 "/usr/lib/avr/include/avr/version.h" 1 3
# 437 "/usr/lib/avr/include/avr/io.h" 2 3


# 1 "/usr/lib/avr/include/avr/fuse.h" 1 3
# 239 "/usr/lib/avr/include/avr/fuse.h" 3
typedef struct
{
    unsigned char low;
    unsigned char high;
    unsigned char extended;
} __fuse_t;
# 440 "/usr/lib/avr/include/avr/io.h" 2 3


# 1 "/usr/lib/avr/include/avr/lock.h" 1 3
# 443 "/usr/lib/avr/include/avr/io.h" 2 3
# 27 "lcd.c" 2
# 1 "/usr/lib/avr/include/avr/pgmspace.h" 1 3
# 87 "/usr/lib/avr/include/avr/pgmspace.h" 3
# 1 "/usr/lib/gcc/avr/4.8.2/include/stddef.h" 1 3 4
# 212 "/usr/lib/gcc/avr/4.8.2/include/stddef.h" 3 4
typedef unsigned int size_t;
# 88 "/usr/lib/avr/include/avr/pgmspace.h" 2 3
# 1037 "/usr/lib/avr/include/avr/pgmspace.h" 3
extern const void * memchr_P(const void *, int __val, size_t __len) __attribute__((__const__));
extern int memcmp_P(const void *, const void *, size_t) __attribute__((__pure__));
extern void *memccpy_P(void *, const void *, int __val, size_t);
extern void *memcpy_P(void *, const void *, size_t);
extern void *memmem_P(const void *, size_t, const void *, size_t) __attribute__((__pure__));
extern const void * memrchr_P(const void *, int __val, size_t __len) __attribute__((__const__));
extern char *strcat_P(char *, const char *);
extern const char * strchr_P(const char *, int __val) __attribute__((__const__));
extern const char * strchrnul_P(const char *, int __val) __attribute__((__const__));
extern int strcmp_P(const char *, const char *) __attribute__((__pure__));
extern char *strcpy_P(char *, const char *);
extern int strcasecmp_P(const char *, const char *) __attribute__((__pure__));
extern char *strcasestr_P(const char *, const char *) __attribute__((__pure__));
extern size_t strcspn_P(const char *__s, const char * __reject) __attribute__((__pure__));
extern size_t strlcat_P (char *, const char *, size_t );
extern size_t strlcpy_P (char *, const char *, size_t );
extern size_t __strlen_P(const char *) __attribute__((__const__));
extern size_t strnlen_P(const char *, size_t) __attribute__((__const__));
extern int strncmp_P(const char *, const char *, size_t) __attribute__((__pure__));
extern int strncasecmp_P(const char *, const char *, size_t) __attribute__((__pure__));
extern char *strncat_P(char *, const char *, size_t);
extern char *strncpy_P(char *, const char *, size_t);
extern char *strpbrk_P(const char *__s, const char * __accept) __attribute__((__pure__));
extern const char * strrchr_P(const char *, int __val) __attribute__((__const__));
extern char *strsep_P(char **__sp, const char * __delim);
extern size_t strspn_P(const char *__s, const char * __accept) __attribute__((__pure__));
extern char *strstr_P(const char *, const char *) __attribute__((__pure__));
extern char *strtok_P(char *__s, const char * __delim);
extern char *strtok_rP(char *__s, const char * __delim, char **__last);

extern size_t strlen_PF (uint_farptr_t src) __attribute__((__const__));
extern size_t strnlen_PF (uint_farptr_t src, size_t len) __attribute__((__const__));
extern void *memcpy_PF (void *dest, uint_farptr_t src, size_t len);
extern char *strcpy_PF (char *dest, uint_farptr_t src);
extern char *strncpy_PF (char *dest, uint_farptr_t src, size_t len);
extern char *strcat_PF (char *dest, uint_farptr_t src);
extern size_t strlcat_PF (char *dst, uint_farptr_t src, size_t siz);
extern char *strncat_PF (char *dest, uint_farptr_t src, size_t len);
extern int strcmp_PF (const char *s1, uint_farptr_t s2) __attribute__((__pure__));
extern int strncmp_PF (const char *s1, uint_farptr_t s2, size_t n) __attribute__((__pure__));
extern int strcasecmp_PF (const char *s1, uint_farptr_t s2) __attribute__((__pure__));
extern int strncasecmp_PF (const char *s1, uint_farptr_t s2, size_t n) __attribute__((__pure__));
extern char *strstr_PF (const char *s1, uint_farptr_t s2);
extern size_t strlcpy_PF (char *dst, uint_farptr_t src, size_t siz);
extern int memcmp_PF(const void *, uint_farptr_t, size_t) __attribute__((__pure__));


__attribute__((__always_inline__)) static inline size_t strlen_P(const char * s);
static inline size_t strlen_P(const char *s) {
  return __builtin_constant_p(__builtin_strlen(s))
     ? __builtin_strlen(s) : __strlen_P(s);
}
# 28 "lcd.c" 2
# 1 "/usr/lib/avr/include/util/delay.h" 1 3
# 43 "/usr/lib/avr/include/util/delay.h" 3
# 1 "/usr/lib/avr/include/util/delay_basic.h" 1 3
# 40 "/usr/lib/avr/include/util/delay_basic.h" 3
static inline void _delay_loop_1(uint8_t __count) __attribute__((always_inline));
static inline void _delay_loop_2(uint16_t __count) __attribute__((always_inline));
# 80 "/usr/lib/avr/include/util/delay_basic.h" 3
void
_delay_loop_1(uint8_t __count)
{
 __asm__ volatile (
  "1: dec %0" "\n\t"
  "brne 1b"
  : "=r" (__count)
  : "0" (__count)
 );
}
# 102 "/usr/lib/avr/include/util/delay_basic.h" 3
void
_delay_loop_2(uint16_t __count)
{
 __asm__ volatile (
  "1: sbiw %0,1" "\n\t"
  "brne 1b"
  : "=w" (__count)
  : "0" (__count)
 );
}
# 44 "/usr/lib/avr/include/util/delay.h" 2 3
# 1 "/usr/lib/avr/include/math.h" 1 3
# 127 "/usr/lib/avr/include/math.h" 3
extern double cos(double __x) __attribute__((__const__));





extern double sin(double __x) __attribute__((__const__));





extern double tan(double __x) __attribute__((__const__));






extern double fabs(double __x) __attribute__((__const__));






extern double fmod(double __x, double __y) __attribute__((__const__));
# 168 "/usr/lib/avr/include/math.h" 3
extern double modf(double __x, double *__iptr);



extern float modff (float __x, float *__iptr);




extern double sqrt(double __x) __attribute__((__const__));





extern double cbrt(double __x) __attribute__((__const__));
# 194 "/usr/lib/avr/include/math.h" 3
extern double hypot (double __x, double __y) __attribute__((__const__));







extern double square(double __x) __attribute__((__const__));






extern double floor(double __x) __attribute__((__const__));






extern double ceil(double __x) __attribute__((__const__));
# 234 "/usr/lib/avr/include/math.h" 3
extern double frexp(double __x, int *__pexp);







extern double ldexp(double __x, int __exp) __attribute__((__const__));





extern double exp(double __x) __attribute__((__const__));





extern double cosh(double __x) __attribute__((__const__));





extern double sinh(double __x) __attribute__((__const__));





extern double tanh(double __x) __attribute__((__const__));







extern double acos(double __x) __attribute__((__const__));







extern double asin(double __x) __attribute__((__const__));






extern double atan(double __x) __attribute__((__const__));
# 298 "/usr/lib/avr/include/math.h" 3
extern double atan2(double __y, double __x) __attribute__((__const__));





extern double log(double __x) __attribute__((__const__));





extern double log10(double __x) __attribute__((__const__));





extern double pow(double __x, double __y) __attribute__((__const__));






extern int isnan(double __x) __attribute__((__const__));
# 333 "/usr/lib/avr/include/math.h" 3
extern int isinf(double __x) __attribute__((__const__));






__attribute__((__const__)) static inline int isfinite (double __x)
{
    unsigned char __exp;
    __asm__ (
 "mov	%0, %C1		\n\t"
 "lsl	%0		\n\t"
 "mov	%0, %D1		\n\t"
 "rol	%0		"
 : "=r" (__exp)
 : "r" (__x) );
    return __exp != 0xff;
}






__attribute__((__const__)) static inline double copysign (double __x, double __y)
{
    __asm__ (
 "bst	%D2, 7	\n\t"
 "bld	%D0, 7	"
 : "=r" (__x)
 : "0" (__x), "r" (__y) );
    return __x;
}
# 376 "/usr/lib/avr/include/math.h" 3
extern int signbit (double __x) __attribute__((__const__));






extern double fdim (double __x, double __y) __attribute__((__const__));
# 392 "/usr/lib/avr/include/math.h" 3
extern double fma (double __x, double __y, double __z) __attribute__((__const__));







extern double fmax (double __x, double __y) __attribute__((__const__));







extern double fmin (double __x, double __y) __attribute__((__const__));






extern double trunc (double __x) __attribute__((__const__));
# 426 "/usr/lib/avr/include/math.h" 3
extern double round (double __x) __attribute__((__const__));
# 439 "/usr/lib/avr/include/math.h" 3
extern long lround (double __x) __attribute__((__const__));
# 453 "/usr/lib/avr/include/math.h" 3
extern long lrint (double __x) __attribute__((__const__));
# 45 "/usr/lib/avr/include/util/delay.h" 2 3
# 84 "/usr/lib/avr/include/util/delay.h" 3
static inline void _delay_us(double __us) __attribute__((always_inline));
static inline void _delay_ms(double __ms) __attribute__((always_inline));
# 141 "/usr/lib/avr/include/util/delay.h" 3
void
_delay_ms(double __ms)
{
 uint16_t __ticks;
 double __tmp ;



 uint32_t __ticks_dc;
 extern void __builtin_avr_delay_cycles(unsigned long);
 __tmp = ((16000000UL) / 1e3) * __ms;
# 161 "/usr/lib/avr/include/util/delay.h" 3
  __ticks_dc = (uint32_t)(ceil(fabs(__tmp)));


 __builtin_avr_delay_cycles(__ticks_dc);
# 186 "/usr/lib/avr/include/util/delay.h" 3
}
# 223 "/usr/lib/avr/include/util/delay.h" 3
void
_delay_us(double __us)
{
 uint8_t __ticks;
 double __tmp ;



 uint32_t __ticks_dc;
 extern void __builtin_avr_delay_cycles(unsigned long);
 __tmp = ((16000000UL) / 1e6) * __us;
# 243 "/usr/lib/avr/include/util/delay.h" 3
  __ticks_dc = (uint32_t)(ceil(fabs(__tmp)));


 __builtin_avr_delay_cycles(__ticks_dc);
# 261 "/usr/lib/avr/include/util/delay.h" 3
}
# 29 "lcd.c" 2
# 1 "lcd.h" 1
# 297 "lcd.h"
extern void lcd_init(uint8_t dispAttr);






extern void lcd_clrscr(void);






extern void lcd_home(void);
# 321 "lcd.h"
extern void lcd_gotoxy(uint8_t x, uint8_t y);







extern void lcd_putc(char c);







extern void lcd_puts(const char *s);
# 346 "lcd.h"
extern void lcd_puts_p(const char *progmem_s);







extern void lcd_command(uint8_t cmd);
# 364 "lcd.h"
extern void lcd_data(uint8_t data);
# 30 "lcd.c" 2
# 84 "lcd.c"
static void toggle_e(void);
# 101 "lcd.c"
static void toggle_e(void)
{
    (*(volatile uint8_t *)((0x08) + 0x20)) |= (1 << (2));;
    _delay_us(1);
    (*(volatile uint8_t *)((0x08) + 0x20)) &= ~(1 << (2));;
}
# 118 "lcd.c"
static void lcd_write(uint8_t data,uint8_t rs)
{
    unsigned char dataBits ;


    if (rs) {
       (*(volatile uint8_t *)((0x08) + 0x20)) |= (1 << (0));
    } else {
       (*(volatile uint8_t *)((0x08) + 0x20)) &= ~(1 << (0));
    }
    (*(volatile uint8_t *)((0x08) + 0x20)) &= ~(1 << (1));

    if ( ( &(*(volatile uint8_t *)((0x0B) + 0x20)) == &(*(volatile uint8_t *)((0x0B) + 0x20))) && ( &(*(volatile uint8_t *)((0x0B) + 0x20)) == &(*(volatile uint8_t *)((0x0B) + 0x20)) ) && ( &(*(volatile uint8_t *)((0x0B) + 0x20)) == &(*(volatile uint8_t *)((0x0B) + 0x20)) )
      && (2 == 0) && (3 == 1) && (4 == 2) && (5 == 3) )
    {

        (*(&(*(volatile uint8_t *)((0x0B) + 0x20)) - 1)) |= 0x0F;


        dataBits = (*(volatile uint8_t *)((0x0B) + 0x20)) & 0xF0;
        (*(volatile uint8_t *)((0x0B) + 0x20)) = dataBits |((data>>4)&0x0F);
        toggle_e();


        (*(volatile uint8_t *)((0x0B) + 0x20)) = dataBits | (data&0x0F);
        toggle_e();


        (*(volatile uint8_t *)((0x0B) + 0x20)) = dataBits | 0x0F;
    }
    else
    {

        (*(&(*(volatile uint8_t *)((0x0B) + 0x20)) - 1)) |= (1 << (2));
        (*(&(*(volatile uint8_t *)((0x0B) + 0x20)) - 1)) |= (1 << (3));
        (*(&(*(volatile uint8_t *)((0x0B) + 0x20)) - 1)) |= (1 << (4));
        (*(&(*(volatile uint8_t *)((0x0B) + 0x20)) - 1)) |= (1 << (5));


        (*(volatile uint8_t *)((0x0B) + 0x20)) &= ~(1 << (5));
        (*(volatile uint8_t *)((0x0B) + 0x20)) &= ~(1 << (4));
        (*(volatile uint8_t *)((0x0B) + 0x20)) &= ~(1 << (3));
        (*(volatile uint8_t *)((0x0B) + 0x20)) &= ~(1 << (2));
     if(data & 0x80) (*(volatile uint8_t *)((0x0B) + 0x20)) |= (1 << (5));
     if(data & 0x40) (*(volatile uint8_t *)((0x0B) + 0x20)) |= (1 << (4));
     if(data & 0x20) (*(volatile uint8_t *)((0x0B) + 0x20)) |= (1 << (3));
     if(data & 0x10) (*(volatile uint8_t *)((0x0B) + 0x20)) |= (1 << (2));
        toggle_e();


        (*(volatile uint8_t *)((0x0B) + 0x20)) &= ~(1 << (5));
        (*(volatile uint8_t *)((0x0B) + 0x20)) &= ~(1 << (4));
        (*(volatile uint8_t *)((0x0B) + 0x20)) &= ~(1 << (3));
        (*(volatile uint8_t *)((0x0B) + 0x20)) &= ~(1 << (2));
     if(data & 0x08) (*(volatile uint8_t *)((0x0B) + 0x20)) |= (1 << (5));
     if(data & 0x04) (*(volatile uint8_t *)((0x0B) + 0x20)) |= (1 << (4));
     if(data & 0x02) (*(volatile uint8_t *)((0x0B) + 0x20)) |= (1 << (3));
     if(data & 0x01) (*(volatile uint8_t *)((0x0B) + 0x20)) |= (1 << (2));
        toggle_e();


        (*(volatile uint8_t *)((0x0B) + 0x20)) |= (1 << (2));
        (*(volatile uint8_t *)((0x0B) + 0x20)) |= (1 << (3));
        (*(volatile uint8_t *)((0x0B) + 0x20)) |= (1 << (4));
        (*(volatile uint8_t *)((0x0B) + 0x20)) |= (1 << (5));
    }
}
# 199 "lcd.c"
static uint8_t lcd_read(uint8_t rs)
{
    uint8_t data;


    if (rs)
        (*(volatile uint8_t *)((0x08) + 0x20)) |= (1 << (0));
    else
        (*(volatile uint8_t *)((0x08) + 0x20)) &= ~(1 << (0));
    (*(volatile uint8_t *)((0x08) + 0x20)) |= (1 << (1));

    if ( ( &(*(volatile uint8_t *)((0x0B) + 0x20)) == &(*(volatile uint8_t *)((0x0B) + 0x20))) && ( &(*(volatile uint8_t *)((0x0B) + 0x20)) == &(*(volatile uint8_t *)((0x0B) + 0x20)) ) && ( &(*(volatile uint8_t *)((0x0B) + 0x20)) == &(*(volatile uint8_t *)((0x0B) + 0x20)) )
      && ( 2 == 0 )&& (3 == 1) && (4 == 2) && (5 == 3) )
    {
        (*(&(*(volatile uint8_t *)((0x0B) + 0x20)) - 1)) &= 0xF0;

        (*(volatile uint8_t *)((0x08) + 0x20)) |= (1 << (2));;
        _delay_us(1);
        data = (*(&(*(volatile uint8_t *)((0x0B) + 0x20)) - 2)) << 4;
        (*(volatile uint8_t *)((0x08) + 0x20)) &= ~(1 << (2));;

        _delay_us(1);

        (*(volatile uint8_t *)((0x08) + 0x20)) |= (1 << (2));;
        _delay_us(1);
        data |= (*(&(*(volatile uint8_t *)((0x0B) + 0x20)) - 2))&0x0F;
        (*(volatile uint8_t *)((0x08) + 0x20)) &= ~(1 << (2));;
    }
    else
    {

        (*(&(*(volatile uint8_t *)((0x0B) + 0x20)) - 1)) &= ~(1 << (2));
        (*(&(*(volatile uint8_t *)((0x0B) + 0x20)) - 1)) &= ~(1 << (3));
        (*(&(*(volatile uint8_t *)((0x0B) + 0x20)) - 1)) &= ~(1 << (4));
        (*(&(*(volatile uint8_t *)((0x0B) + 0x20)) - 1)) &= ~(1 << (5));


        (*(volatile uint8_t *)((0x08) + 0x20)) |= (1 << (2));;
        _delay_us(1);
        data = 0;
        if ( (*(&(*(volatile uint8_t *)((0x0B) + 0x20)) - 2)) & (1 << (2)) ) data |= 0x10;
        if ( (*(&(*(volatile uint8_t *)((0x0B) + 0x20)) - 2)) & (1 << (3)) ) data |= 0x20;
        if ( (*(&(*(volatile uint8_t *)((0x0B) + 0x20)) - 2)) & (1 << (4)) ) data |= 0x40;
        if ( (*(&(*(volatile uint8_t *)((0x0B) + 0x20)) - 2)) & (1 << (5)) ) data |= 0x80;
        (*(volatile uint8_t *)((0x08) + 0x20)) &= ~(1 << (2));;

        _delay_us(1);


        (*(volatile uint8_t *)((0x08) + 0x20)) |= (1 << (2));;
        _delay_us(1);
        if ( (*(&(*(volatile uint8_t *)((0x0B) + 0x20)) - 2)) & (1 << (2)) ) data |= 0x01;
        if ( (*(&(*(volatile uint8_t *)((0x0B) + 0x20)) - 2)) & (1 << (3)) ) data |= 0x02;
        if ( (*(&(*(volatile uint8_t *)((0x0B) + 0x20)) - 2)) & (1 << (4)) ) data |= 0x04;
        if ( (*(&(*(volatile uint8_t *)((0x0B) + 0x20)) - 2)) & (1 << (5)) ) data |= 0x08;
        (*(volatile uint8_t *)((0x08) + 0x20)) &= ~(1 << (2));;
    }
    return data;
}
# 268 "lcd.c"
static uint8_t lcd_waitbusy(void)

{
    register uint8_t c;


    while ( (c=lcd_read(0)) & (1<<7)) {}


    _delay_us(4);


    return (lcd_read(0));

}






static inline void lcd_newline(uint8_t pos)
{
    register uint8_t addressCounter;






    if ( pos < (0x40) )
        addressCounter = 0x40;
    else
        addressCounter = 0x00;
# 324 "lcd.c"
    lcd_command((1<<7)+addressCounter);

}
# 338 "lcd.c"
void lcd_command(uint8_t cmd)
{
    lcd_waitbusy();
    lcd_write(cmd,0);
}







void lcd_data(uint8_t data)
{
    lcd_waitbusy();
    lcd_write(data,1);
}
# 364 "lcd.c"
void lcd_gotoxy(uint8_t x, uint8_t y)
{




    if ( y==0 )
        lcd_command((1<<7)+0x00 +x);
    else
        lcd_command((1<<7)+0x40 +x);
# 386 "lcd.c"
}




int lcd_getxy(void)
{
    return lcd_waitbusy();
}





void lcd_clrscr(void)
{
    lcd_command(1<<0);
}





void lcd_home(void)
{
    lcd_command(1<<1);
}







void lcd_putc(char c)
{
    uint8_t pos;


    pos = lcd_waitbusy();
    if (c=='\n')
    {
        lcd_newline(pos);
    }
    else
    {
# 456 "lcd.c"
        lcd_write(c, 1);
    }

}







void lcd_puts(const char *s)

{
    register char c;

    while ( (c = *s++) ) {
        lcd_putc(c);
    }

}







void lcd_puts_p(const char *progmem_s)

{
    register char c;

    while ( (c = (__extension__({ uint16_t __addr16 = (uint16_t)((uint16_t)(progmem_s++)); uint8_t __result; __asm__ ( "lpm %0, Z" "\n\t" : "=r" (__result) : "z" (__addr16) ); __result; }))) ) {
        lcd_putc(c);
    }

}
# 504 "lcd.c"
void lcd_init(uint8_t dispAttr)
{





    if ( ( &(*(volatile uint8_t *)((0x0B) + 0x20)) == &(*(volatile uint8_t *)((0x0B) + 0x20))) && ( &(*(volatile uint8_t *)((0x0B) + 0x20)) == &(*(volatile uint8_t *)((0x0B) + 0x20)) ) && ( &(*(volatile uint8_t *)((0x0B) + 0x20)) == &(*(volatile uint8_t *)((0x0B) + 0x20)) )
      && ( &(*(volatile uint8_t *)((0x08) + 0x20)) == &(*(volatile uint8_t *)((0x0B) + 0x20))) && ( &(*(volatile uint8_t *)((0x08) + 0x20)) == &(*(volatile uint8_t *)((0x0B) + 0x20))) && (&(*(volatile uint8_t *)((0x08) + 0x20)) == &(*(volatile uint8_t *)((0x0B) + 0x20)))
      && (2 == 0 ) && (3 == 1) && (4 == 2) && (5 == 3)
      && (0 == 4 ) && (1 == 5) && (2 == 6 ) )
    {

        (*(&(*(volatile uint8_t *)((0x0B) + 0x20)) - 1)) |= 0x7F;
    }
    else if ( ( &(*(volatile uint8_t *)((0x0B) + 0x20)) == &(*(volatile uint8_t *)((0x0B) + 0x20))) && ( &(*(volatile uint8_t *)((0x0B) + 0x20)) == &(*(volatile uint8_t *)((0x0B) + 0x20)) ) && ( &(*(volatile uint8_t *)((0x0B) + 0x20)) == &(*(volatile uint8_t *)((0x0B) + 0x20)) )
           && (2 == 0 ) && (3 == 1) && (4 == 2) && (5 == 3) )
    {

        (*(&(*(volatile uint8_t *)((0x0B) + 0x20)) - 1)) |= 0x0F;
        (*(&(*(volatile uint8_t *)((0x08) + 0x20)) - 1)) |= (1 << (0));
        (*(&(*(volatile uint8_t *)((0x08) + 0x20)) - 1)) |= (1 << (1));
        (*(&(*(volatile uint8_t *)((0x08) + 0x20)) - 1)) |= (1 << (2));
    }
    else
    {

        (*(&(*(volatile uint8_t *)((0x08) + 0x20)) - 1)) |= (1 << (0));
        (*(&(*(volatile uint8_t *)((0x08) + 0x20)) - 1)) |= (1 << (1));
        (*(&(*(volatile uint8_t *)((0x08) + 0x20)) - 1)) |= (1 << (2));
        (*(&(*(volatile uint8_t *)((0x0B) + 0x20)) - 1)) |= (1 << (2));
        (*(&(*(volatile uint8_t *)((0x0B) + 0x20)) - 1)) |= (1 << (3));
        (*(&(*(volatile uint8_t *)((0x0B) + 0x20)) - 1)) |= (1 << (4));
        (*(&(*(volatile uint8_t *)((0x0B) + 0x20)) - 1)) |= (1 << (5));
    }
    _delay_us(16000);


    (*(volatile uint8_t *)((0x0B) + 0x20)) |= (1 << (3));
    (*(volatile uint8_t *)((0x0B) + 0x20)) |= (1 << (2));
    toggle_e();
    _delay_us(5000);


    toggle_e();
    _delay_us(64);


    toggle_e();
    _delay_us(64);


    (*(volatile uint8_t *)((0x0B) + 0x20)) &= ~(1 << (2));
    toggle_e();
    _delay_us(64);
# 585 "lcd.c"
    lcd_command(0x28);

    lcd_command(0x08);
    lcd_clrscr();
    lcd_command(((1<<2) | (1<<1) ));
    lcd_command(dispAttr);

}
