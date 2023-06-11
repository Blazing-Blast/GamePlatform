#include "simulate.hpp"
#include "./graphics/basic.hpp"
#include "../../settings.hpp"

#include <synchapi.h>
#include <sysinfoapi.h>
#include <cstdlib>
#include <ctime>
#include <cstring>

SizedBuffer sBuffer;
const Colour2D bg  = {Point2D{0, 0}, background};

void Common::simulateFrame(u32 *buffer, u32 height, u32 width) {
    // Should stop it from crashing on minimize.
    // Comes with the added bonus of preserving screen state.
    if (width <= 0 || height <= 0) return;

    if (height != sBuffer.height || width != sBuffer.width)
        Common::onResize(buffer, height, width);

    Common::generatePixels(buffer, height, width);
}

void Common::onResize(u32 *buffer, u32 height, u32 width) {
    // Reseeds rng.
    std::srand(std::time(nullptr));

    // Resizes buffer.
    sBuffer = {.buffer = (Colour*)(void*)buffer, .width = width, .height = height};
    Colour2D startPixel = {.pos = {width/2, height/2}, .col = {foreground}};
    // Draws new background.
    Graphics::drawRect(&sBuffer, bg, {width, height});
    // Puts the centrepixel back in.
    Graphics::setPixel(&sBuffer, startPixel);
}

void Common::generatePixels(u32 *buffer, u32 height, u32 width) {
    u32 tries = 0;
    u8 gen = 0xFF;

    SYSTEMTIME time;
    GetSystemTime(&time);

    SYSTEMTIME newTime;

    i32 deltaTime = 0;

    while (gen){
        // Resyncs time.
        GetSystemTime(&newTime);
        deltaTime = newTime.wMilliseconds - time.wMilliseconds;
        deltaTime = deltaTime >= 0 ? deltaTime : (deltaTime + 1000);

        // checks if it needs to render a new frame.
        if (deltaTime >= frameTime) {
            GetSystemTime(&time);
            Sleep(1);
            return;
        }

        while (1) {
            // Checks a random pixel on the screen.
            u32 x = rand() % sBuffer.width;
            u32 y = rand() % sBuffer.height;

            // Mutates and checks if it is a valid pixel.
            u32 col = mutateColor(x, y, (1 << variance), bias);
            if (col == background) continue;

            Point2D pos = getNeighbour(x, y);

            Colour2D pixel = {pos, {col}};

            // checks if it found an empty neighbour.
            if (Graphics::initPixel(&sBuffer, pixel, {background & 0x00FFFFFF})) {
                gen--;
                break;
            }
            // Else it checks if it has checked too many pixels.
            // It is then assumed that (nearly) all other pixels are checked.
            if (tries++ > width * height * 2)
                return;
        }
    }
}

u32 Common::mutateColor(u32 x, u32 y, u8 variance, i8 bias) {
    Colour col = Graphics::getPixel(&sBuffer, {x ,y});
    if (!col.c) return background;

    u8 r = (col.c & 0x00FF0000) >> 16;
    u8 g = (col.c & 0x0000FF00) >> 8;
    u8 b =  col.c & 0x000000FF;
    // I could probably speed this up with some clever bit manipulation.
    r = clamp ((i16)r + (i16)(std::rand() & variance) + (i16)(bias - variance / 2));
    g = clamp ((i16)g + (i16)(std::rand() & variance) + (i16)(bias - variance / 2));
    b = clamp ((i16)b + (i16)(std::rand() & variance) + (i16)(bias - variance / 2));
    
    return 0xFF000000 | r << 16 | g << 8 | b;
}

Point2D Common::getNeighbour(u32 x, u32 y) {
    u8 offset = 0;
    // Make sure we are always offset either by x or y
    while(((offset & 1) ^ ((offset & 2) >> 1)) || ((offset & 4) ^ ((offset & 8) >> 1)))
        offset = rand() % 16;
    Point2D pos = {x, y};
    pos.x += (offset & 1) - ((offset & 2) >> 1);
    pos.y += ((offset & 4) >> 2) - ((offset & 8) >> 3);
    return pos;
}

u8 Common::clamp(i16 value) {
    if (value < 0) return 0;
    if (value > 0xFF) return 0xFF;
    return value;
}