#include <Engima.h>

class Sandbox : public Enigma::Application
{
public:
	Sandbox()
	{

	}

	~Sandbox()
	{

	}
};

Enigma::Application* Enigma::CreateApplication()
{
	return new Sandbox;
}

