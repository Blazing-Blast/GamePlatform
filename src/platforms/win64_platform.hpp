#ifndef PLATFORMS_WIN64_PLATFORM_HPP
#define PLATFORMS_WIN64_PLATFORM_HPP

#include <windows.h>
#include <iostream>
#include <algorithm>

#include "../common/simulate.hpp"
#include "../common/types/types.hpp"

int WinMain(HINSTANCE hInstance, HINSTANCE hPrevInstance, LPSTR lpCmdLine, int nShowCmd);

namespace Windows {
    // This bool gets set to false whenever you press the x button
    bool going = true;
    // Here all the pixels are stored
    COLORREF* frameBuffer;
    i32 bufferWidth;
    i32 bufferHeight;
    // This contains some info about the buffer
    BITMAPINFO bmpInfo;

    void runFrame(HWND window, HDC handle);
    void processInput(HWND window);
    void renderFrame(HDC handle);

    i32 WinMain(HINSTANCE hInstance, HINSTANCE hPrevInstance, LPSTR lpCmdLine, i32 nShowCmd);
    LRESULT windowCallback(HWND hWnd, UINT uMsg, WPARAM wParam, LPARAM lParam);
}

#endif