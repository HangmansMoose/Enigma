#pragma once

#ifdef ENIGMA_PLATFORM_WINDOWS

// Function definition in client application
extern Enigma::Application* Enigma::CreateApplication();

int main(int argc, char* argv[])
{
	Enigma::Log::Init();
	ENIGMA_CORE_WARN("Logger Initialized!");
	ENIGMA_INFO("Logger Initialized!");
	auto app = Enigma::CreateApplication();
	app->Run();
	delete app;
}
#endif
