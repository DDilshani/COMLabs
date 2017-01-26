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

	@Override
	public void run() {

		try {

			BufferedReader in = new BufferedReader(new InputStreamReader(url.openStream()));

			content.append("\nBEGIN DOWNLOAD " + url +"\n");
			String inputLine;

			while ((inputLine = in.readLine()) != null) {

				// content.append("\nBEGIN DOWNLOAD " + url +"\n");
	            content.append(inputLine);
	            yield();
	            // content.append("\nEND DOWNLOAD " + url +"\n");
			}

			in.close();
			content.append("\nEND DOWNLOAD " + url +"\n");

		} catch (Exception e){

			System.out.println(e);
		
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
		
		// sleep(1000);
		System.out.println(content.toString());
		
	}

	
}