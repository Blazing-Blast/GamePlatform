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

            // Using a breakpoint I can see that:
            // zoom: 10
            // x: 1
            // y: 0
            // position: 
            //   x: 200
            //   y: 500
            // col:
            //  c: 0xFF44FF00 (4282711808)

            const Colour2D pixel = Colour2D {
                .pos = Point2D {
                    .x = position.x + (x * zoom),
                    .y = position.y - (y * zoom)
                },
                .col = col
            };

            // Afterwards:
            // pixel:
            //   pos:
            //     x: 0
            //     y: 2
            //   col:
            //     c: 0xFF44FF00 (4282711808)

            // Expected behaivor:
            // pixel:
            //   pos:
            //     x: 200
            //     y: 520
            //   col:
            //     c: 0xFF44FF00 (4282711808)

            Graphics::DrawRect(buffer, pixel, Point2D {zoom, zoom});
        }
    }
}