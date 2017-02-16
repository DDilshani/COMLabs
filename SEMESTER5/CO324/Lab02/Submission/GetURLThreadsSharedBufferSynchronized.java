import java.net.*;
import java.io.*;
import java.util.*;
import java.lang.*;

//get more than 1 url using a shared string buffer
public class GetURLThreadsSharedBufferSynchronized extends Thread {

	//Class variable
	static 	StringBuffer content = new StringBuffer();

	//Instance variable
	private URL url;

	// constructor is needed to create a URL object and a Thread for each commandline input
	public GetURLThreadsSharedBufferSynchronized(String url) throws MalformedURLException {

		this.url = new URL(url);

	}

	@Override
	public synchronized void run() {

		try {

			BufferedReader in = new BufferedReader(new InputStreamReader(url.openStream()));

			// to see the downloads from each url clearly
			content.append("\nBEGIN DOWNLOAD " + url +"\n");
			String inputLine;

			while ((inputLine = in.readLine()) != null) {

	            content.append(inputLine);
	            yield(); // To observe the concurrent behaviour of threads (not in order) --> Not a synchronizing method
			}

			in.close();
			content.append("\nEND DOWNLOAD " + url +"\n");

		} catch (Exception e){

			System.out.println(e);
			System.out.println("Invalid url!");
		
		}
		

	}


	public static void main(String[] args) throws Exception {

		// To keep threads
		ArrayList <Thread> threads = new ArrayList <Thread>();

		for (String s : args) {

			Thread t = new GetURLThreadsSharedBufferSynchronized(s);
			t.start();
			threads.add(t);

		}

		// Synchronizing threads using join.
		//Nothing is printed if not joined
		for (Thread t : threads ) {
			t.join();
		}
		
		// sleep(1000); --> Using sleep will not synchronize threads 
		System.out.println(content.toString());
		
	}

	
}