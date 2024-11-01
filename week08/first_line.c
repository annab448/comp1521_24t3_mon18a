#include <stdio.h>


int main(int argc, char *argv[]) {
	char *fname = argv[1];
	// pretend errors were hcecked

	FILE *stream = fopen(fname, "r");
	if (stream == NULL) {
		perror(fname);
	}

	int c;

	while ((c = fgetc(stream)) != EOF) {
		fputc(c, stdout);
		if (c == '\n') break;
	}

	fclose(stream);
}
