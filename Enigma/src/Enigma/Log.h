#pragma once

#include "Core.h"
#include "spdlog/spdlog.h"
#include "spdlog/fmt/ostr.h"

namespace Enigma {

	class Log
	{
	public:
		static void Init();

		inline static std::shared_ptr<spdlog::logger>& GetCoreLogger() { return s_CoreLogger; }
		inline static std::shared_ptr<spdlog::logger>& GetClientLogger() { return s_ClientLogger; }
	private:
		static std::shared_ptr<spdlog::logger> s_CoreLogger;
		static std::shared_ptr<spdlog::logger> s_ClientLogger;
	};

}

// Core log macros
#define ENIGMA_CORE_TRACE(...)    ::Enigma::Log::GetCoreLogger()->trace(__VA_ARGS__)
#define ENIGMA_CORE_INFO(...)     ::Enigma::Log::GetCoreLogger()->info(__VA_ARGS__)
#define ENIGMA_CORE_WARN(...)     ::Enigma::Log::GetCoreLogger()->warn(__VA_ARGS__)
#define ENIGMA_CORE_ERROR(...)    ::Enigma::Log::GetCoreLogger()->error(__VA_ARGS__)
#define ENIGMA_CORE_FATAL(...)    ::Enigma::Log::GetCoreLogger()->fatal(__VA_ARGS__)

// Client log macros
#define ENIGMA_TRACE(...)	      ::Enigma::Log::GetClientLogger()->trace(__VA_ARGS__)
#define ENIGMA_INFO(...)	      ::Enigma::Log::GetClientLogger()->info(__VA_ARGS__)
#define ENIGMA_WARN(...)	      ::Enigma::Log::GetClientLogger()->warn(__VA_ARGS__)
#define ENIGMA_ERROR(...)	      ::Enigma::Log::GetClientLogger()->error(__VA_ARGS__)
#define ENIGMA_FATAL(...)	      ::Enigma::Log::GetClientLogger()->fatal(__VA_ARGS__)