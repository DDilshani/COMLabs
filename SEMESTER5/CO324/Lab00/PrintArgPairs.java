import java.util.*;
import java.util.Scanner;

public class PrintArgPairs{


	public static void main(String[] args) {

		HashMap <String, String> map = new HashMap <String, String>();
		
		for (String s: args) {
			
			String [] array = s.split(",");
			map.put(array[0], array[1]);
		}

		for (String key: map.keySet()){

			System.out.println(key + ": " + map.get(key));
		}
	}
}


