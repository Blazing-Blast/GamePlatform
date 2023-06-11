#ifndef COMMON_GRAPHICS_SPRITE_H
#define COMMON_GRAPHICS_SPRITE_H

#include "../types/types.hpp"

typedef struct Sprite {
    Colour *buffer;
    u32 width;
    u32 height;
} Sprite;

namespace Graphics {
    // Draws a bitmap-like sprite to the screen.
    void drawSprite(SizedBuffer *buffer, Point2D position, const Sprite &sprite);
    // Scales it up by an integrer.
    void zoomSprite(SizedBuffer *buffer, Point2D position, const Sprite &sprite, u32 zoom);
}

#endif