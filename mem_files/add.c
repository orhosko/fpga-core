int main() {
    asm volatile("li sp, 0x0200");

    volatile int a = 1;
    int b = 1;

    for(int i = 0; i < 10; i++) {
        b = a;
        a = a + b;
    }

    return a;
}
