def selection_sort(array):

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
    

    print (array)

selection_sort([ 6, 2, 8, 22, 1])
selection_sort([ 100, 72, 68, 22, 1])
selection_sort([ 6, 12, 38, 222, 901])
selection_sort([ 6, 6, 6, 6, 6, 6, 6])
selection_sort([])
selection_sort([10, 6])
selection_sort([10])
selection_sort([2, 9, 49, 0, 5, 20, 17])
