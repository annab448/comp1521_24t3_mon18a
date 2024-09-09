#include <stdio.h>

int main(void) {
	// str = "Hi"
    char str[10];
    str[0] = 'H';
    str[1] = 'i';
	str[2] = '\0';
    printf("%s", str);
    return 0;
}
