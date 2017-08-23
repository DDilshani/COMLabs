#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <fcntl.h>
#include <sys/types.h>
#include <sys/stat.h>

#define MAX_SIZE 1024 


void die(const char *msg);

int main() 
{ 

	int fd1, fd2; 
	char* fifo1 = "/tmp/fifo1"; 
	char* fifo2 = "/tmp/fifo2";

	char *tr_args[] = {"tr", "[:lower:]", "[:upper:]", NULL};

	printf("Waiting for the Sender to send a String...\n");

    // Make 2 named pipelines
	mkfifo(fifo1, 0666);
	mkfifo(fifo2, 0666);

	// Set STDIN and STDOUT for the process
	fd1 = open(fifo1, O_RDONLY);
	fd2 = open(fifo2, O_WRONLY);

	// Replace STDIN with input of the pipe
	if (dup2(fd1, 0) == -1)
		die("dup2()");

	// Repalce STDOUT with output pipe
	if (dup2(fd2, 1) == -1)
		die("dup2()");

	// Execute tr() command
	if(execvp("tr", tr_args) == -1)
		die("execvp()");

	close(fd1);
	close(fd2);

	exit(EXIT_SUCCESS);

    return 0; 
}

/* A better way to Die (exit) */
void die(const char *msg) {
	perror(msg);
	exit(EXIT_FAILURE);
}