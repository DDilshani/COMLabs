#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include  <sys/types.h>

int main(int argc, char **argv){

	execl("/bin/ls", "-l", argv[1], NULL);
	puts("Program ls has terminated");

}

