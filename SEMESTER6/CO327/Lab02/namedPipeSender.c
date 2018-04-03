#include <fcntl.h> 
#include <stdio.h> 
#include <sys/stat.h> 
#include <unistd.h> 
#include <string.h> 


#define MAX_SIZE 1024 

int main() 
{ 
    int fd1, fd2; 
    char * fifo1 = "/tmp/fifo1";
    char * fifo2 = "/tmp/fifo2";

    char input [MAX_SIZE];

    printf("Enter Input String: "); 
    scanf("%s", input);

    //Make two named pipes
    mkfifo(fifo1,0666); 
    mkfifo(fifo2,0666); 

    printf("Waiting for the other process...\n");
    
    // Send data to the other process
    fd1 = open(fifo1, O_WRONLY); 
    write(fd1, input , strlen(input)); 
    close(fd1);

    // Read data from pipe capitalized by the other process
    char buffer[MAX_SIZE];
    fd2 = open(fifo2, O_RDONLY); 
    read(fd2, buffer , MAX_SIZE); 
    close(fd2);

    // Print out the line
    printf("Capitalized string: %s\n", buffer);

    // Destroy pipes
    unlink(fifo1); 
    unlink(fifo2); 

    return 0; 
}
