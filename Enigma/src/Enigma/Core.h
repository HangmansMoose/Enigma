#pragma once

#ifdef ENIGMA_DEBUG
	#define ENIGMA_ENABLE_ASSERTS
#endif

#ifdef ENIGMA_ENABLE_ASSERTS
	#define ENIGMA_ASSERT(x, ...) { if(!(x)) { ENIGMA_ERROR("Assertion Failed: {0}", __VA_ARGS__); __debugbreak(); } }
	#define ENIGMA_CORE_ASSERT(x, ...) { if(!(x)) { ENIGMA_CORE_ERROR("Assertion Failed: {0}", __VA_ARGS__); __debugbreak(); } }
#else
	#define ENIGMA_ASSERT(x, ...)
	#define ENIGMA_CORE_ASSERT(x, ...)
#endif

#define BIT(x) (1 << x)

#define ENIGMA_BIND_EVENT_FN(fn) std::bind(&fn, this, std::placeholders::_1)