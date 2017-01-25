import java.net.*;
import java.io.*;
import java.util.*;

public class GetUrl {

	public static void main(String[] args) throws Exception {

		URL url = new URL(args[0]);

		URLConnection cn = url.openConnection();

		BufferedReader in = new BufferedReader(new InputStreamReader(cn.getInputStream()));

		String inputLine;

		while ((inputLine = in.readLine()) != null) {
            System.out.println(inputLine);
		}

        in.close();

        // Printing HTTP header Fields
        Map<String, List<String>> headerMap = cn.getHeaderFields();

		System.out.println("\nPrinting Response Header...\n");

		for (Map.Entry<String, List<String>> entry : headerMap.entrySet()) {
			
			System.out.println("Key : " + entry.getKey()+ " ,Value : " + entry.getValue());
		}
		
	}
}