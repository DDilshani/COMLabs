package com.company;

/**
 * Created by e13175 on 7/12/16.
 */

public class Array {

    private int lastIndex;
    private int size;

    private int[] array;



    public Array() {

        this.array = new int[0];
        this.size = 0;
        this.lastIndex = -1;

    }

    public Array(int size) {

        this.size = size;

        this.array = new int[this.size];

        //Setting the lastIndex to the last element
        this.lastIndex = size - 1;

    }

    public void add(int d) {


        int[] tempArray;

        try {

            this.array[this.lastIndex + 1] = d;

        } catch (ArrayIndexOutOfBoundsException e ) {

            //Creating a new temporary array with required size for the new element.
            tempArray = new int[this.size + 1];

            //Copying all the elements in the previous array to the new array.
            System.arraycopy(this.array, 0, tempArray, 0, array.length);

            //Setting the temporary array back to the permanent array.
            this.array = tempArray;


        } finally {

            //Handling last index and size after addition.
            this.lastIndex++;
            this.size++;

            //Setting value of the element at the end of the array.
            this.array[this.lastIndex] = d;
        }

    }

    public int add(int index, int d) {

        //Addition will be successful if the given index is inside the bound of the array.
        //If successful return 0 to the user.

        int temp = this.array[index];

        //Declaring a temporary array which can hold the new element.
        int [] tempArray = new int[this.size + 1];

        //Copying elements up to the element before the required index.
        //System.arraycopy(this.array, 0, tempArray, 0, index);
        for (int i = 0; i < index ; i++) {
            tempArray[i] = this.array[i];
        }

        //Adding the element to the required index
        tempArray[index] = d;

        //Copying rest of the elements
        //System.arraycopy(this.array, index + 1, tempArray, index + 1, this.size + 1 - (index + 1));
        for (int i = index + 1; i < this.array.length ; i++) {
            tempArray[i] = this.array[i];
        }

        //Setting the temporary array as the original array.
        this.array = tempArray;

        //Handling last index and size after the addition.
        this.lastIndex++;
        this.size++;

        return 0;

    }

    public int replace(int index, int d) {

        //Replacement will be successful and if the given index is within the bound of the array.
        //If successful return 0 to the user.

        //Replacing the given element at the given index.
        this.array[index] = d;

        return 0;

    }

    public int get(int index) {

        //Returns the value at the given index if the index is within the bound of the array.
        //This function will return the value at the given index if successful.

        return this.array[index];

    }

    public int remove(int index){

        //Removing will be successful if the given index is inside the bound of the array.
        //If successful return 0 to the user.

        int temp = this.array[index];

        //Declaring a temporary array which can hold the new element.
        int [] tempArray = new int[this.size - 1];

        //Copying elements up to the element before the required index.
        //System.arraycopy(this.array, 0, tempArray, 0, index);
        for (int i = 0; i < index ; i++) {
            tempArray[i] = this.array[i];
        }

        //Copying rest of the elements withot the removing element
        //System.arraycopy(this.array, index + 1, tempArray, index + 1, this.size + 1 - (index + 1));

        for (int i = index + 1; i < tempArray.length ; i++) {
            tempArray[i] = this.array[i];
        }

        //Setting the temporary array as the original array.
        this.array = tempArray;

        //Handling last index and size after the addition.
        this.lastIndex--;
        this.size--;

        return 0;


    }

    public boolean isEmpty() {

        return (this.size == 0);

    }

    public int size() {

        return this.size;

    }

    public boolean contains(int d) {

        //Setting an indicator
        int found = 0;

        //Checking whether the element is in the array
        for (int i : this.array) {
            if (this.array[i] == d) {
                found = 1;
            }
        }

        return (found == 1);

    }

    public boolean trimToSize(int size) {

        // This function will return true if trimming was successful.
        // For a array with same size as the trim size it will be considered as a successful trim.
        int[] tempArray;

        if (this.size > size) {

            //Trimming the array

            tempArray = new int[size];

            for (int i : tempArray) {
                tempArray[i] = this.array[i];
            }

            this.array = tempArray;
            this.size = size;
            this.lastIndex = size - 1;

            return true;

        }else if (this.size == size){

            //No trimming but successful
            return true;

        } else {

            //Trimming unsuccessful
            System.out.println("Insufficient Array length to trim");

            return false;

        }

    }

    public void clear() {

        // Creating an empty array
        this.array = new int[0];
        this.size = 0;
        this.lastIndex = -1;

    }

    @Override
    public String toString() {

        String toPrint = "";

        for (int i = 0; i < this.array.length; i++) {

            if (i > 0) {
                toPrint = toPrint + ", ";
            }

            toPrint = toPrint + this.array[i];
        }

        return "[" + toPrint + "]";
    }


    public int[] getArray() {
        return array;
    }
}
