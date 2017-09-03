#include <unistd.h>
#include <stdio.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <string.h>
#include <stdlib.h>
#include <pthread.h>

void* handle_client(void*);

int main()
{
	int listenfd;
	int* connfd;
	struct sockaddr_in servaddr,cliaddr;
	socklen_t clilen;

	listenfd=socket(AF_INET,SOCK_STREAM,0);

	servaddr.sin_family = AF_INET;
	servaddr.sin_addr.s_addr=htonl(INADDR_ANY);
	servaddr.sin_port=htons(32000);

	bind(listenfd,(struct sockaddr *)&servaddr,sizeof(servaddr));

	listen(listenfd,5);

	clilen = sizeof(cliaddr);
	while (1)
	{
		connfd = malloc(sizeof(int));
		*connfd = accept(listenfd, (struct sockaddr *) &cliaddr, &clilen);
		/* now create a new thread, pass it the socket and run the thread. */

		pthread_t mythread;

		if ( pthread_create( &mythread, NULL, handle_client, connfd) ){

            printf("error creating thread.");
            abort();
        }

        // // Free allocated memory
        // free(connfd);
	}
}

void* handle_client(void* connfd)
{
	/* read a string sent by the client, 
	 * print it and then send the string 
	 * "Hello from the server" to the client*/
	int read_size;
	char msg_buffer[2000];

	//Get the socket descriptor
	int socket = *(int *)connfd;

	char *welcome_msg = "Hello from the server\n";

	while((read_size = recv(socket, msg_buffer, 2000, 0)) > 0){

		// Print the client message on server
		printf("%s", msg_buffer);

		// Send the welcome message to client
		write(socket, welcome_msg, strlen(welcome_msg));

		// clear the buffer
		memset(msg_buffer, 0, 2000);
	}

	if (read_size == 0){
		
		printf("Client Disconnected..\n");
		fflush(stdout);

	} else if ( read_size == -1) {
		perror("recv failed");
	}

	// Close socket
	close(socket);

	// Free allocated memory for socket pointer
	free(connfd);
	return NULL;
}
