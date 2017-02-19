// import java.io.BufferedReader;
// import java.io.FileReader;
// import java.io.FileWriter;
// import java.io.IOException;
// import java.io.Writer;
// import java.util.HashMap;
// import java.util.Arrays;
import java.util.*;
import java.io.*;

public class AddressBook {

	private static HashMap <String, List<String>> contactsMap;
	private BufferedReader br;
	private BufferedWriter bw;
	private String pathToCSV;

	public AddressBook(String fileName) throws IOException {

		this.pathToCSV = fileName;

		this.contactsMap = new HashMap <String, List<String>>();

		this.br = new BufferedReader(new FileReader(fileName));

		String line;

		while((line = br.readLine()) != null ){

			String [] data = line.split(",");

			List <String> details = new ArrayList <>(Arrays.asList(data));

			details.remove(0);

			contactsMap.put(data[0], details);

		}

		// System.out.println(contactsMap);
	}

	public String search(String name){

		if (contactsMap.containsKey(name)) {

            return contactsMap.get(name).toString();

        } else {

            return ("not found!");

        }
	}

	public void add(String name, String details){
        
        String [] contacts = details.split(",");
        
        List <String> data = new ArrayList <>(Arrays.asList(contacts));
        
        contactsMap.put(name, data);
        
    }

    public void delete(String name){

    	contactsMap.remove(name);
    }

    public void writeToCSV() throws IOException {

    	this.bw = new BufferedWriter(new FileWriter(pathToCSV));

    	for (String key : contactsMap.keySet() ) {

    		List <String> temp = contactsMap.get(key);
    		temp.add(0, key);

    		String content = String.join(",", temp);
    		// System.out.println(content);

    		// bw.write(key);
    		bw.write(content);
    		bw.write("\n");
    		bw.flush();
    		
    	}


        
    }
    

	public static void main(String[] args) throws Exception {
		
		AddressBook addressBook = new AddressBook(args[0]);

		Scanner scan = new Scanner(System.in);

		System.out.print("\nEnter user name: ");
		String user = scan.nextLine();

		String result = addressBook.search(user);
		System.out.println("Contacts for user " + user + ": " + result + "\n");


		System.out.print("\nEnter user name to add as a new contact: ");
		user = scan.nextLine();

		System.out.print("\nEnter contact details separated with commas to add: ");
		String details = scan.nextLine();

		addressBook.add(user, details);
		addressBook.writeToCSV();

		System.out.print("\nEnter user name to delete a contact: ");
		user = scan.nextLine();

		addressBook.delete(user);
		addressBook.writeToCSV();

	}



	
}