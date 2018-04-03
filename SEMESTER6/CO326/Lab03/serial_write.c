#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <termios.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <unistd.h>
#include <limits.h>
        
#define BAUDRATE B115200 
#define MODEMDEVICE "/dev/ttyS4"
#define _POSIX_SOURCE 1 /* POSIX compliant source */
#define FALSE 0
#define TRUE 1
 
void openport(void);
void readport(void);
void sendport(void);
void closeport(void);

int fd=0;
struct flock lock;
struct termios oldtp, newtp;
 
int main()
{
 

	openport();
	sleep(1);
	sendport();
	closeport();
	return 0; 

}
 
void sendport(void)
{
         int n;
         printf("Start send\n");
         char* line = "I am a simple sentence that should go through serial port\n";
	n = write(fd, line, strlen(line)+1);
         if (n < 0){
	  fputs("write() of bytes failed!\n", stderr);
        }else{
            printf("sent successfully %d bytes\n",n);
        }
 
}
 
void openport(void){
	fd = open(MODEMDEVICE, O_RDWR | O_NOCTTY);
	printf("fd %d\n",fd);
	if (fd <0){perror(MODEMDEVICE);}

        	fcntl(fd,F_SETFL,0);

	/* Locking the file */
	/* Initialize the flock structure.*/
	memset (&lock, 0, sizeof(lock));
	lock.l_type = F_WRLCK;
	/* Place a write lock on the file. */
	fcntl (fd, F_SETLKW, &lock);

	tcgetattr(fd,&oldtp); /* save current serial port settings */
        // tcgetattr(fd,&newtp); /* save current serial port settings */
        bzero(&newtp, sizeof(newtp));

        newtp.c_cflag = BAUDRATE | CRTSCTS | CS8 | CLOCAL | CREAD;

        newtp.c_iflag = IGNPAR | ICRNL;

        newtp.c_oflag = 0;

        newtp.c_lflag = ICANON;

        

}


void closeport(void){
	/* Release the lock. */
 	lock.l_type = F_UNLCK;
 	fcntl (fd, F_SETLKW, &lock);
 	close (fd);

}


