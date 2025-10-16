# NOTES

## Project setup
Add reference to Enigma in Sandbox project (right-click add). This ensures that when Enigma is compiled the linking to it in Sandbox is
also updated. It also automatically adds the lib files to the linker options.

Visual Studio will automatically create the lib file when you compile a dll. The lib contains all the signatures of the exported functions 
so it can be linked against at compile time, but the dll contains the actual compiled code that is required at run time.
