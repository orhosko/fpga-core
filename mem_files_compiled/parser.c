int uart_read();
void uart_write(int c);

int main() {
    asm volatile("li sp, 0x0200");

    while(1) {
        int a = uart_read();
        uart_write(a);
    }
}

int uart_read() {
    int c;
    asm volatile("li a0, 0x10000000");
    asm volatile("sw a0, 0(sp)");
    return c;
}

void uart_write(int c) {
    asm volatile("li a0, 0x10000000");
    asm volatile("lw a0, 0(sp)");
}
