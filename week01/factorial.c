#include <stdio.h>

int factorial(int num) {
	// do I need to stop?
	printf("factorial called on %d\n", num);
	if (num <= 2) {
		printf("reached 2, stopping\n");
		return 2;
	}

	// 4! = 4*3*2*1 = 4 * 3!
	// change
	return num * factorial(num-1);
}

int main(void) {
	int num;
	printf("enter a number: ");
	scanf("%d", &num);

	int fac = factorial(num); // START => whatever the user enters
	printf("%d\n", fac);
	
}
