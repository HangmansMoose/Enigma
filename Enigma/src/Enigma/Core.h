#pragma once

#ifdef ENIGMA_PLATFORM_WINDOWS
	#ifdef ENIGMA_BUILD_DLL
		#define ENIGMA_API __declspec(dllexport)
	#else
		#define ENIGMA_API __declspec(dllimport)
	#endif
#else
	#error Enigma only supports Windows!
#endif

#ifdef ENIGMA_ENABLE_ASSERTS
	#define ENIGMA_ASSERT(x, ...) { if(!(x)) { ENIGMA_ERROR("Assertion Failed: {0}", __VA_ARGS__); __debugbreak(); } }
	#define ENIGMA_CORE_ASSERT(x, ...) { if(!(x)) { ENIGMA_CORE_ERROR("Assertion Failed: {0}", __VA_ARGS__); __debugbreak(); } }
#else
	#define ENIGMA_ASSERT(x, ...)
	#define ENIGMA_CORE_ASSERT(x, ...)
#endif

#define BIT(x) (1 << x)
