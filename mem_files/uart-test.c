#include <stdint.h>

#define UART_BASE 0x10000000
#define UART_STAT (*(volatile uint32_t *)(UART_BASE + 0x04))
#define UART_TX (*(volatile uint32_t *)(UART_BASE + 0x08))
#define UART_RX (*(volatile uint32_t *)(UART_BASE + 0x0C))

void uart_write(uint8_t data) {
  while (!(UART_STAT & 0x02))
    ; // Wait until TX ready
  UART_TX = data;
}

uint8_t uart_read() {
  while (!(UART_STAT & 0x01))
    ; // Wait until RX valid
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
static char *hello = "Hello, World!\n";
volatile int i = 0;
volatile int j = 1;
volatile int k = 2;
int main() {
  char buf[128];
  uart_write_str(hello);
  uart_write(i);
  uart_write(j);
  uart_read_str(buf, sizeof(buf));
  uart_write_str("You said: ");
  uart_write_str(buf);
  uart_write_str("\n");
  return 0;
}
