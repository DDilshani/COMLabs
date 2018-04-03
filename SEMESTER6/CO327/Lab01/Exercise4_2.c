#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include  <sys/types.h>
#include <sys/wait.h>

#define MAX_LEN 250
#define ARG_LEN 20



int main(void){

	printf("Welcome to the Simple Shell!\n");
	char command[MAX_LEN];
	char arg[ARG_LEN];
	// char path[6] = "/bin/";
	// char *command = (char*)malloc(sizeof(char)* MAX_LEN);


	while (1){

		printf("\nPlease Enter Your Command and Arguments: \n");
		printf("Command: ");
		scanf("%s", command);
		
		char c = getchar(); // To remove space
		// printf("Argument: ");

		// scanf("%[^\t\n]s", line);
		fgets(arg, sizeof arg, stdin);
		size_t len = strlen(arg);
	  	if (len > 0 && arg[len-1] == '\n') {
			arg[--len] = '\0';
		}

		// command = strcat(path, line);

		int pid;
		pid = fork();

		if (pid < 0){

			perror("fork");
			exit(1);
		}

		if (pid == 0){ // child process

			if (strlen(arg) == 0){ // If no arguments given
				execl(command, command, (char*)NULL);
				
			} else {
				execl(command, command, arg, (char*)NULL);
			}
		
		} else {	//parent waiting
			wait(NULL);
		}
	}

}