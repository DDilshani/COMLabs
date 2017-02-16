import java.io.BufferedReader;
import java.io.FileReader;
import java.io.*;
import java.util.HashMap;
import java.util.Arrays;
import java.util.Scanner;
import java.util.*;

public class Contacts {

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

			Scanner scan = new Scanner(System.in);

			String user = scan.nextLine();

			System.out.println("Contacts of user " + user + ": " + contactsMap.get(user));
			
			System.out.print("\nEnter user name to add a new contact: ");

			user = scan.nextLine();

			ArrayList<String> newContatacts = new ArrayList<String>();

			System.out.print("\nEnter contacts to add: ");

			while(scan.hasNextLine()){

				String input = scan.nextLine();
				newContatacts.add(input);
			}

			contactsMap.put(user, newContatacts);

			for (String key: contactsMap.keySet()){

				System.out.println(key + ": " + contactsMap.get(key));
			}

			System.out.print("\nEnter user name to remove contact: ");

			user = scan.nextLine();

			contactsMap.remove(user);

			for (String key: contactsMap.keySet()){

				System.out.println(key + ": " + contactsMap.get(key));
			}
		

		}
	}

	public String search(String name){
	
        /*TODO*/
        if (contactsMap.containsKey(name)) {

            return contactsMap.get(name).toString();

        } else {

            return ("Contacts for name "+ name +" is not found!");

        }
    }

	public void add(String name, String details){
        
        String [] contacts = details.split(",");
        
        List <String> data = new ArrayList <>(Arrays.asList(contacts));
        
        contactsMap.put(name, data);
        
    }

	public static writeToCSV(){

		String eol = System.getProperty("line.separator");

        try (Writer writer = new FileWriter("Contacts.csv")) {
          for (Map.Entry<String, List<String>> entry : contactsMap.entrySet()) {
            writer.append(entry.getKey())
                  .append(',')
                  .append((CharSequence) entry.getValue())
                  .append(eol);
          }
          
        } catch (IOException ex) {
          ex.printStackTrace(System.err);
        }
	}

	
}

