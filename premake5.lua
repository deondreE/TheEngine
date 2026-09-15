VulkanSDK = os.getenv("VULKAN_SDK")

workspace "TheEngine"
   configurations { "Debug", "Release" }
   language "C++"
   cppdialect "C++23"

   targetdir "build/bin/%{cfg.buildcfg}"
   objdir "build/bin-int/%{cfg.buildcfg}"

   startproject "Sandbox"
   
project "EngineLib"
   kind "StaticLib"
   
   files { "Engine/**.hpp", "Engine/**.cpp" }

   links 
   {
    "%VULKAN_SDK%\\**.lib"
   }

   includedirs
   {
     "%VULKAN_SDK%\\Include",
     "Engine/pch",
     "."
   }
   
   filter "configurations:Debug"
      defines { "DEBUG" }
      symbols "On"

   filter "configurations:Release"
      defines { "NDEBUG" }
      optimize "On"

   pchheader "Engine/pch/pch.hpp"
   pchsource "Engine/pch/pch.cpp"

project "Sandbox"
   kind "ConsoleApp"

   files { "Sandbox/**.hpp", "Sandbox/**.cpp" }

   links 
   {
    "EngineLib"
   }

   includedirs
   {
    "Engine",
    "vendor"
   }

   filter "configurations:Debug"
      defines { "DEBUG" }
      symbols "On"

   filter "configurations:Release"
      defines { "NDEBUG" }
      optimize "On"