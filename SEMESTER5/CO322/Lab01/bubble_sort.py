def bubble_sort(array):

    swapped = True

    while swapped:

        swapped = False
        for i in range (len(array) - 1):
            if array[i] > array [i+1]:
                temp = array[i]
                array[i] = array[i+1]
                array[i+1] = temp
                swapped = True

    print (array)
                
bubble_sort([ 6, 2, 8, 22, 1])
bubble_sort([ 100, 72, 68, 22, 1])
bubble_sort([ 6, 12, 38, 222, 901])

bubble_sort([ 6, 6, 6, 6, 6, 6, 6])

bubble_sort([])

bubble_sort([10, 6])

bubble_sort([100])

bubble_sort([2, 9, 49, 0, 5, 20, 17])
