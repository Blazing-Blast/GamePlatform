#include "simulate.hpp"
#include "./graphics/basic.hpp"
#include "../../settings.hpp"

#include <synchapi.h>
#include <sysinfoapi.h>
#include <cstdlib>
#include <ctime>
#include <cstring>

const Colour2D bg  = {Point2D{0, 0}, background};

void Common::simulateFrame(u32 *buffer, u32 height, u32 width) {
    if (width <= 0 || height <= 0) return;

    if (height != sBuffer.height || width != sBuffer.width)
        Common::onResize(buffer, height, width);

    Common::generatePixels(buffer, height, width);
}

void Common::onResize(u32 *buffer, u32 height, u32 width) {
    std::srand(std::time(nullptr));

    sBuffer = {.buffer = (Colour*)(void*)buffer, .width = width, .height = height};
    Colour2D startPixel = {.pos = {width/2, height/2}, .col = {foreground}};
    Graphics::drawRect(&sBuffer, bg, {width, height});
    Graphics::setPixel(&sBuffer, startPixel);
}

void Common::generatePixels(u32 *buffer, u32 height, u32 width) {

    u64 tries = 0;
    u8 gen = 0xFF;

    SYSTEMTIME time;
    GetSystemTime(&time);

    SYSTEMTIME newTime;

    i64 deltaTime = 0;
    const i64 frameTime = 1000/60;

    while (gen){
        GetSystemTime(&newTime);
        deltaTime = newTime.wMilliseconds - time.wMilliseconds;
        deltaTime = deltaTime >= 0 ? deltaTime : (deltaTime + 1000);

        if (deltaTime >= frameTime) {
            GetSystemTime(&time);
            Sleep(1);
            return;
        }

        while (1) {

            u32 x = rand() % sBuffer.width;
            u32 y = rand() % sBuffer.height;

            u32 col = colourShit(x, y, (1 << variance), bias);
            if (col == background) continue;

            Point2D pos = posShit(x, y);

            Colour2D pixel = {pos, {col}};

            if (Graphics::onitPixel(&sBuffer, pixel, {background & 0x00FFFFFF})) {
                gen--;
                break;
            }
            if (tries++ > width * height * 2)
                return;
        }
    }
}

u32 Common::colourShit(u32 x, u32 y, u8 variance, i8 bias) {
    Colour col = Graphics::getPixel(&sBuffer, {x ,y});
    if (!col.c) return background;

    u8 r = (col.c & 0x00FF0000) >> 16;
    u8 g = (col.c & 0x0000FF00) >> 8;
    u8 b =  col.c & 0x000000FF;

    r = clamp ((i16)r + (i16)(std::rand() & variance) + (i16)(bias-variance/2));
    g = clamp ((i16)g + (i16)(std::rand() & variance) + (i16)(bias-variance/2));
    b = clamp ((i16)b + (i16)(std::rand() & variance) + (i16)(bias-variance/2));
    
    return 0xFF000000 | r << 16 | g << 8 | b;
}

Point2D Common::posShit(u32 x, u32 y) {
    u8 offset = 0;
    while(!offset)
        offset = rand() % 16;
    Point2D pos = {x, y};
    pos.x += (offset & 1) - ((offset & 2) >> 1);
    pos.y += ((offset & 4) >> 2) - ((offset & 8) >> 3);
    return pos;
}

u8 clamp(i16 value) {
    if (value < 0) return 0;
    if (value > 0xff) return 0xff;
    return value;
}