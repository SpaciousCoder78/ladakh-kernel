# ladakh-kernel
![Assembly](https://img.shields.io/badge/Assembly-brown?style=for-the-badge&logo=asm)
![C](https://img.shields.io/badge/c-%2300599C.svg?style=for-the-badge&logo=c&logoColor=white)
![Linux](https://img.shields.io/badge/Linux-FCC624?style=for-the-badge&logo=linux&logoColor=black)
![macOS](https://img.shields.io/badge/mac%20os-000000?style=for-the-badge&logo=macos&logoColor=F0F0F0)

A 32-bit x86 based Kernel for khardunglaDOS based on i686-elf architecture

Supported Operating Systems for Building: 

![macOS](https://img.shields.io/badge/mac%20os-000000?style=for-the-badge&logo=macos&logoColor=F0F0F0)
![Linux](https://img.shields.io/badge/Linux-FCC624?style=for-the-badge&logo=linux&logoColor=black)


# Installing

- Build and Install GCC and binutils for i686-elf from this guide: https://wiki.osdev.org/GCC_Cross-Compiler
- Clone this repository
  ```sh
  $ git clone https://github.com/SpaciousCoder78/ladakh-kernel.git
  ```
- Assemble `boot.s`
  ```sh
  $ i686-elf-as boot/boot.s -o boot.o
  ```
- Compile `kernel.c`
  ```sh
  $ i686-elf-gcc -c kernel/kernel.c -o kernel.o -std=gnu99 -ffreestanding -O2 -Wall -Wextra
  ```
- Link kernel and bootstrap using `linker.ld`
  ```sh
  $ i686-elf-gcc -T linker.ld -o myos.bin -ffreestanding -O2 -nostdlib boot.o kernel.o -lgcc
  ```
- sd
