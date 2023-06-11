#include "../types/types.hpp"

namespace Graphics {
    void   SetPixel       (SizedBuffer *buffer, const Colour2D &colour);
    Colour GetPixel       (SizedBuffer *buffer, const Point2D  pos);
    u8     InitPixel      (SizedBuffer *buffer, const Colour2D &colour, const Colour reference);
    void   DrawRect       (SizedBuffer *buffer, const Colour2D &colour, Point2D size);
    void   DrawCircle     (SizedBuffer *buffer, const Colour2D &colour, u32 radius);
 // void   DrawTriagle    (SizedBuffer *buffer, Point2D p0, Point2D p1, Point2D p2, Colour colour);
 // void   DrawQuad       (SizedBuffer *buffer, Point2D a, Point2D b, Point2D c, Point2D d, Colour colour);
}