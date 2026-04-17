# asp1-rin Assembly Project #1

## Description
This project is a lightweight Windows executable written in x86-64 Assembly. It demonstrates low-level system calls and Winsock API integration to fetch and display the local machine's IP address. This version includes a custom application icon embedded via Windows resource compilation.

## Features
* Written entirely in Assembly (NASM syntax).
* Interacts directly with Windows APIs (WSAStartup, gethostname, etc.).
* Custom application icon (search.ico) integrated into the executable.
* Automated CI/CD pipeline for generating .exe files via GitHub Actions.

## Project Structure
* main.asm: Primary assembly source code.
* resource.rc: Resource script for embedding the icon.
* search.ico: Application icon file.
* .github/workflows/build.yml: Automated build configuration.

## Requirements
To build this project locally, you need:
* NASM (Netwide Assembler)
* Mingw-w64 (for x86_64-w64-mingw32-gcc and windres)

## How to Build
Run the following commands in your terminal:

1. Assemble the source code:
   nasm -f win64 main.asm -o main.o

2. Compile the resource file:
   x86_64-w64-mingw32-windres resource.rc -o resource.o

3. Link all objects into a Windows executable:
   x86_64-w64-mingw32-gcc main.o resource.o -o my_ip_tool.exe -lws2_32 -static

## Usage
1. Download the executable from the Actions artifact tab in the GitHub repository.
2. Open Command Prompt (CMD).
3. Run my_ip_tool.exe to see your local IP address.

## License
This project is for educational purposes regarding system programming, assembly language, and Windows resource management.
