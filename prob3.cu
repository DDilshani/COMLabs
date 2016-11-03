#include <stdio.h>
#include <stdlib.h>

#define SIZE 8

__global__ void addArray(double * result, double * array);

int main(){

	cudaEvent_t start,stop;
	float elapsedtime;
	
	//the moment at which we start measuring the time
	cudaEventCreate(&start);
	cudaEventRecord(start,0);	

	double array[SIZE];
	double result[SIZE/2];
	int i;

	for (i = 0; i < SIZE; i++){
		array[i] = i +1 ;
		//printf("%lf ", array[i] );
	}

	//pointers to the arrays to be put in cuda memory
	double *array_cuda;
	double *result_cuda;

	//allocate memory in cuda device
	cudaMalloc((void **)&array_cuda, sizeof(double)* SIZE);
	cudaMalloc((void **)&result_cuda, sizeof(double)* (SIZE/2));

	//Copy contents from main memory to device memory
	cudaMemcpy(array_cuda, array, sizeof(double)*SIZE, cudaMemcpyHostToDevice);

	//call the cuda kernel
	addArray <<< 1, SIZE/2 >>> (result_cuda, array_cuda);

	//Copy results from device to host
	cudaMemcpy(result, result_cuda, sizeof(double)* (SIZE/2), cudaMemcpyDeviceToHost);

	printf("Answer is : ");

	for(i=0; i<SIZE/2 ;i++){
		printf("%.1lf ",result[i]);
	}

	//the moment at which we stop measuring time 
	cudaEventCreate(&stop);
	cudaEventRecord(stop,0);
	cudaEventSynchronize(stop);
	
	//Find and print the elapsed time
	cudaEventElapsedTime(&elapsedtime,start,stop);
	printf("Time spent for operation is %.10f seconds\n",elapsedtime/(float)1000);
	
	return 0;

}

__global__ void addArray(double *result_cuda, double *array_cuda){
	
	int tid = threadIdx.x;
	result_cuda[tid] = (array_cuda[2*tid] + array_cuda[2*tid+1]) / 2;
}
