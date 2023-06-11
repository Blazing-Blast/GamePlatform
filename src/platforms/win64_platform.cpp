#include "win64_platform.hpp"

i32 Windows::WinMain(HINSTANCE hInstance, HINSTANCE hPrevInstance, LPSTR lpCmdLine, i32 nShowCmd) {
    static_assert(sizeof(void*) == 8);  // Make sure we run on a 64-bit machine.

    WNDCLASS windowClass = {
        .style = CS_HREDRAW | CS_VREDRAW, // Style
        .lpfnWndProc = windowCallback, // Function pointer to callback
        .lpszClassName = "Class for game window" // Window Class name
    };

    RegisterClass(&windowClass);
    
    HWND window = CreateWindow(
        windowClass.lpszClassName,          //window class name
        "Very cool window name",            // window name
        WS_VISIBLE | WS_OVERLAPPEDWINDOW,   // window style
        CW_USEDEFAULT,                      // x pos
        CW_USEDEFAULT,                      // y pos
        1280,                               // width
        720,                                // height
        0,                                  // window parent
        0,                                  // window menu
        hInstance,                          // instance
        0                                   // other data
    );

    const HDC handle = GetDC(window);
    while(going) 
        runFrame(window, handle);
    
    return 0;
}

// All the things that run every frame.
void Windows::runFrame(HWND window, HDC handle) {
    processInput(window); // Get user input.
    Common::simulateFrame(frameBuffer, bufferHeight, bufferWidth); // Write everything into the frame buffer.
    renderFrame(handle); // Put that buffer where it is supposed to go.
}

void Windows::processInput(HWND window) {
    MSG message;
    while (PeekMessage(&message, window, 0, 0, PM_REMOVE)) { // Just send every message to our callback function.
        TranslateMessage(&message);
        DispatchMessage(&message);
    }
}

void Windows::renderFrame(HDC handle) {
    StretchDIBits( // Copy the frame buffer onto the screen.
        handle,  // Handle (faster if pre-loaded)
        0, // x dest
        0, // y
        bufferWidth,
        bufferHeight,
        0, // x src
        0, // y
        bufferWidth,
        bufferHeight,
        frameBuffer, // source
        &bmpInfo, // bitmap info
        DIB_RGB_COLORS, // colors used
        SRCCOPY // operation type
    );
}

// Handle user input
LRESULT Windows::windowCallback(HWND hWnd, UINT uMsg, WPARAM wParam, LPARAM lParam) {
    switch (uMsg) {
        case WM_KEYDOWN:
            // Test if we pressed F11, then toggle fullscreen.
            if (wParam != VK_F11 || (lParam & (1 << 30))) break;
            if (GetWindowLongPtr(hWnd, GWL_STYLE) & WS_POPUP) { // unFullscreen
                    SetWindowLongPtr(hWnd, GWL_STYLE, WS_VISIBLE | WS_OVERLAPPEDWINDOW);
                    SetWindowPos(hWnd, NULL, 0, 0, 600, 400, SWP_FRAMECHANGED);
                }
            else {//show full-screen
                int w = GetSystemMetrics(SM_CXSCREEN);
                int h = GetSystemMetrics(SM_CYSCREEN);
                SetWindowLongPtr(hWnd, GWL_STYLE, WS_VISIBLE | WS_POPUP);
                SetWindowPos(hWnd, HWND_TOP, 0, 0, w, h, SWP_FRAMECHANGED);
            }
            break;

        // On exit
        case WM_CLOSE:
            case WM_DESTROY: {  
                going = false;
                return 0;
            } break;

        // On Resize
        case WM_SIZE: {
            RECT rect;
            GetClientRect(hWnd, &rect);
            bufferWidth = rect.right - rect.left;
            bufferHeight = rect.bottom - rect.top;

            // Reallocate new buffer
            if (frameBuffer) VirtualFree(frameBuffer, bufferWidth * bufferHeight * 8, MEM_RELEASE);
            frameBuffer = (COLORREF*)VirtualAlloc(0, bufferWidth * bufferHeight * 8, MEM_COMMIT | MEM_RESERVE, PAGE_READWRITE);

            // Update info header
            bmpInfo.bmiHeader = {
                sizeof(bmpInfo.bmiHeader), // size
                bufferWidth,
                bufferHeight,
                1, // planes
                32, // bits per pixel
                BI_RGB, // compression
                0, // biSizeImage
                0, // biXPelsPerMeter
                0, // biYPelsPerMeter
                0, // biClrUsed
                0 // biClrImportant
            };
            break;
        }

        default:
            return DefWindowProcA(hWnd, uMsg, wParam, lParam);
    }

    return 0;
}

int WinMain(HINSTANCE hInstance, HINSTANCE hPrevInstance, LPSTR lpCmdLine, int nShowCmd) {
    return Windows::WinMain(hInstance, hPrevInstance, lpCmdLine, nShowCmd);
}