workspace "Enigma"
	architecture "x64"

	configurations
	{
		"Debug",
		"Release",
		"Dist"
	}

outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

project "Enigma"
	location "Enigma"
	kind "SharedLib"
	language "C++"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	files
	{
		"%{prj.name}/src/**.h",
		"%{prj.name}/src/**.cpp"
	}

	includedirs
	{
		"%{prj.name}/vendor/spdlog/include"
	}

	filter "system:windows"
		cppdialect "C++17"
		staticruntime "On"
		systemversion "10.0.17134.0"

		defines
		{
			"Enigma_PLATFORM_WINDOWS",
			"Enigma_BUILD_DLL"
		}

		postbuildcommands
		{
			("{COPY} %{cfg.buildtarget.relpath} ../bin/" .. outputdir .. "/Sandbox")
		}

	filter "configurations:Debug"
		defines "Enigma_DEBUG"
		symbols "On"

	filter "configurations:Release"
		defines "Enigma_RELEASE"
		optimize "On"

	filter "configurations:Dist"
		defines "Enigma_DIST"
		optimize "On"

project "Sandbox"
	location "Sandbox"
	kind "ConsoleApp"
	language "C++"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	files
	{
		"%{prj.name}/src/**.h",
		"%{prj.name}/src/**.cpp"
	}

	includedirs
	{
		"Enigma/vendor/spdlog/include",
		"Enigma/src"
	}

	links
	{
		"Enigma"
	}

	filter "system:windows"
		cppdialect "C++20"
		staticruntime "On"
		systemversion "10.0.22621.0"

		defines
		{
			"ENIGMA_PLATFORM_WINDOWS"
		}

	filter "configurations:Debug"
		defines "Enigma_DEBUG"
		symbols "On"

	filter "configurations:Release"
		defines "Enigma_RELEASE"
		optimize "On"

	filter "configurations:Dist"
		defines "Enigma_DIST"
		optimize "On"