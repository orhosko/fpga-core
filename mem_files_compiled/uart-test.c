#include <stdint.h>

#define UART_BASE 0x10000000
#define UART_STAT (*(volatile uint8_t *)(UART_BASE + 0x04))
#define UART_TX (*(volatile uint8_t *)(UART_BASE + 0x08))
#define UART_RX (*(volatile uint8_t *)(UART_BASE + 0x0C))

// sending and reading a char takes ~235 inst

// ------------------------------------------------------------------
static inline __attribute__((always_inline)) void delay(int n) {
    volatile int a = 0;
    for (int j = 0; j < n; j++) {
        a++;
    }
}

static inline __attribute__((always_inline)) void debug_a(char a) {
    delay(10000);
    while (!(UART_STAT & 0x02))
        ; // Wait until TX ready

    UART_TX = a;
}
// ------------------------------------------------------------------

void uart_write(uint8_t data) {
    while (!(UART_STAT & 0x02))
        ; // Wait until TX ready
    UART_TX = data;
}

uint8_t uart_read() {
    while (!(UART_STAT & 0x01))
        ; // Wait until RX valid

    char c = UART_RX;
    uart_write(c);

    return c;
}

void uart_write_str(const char *str) {
    int i = 0;
    while (*str != '\0') {
        uart_write(*str++);

        i++;
        if (i > 63) {
            break;
        }
    }
}

void uart_read_str(char *buf, int len) {
    int i;
    for (i = 0; i < len - 1; i++) {
        buf[i] = uart_read();
        if (buf[i - 1] == '\r' && buf[i] == '\n') {
            break;
        }
    }
    buf[i] = '\0';
}

int main() {
    char buf[64];

    buf[0] = '1';
    buf[1] = '2';
    buf[2] = '3';
    buf[3] = '4';
    buf[4] = '\r';
    buf[5] = '\n';
    buf[6] = '\0';

    buf[61] = '\r';
    buf[62] = '\n';
    buf[63] = '\0';

    uart_write_str(buf);

    uart_write_str("Hello");
    uart_write_str(buf + 61);

    int i = 'a';
    for (int j = 0; j < 100; j++) {
        uart_write(i);
        i++;

        if (i > 'z') {
            i = 'a';
            uart_write('\r');
            uart_write('\n');
        }
    }
    uart_write_str(buf + 61);

    while (1) {
        uart_write_str("Please enter something:\r\n");
        uart_read_str(buf, sizeof(buf));
        uart_write_str("You said: ");
        uart_write_str(buf);
        uart_write_str("\r\n");
    }

    return 0;
}
