#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <string.h>
#include <sys/wait.h>

#define READ_END 0
#define WRITE_END 1
#define STR_SIZE 200

void capitalize(char array[]);

int main(){

	int pipe1[2];	// parent --> child
	int pipe2[2];	// child --> parent
	pid_t pid;

	if(pipe(pipe1)) {
		perror("Pipe 1 creation");
		return -1;
	}

	if(pipe(pipe2)) {
		perror("Pipe 2 creation");
		return -1;
	}

	pid = fork();
	
	if(pid < 0) {
		perror("Fork");
		return -1;
	}

	if(pid > 0) {
	/* parent */

		printf("Parent: Parent process started...\n");

		//	Get input from the user
		printf("Parent: Enter Input String:\n");
		char input[STR_SIZE];
		scanf("%s", input);

		//	Send the string to the child
		close(pipe1[READ_END]);
		write(pipe1[WRITE_END], input, strlen(input));
		close(pipe1[WRITE_END]);
		
		printf("Parent: Waiting for child...\n");
		wait(NULL);

		//	Read the capilalized string
		char buffer2[STR_SIZE];
		close(pipe2[WRITE_END]);
		sleep(5); 
		int count = read(pipe2[READ_END], buffer2, STR_SIZE);
		buffer2[count] = '\0';

		//	Print the received string
		printf("Parent: Received String : %s\n", buffer2);
		exit(EXIT_SUCCESS);
	}

	if(pid == 0) {
	/* child */
		printf("Child: Child process started...\n");

		char buffer[STR_SIZE];

		// Read the string from parent
		close(pipe1[WRITE_END]);
		sleep(5); 
		int  count = read(pipe1[READ_END], buffer, STR_SIZE);
		buffer[count] = '\0';
		printf("Child: Received String : %s\n", buffer);

		//	Capitalize received string
		capitalize(buffer);

		// Send the String back to parent
		printf("Child: Sending Capitalized String : %s\n", buffer);
		close(pipe2[READ_END]);
		write(pipe2[WRITE_END], buffer, strlen(buffer));
		close(pipe2[WRITE_END]);

		exit(EXIT_SUCCESS);

	}

	
	
	return 0;
}

void capitalize(char array[]){

	int i, size;

	size = strlen(array);

	for (i = 0; i < size; i++){
		if (array[i] >= 'a' && array[i] <= 'z'){
			array[i] = array[i] - 'a' + 'A';
		}
	}
}
