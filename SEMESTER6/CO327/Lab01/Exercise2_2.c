#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include  <sys/types.h>

int main(void){

	int pid;
	int i;
	for (i = 0; i < 3; i++){
		pid = fork();

		if (pid < 0){

			perror("fork");
			exit(1);
		}

		if (pid == 0)
			printf("This is the child %d process\n", i);
		else
			printf("This is the parent %d process\n", i);
	}

	return 0;
}