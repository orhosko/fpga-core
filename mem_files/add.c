int func(int a, int b);

int main() {
    asm volatile("li sp, 0x0200");

    volatile int a = 32;
    volatile int b = 2;

    return func(a, b);
}

int func(int a, int b) {
    if(b==0)
        return 0;

    return func(a, b-1) - a;
}
