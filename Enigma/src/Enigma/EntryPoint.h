#pragma once

#ifdef ENIGMA_PLATFORM_WINDOWS

// Function definition in client application
extern Enigma::Application* Enigma::CreateApplication();

int main(int argc, char* argv[])
{
	auto app = Enigma::CreateApplication();
	app->Run();
	delete app;
}
#endif
