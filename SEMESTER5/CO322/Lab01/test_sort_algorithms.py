#!/usr/bin/env python

import time

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

	return array	
	print ('Elapsed time in seconds: %f\n' % (end - start))
    
test = [ 6, 2, 8, 22, 1]
result = bubble_sort(test)

if result == test.sort():
	print (True)
else:
	print(False)