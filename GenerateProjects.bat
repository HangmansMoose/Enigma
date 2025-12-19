@echo off
if not exist .\Enigma\third_party\GLFW\premake5.lua copy Premake_files\GLFW_premake5.lua .\Enigma\third_party\GLFW\premake5.lua
if not exist .\Enigma\third_party\Glad\premake5.lua copy Premake_files\glad_premake5.lua .\Enigma\third_party\Glad\premake5.lua
if not exist .\Enigma\third_party\imgui\premake5.lua copy Premake_files\imgui_premake5.lua .\Enigma\third_party\imgui\premake5.lua
call premake5.exe vs2022
PAUSE
