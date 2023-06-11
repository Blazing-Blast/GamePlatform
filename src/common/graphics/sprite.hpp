#ifndef COMMON_GRAPHICS_SPRITE_H
#define COMMON_GRAPHICS_SPRITE_H

#include "../types/types.hpp"

typedef struct Sprite {
    Colour *buffer;
    u32 width;
    u32 height;
} Sprite;

namespace Graphics {
    void drawSprite(SizedBuffer *buffer, Point2D position, const Sprite &sprite);
    void zoomSprite(SizedBuffer *buffer, Point2D position, const Sprite &sprite, u32 zoom);
}

#endif