// Class for a Linked List
//Author : E/13/175

public class MyList <T> {

	public Node <T> head = null;	//Pointer to the head of the list

	public MyList(){

	}

	public MyList(T data){

		this.head = new Node <T>(data);
	}

	public void add(T data){

		if(this.isEmpty()){

			head = new Node <T>(data);	//create new node and add data

		} else {

			Node <T> temp = head;	//gettting current head
			head = new Node <T> (data, temp); // creating a new node with new data pointing to previous head

		}
	
	}

	public boolean isEmpty(){

		return (head == null); //check whether head is pointing to a node

	}

	public boolean hasElements(){

		return !(head == null);

	}

	public T remove(){

		if (this.isEmpty()) {
			
			return null;

		} else {

			T data = head.getData(); // getting data in the current head
			Node <T> next = head.getNext(); // getting the next node of current head
			head = next; // Setting the next node as current head
			return data; 

		}
	}

	@Override
	public String toString(){

		Node <T> iterator = head;

		String toPrint = "";

		if (this.hasElements()) {

			// Printing till one before the tail 
			while(iterator.getNext() != null){

				String node = iterator.toString();
				String delimiter = ", ";
				iterator = iterator.getNext(); //Iterator incremented
			
				toPrint = toPrint + node + delimiter;

			}

			// Printing the last node (tail) 
			String node = iterator.toString();
			toPrint = toPrint + node;

		}

		toPrint = "[" + toPrint + "]";

		return toPrint;
	}
}

