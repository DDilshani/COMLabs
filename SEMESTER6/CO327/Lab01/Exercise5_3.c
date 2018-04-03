#include <sys/types.h>
#include <sys/socket.h>
#include <stdio.h>
#include <netinet/in.h>
#include <unistd.h>
#include <stdlib.h>
#include <sys/types.h> 
#include <string.h>
#include <sys/wait.h>

#define MAX_LEN 1000

void handleClient(struct sockaddr_in clientAddress, int clientSockfd, int clientLen);

int main(){
	
	int pid;
	int serverSockfd, clientSockfd;
	socklen_t serverLen, clientLen;
	struct sockaddr_in serverAddress;
	struct sockaddr_in clientAddress;

	serverSockfd = socket(AF_INET, SOCK_STREAM, 0);
	
	//Initializing a sockaddr_in with our own address information for binding the socket
	serverAddress.sin_family = AF_INET;
	serverAddress.sin_addr.s_addr = htonl(INADDR_ANY);
	serverAddress.sin_port = htons(12345);

	// Binding and listenning
	serverLen = sizeof(serverAddress);
	bind(serverSockfd, (struct sockaddr *)&serverAddress,serverLen);
	listen(serverSockfd, 5);

	while(1) {

		printf("Server started...\nWaiting for client...\n");
		char ch[] = "Connected to server\n";

		// Accept connection
		clientLen = sizeof(clientAddress);
		clientSockfd = accept(serverSockfd,(struct sockaddr *)&clientAddress, &clientLen);

		if (clientSockfd < 0){
			perror("ERROR on accept");
			exit(1);
		}

		pid  = fork();

		if (pid < 0){
			perror("ERROR on fork");
			exit(1);
		}

		if(pid == 0) {

			for(int i=0; i<strlen(ch); i++){
				write(clientSockfd, &ch[i], 1);
			}
			printf("\n");

			/* In child process which the handles client connection */
			// handleClient(clientSockfd);
			sleep(10);
			close(clientSockfd);
			exit(0);

		} else {
			/* In parent process which continues to listen for new clients */
			wait(NULL);
			close(clientSockfd);
		}

	}
}

// void handleClient(struct sockaddr_in clientAddress, int clientSockfd, int clientLen){

// 	int recvNumBytes;
// 	char buffer[MAX_LEN];

// 	recvNumBytes = recvFrom(clientSockfd, buffer, MAX_LEN, 0, (struct  sockaddr*)&clientAddress, clientLen);
	
// 	buffer[recvNumBytes] = '\0';

// 	sendto()




// }
