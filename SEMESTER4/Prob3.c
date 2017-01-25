#include <stdio.h>

#define SIZE 8

int main(){

	double array[SIZE];
	double result[SIZE-1];
	int i;

	for (i = 0; i < SIZE; i++){
		array[i] = i ;
		//printf("%lf ", array[i] );
	}

	for (i = 0; i < SIZE-1; i++)
	{
		result[i] = (array[i] + array[i+1]) / 2;
		
	}

	printf("Answer is: ");

	for(i=0; i < SIZE -1; i++){
		printf(" %.1lf ", result[i] );
	}
	
	return 0;

}