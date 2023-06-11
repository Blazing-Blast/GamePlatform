#ifndef COMMON_TYPES_TYPES_H
#define COMMON_TYPES_TYPES_H

typedef unsigned long long u64;
typedef unsigned long int u32;
typedef unsigned short u16;
typedef unsigned char u8;

typedef signed long long i64;
typedef signed long i32;
typedef signed short i16;
typedef signed char i8;

typedef struct Colour {
    u32 c;
} Colour;

typedef struct ARGB {
    u8 a;
    u8 r;
    u8 g;
    u8 b;
} ARGB;

typedef struct Point2D {
    u32 x;
    u32 y;
} Point2D;

typedef struct Colour2D {
    Point2D pos;
    Colour  col;
} Colour2D;

typedef struct SizedBuffer {
    Colour *buffer;
    u32 width;
    u32 height;
} SizedBuffer;

#endif