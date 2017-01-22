def insertion_sort(array):

    N = len(array)
    for i in range(1,N):
        current = array[i]
        index = i
        
        for j in range(index, 0, -1):
            if array[j -1] > current:
                array[j] = array[j-1]
                index = j-1
                
##        while array[index-1] > current and index >0:
##            array[index] = array[index-1]
##            index = index - 1
          
        array[index] = current

    print (array)
    
insertion_sort([ 6, 2, 8, 22, 1])
insertion_sort([ 100, 72, 68, 22, 1])
insertion_sort([ 6, 12, 38, 222, 901])
insertion_sort([ 6, 6, 6, 6, 6, 6, 6])
insertion_sort([])
insertion_sort([10, 6])
insertion_sort([10])
insertion_sort([2, 9, 49, 0, 5, 20, 17])
