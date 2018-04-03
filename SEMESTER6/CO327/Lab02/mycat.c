#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <fcntl.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <string.h>

#define BUF_SIZE 1000

int main(int argc, char const *argv[]){

	int out;
	char *buffer = malloc(BUF_SIZE + 1);

	// Get file path
	char const *path = argv[1];
	// char const *path = "Answers.txt";

	// Openning the file to read
	out = open(path, O_RDONLY);

	if(out == -1)
	{
		fprintf(stderr,"Couldn't open the file\n");
		return 1;
	} 

	size_t ret = read(out, buffer, BUF_SIZE);

	if(ret == -1)
	{
		fprintf(stderr,"Error reading from file\n");
		return 1;
	}

	buffer[ret] = '\0';

	printf("File Output:\n%s\n", buffer);

	free(buffer);

	ret = close(out);

	if(ret == -1)
	{
		fprintf(stderr,"Error closing the file after reading.\n");
		return 1;
	}


	return 0;
}