workspace "Enigma"
    architecture "x64"
    startproject "Sandbox"

    configurations
    {
        "Debug",
        "Release",
        "Dist"
    }

outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

-- Include directories relative to root folder (solution directory)
IncludeDir = {}

project "Enigma"
    location "Enigma"
    kind "StaticLib"
    language "C++"
    cppdialect "C++23"
    staticruntime "on"

    targetdir ("Build/" .. outputdir .. "/%{prj.name}")
    objdir ("Build/intermdediate/" .. outputdir .. "/%{prj.name}")

    pchheader "enigma_pch.h"
    pchsource "Enigma/src/enigma_pch.cpp"

    files
    {
        "%{prj.name}/src/**.h",
        "%{prj.name}/src/**.cpp",
        "%{prj.name}/Includes/glm/glm/**.hpp",
        "%{prj.name}/Includes/glad/glad.c",
        "%{prj.name}/Includes/glm/glm/**.inl"
    }

    defines
    {
        "_CRT_SECURE_NO_WARNINGS"
    }

    includedirs
    {
        "%{prj.name}/src",
        "%{prj.name}/includes/spdlog",
        "%{prj.name}/includes/ImGui",
        "%{prj.name}/includes"
    }

    libdirs
    {
        "%{prj.name}/libs"
    }

    links
    {
        "glfw3_mt.lib",
        "glfw3.lib",
        "opengl32.lib",
        "gdi32.lib"
    }

    filter "system:windows"
        systemversion "latest"

        defines
        {
            "ENIGMA_PLATFORM_WINDOWS",
            "ENIGMA_BUILD_DLL",
            "GLFW_INCLUDE_NONE"
        }

        buildoptions "/utf-8"


    filter "configurations:Debug"
        defines "ENIGMA_DEBUG"
        runtime "Debug"
        symbols "On"

    filter "configurations:Release"
        defines "ENIGMA_RELEASE"
        runtime "Release"
        optimize "On"

    filter "configurations:Dist"
        defines "ENIGMA_DIST"
        runtime "Release"
        optimize "On"

project "Sandbox"
    location "Sandbox"
    kind "ConsoleApp"
    language "C++"
    cppdialect "C++23"
    staticruntime "on"

    targetdir ("Build/" .. outputdir .. "/%{prj.name}")
    objdir ("Build/intermediate/" .. outputdir .. "/%{prj.name}")

    files
    {
        "%{prj.name}/src/**.h",
        "%{prj.name}/src/**.cpp"
    }

    includedirs
    {
        "Enigma/Includes",
        "Enigma/src",
    }

    links
    {
        "Enigma"
    }

    filter "system:windows"
        systemversion "latest"

        buildoptions "/utf-8"

        defines
        {
            "ENIGMA_PLATFORM_WINDOWS"
        }

    filter "configurations:Debug"
        defines "ENIGMA_DEBUG"
        runtime "Debug"
        symbols "on"

    filter "configurations:Release"
        defines "ENIGMA_RELEASE"
        runtime "Release"
        optimize "on"

    filter "configurations:Dist"
        defines "ENIGMA_DIST"
        runtime "Release"
        optimize "on"
