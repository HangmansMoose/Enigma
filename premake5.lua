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
IncludeDir["GLFW"] = "Enigma/third_party/GLFW/include"
IncludeDir["Glad"] = "Enigma/third_party/Glad/include"
IncludeDir["ImGui"] = "Enigma/third_party/imgui"
IncludeDir["glm"] = "Enigma/third_party/glm"

group "Dependencies"
    include "Enigma/third_party/GLFW"
    include "Enigma/third_party/Glad"
    include "Enigma/third_party/imgui"

group ""

project "Enigma"
    location "Enigma"
    kind "StaticLib"
    language "C++"
    cppdialect "C++23"
    staticruntime "on"

    targetdir ("bin/" .. outputdir .. "/%{prj.name}")
    objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

    pchheader "enigma_pch.h"
    pchsource "Enigma/src/enigma_pch.cpp"

    files
    {
        "%{prj.name}/src/**.h",
        "%{prj.name}/src/**.cpp",
        "%{prj.name}/third_party/glm/glm/**.hpp",
        "%{prj.name}/third_party/glm/glm/**.inl",
    }

    defines
    {
        "_CRT_SECURE_NO_WARNINGS"
    }

    includedirs
    {
        "%{prj.name}/src",
        "%{prj.name}/third_party/spdlog/include",
        "%{IncludeDir.GLFW}",
        "%{IncludeDir.Glad}",
        "%{IncludeDir.ImGui}",
        "%{IncludeDir.glm}"
    }

    links
    {
        "GLFW",
        "Glad",
        "ImGui",
        "opengl32.lib"
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

    targetdir ("bin/" .. outputdir .. "/%{prj.name}")
    objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

    files
    {
        "%{prj.name}/src/**.h",
        "%{prj.name}/src/**.cpp"
    }

    includedirs
    {
        "Enigma/third_party/spdlog/include",
        "Enigma/src",
        "Enigma/third_party",
        "%{IncludeDir.glm}"
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
