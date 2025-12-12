workspace "Enigma"
	architecture "x64"

	configurations
	{
		"Debug",
		"Release",
		"Dist"
	}

outputdir = "%{cfg.buildcfg}/%{cfg.system}"

-- Include directories relative to root folder (solution directory)
IncludeDir = {}

project "Enigma"
	location "Enigma"
	kind "SharedLib"
	language "C++"

	targetdir ("Build/" .. outputdir)
	objdir ("Build/Intermediate/" .. outputdir)

    pchheader "enigma_pch.h"
	pchsource "Enigma/src/enigma_pch.cpp"

	files
	{
		"%{prj.name}/src/**.h",
		"%{prj.name}/src/**.cpp"
	}

	includedirs
	{
		"%{prj.name}/src",
		"%{prj.name}/third_party/spdlog/include",
        "G:/libraries/GLFW/include/"
	}
    
    libdirs
    {
        "G:/libraries/GLFW/bin/lib-vc2022/"
    }

    links
    {
        "glfw3_mt.lib",
        "opengl32.lib"
    }

	filter "system:windows"
		cppdialect "C++23"
		staticruntime "On"
		systemversion "latest"
		buildoptions{ "/utf-8" }

		defines
		{
			"ENIGMA_PLATFORM_WINDOWS",
			"ENIGMA_BUILD_DLL",
            "ENIGMA_ENABLE_ASSERTS"
		}

		postbuildcommands
		{
			("{COPY} %{cfg.buildtarget.relpath} ../Build/" .. outputdir .. "/Sandbox")
		}

	filter "configurations:Debug"
		defines "ENIGMA_DEBUG"
		symbols "On"

	filter "configurations:Release"
		defines "ENIGMA_RELEASE"
		optimize "On"

	filter "configurations:Dist"
		defines "ENIGMA_DIST"
		optimize "On"

project "Sandbox"
	location "Sandbox"
	kind "ConsoleApp"
	language "C++"

	targetdir ("Build/" .. outputdir .. "/%{prj.name}")
	objdir ("Build/Intermediate/" .. outputdir .. "/%{prj.name}")

	files
	{
		"%{prj.name}/src/**.h",
		"%{prj.name}/src/**.cpp"
	}

	includedirs
	{
		"Enigma/third_party/spdlog/include",
		"Enigma/src"
	}

	links
	{
		"Enigma"
	}

	filter "system:windows"
		cppdialect "C++23"
		staticruntime "On"
		systemversion "latest"
		buildoptions{ "/utf-8" }

		defines
		{
			"ENIGMA_PLATFORM_WINDOWS"
		}

	filter "configurations:Debug"
		defines "ENIGMA_DEBUG"
		symbols "On"

	filter "configurations:Release"
		defines "ENIGMA_RELEASE"
		optimize "On"

	filter "configurations:Dist"
		defines "ENIGMA_DIST"
		optimize "On"
