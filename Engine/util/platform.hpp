#pragma once

#include "pch.hpp"

struct WindowHandle 
{
    void* ptr; // Win32 HWND, Macos Version of whatever that is.
    int width, height;
};

WindowHandle create_window(int width, int height, std::string title);