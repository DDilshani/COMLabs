import java.io.BufferedReader;
import java.io.FileReader;
import java.io.*;
import java.util.HashMap;
import java.util.Arrays;
import java.util.Scanner;
import java.util.*;

public class ex1 {

	private static HashMap <String, List <String>> contactsMap = new HashMap <String, List <String>>();
	private static List <String> contacts;

	public static void main(String[] args) {

		String pathToFile = args[0];

		contactsMap = new HashMap <String, List <String>>();

		try{

			//Read file
			BufferedReader br = new BufferedReader(new FileReader(pathToFile));

			String line = br.readLine();
 
			// while ( (br.readLine()) != null){
			while ( line != null){
 
				String[] array = line.split(",");

				//String key = array[0];

				String data [] = Arrays.copyOfRange(array, 1, array.length);
			
				// Storing contacts in an array list
				contacts = new ArrayList <String>(Arrays.asList(data));

				contactsMap.put(array[0], contacts);

				line = br.readLine();

			}

		} catch(Exception e1) {

			System.out.println(e1);

		} finally{

			// Print the hashmap
			for (String key: contactsMap.keySet()){

				System.out.println(key + ": " + contactsMap.get(key));
			}

			System.out.print("\nEnter user name: ");

			Scanner input = new Scanner(System.in);

			String user = input.nextLine();

			System.out.println("Contacts of user " + user + ": " + contactsMap.get(user));
			
			System.out.print("\nEnter user name to remove contact: ");

		}
	}
}

