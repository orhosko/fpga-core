#include <stdint.h>

#define UART_BASE 0x10000000
#define UART_STAT (*(volatile uint8_t *)(UART_BASE + 0x04))
#define UART_TX (*(volatile uint8_t *)(UART_BASE + 0x08))
#define UART_RX (*(volatile uint8_t *)(UART_BASE + 0x0C))

void uart_write(uint8_t data) {
  volatile int a=0;
  for(int j = 0; j < 10000; j++) { // ~30k inst
    a++;
  }

  while (!(UART_STAT & 0x02)) // ~235 inst
    ; // Wait until TX ready
  UART_TX = data;
}

uint8_t uart_read() {
  while (!(UART_STAT & 0x01)) // ~235 inst
    ; // Wait until RX valid

  char c = UART_RX;
  uart_write(c);
  
  return c;
}

void uart_write_str(const char *str) {
  while (*str) {
    uart_write(*str++);
  }
}

void uart_read_str(char *buf, int len) {
  int i;
  for (i = 0; i < len - 2; i++) {
    buf[i] = uart_read();
    if (buf[i] == '\n') {
      break;
    }
  }
  buf[i] = '\0';
}

char buf[16];
int main() {
 
  uart_write_str("Hello\r\n");
  uart_write_str("Please enter something:\r\n");
  uart_read_str(buf, sizeof(buf));
  uart_write_str("You said: ");
  uart_write_str(buf);

  int i = 'a';
  for(int j=0; j<1000; j++) {
    uart_write(i);
    i++;
    
    if (i > 'z') {
      i = 'a';
      uart_write('\r');
      uart_write('\n');
    }
  }

  return 0;
}
