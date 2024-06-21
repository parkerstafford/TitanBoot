[bits 16]
[org 0x7c00]

start:
    ; Set up segment registers
    cli
    cld
    xor ax, ax
    mov ds, ax
    mov es, ax
    mov ss, ax
    mov sp, 0x7c00

    ; Set up the A20 line
    in al, 0x92
    or al, 00000010b
    out 0x92, al

    ; Print start up message to the screen
    mov si, msg
    call print_string

    ; Hang
hang:
    hlt
    jmp hang

print_string:
    mov ah, 0x0E ; BIOS teletype function
.repeat:
    lodsb
    cmp al, 0
    je .done
    int 0x10
    jmp .repeat
.done:
    ret

msg db 'TitanBoot has successfully started', 0

times 510-($-$$) db 0
dw 0xaa55
