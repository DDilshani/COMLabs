/**
 *
 * @author Nathasha Naranpanawa
 */
import java.util.*;

public class SparseMatrix {

    private HashMap <Object,Integer> matrix;
    
    public SparseMatrix(){}
  
    // create an empty square matrix of given size
    public void createEmptyMatrix(int size){

    	matrix = new HashMap<>();

    }

    // put A[i][j] = 1  
    public void set(int i, int j, int value){

    	Key k = new Key(i,j);
    	matrix.put(k, value);

    }
    
    // return value at A[i][j]
    public int get(int i, int j){ 

    	Key k = new Key(i,j); 

    	if(matrix.containsKey()){

    		return matrix.getValue(k);

    	} else {

    		return 0;
    	}

    }

    @Override
	public boolean equals(Object o){

		
	    return this.theStringValue.equals(o);
	}

    
}
