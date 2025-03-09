#include <stdint.h>

#define UART_BASE   0x40000000
#define UART_TX     (*(volatile uint8_t *)(UART_BASE + 0x08))
#define UART_RX     (*(volatile uint8_t *)(UART_BASE + 0x0C))
#define UART_STAT   (*(volatile uint8_t *)(UART_BASE + 0x04))

void uart_write(uint8_t data) {
    while (!(UART_STAT & 0x02)); // Wait until TX ready
    UART_TX = data;
}

uint8_t uart_read() {
    while (!(UART_STAT & 0x01)); // Wait until RX valid
    return UART_RX;
}

void uart_write_str(const char *str) {
    while (*str) {
        uart_write(*str++);
    }
}

void uart_read_str(char *buf, int len) {
    int i;
    for (i = 0; i < len - 1; i++) {
        buf[i] = uart_read();
        if (buf[i] == '\n') {
            break;
        }
    }
    buf[i] = '\0';
}

int main() {
    char buf[128];
    uart_write_str("Hello, World!\n");
    uart_read_str(buf, sizeof(buf));
    uart_write_str("You said: ");
    uart_write_str(buf);
    uart_write_str("\n");
    return 0;
}
