import java.io.BufferedReader;
import java.io.FileReader;
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
    
    // Shared address book
    public static HashMap <String, List <String>> addressBook = new HashMap <String, List <String>>();
    
    //read from file and create Address Book
    public static void initAddressBook(String fileName) throws Exception{
    
        /*TODO*/
        //Create your address book
        //Read file
        BufferedReader br = new BufferedReader(new FileReader(fileName));

        String line = br.readLine();

        // while ( (br.readLine()) != null){
        while ( line != null){

            String[] array = line.split(",");

            String data [] = Arrays.copyOfRange(array, 1, array.length);
        
            // Storing contacts in an array list
             List <String> contacts = new ArrayList <>(Arrays.asList(data));

            addressBook.put(array[0], contacts);

            line = br.readLine();

        }    
    }
    
    //search details of the requested contact in the address book
    public static String search(String name){
	
        /*TODO*/
        if (addressBook.containsKey(name)) {

            return addressBook.get(name).toString();

        } else {

            return ("Contacts for name "+ name +" is not found!");

        }
    }   
}


