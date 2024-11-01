#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define LINE_MAX 2048

void search_stream(FILE *stream, char *search_string, char *filename) {
	int line_no = 1;
	char line[LINE_MAX];

	while (fgets(line, LINE_MAX-1, stream) != NULL) {
		if (strstr(line, search_string) != NULL) {
			printf("%s:%d:%s", filename, line_no, line);
		}
		line_no++;
	}
}

int main(int argc, char **argv) {
	if (argc == 1) {
		fprintf(stderr, "Usage: %s search_string [files]\n", argv[0]);
	} else if (argc == 2) {
		search_stream(stdin, argv[1], "");
	} else {
		// search files
		for (int i = 2; i < argc; i++) {
			// open our file
			FILE *stream = fopen(argv[i], "r");
			if (stream == NULL) {
				perror(argv[i]);
				exit(1);
			}

			search_stream(stream, argv[1], argv[i]);

		}
	}
}
