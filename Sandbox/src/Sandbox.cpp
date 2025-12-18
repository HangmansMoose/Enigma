#include <Enigma.h>

class ExampleLayer : public Enigma::Layer
{
public:
	ExampleLayer()
		: Layer("Example")
	{
	}

	void OnUpdate() override
	{
		ENIGMA_INFO("ExampleLayer::Update");
	}

	void OnEvent(Enigma::Event& event) override
	{
		ENIGMA_TRACE("{0}", event.ToString());
	}

};
class Sandbox : public Enigma::Application
{
public:
	Sandbox()
	{
		PushLayer(new ExampleLayer());
		PushOverlay(new Enigma::ImGuiLayer());

	}

	~Sandbox()
	{

	}
};

Enigma::Application* Enigma::CreateApplication()
{
	return new Sandbox;
}

