#pragma once

#include <cstdint> 
#include <cstddef>

#define BIT(x) (1 << x)

typedef int8_t  i8;
typedef int16_t i16;
typedef int32_t i32;
typedef int64_t i64;

typedef uint8_t  u8;
typedef uint16_t u16;
typedef uint32_t u32;
typedef uint64_t u64;

// These would be less of a performance hit than an actual bool
typedef int8_t  b8;
typedef int16_t b16;
typedef int32_t b32;

typedef float   f32;
typedef double  f64;

#define Kilobytes(Value) ((Value)*1024LL)
#define Megabytes(Value) (Kilobytes(Value)*1024LL)
#define Gigabytes(Value) (Megabytes(Value)*1024LL)

#ifdef THAUM_ENABLE_ASSERTS
	#define THAUM_ASSERT(x, ...) { if(!(x)) { HZ_ERROR("Assertion Failed: {0}", __VA_ARGS__); __debugbreak(); } }
#else
	#define THAUM_ASSERT(x, ...)
#endif

