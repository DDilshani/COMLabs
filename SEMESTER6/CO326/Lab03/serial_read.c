#include <sys/stat.h>
#include <fcntl.h>
#include <termios.h>
#include <stdio.h>
#include <string.h>
#include <errno.h>        
#include <stdlib.h> 
#include <unistd.h>
#include <time.h>
#define BAUDRATE B115200 
#define MODEMDEVICE "/dev/ttyS4"/*UART NAME IN PROCESSOR*/
#define _POSIX_SOURCE 1 /* POSIX compliant source */
#define FALSE 0
#define TRUE 1
void openport(void);
void sendport(void);
void readport(void);
int fd=0,n;

struct termios oldtp, newtp;

struct flock lock;
clock_t start, end;


void closeport(void){
         /* Release the lock. */
        lock.l_type = F_UNLCK;
        fcntl (fd, F_SETLKW, &lock);
        close (fd);



}

void  readport(void)
{
	unsigned char buff[100];
	
	/* Recieve only should wait for 5 seconds */
	//start = clock();
    	//end = clock();

fd = open(MODEMDEVICE, O_RDWR | O_NOCTTY | O_NDELAY);
printf("fd=%d\n",fd);
if (fd <0){
	perror(MODEMDEVICE);
	exit(0);
}
fcntl(fd,F_SETFL,0);
//Locking the file
 /* Initialize the flock structure. */
 memset (&lock, 0, sizeof(lock));
 lock.l_type = F_WRLCK;
 /* Place a read lock on the file. */
 fcntl (fd, F_SETLKW, &lock);



 tcgetattr(fd,&oldtp); /* save current serial port settings */
 bzero(&newtp, sizeof(newtp));

 newtp.c_cflag = BAUDRATE | CRTSCTS | CS8 | CLOCAL | CREAD;
 newtp.c_iflag = IGNPAR | ICRNL;
 newtp.c_oflag = 0;
 newtp.c_lflag = ICANON;
 newtp.c_cc[VINTR]    = 0;     /* Ctrl-c */
 newtp.c_cc[VQUIT]    = 0;     /* Ctrl-\ */
 newtp.c_cc[VERASE]   = 0;     /* del */
 newtp.c_cc[VKILL]    = 0;     /* @ */
 // newtp.c_cc[VEOF]     = 4;     /* Ctrl-d */
 newtp.c_cc[VTIME]    = 0;     /* inter-character timer unused */
 newtp.c_cc[VMIN]     = 0;     /* blocking read until 1 character arrives */
 newtp.c_cc[VSWTC]    = 0;     /* '\0' */
 newtp.c_cc[VSTART]   = 0;     /* Ctrl-q */
 newtp.c_cc[VSTOP]    = 0;     /* Ctrl-s */
 newtp.c_cc[VSUSP]    = 0;     /* Ctrl-z */
 newtp.c_cc[VEOL]     = 0;     /* '\0' */
 newtp.c_cc[VREPRINT] = 0;     /* Ctrl-r */
 newtp.c_cc[VDISCARD] = 0;     /* Ctrl-u */
 newtp.c_cc[VWERASE]  = 0;     /* Ctrl-w */
 newtp.c_cc[VLNEXT]   = 0;     /* Ctrl-v */
 newtp.c_cc[VEOL2]    = 0;     /* '\0' */
	// while (1) {
	//if(((double) (end - start)) /CLOCKS_PER_SEC >5) break;
	//end = clock();
	//printf("x\n");
	fcntl(fd,F_SETFL,FNDELAY);
  	n = read(fd, &buff, 100);

	// printf("x\n");
  	if (n ==0) 
  		// continue;
	if (buff=='\0') 
		// break;
  	printf("%s",buff);
  	// }
}

void openport(void)
{
fd = open(MODEMDEVICE, O_RDWR | O_NOCTTY | O_NDELAY);
printf("fd=%d\n",fd);
if (fd <0){
	perror(MODEMDEVICE);
	exit(0);
}
fcntl(fd,F_SETFL,0);
//Locking the file
 /* Initialize the flock structure. */
 memset (&lock, 0, sizeof(lock));
 lock.l_type = F_WRLCK;
 /* Place a read lock on the file. */
 fcntl (fd, F_SETLKW, &lock);



 tcgetattr(fd,&oldtp); /* save current serial port settings */
 bzero(&newtp, sizeof(newtp));

 newtp.c_cflag = BAUDRATE | CRTSCTS | CS8 | CLOCAL | CREAD;
 newtp.c_iflag = IGNPAR | ICRNL;
 newtp.c_oflag = 0;
 newtp.c_lflag = ICANON;
 newtp.c_cc[VINTR]    = 0;     /* Ctrl-c */
 newtp.c_cc[VQUIT]    = 0;     /* Ctrl-\ */
 newtp.c_cc[VERASE]   = 0;     /* del */
 newtp.c_cc[VKILL]    = 0;     /* @ */
 // newtp.c_cc[VEOF]     = 4;     /* Ctrl-d */
 newtp.c_cc[VTIME]    = 0;     /* inter-character timer unused */
 newtp.c_cc[VMIN]     = 0;     /* blocking read until 1 character arrives */
 newtp.c_cc[VSWTC]    = 0;     /* '\0' */
 newtp.c_cc[VSTART]   = 0;     /* Ctrl-q */
 newtp.c_cc[VSTOP]    = 0;     /* Ctrl-s */
 newtp.c_cc[VSUSP]    = 0;     /* Ctrl-z */
 newtp.c_cc[VEOL]     = 0;     /* '\0' */
 newtp.c_cc[VREPRINT] = 0;     /* Ctrl-r */
 newtp.c_cc[VDISCARD] = 0;     /* Ctrl-u */
 newtp.c_cc[VWERASE]  = 0;     /* Ctrl-w */
 newtp.c_cc[VLNEXT]   = 0;     /* Ctrl-v */
 newtp.c_cc[VEOL2]    = 0;     /* '\0' */

}

int  main()
{

	openport();
	printf("Port open successfully\n");
	readport();
	closeport();
        return 0;
}

