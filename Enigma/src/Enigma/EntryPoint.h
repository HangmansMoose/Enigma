#pragma once

#ifdef ENIGMA_PLATFORM_WINDOWS

// Function definition in client application
extern Enigma::Application* Enigma::CreateApplication();

int main(int argc, char* argv[])
{
	Enigma::Log::Init();
	Enigma::Log::GetCoreLogger()->warn("Logger Initialized!");
	Enigma::Log::GetClientLogger()->warn("Logger Initialized!");
	auto app = Enigma::CreateApplication();
	app->Run();
	delete app;
}
#endif
