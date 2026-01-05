#include "enigma_pch.h"
#include "OpenGLContext.h"

#include <glad/glad.h>
#include <GLFW/glfw3.h>

OpenGLContext::OpenGLContext(GLFWwindow* windowHandle)
	: m_WindowHandle(windowHandle)
{
	ENIGMA_CORE_ASSERT(windowHandle, "Window handle is null!")
}

void OpenGLContext::Init()
{
	glfwMakeContextCurrent(m_WindowHandle);
	int status = gladLoadGLLoader((GLADloadproc)glfwGetProcAddress);
	ENIGMA_CORE_ASSERT(status, "Failed to initialize Glad!");


	ENIGMA_CORE_INFO("OpenGL Info:");
	ENIGMA_CORE_INFO("  Vendor: {0}",	(char*)glGetString(GL_VENDOR));
	ENIGMA_CORE_INFO("  Renderer: {0}", (char*)glGetString(GL_RENDERER));
	ENIGMA_CORE_INFO("  Version: {0}",  (char*)glGetString(GL_VERSION));

}

void OpenGLContext::SwapBuffers()
{
	glfwSwapBuffers(m_WindowHandle);
}
