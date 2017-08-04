#include <sys/socket.h> 
#include <netinet/in.h> 
#include <stdio.h> 
#include <string.h> 

int main(int argc, char**argv){

	int listenfd, connfd, n; 
	struct sockaddr_in servaddr,cliaddr; 
	socklen_t clilen; 
	char* banner = "Hello TCP client! This is TCP server"; 
	char buffer[1000]; 

	/* one socket is dedicated to listening */ 
	sockfd = socket(AF_INET,SOCK_STREAM,0); 

	listen(sockfd,5);
	clilen = sizeof(cli_addr);

	while (1){
	/* New socket descriptor is returned each time a client connects*/
		newsockfd = accept(sockfd, (struct sockaddr *) &cli_addr, &clilen);
		if (newsockfd < 0){
			perror("ERROR on accept");
			exit(1);
		}
		pid = fork();
		if (pid < 0){
			perror("ERROR on fork");
			exit(1);
		}
		if (pid == 0){
			/* In child process which the handles client connection */
			close(sockfd);
			handle_client(newsockfd);
			exit(0);
		}
		else
			/* In parent process which continues to listen for new clients */
			close(newsockfd);
	}







}

