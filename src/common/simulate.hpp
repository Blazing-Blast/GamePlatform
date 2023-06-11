#ifndef COMMON_SIMULATE_HPP
#define COMMON_SIMULATE_HPP

#include "types/types.hpp"

namespace Common {
    // Contians everything to be done, visually every frame.
    void    simulateFrame(u32 *buffer, u32 height, u32 width);
    void    onResize(u32 *buffer, u32 height, u32 width);
    // Keeps generating new pixels until it is time to call a new frame.
    void    generatePixels(u32 *buffer, u32 height, u32 width);
    u32     mutateColor(u32 x, u32 y, u8 variance, i8 bias);
    Point2D getNeighbour(u32 x, u32 y);
    u8 clamp(i16 value);
}

#endif