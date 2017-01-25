import java.util.*;
import java.util.Scanner;
import java.io.*;

// Read program aruments of extended lists, store in a data structure and print
public class PrintArgList {

	public static void main(String[] args) {

		HashMap <String, List <String>> map = new HashMap <String, List <String>>();
		List <String> contacts;
		
		for (String s: args) {
			
			String [] array = s.split(",");
			String key = array[0];

			// creating a sub array with contact details
			String data [] = Arrays.copyOfRange(array, 1, array.length);
			
			// Storing contacts in an array list
			contacts = new ArrayList <String>(Arrays.asList(data));

			map.put(array[0], contacts);
		}

		// Print the hashmap
		for (String key: map.keySet()){

			System.out.println(key + ": " + map.get(key));
		}

		// Get user inputs
		System.out.print("\nEnter user name: ");

		Scanner input = new Scanner(System.in);

		String user = input.nextLine();

		System.out.println("Value for user " + user + ": " + map.get(user));

	}
}


