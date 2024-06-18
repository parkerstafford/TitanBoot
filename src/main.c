void main() {
    char *video_memory = (char *)0xb8000;
    *video_memory = 'X';
    *(video_memory + 1) = 0x07;
    while (1) {}
}