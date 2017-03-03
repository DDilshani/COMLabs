
public class MyList <T> {
	// extends Node <T> 

	public Node <T> head = null;
	

	public MyList(){

		// this.head = new Node <T>();	
	}

	public MyList(T data){

		this.head = new Node <T>(data);
	}

	public void add(T data){

		if(this.isEmpty()){

			head = new Node <T>(data);

		} else {

			Node <T> temp = head;
			head = new Node <T> (data, temp);

		}
	
	}

	public boolean isEmpty(){

		return (head == null);

	}

	public boolean hasElements(){

		return !(head == null);

	}

	public T remove(){

		if (this.isEmpty()) {
			
			return null;

		} else {

			// Node temp = head;
			T data = head.getData();
			Node <T> next = head.getNext();
			head = next;
			return data;

		}
	}

	public void printMyList(){

		Node <T> current = head;

		while(current.getNext() != null){

			current.printNode();
			System.out.println(", ");
			current = current.getNext();

		}

	}
}

