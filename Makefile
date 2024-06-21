all: bootloader.bin

bootloader.bin: src/bootloader.asm
	nasm -f bin -o bootloader.bin src/bootloader.asm

clean:
	rm -f bootloader.bin
