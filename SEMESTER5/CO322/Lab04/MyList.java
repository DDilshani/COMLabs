

public class MyList <T> {

	private Node head;
	private Node tail; 

	public MyList(){

		Node node = new Node();
		this.head = node;
		this.tail = null;

	}

	public MyList(Node node){

		this.head = node;
		this.tail = null;

	}

	public void add(T data){

		
	}
}

public class Node <T> {

	private T data;
	private int pointer;

	public Node(){

		this.data = null;
		this.pointer = null;
	}

	public Node(T data, int pointer){

		this.data = data;
		this.pointer = pointer;

	}

	public T getData(){

		return this.data
	}

	public T getPointer(){

		return this.pointer;
	}

	public T setData(T data){

		this.data = data;
	}

	public T setPointer(int pointer){

		this.pointer = pointer;
	}



}