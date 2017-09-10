#include <semaphore.h> 
#include <pthread.h> 
#include <stdio.h> 
#include <unistd.h> 
#include <stdlib.h> 

#define SIZE 20

int readerCount; // counter for readers
sem_t readLock; 
sem_t writeLock;  
int * dataBuffer;
 
struct drand48_data randBuffer;

void* reader(void *arg) { 

	int index;
	double x; 
	srand48_r(time(NULL), &randBuffer);

	while(1) { 

		sem_wait(&readLock); 
		readerCount++;

		if (readerCount == 1){
			sem_wait(&writeLock);
		}
		sem_post(&readLock);

		// Read and print data at a random index
		drand48_r(&randBuffer, &x);	
		index = ((int)(x * 100)) % SIZE;
		printf("Reader read at index: %d with data: %d\n", index, dataBuffer[index]);  

		sem_wait(&readLock);
		readerCount--;

		if (readerCount == 0){
			sem_post(&writeLock);
		} 
		sem_post(&readLock);
		drand48_r(&randBuffer, &x);	
		usleep(x*100);
	}  

	return NULL; 
}

int main(int argc, char **argv) { 

	pthread_t thread;
	double y; 
	int index, i;
	srand48_r(time(NULL), &randBuffer);
	dataBuffer = (int *) malloc(sizeof(int) * SIZE);

	if(sem_init(&readLock, 0, 1)) { 
		printf("Could not initialize a semaphore\n"); 
		return -1; 
	} 

	if(sem_init(&writeLock, 0, 1)) { 
		printf("Could not initialize a semaphore\n"); 
		return -1; 
	} 

	for (i = 0; i < 10; i++){
		if(pthread_create(&thread, NULL, &reader, NULL)) { 
			printf("Could not create thread\n"); 
			return -1; 
		} 
	}

	while(1) { 

		sem_wait(&writeLock); 

		// Writer increments value at a randome index
		drand48_r(&randBuffer, &y);	
		index = ((int)(y * 100)) % SIZE;
		dataBuffer[index]++;

		// Writer prints the value
		printf("Writer wrote at index: %d with data: %d\n", index, dataBuffer[index]);  
	
		sem_post(&writeLock);   
		drand48_r(&randBuffer, &y);	
		usleep(y*100);
	}

	return 0; 
} 

