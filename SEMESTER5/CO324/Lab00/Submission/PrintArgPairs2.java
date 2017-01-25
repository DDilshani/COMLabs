import java.util.*;
import java.util.Scanner;

// Class to read program argument pairs, store, print and get user input requests
public class PrintArgPairs2 {

	public static void main(String[] args) {

		HashMap <String, String> map = new HashMap <String, String>();
		
		for (String s: args) {
			
			String [] array = s.split(",");
			map.put(array[0], array[1]);
		}

		for (String key: map.keySet()){

			System.out.println(key + ": " + map.get(key));
		}

		// get user input
		System.out.print("\nEnter user name: ");

		Scanner input = new Scanner(System.in);

		String user = input.nextLine();

		System.out.println("Value for user " + user + ": " + map.get(user));

	}
}


