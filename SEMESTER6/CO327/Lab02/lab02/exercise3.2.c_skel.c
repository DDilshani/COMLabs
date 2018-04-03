#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <fcntl.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <sys/wait.h>

#define READ_END 0
#define WRITE_END 1
#define INPUTFILE "fixtures"

/**
 * Executes the command "cat fixtures | grep <search_term> | cut -b 1-9".
 */
/* function prototypes */
void die(const char*);

int main(int argc, char **argv)
{
	int pid;

	if (argc < 2)
	{
		printf("%s: missing operand\n", argv[0]);
		printf("Usage: %s <search_term in %s>\n", argv[0],INPUTFILE);
		exit(EXIT_FAILURE);
	}

	// arguments for commands
	char *cat_args[] = {"cat", INPUTFILE, NULL}; 
	char *grep_args[] = {"grep", "-i", argv[1], NULL};
	char *cut_args[] = {"cut", "-b", "1-9", NULL};

	// make 2 pipes (cat to grep and grep to cut); each has 2 fds
	int pipe1[2];
	int pipe2[2];

	// sets up 1st pipe
	if(pipe(pipe2) == -1) 
		die("pipe2()");

	// we now have 2 fds:
	// pipe2[0] = read end of grep->cut pipe (read by cut)
	// pipe2[1] = write end of grep->cut pipe (written by grep)
	
	// fork the first child (to execute cat and grep)
	pid = fork();

	if(pid < 0)
		die("fork()");

	if ( pid == 0){
		/*child*/
		printf("Child0: Child process started...\n");

		// sets up 2nd pipe
		if(pipe(pipe1) == -1) 
			die("pipe1()");

		// pipe1[0] = read end of cat->grep pipe (read by grep)
		// pipe1[1] = write end of cat->grep pipe (written by cat)

		// fork second child (to execute grep)
		int pid2 = fork();

		if(pid < 0)
			die("fork()");

		if (pid2 == 0){

			printf("Child1: Child process started...\n");

			// replace cat's stdout with write part of 1st pipe
			if(dup2(pipe1[WRITE_END], 1) == -1)
				die("dup2()");
			
			// close all pipes (very important!); end we're using was safely copied
			close(pipe1[READ_END]);
			// close(pipe2);

			// Execute the cat command
			if(execvp("cat", cat_args) == -1)
				die("execvp()");

			exit(EXIT_SUCCESS);

		} 
		else {

			printf("Parent1: Parent process started...\n");

			wait(NULL);

			printf("Parent1: Child1 finished...\n");

			// replace grep's stdin with read end of 1st pipe
			if(dup2(pipe1[READ_END], 0) == -1)
				die("dup2()");

			// replace grep's stdout with write end of 2nd pipe
			if(dup2(pipe2[WRITE_END], 1) == -1)
				die("dup2()");

			// close all ends of pipes
			close(pipe1[WRITE_END]);
			close(pipe2[READ_END]);

			// execute grep command
			if(execvp("grep", grep_args) == -1)
				die("execvp()");

			exit(EXIT_SUCCESS);
		}
		
	} else {
		// fork second child (to execute grep)
		printf("Parent0: Parent process started...\n");
		
		wait(NULL);
		
		printf("Parent0: Child0 finished...\n");
		// replace cut's stdin with input read of 2nd pipe
		if(dup2(pipe2[READ_END],0) == -1)
			die("dup2()");

		// if(dup2(pipe2[WRITE_END], 1) == -1)
		// 	die("dup2()");

		// close all ends of pipes
		close(pipe2[WRITE_END]);
		// close(pipe1);

		// execute cut command
		if(execvp("cut", cut_args) == -1)
			die("execvp()");

		exit(EXIT_SUCCESS);

	}

	//printf("out\n" );
	
	return 0;

}

/* A better way to Die (exit) */
void die(const char *msg) {
	perror(msg);
	exit(EXIT_FAILURE);
}