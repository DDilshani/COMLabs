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
 * Executes the command "cat fixtures | grep <search_term> | cut -b 1-9".  
 * Basic error checking is included for most system calls
 * 
 * @author Asitha Bandaranayake 
 * @edited by Udaree Kanewala
 * @version 0.2 05/08/2015
 */

#define INPUTFILE "fixtures"

/* function prototypes */
void die(const char*);

int main(int argc, char **argv)
{
	int pipefd[2];
	int pipefd2[2];
	int pid;

	if (argc < 2)
	{
		printf("%s: missing operand\n", argv[0]);
		printf("Usage: %s <search_term in %s> 1-9\n", argv[0],INPUTFILE);
		exit(EXIT_FAILURE);
	}
	
	char *cat_args[] = {"cat", INPUTFILE, NULL};
	char *grep_args[] = {"grep", "-i", argv[1], NULL};
	char *grep_args[] = {"cut", "-b", argv[2], NULL};

	// make a pipe (fds go in pipefd[0] and pipefd[1])

	if(pipe(pipefd) == -1) 
		die("pipe()");

	pid = fork();
	if(pid == (pid_t)(-1))
		die("fork()");

	if (pid == 0)
	{
		// child gets here and handles "grep <search_term> | cut -b 1-9"
		close(0)

		// replace standard input with input part of pipe
		if(dup(pipefd[READ_END]) == -1)
			die("dup()");;

		// close unused half of pipe
		close(pipefd[WRITE_END]);

		// execute grep
		if(execvp("grep", grep_args) == -1)
			die("execvp()");

		exit(EXIT_SUCCESS);
	}
	else
	{
		// parent gets here and handles "cat INPUTFILE"

		// close standard output
		close(1);

		// replace standard output with output part of pipe
		if(dup(pipefd[WRITE_END]) == -1)
			die("dup()");

		// close unused input half of pipe
		close(pipefd[READ_END]);

		// execute cat
		if(execvp("cat", cat_args) == -1)
			die("execvp()");

		exit(EXIT_SUCCESS);
	}
}

/* A better way to Die (exit) */
void die(const char *msg) {
	perror(msg);
	exit(EXIT_FAILURE);
}
