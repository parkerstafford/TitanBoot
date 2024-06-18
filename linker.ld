OUTPUT_FORMAT("binary")
ENTRY(start)

SECTIONS {
    . = 0x7c00;
    .text : {
        *(.text)
        *(.rodata)
    }
    .data : {
        *(.data)
    }
    .bss : {
        *(.bss)
    }
    /DISCARD/ : {
        *(.comment)
        *(.eh_frame)
    }
}
