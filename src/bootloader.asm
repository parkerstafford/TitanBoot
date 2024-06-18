bits 16

org 0x7c00  ; The origin where BIOS loads the bootloader

start:
    cli                   ; Clear interrupts
    xor ax, ax            ; Zero out AX
    mov ds, ax            ; Set DS to 0
    mov es, ax            ; Set ES to 0
    mov ss, ax            ; Set SS to 0
    mov sp, 0x7c00        ; Set stack pointer to 0x7c00
    sti                   ; Enable interrupts

    ; Set up segment registers
    mov ax, 0x07C0
    mov ds, ax
    mov es, ax

    ; Bootloader code goes here

    ; Infinite loop to halt the system
hang:
    jmp hang

; Boot sector signature
times 510-($-$$) db 0
dw 0xaa55
