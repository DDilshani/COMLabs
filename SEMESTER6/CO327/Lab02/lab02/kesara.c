#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <fcntl.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <sys/wait.h>

#define READ_END 0
#define WRITE_END 1

/**
 * Executes the command "cat fixtures | grep <input_country> | cut -b 1-9".  
 * Basic error checking is included for most system calls
 * 
 * @author Asitha Bandaranayake 
 * @edited By Kesara Gamlath
 * @version 0.2 05/08/2015
 */

#define INPUTFILE "fixtures"

/* function prototypes */
void die(const char*);

int main(int argc, char **argv)
{
	int pipefd[2];
	int pipefd2[2]; // Second pipe
	int pid;

	if (argc < 2)
	{
		printf("%s: missing operand\n", argv[0]);
		printf("Usage: %s <search_term in %s>\n", argv[0], INPUTFILE);
		exit(EXIT_FAILURE);
	}
	
	char *cat_args[] = {"cat", INPUTFILE, NULL};
	char *grep_args[] = {"grep", "-i", argv[1], NULL};
	char *cut_args[] = {"cut", "-b", "1-9", NULL};

	// make a pipe (fds go in pipefd[READ_END] and pipefd[WRITE_END])

	if (pipe(pipefd2) == -1)
		die("pipe2()");

	pid = fork();
	if(pid == (pid_t)(-1))
		die("fork()");

	if (pid == 0)
	{
		// child gets here and handles "grep <search_term> | cut -b 1-9"

		printf("Child Started!\n");

		if(pipe(pipefd) == -1) 
			die("pipe()");

		int pid2 = fork();

		if (pid2 < 0)
			die("fork2()");

		if (pid2 == 0){

			// child handles grep <seach_term>

			printf("New Child Started!\n");

			// replace standard output with output part of pipe
			if(dup2(pipefd[WRITE_END],1) == -1)
				die("dup2()");

			// close unused input half of pipe
			close(pipefd[READ_END]);

			// execute cat
			if(execvp("cat", cat_args) == -1)
				die("execvp()");

			exit(EXIT_SUCCESS);

		}

		else {

			// Paredt to handle cut -b 1-9

			printf("New Parent Started and waiting for New Child...!\n");
			// wait till child finishes
			wait(NULL);

			printf("New Child replied!\n");

			// replace standard input with input part of pipe
			if(dup2(pipefd[READ_END], 0) == -1)
				die("dup2()");

			if (dup2(pipefd2[WRITE_END], 1) == -1)
				die("dup2()");

			// close unused half of pipe
			close(pipefd[WRITE_END]);
			close(pipefd2[READ_END]);

			// execute grep
			if(execvp("grep", grep_args) == -1)
				die("execvp()");

			exit(EXIT_SUCCESS);	

		}


		exit(EXIT_SUCCESS);
	}
	else
	{
		// parent gets here and handles "cat INPUTFILE"

		printf("Parent Started and waiting for Child\n");

		wait(NULL);

		printf("Child replied!\n");

		// replace standard input with input part of pipe
		if(dup2(pipefd2[READ_END], 0) == -1)
			die("dup2()");

		// close unused half of pipe
		close(pipefd2[WRITE_END]);

		printf("Final Results:\n");

		// execute grep
		if(execvp("cut", cut_args) == -1)
			die("execvp()");

		exit(EXIT_SUCCESS);

		
	}
}

/* A better way to Die (exit) */
void die(const char *msg) {
	perror(msg);
	exit(EXIT_FAILURE);
}


