#!/usr/bin/env python

def QuickSort(array, start, end):

	if (start < end):

		pivot = partition (array, start, end)
		QuickSort(array, start, pivot-1)
		QuickSort(array, pivot+1, end)

	return array


def partition (array, start, end):

	pivot = array[start]
	pivot_id = start

	leftMark = start +1
	rightMark = end

	end = False

	while not end:

		while array[leftMark] <= pivot and leftMark <= rightMark:
			leftMark +=1

		while array[rightMark] >= pivot and rightMark >= leftMark:
			rightMark -=1

		if rightMark < leftMark:
			# array[pivot_id] = array[rightMark]
			# array[rightMark] = pivot
			end = True
		else:
			temp = array[leftMark]
			array[leftMark] = array[rightMark]
			array[rightMark] = temp

			# array[leftMark], array[rightMark] = array[rightMark], array[leftMark]

	array[pivot_id] = array[rightMark]
	array[rightMark] = pivot
	# array[rightMark], array[pivot_id] = array[pivot_id], array[rightMark]
	# pivot_id = rightMark
	return rightMark


test1 = [54,26,93,17,77,31,44,55,20]

result = QuickSort(test1, 0, len(test1)-1)
print result

test1 = [2, 9, 49, 0, 5, 20, 17]

result = QuickSort(test1, 0, len(test1)-1)
print result

