#include "basic.hpp"
#include "../types/types.hpp"

void Graphics::setPixel(SizedBuffer *buffer, const Colour2D &colour) {
    if (colour.pos.x >= buffer->width || colour.pos.y >= buffer->height) return;
    buffer->buffer[colour.pos.y * buffer->width + colour.pos.x] = colour.col;
}

Colour Graphics::getPixel(SizedBuffer *buffer, const Point2D pos) {
    if (pos.x >= buffer->width || pos.y >= buffer->height) return {0};
    return {buffer->buffer[pos.y * buffer->width + pos.x].c & 0x00FFFFFF};
}

u8 Graphics::onitPixel(SizedBuffer *buffer, const Colour2D &colour, const Colour reference) {
    if (colour.pos.x >= buffer->width || colour.pos.y >= buffer->height) return 0;
    if (Graphics::getPixel(buffer, colour.pos).c != reference.c) return 0;
    Graphics::setPixel(buffer, colour);
    return 1;
}

void Graphics::drawRect(SizedBuffer *buffer, const Colour2D &colour, Point2D size) {
    for (u32 y = colour.pos.y; y < size.y + colour.pos.y; y++) {
        for (u32 x = colour.pos.x; x < size.x + colour.pos.x; x++) {
            Colour2D pixel = {.pos = Point2D{.x = x, .y = y}, .col = colour.col};
            setPixel(buffer, pixel);
        }
    }
}

void Graphics::drawCircle(SizedBuffer *buffer, const Colour2D &colour, u32 radius) {
    for (i32 y = -radius; y < (i32)radius; y++) {
        if((i32)colour.pos.y + y < 0) continue;
        for (i32 x = -radius; x < (i32)radius; x++) {
            if((i32)colour.pos.x + x < 0) continue;
            if (y*y + x*x <= (i32)(radius*radius)) {
                Colour2D pixel = {.pos = Point2D{.x = (u32)x + colour.pos.x, .y = (u32)y + colour.pos.y}, .col = colour.col};
                setPixel(buffer, pixel);
            }
        }
    }
}