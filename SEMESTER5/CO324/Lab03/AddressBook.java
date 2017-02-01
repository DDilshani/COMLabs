import java.io.BufferedReader;
import java.io.FileReader;
import java.io.*;
import java.util.HashMap;
import java.util.Arrays;
import java.util.*;
/**
 *
 * @author Nathasha
 */

//Logic for your address book
public class AddressBook {

    // Shared address book
    public static HashMap <String, List <String>> addressBook = new HashMap <String, List <String>>();

    // List to keep the contacts

    
    //read from file and create Address Book
    public static void initAddressBook(String fileName) throws Exception {

        //Read file
        BufferedReader br = new BufferedReader(new FileReader(fileName));

        String line = br.readLine();

        // while ( (br.readLine()) != null){
        while ( line != null){

            String[] array = line.split(",");

            String data [] = Arrays.copyOfRange(array, 1, array.length);
        
            // Storing contacts in an array list
             List <String> contacts = new ArrayList <String>(Arrays.asList(data));

            addressBook.put(array[0], contacts);

            line = br.readLine();

        }    
    }
    
    //search details of the requested contact in the address book
    public static String search(String name){
	
        if (addressBook.containsKey(name)) {

            return addressBook.get(name).toString();

        } else {

            return "Invalid contact name!";

        }

    }

    public static void main(String[] args) throws Exception {
        
        initAddressBook("contacts.txt");
        String contact = search("Kesara");
        System.out.println(contact);
    }
    
}


