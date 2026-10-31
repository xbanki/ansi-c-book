#include <stdio.h>

int main() {
    int upper = 300;
    int step  = 20;
    int lower = 0;

    float fahr = lower;
    float cels;

    printf("%7s %4s\n", "°C", "°F");
    while (fahr <= upper) {
        cels = (5.0 / 9.0) * (fahr - 32.0);
        printf("%6.1f %3.0f\n", cels, fahr);
        fahr = fahr + step;
    }
}
