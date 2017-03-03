
public class Main {

	public static void main(String[] args) throws Exception {
		
		System.out.println("\n-----------------------Test 1: Integer List------------------------------\n" );

		MyList <Integer> intList = new MyList<>();
		System.out.println("The list : " + intList.toString());

		System.out.println("\n---------------Test 1.1: Empty List-----------------\n" );
		System.out.println("The list is empty : " + intList.isEmpty());
		System.out.println("The list has elements : " + intList.hasElements());

		System.out.println("\n---------------Test 1.2: Add One Element------------\n" );
		intList.add(10);
		System.out.println("The list : " + intList.toString());
		System.out.println("The list is empty : " + intList.isEmpty());
		System.out.println("The list has elements : " + intList.hasElements());

		System.out.println("\n---------------Test 1.3: Add Elements---------------\n" );
		intList.add(5);
		intList.add(100);
		intList.add(1);
		intList.add(20);
		System.out.println("The list : " + intList.toString());
		System.out.println("The list is empty : " + intList.isEmpty());
		System.out.println("The list has elements : " + intList.hasElements());

		System.out.println("\n--------------Test 1.4: Remove Element--------------\n" );
		Integer element = intList.remove();
		System.out.println("The list : " + intList.toString());
		System.out.println("Removed element : " + element);
		System.out.println("The list is empty : " + intList.isEmpty());
		System.out.println("The list has elements : " + intList.hasElements());

		System.out.println("\n-----------Test 1.5: Remove All Elements------------\n" );
		Integer element1 = intList.remove();
		Integer element2 = intList.remove();
		Integer element3 = intList.remove();
		Integer element4 = intList.remove();
		
		System.out.println("The list : " + intList.toString());
		System.out.println("Removed elements : " + element1 +", " + element2 +", " + element3 +", " + element4);
		System.out.println("The list is empty : " + intList.isEmpty());
		System.out.println("The list has elements : " + intList.hasElements());

		System.out.println("\n----------Test 1.6: Remove From Empty List----------\n" );
		element = intList.remove();
		System.out.println("The list : " + intList.toString());
		System.out.println("Removed element : " + element);
		System.out.println("The list is empty : " + intList.isEmpty());
		System.out.println("The list has elements : " + intList.hasElements());

		System.out.println("\n\n-----------------------Test 2: String List------------------------------\n" );
		
		MyList <String> strList = new MyList<>();
		System.out.println("The list : " + strList.toString());

		System.out.println("\n---------------Test 2.1: Empty List-----------------\n" );
		System.out.println("The list is empty : " + strList.isEmpty());
		System.out.println("The list has elements : " + strList.hasElements());

		System.out.println("\n---------------Test 1.2: Add One Element------------\n" );
		strList.add("Dog");
		System.out.println("The list : " + strList.toString());
		System.out.println("The list is empty : " + strList.isEmpty());
		System.out.println("The list has elements : " + strList.hasElements());

		System.out.println("\n---------------Test 2.3: Add Elements---------------\n" );
		strList.add("Cat");
		strList.add("Elephant");
		strList.add("Rat");
		strList.add("Fish");
		System.out.println("The list : " + strList.toString());
		System.out.println("The list is empty : " + strList.isEmpty());
		System.out.println("The list has elements : " + strList.hasElements());

		System.out.println("\n--------------Test 2.2: Remove Element--------------\n" );
		String strElement = strList.remove();
		System.out.println("The list : " + strList.toString());
		System.out.println("Removed element : " + strElement);
		System.out.println("The list is empty : " + strList.isEmpty());
		System.out.println("The list has elements : " + strList.hasElements());

		System.out.println("\n-----------Test 2.3: Remove All Elements------------\n" );
		String strElement1 = strList.remove();
		String strElement2 = strList.remove();
		String strElement3 = strList.remove();
		String strElement4 = strList.remove();
		
		System.out.println("The list : " + strList.toString());
		System.out.println("Removed elements : " + strElement1 +", " + strElement2 +", " + strElement3 +", " + strElement4);
		System.out.println("The list is empty : " + strList.isEmpty());
		System.out.println("The list has elements : " + strList.hasElements());

		System.out.println("\n----------Test 2.4: Remove From Empty List----------\n" );
		strElement = strList.remove();
		System.out.println("The list : " + strList.toString());
		System.out.println("Removed element : " + strElement);
		System.out.println("The list is empty : " + strList.isEmpty());
		System.out.println("The list has elements : " + strList.hasElements());
		
		
		
		
		

	}
	
}