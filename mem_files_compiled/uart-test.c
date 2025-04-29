#include <stdint.h>

#define UART_BASE 0x10000000
#define UART_STAT (*(volatile uint8_t *)(UART_BASE + 0x04))
#define UART_TX (*(volatile uint8_t *)(UART_BASE + 0x08))
#define UART_RX (*(volatile uint8_t *)(UART_BASE + 0x0C))

static inline __attribute__((always_inline)) void delay(int n) {
  volatile int a=0;
  for(int j = 0; j < n; j++) {
    a++;
  }
}

static inline __attribute__((always_inline)) void debug_a(char a) {
  delay(10000);
  while (!(UART_STAT & 0x02))
    ; // Wait until TX ready

  UART_TX = a;
}

void uart_write(uint8_t data) {
  debug_a('4');
  volatile int a=0;
  for(int j = 0; j < 10000; j++) { // ~30k inst
    a++;
  }

  while (!(UART_STAT & 0x02)) // ~235 inst
    ; // Wait until TX ready
  UART_TX = data;
  debug_a('5');
}

uint8_t uart_read() {
  while (!(UART_STAT & 0x01)) // ~235 inst
    ; // Wait until RX valid

  char c = UART_RX;
  uart_write(c);
  
  return c;
}

void uart_write_str(const char *str) {
  debug_a('2');
  while (*str != '\0') {
    debug_a('3');
    uart_write(*str++);
  }
}

void uart_read_str(char *buf, int len) {
  int i;
  for (i = 0; i < len - 1; i++) {
    buf[i] = uart_read();
    if (buf[i-1] == '\r' && buf[i] == '\n') {
      break;
    }
  }
  buf[i] = '\0';
}

char buf[16];
int main() {

  debug_a('1');
  
  uart_write_str("Hello\r\n");
  while(1)
    {
      uart_write_str("Please enter something:\r\n");
      uart_read_str(buf, sizeof(buf));
      uart_write_str("You said: ");
      uart_write_str(buf);
      uart_write_str("\r\n");
    }

  return 0;
}
