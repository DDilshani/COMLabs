import java.net.*;
import java.io.*;
import java.util.*;
import java.lang.*;

//get more than 1 url
public class GetURLThreads extends Thread {

	static 	StringBuffer content = new StringBuffer();
	URL url;

	public GetURLThreads(String url) throws MalformedURLException {

		this.url = new URL(url);

	}

	public void run() {

		try {

			BufferedReader in = new BufferedReader(new InputStreamReader(url.openStream()));

			String inputLine;

			while ((inputLine = in.readLine()) != null) {

	            content.append(inputLine);
			}

			in.close();

		} catch (Exception e){

			System.out.println(e);
		// 	System.exit(-1);
		}
		

	}


	public static void main(String[] args) throws Exception {

		ArrayList <Thread> threads = new ArrayList <Thread>();

		for (String s : args) {

			Thread t = new GetURLThreads(s);
			t.start();
			threads.add(t);

		}

		for (Thread t : threads ) {
			t.join();
		}

		System.out.println(content.toString());
		
	}

	
}