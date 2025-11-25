#pragma once

// This ensures that we export functions in the Engine side and then
// import those functions on the Sandbox side.
#ifdef ENIGMA_PLATFORM_WINDOWS
	#ifdef ENIGMA_BUILD_DLL
		#define ENIGMA_API __declspec(dllexport)
	#else
		#define ENIGMA_API __declspec(dllimport)
	#endif
#else
	#error Unsupported platform!
#endif

#define BIT(x) (1 << x)