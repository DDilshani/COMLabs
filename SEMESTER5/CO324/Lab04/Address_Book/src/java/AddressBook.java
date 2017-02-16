import java.io.BufferedReader;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.Writer;
import java.util.HashMap;
import java.util.Arrays;
import java.util.*;


/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Nathasha
 */

//Logic for your address book
public class AddressBook {
    
    // instance address book
    public HashMap <String, List <String>> contactsMap;
    
    //read from file and create Address Book
    public AddressBook(String fileName) throws Exception{
    
        /*TODO*/
        //Create your address book
        contactsMap = new HashMap <String, List <String>>();
        
        //Read file
        BufferedReader br = new BufferedReader(new FileReader(fileName));

        String line = br.readLine();

        // while ( (br.readLine()) != null){
        while ( line != null){

            String[] array = line.split(",");

            String data [] = Arrays.copyOfRange(array, 1, array.length);
        
            // Storing contacts in an array list
             List <String> contacts = new ArrayList <>(Arrays.asList(data));

            contactsMap.put(array[0], contacts);

            line = br.readLine();

        }    
    }
    
    //search details of the requested contact in the address book
    public String search(String name){
	
        /*TODO*/
        if (contactsMap.containsKey(name)) {

            return contactsMap.get(name).toString();

        } else {

            return ("Contacts for name "+ name +" is not found!");

        }
    }
    
    public synchronized void add(String name, String details){
        
        String [] contacts = details.split(",");
        
        List <String> data = new ArrayList <>(Arrays.asList(contacts));
        
        contactsMap.put(name, data);
        
    }
    
    public void writeToCSV(){
        
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


