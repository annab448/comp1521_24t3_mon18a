#include <stdio.h>

int main(void) {
  int i = 0;		// start
  while (i < 10) {	// stop
    printf("%d\n", i);
    i++;			// change
  }

  int k;
  // for (start; stop; change) {
  for (k = 0; k < 10; k++) {
	printf("%d\n", k);
  }

}
