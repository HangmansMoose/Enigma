#pragma once

#ifdef ENIGMA_PLATFORM_WINDOWS

extern Enigma::Application* Enigma::CreateApplication();

int main(int argc, char** argv)
{
	Enigma::Log::Init();
	ENIGMA_CORE_WARN("Initialized Log!");
	int a = 5;
	ENIGMA_INFO("Hello! Var={0}", a);

	auto app = Enigma::CreateApplication();
	app->Run();
	delete app;
}

#endif