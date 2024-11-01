#include <stdio.h>


int main(int argc, char *argv[]) {
	char *fname = argv[1];
	// pretend errors were hcecked

	FILE *stream = fopen(fname, "a");
	if (stream == NULL) {
		perror(fname);
	}

	int c;

	while ((c = fgetc(stdin)) != EOF) {
		fputc(c, stream);
		if (c == '\n') break;
	}

	fclose(stream);
}
