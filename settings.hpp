#include "src/common/types/types.hpp"

u32 contrast(u32 input) {return input ^ 0x00FFFFFF;}

const u32 purple    = 0xFFBB00FF;
const u32 black     = 0xFF000000;
const u32 white     = 0xFFFFFFFF;
const u32 nearBlack = 0xFF010101;
const u32 gray      = 0xFFBBBBBB;
const u32 transBlue = 0xFF5BCEFA;

const u32 foreground = transBlue;
const u32 background = black;
const u8  variance   = 4; // setting this to 0 will make it tend to white, otherwise it will behave as expected.
const i8  bias       = 0;