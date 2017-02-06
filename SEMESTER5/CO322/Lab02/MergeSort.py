#!/usr/bin/env python

# Recursive function
def MergeSort(array):

	if len(array) > 1:

		#  Spliting the array into halves
		mid = len(array)//2

		leftArray = array[:mid]
		rightArray = array[mid:]

		MergeSort(leftArray)
		MergeSort(rightArray)

		MergeHelper(leftArray,rightArray,array)
		
	return array
		
def MergeHelper(leftArray, rightArray, array):

	# To keep array indexes
	i = 0
	j = 0
	k = 0

	# Checking foe the smallest value in given halves of the array and assigning it to the original array continuosly
	while i < len(leftArray) and j < len(rightArray):
		if leftArray[i] < rightArray[j]:
			array[k] = leftArray[i]
			i = i + 1
		else:
			array[k] = rightArray[j]
			j = j + 1
		k = k + 1

	# Adding remaining elements of the left half to the original array
	while i < len(leftArray):
		array[k] = leftArray[i]
		i = i + 1
		k = k + 1

	
	# Adding remaining elements of the right half to the original array
	while j < len(rightArray):
		array[k] = rightArray[j]
		j = j + 1
		k = k + 1

	return array

# Function to check whether two arrays are equal
def check_array_equals(expected_array, actual_array):

	if actual_array == expected_array:
		print ('Test passed!\n')
	else:
		print('Test failed!\n')

    
# Test 1 : Random array 
print ('\n----------------Test 1 : Random array--------------------\n') 
test1 = [54, 26, 93, 17, 2, 9, 49, 0, 5, 20, 17, 77, 31, 44, 55, 20]
print ('Original array: ' + str(test1))

expected = sorted(test1)
print ('Expected sorted array: ' + str(expected))

actual = MergeSort(test1)
print ('Actual sorted array: '+ str(actual))

check_array_equals(expected, actual)


# Test 2 : Already sorted array(Ascending)   
print ('\n---------Test 2 : Already sorted array (Ascending)--------\n')
test2 = [ 6, 12, 38, 222, 901]
print ('Original array: ' + str(test2))

expected = sorted(test2)
print ('Expected sorted array: ' + str(expected))

actual = MergeSort(test2)
print ('Actual sorted array: '+ str(actual))

check_array_equals(expected, actual)


# Test 3 : Already sorted array(Decending)
print ('\n---------Test 3 : Already sorted array(Decending)--------\n')   
test3 = [ 100, 72, 68, 22, 1]
print ('Original array: ' + str(test3))

expected = sorted(test3)
print ('Expected sorted array: ' + str(expected))

actual = MergeSort(test3)
print ('Actual sorted array: '+ str(actual))

check_array_equals(expected, actual)


# Test 4 : Array with equal elements
print ('\n-----------Test 4 : Array with equal elements----------\n')     
test4 = [ 6, 6, 6, 6, 6, 6, 6]
print ('Original array: ' + str(test4))

expected = sorted(test4)
print ('Expected sorted array: ' + str(expected))

actual = MergeSort(test4)
print ('Actual sorted array: '+ str(actual))

check_array_equals(expected, actual)

# Test 5 : Emptey array
print ('\n------------------Test 5 : Empty array-----------------\n')   
test5 = []
print ('Original array: ' + str(test5))

expected = sorted(test5)
print ('Expected sorted array: ' + str(expected))

actual = MergeSort(test5)
print ('Actual sorted array: '+ str(actual))

check_array_equals(expected, actual)


# Test 6 : Array with two elements 
print ('\n---------------Test 6 : Array with two elements--------------\n') 
test6 = [10, 6]
print ('Original array: ' + str(test6))

expected = sorted(test6)
print ('Expected sorted array: ' + str(expected))

actual = MergeSort(test6)
print ('Actual sorted array: '+ str(actual))

check_array_equals(expected, actual)


# Test 7 : Array with one element 
print ('\n---------------Test 7 : Array with one element---------------\n') 
test7 = [1000]
print ('Original array: ' + str(test7))

expected = sorted(test7)
print ('Expected sorted array: ' + str(expected))

actual = MergeSort(test7)
print ('Actual sorted array: '+ str(actual))

check_array_equals(expected, actual)


# Test 8 : Array with odd number of elements 
print ('\n-----------Test 8 : Array with odd number of elements----------\n') 
test8 = [2, 9, 49, 0, 5, 20, 17]
print ('Original array: ' + str(test8))

expected = sorted(test8)
print ('Expected sorted array: ' + str(expected))

actual = MergeSort(test8)
print ('Actual sorted array: '+ str(actual))

check_array_equals(expected, actual)


# Test 9 : Array with even number of elements 
print ('\n-----------Test 9 : Array with even number of elements----------\n') 
test9 = [100, 9, 49, 0, 5, 20, 15, 98]
print ('Original array: ' + str(test9))

expected = sorted(test9)
print ('Expected sorted array: ' + str(expected))

actual = MergeSort(test9)
print ('Actual sorted array: '+ str(actual))

check_array_equals(expected, actual)

