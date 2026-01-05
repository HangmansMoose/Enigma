#pragma once

#include <cstdint>
#include <print>


// I like more concise keywords, especially when it comes to data types.
typedef int8_t i8;
typedef int16_t i16;
typedef int32_t i32;
typedef int64_t i64;

typedef uint8_t u8;
typedef uint16_t u16;
typedef uint32_t u32;
typedef uint64_t u64;

typedef float f32;
typedef double f64;



// #############################################################################
//                           Defines
// #############################################################################

// This causes a breakpoint to occur dynamically (ie when an assertion is not met)
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