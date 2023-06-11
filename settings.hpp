#include "src/common/types/types.hpp"

#define contrast(col) ((col) ^ 0x00FFFFFF)

//primary colours
#define red         0xFFFF0000
#define green       0xFF00FF00
#define blue        0xFF0000FF
//secundary collours
#define yellow      0xFFFFFF00
#define pruple      0xFFFF00FF
#define cyan        0xFF00FFFF
//Grayscale
#define black       0xFF000000
#define nearBlack   0xFF010101
#define gray        0xFFBBBBBB
#define nearWhite   0xFFFEFEFE
#define white       0xFFFFFFFF
//Excotics
#define elecPurple  0xFFBB00FF
#define darkElec    0xFF7700BB
#define transBlue   0xFF5BCEFA
#define darioPurple 0xFF490A91

#define tune(col, var) ((col) + nearBlack * (var))

const u32 foreground = darkElec;
const u32 background = black;
const u8  variance   = 2; // setting this to 0 will make it tend to white, otherwise it will behave as expected.
const i8  bias       = 0;