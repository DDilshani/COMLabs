#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include  <sys/types.h>

int main(void){

	int pid;
	pid = fork();

	if (pid < 0){

		perror("fork");
		exit(1);
	}

	if (pid == 0)
		puts("This is the child process");
	else
		puts("This is the parent process");

	return 0;
}