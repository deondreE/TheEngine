VulkanSDK = os.getenv("VULKAN_SDK")

if not VulkanSDK then
   error("VULKAN_SDK environment variable is not set")
end

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

   includedirs
   {
     VulkanSDK .. "/Include",
     "Engine/pch",
     "Engine",
   }

   filter "system:windows"
      architecture "x86_64"

      libdirs
      {
         VulkanSDK .. "/Lib"
      }

      links
      {
         "vulkan-1"
      }
   filter "system:macosx"
      architecture "arm64"

      libdirs
      {
         VulkanSDK .. "/lib"
      }

      links
      {
         "vulkan"
      }
   filter {}

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