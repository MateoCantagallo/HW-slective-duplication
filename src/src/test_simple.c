#include <stdio.h>

int main(int argc, char *argv[]) {
    printf("Hello from Alpha ELF!\n");
    printf("argc = %d\n", argc);
    
    for (int i = 0; i < argc; i++) {
        printf("argv[%d] = %s\n", i, argv[i]);
    }
    
    // Simple arithmetic to test basic operations
    int a = 10;
    int b = 20;
    int c = a + b;
    printf("10 + 20 = %d\n", c);
    
    return 42;  // distinctive return code
}
