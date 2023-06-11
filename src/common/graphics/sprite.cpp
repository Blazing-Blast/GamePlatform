#include "sprite.hpp"
#include "basic.hpp"

void Graphics::DrawSprite(SizedBuffer *buffer, Point2D position, const Sprite &sprite) {
    for (u32 y = sprite.height; y > 0; y--) {
        for (u32 x = 0; x < sprite.width; x++) {
            const Colour col = sprite.buffer[y * sprite.width + x];
            if (!(col.c & 0xFF000000)) continue; // check if alpha channel is set
            const Colour2D pixel = {Point2D{position.x + x, position.y + y}, col};
            Graphics::SetPixel(buffer, pixel);
        }
    }
}

void Graphics::ZoomSprite(SizedBuffer *buffer, Point2D position, const Sprite &sprite, u32 zoom) {
    for (u32 y = 0; y < sprite.height; y++) {
        for (u32 x = 0; x < sprite.width; x++) {
            const Colour col = sprite.buffer[y * sprite.width + x];

            if (!(col.c & 0xFF000000)) continue; // check if alpha channel is set

            const Colour2D pixel = Colour2D {
                .pos = Point2D {
                    .x = position.x + (x * zoom),
                    .y = position.y - (y * zoom)
                },
                .col = col
            };

            Graphics::DrawRect(buffer, pixel, Point2D {zoom, zoom});
        }
    }
}