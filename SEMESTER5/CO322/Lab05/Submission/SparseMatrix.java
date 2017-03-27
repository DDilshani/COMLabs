/**
 *
 * @author Nathasha Naranpanawa
 */
import java.util.*;

public class SparseMatrix {

    private HashMap <Integer,Integer> matrix;
    private int size;
    
    public SparseMatrix(){}
  
    // create an empty square matrix of given size
    public void createEmptyMatrix(int size){

    	this.size = size;
    	matrix = new HashMap<>();

    }

    // put A[i][j] = value  
    public void set(int i, int j, int value){

    	int key = i * size + j; // Generating a unique index to be taken as the key
    	matrix.put(key, value);	// Inserting values at unique key

    }
    
    // return value at A[i][j]
    public int get(int i, int j){ 

    	int key = i * size + j; // Computing relevant unique index

    	if(matrix.containsKey(key)){ // Check whether the unique index is available as a key in hashmap

    		return matrix.get(key); // if so return relevant value for the key

    	} else {

    		return 0; // return 0 for sparse entries
    	}

    }

    // Testing...
    // public static void main(String[] args) {
    	
    // 	SparseMatrix sm = new SparseMatrix();

    // 	sm.createEmptyMatrix(2);
    // 	sm.set(0, 0, 10);
    // 	sm.set(0, 1, 0);
    // 	sm.set(1, 0, 20);
    // 	sm.set(1, 1, 0);

    // 	for (int i = 0; i<2 ; i++) {
    // 		for (int j = 0; j<2 ; j++) {
    		
    // 		System.out.println("Element at index (" + i + ", "+ j + ") : " + sm.get(i,j));
    // 		}
    // 	}
    // }

    
}
