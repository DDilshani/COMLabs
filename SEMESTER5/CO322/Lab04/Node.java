public class Node <T> {

	private T data; //Type safe data
	private Node <T> next;	//Node type pointer to next node

	public Node(){

		this.data = null;
		this.next = null;
	}

	public Node(T data){

		this.data = data;
		this.next = null;
		
	}

	public Node(T data, Node <T> next){

		this.data = data;
		this.next = next;

	}

	public T getData(){

		return data;
	}

	public Node <T> getNext(){

		return next;
	}

	public void setData(T data){

		this.data = data;
	}

	public void setNext(Node <T> next){

		this.next = next;
	}

	@Override
	public String toString(){

		return data.toString();
	}



}