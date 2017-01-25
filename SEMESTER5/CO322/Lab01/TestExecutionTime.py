#!/usr/bin/env python

import time
import random

def bubble_sort(array):

	start = time.time()

	swapped = True

	while swapped:

		swapped = False

		for i in range (len(array) - 1):
			if array[i] > array [i+1]:
				temp = array[i]
				array[i] = array[i+1]
				array[i+1] = temp
				swapped = True

	end = time.time()    

	# print (array)
	print ('Elapsed time in seconds: %f\n' % (end - start))

def selection_sort(array):

    start = time.time()

    N = len(array)
    for i in range(N):

        MAX = array[0]
        max_id = 0
        
        for j in range(1, N-i):

            if array[j] > MAX:
                MAX = array[j]
                max_id = j

        temp = array[max_id]
        array[max_id] = array[N-i-1]
        array[N-i-1] = temp

    end = time.time()

    # print (array)
    print ('Elapsed time in seconds: %f\n' % (end - start))


def insertion_sort(array):

	start = time.time()

	N = len(array)
	for i in range(1,N):
		current = array[i]
		index = i
        
		for j in range(index, 0, -1):
			if array[j-1] > current:
				array[j] = array[j-1]
				index = j-1
                
##        while array[index-1] > current and index >0:
##            array[index] = array[index-1]
##            index = index - 1
          
		array[index] = current

	end = time.time()

	# print (array)
	print ('Elapsed time in seconds: %f\n' % (end - start))

# def TestExecutionTime():

# testArary = random.randint(0,10000,1000)
testArary = random.sample(range(10000), k=1000)

bubble_sort(testArary)
selection_sort(testArary)
insertion_sort(testArary)