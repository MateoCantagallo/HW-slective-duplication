int main() {
    volatile int counter;
    int res = 0;
    int res1 = 3;
    int res2 = 3;
    for (counter = 0; counter < 10; counter++) {
        res2 *= counter;
    }
    for (counter = 0; counter < 100000; counter++) {
        res += counter;
    }
    for (counter = 0; counter < 100000; counter++) {
        res1 -= counter;
    }
   
    
    res = res2 * res1;
    res1 = res * res1;
    res2 = res2 * res1;
    res = res2 * res1;
    res = res2 * res1;
    return 0;
}
