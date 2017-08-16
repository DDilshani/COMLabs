#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <fcntl.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <string.h>

#define BUF_SIZE 10000

int main(int argc, char const *argv[]){

	int outRead, outWrite;
	char *buffer = malloc(BUF_SIZE + 1);

	// Get file path
	char const *source = argv[1];
	char const *dest = argv[2];

	// Openning the source file to read
	outRead = open(source, O_RDONLY);

	if(outRead == -1)
	{
		fprintf(stderr,"Couldn't open the source file\n");
		return 1;
	} 

	// Openning the dest file to write
	outWrite = open(dest, O_WRONLY | O_TRUNC | O_CREAT, S_IWUSR | S_IRUSR);

	if(outWrite == -1)
	{
		fprintf(stderr,"Couldn't open the destination file\n");
		return 1;
	} 

	//Reading from source file
	size_t retRead = read(outRead, buffer, BUF_SIZE);

	if(retRead == -1)
	{
		fprintf(stderr,"Error reading from source file\n");
		return 1;
	}

	buffer[retRead] = '\0';

	// Writing to dest file
	size_t retWrite = write(outWrite, buffer, strlen(buffer));
	
	if(retWrite == -1)
	{
		fprintf(stderr,"Error writing to destinationfile\n");
		return 1;
	}

	free(buffer);

	//	Closing source file after reading
	size_t retCloseSource = close(outRead);

	if(retCloseSource == -1)
	{
		fprintf(stderr,"Error closing the file after reading.\n");
		return 1;
	}

	//	Closing dest file after writing
	size_t retCloseDest = close(outWrite);

	if(retCloseDest == -1)
	{
		fprintf(stderr,"Error closing the file after writing.\n");
		return 1;
	}


	return 0;
}