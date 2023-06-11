#ifndef PLATFORMS_WIN64_PLATFORM_HPP
#define PLATFORMS_WIN64_PLATFORM_HPP

#include <windows.h>
#include <iostream>
#include <algorithm>

#include "../common/simulate.hpp"

int WinMain(HINSTANCE hInstance, HINSTANCE hPrevInstance, LPSTR lpCmdLine, int nShowCmd);

namespace Windows {
    bool going = true;
    COLORREF* frameBuffer;
    long bufferWidth;
    long bufferHeight;
    BITMAPINFO bmpInfo;

    void runFrame(HWND window, HDC handle);
    void processInput(HWND window);
    void renderFrame(HDC handle);

    int WinMain(HINSTANCE hInstance, HINSTANCE hPrevInstance, LPSTR lpCmdLine, int nShowCmd);
    LRESULT windowCallback(HWND hWnd, UINT uMsg, WPARAM wParam, LPARAM lParam);
}

#endif