#ifndef COMMON_GRAPHICS_BASIC_HPP
#define COMMON_GRAPHICS_BASIC_HPP

#include "../types/types.hpp"

namespace Graphics {
    void   setPixel       (SizedBuffer *buffer, const Colour2D &colour);
    Colour getPixel       (SizedBuffer *buffer, const Point2D  pos);
    // Draw pixel if it was the reference colour.
    u8     initPixel      (SizedBuffer *buffer, const Colour2D &colour, const Colour reference);
    void   drawRect       (SizedBuffer *buffer, const Colour2D &colour, Point2D size);
    void   drawCircle     (SizedBuffer *buffer, const Colour2D &colour, u32 radius);
 // void   DrawTriagle    (SizedBuffer *buffer, Point2D p0, Point2D p1, Point2D p2, Colour colour);         
 // void   DrawQuad       (SizedBuffer *buffer, Point2D a, Point2D b, Point2D c, Point2D d, Colour colour);
 // I gave up on this because rasterising a triangle is quite hard
}

#endif