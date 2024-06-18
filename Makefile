CFLAGS=-m16 -ffreestanding -Wall -Wextra -nostdlib -fno-builtin -fno-stack-protector -mno-red-zone -lgcc

all: bootloader.bin

bootloader.bin: bootloader.o main.o
    ld -T linker.ld -o bootloader.bin bootloader.o main.o

bootloader.o: bootloader.asm
    nasm -f elf32 -o bootloader.o bootloader.asm

main.o: main.c
    gcc $(CFLAGS) -c -o main.o main.c

clean:
    rm -f *.o bootloader.bin
