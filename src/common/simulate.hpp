#include "types/types.hpp"

namespace Common {
    void    simulateFrame(u32 *buffer, u32 height, u32 width);
    void    onResize(u32 *buffer, u32 height, u32 width);
    void    newPixel(u32 *buffer, u32 height, u32 width);
    u32     colourShit(u32 x, u32 y, u8 variance, i8 bias);
    Point2D posShit(u32 x, u32 y);
}

u8 clamp(i16 value);