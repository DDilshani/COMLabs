import java.net.*;
import java.io.*;
import java.util.*;
import java.lang.*;

//get contents of more than 1 url using a separate buffer for each instance
public class GetURLThreadsSeparateBufferInstance extends Thread {

	// Buffer and url as an instance variable 
	private StringBuffer content;
	private URL url;

	//Constructor needed to create buffer and URL instance
	public GetURLThreadsSeparateBufferInstance(String url) throws MalformedURLException {

		this.url = new URL(url);
		this.content = new StringBuffer();

	}

	@Override
	public void run() {

		try {

			BufferedReader in = new BufferedReader(new InputStreamReader(url.openStream()));

			this.content.append("\nBEGIN DOWNLOAD " + url +"\n");
			String inputLine;

			while ((inputLine = in.readLine()) != null) {

	            this.content.append(inputLine);
	            yield();
			}

			in.close();
			this.content.append("\nEND DOWNLOAD " + url +"\n");

		} catch (Exception e){

			System.out.println(e);
			System.out.println("Invalid Url!");
		}
		

	}


	public static void main(String[] args) throws Exception {

		ArrayList <GetURLThreadsSeparateBufferInstance> threads = new ArrayList <GetURLThreadsSeparateBufferInstance>();

		for (String s : args) {

			GetURLThreadsSeparateBufferInstance t = new GetURLThreadsSeparateBufferInstance(s);
			t.start();
			threads.add(t);

		}

		for (GetURLThreadsSeparateBufferInstance t : threads ) {
			t.join();
			System.out.println(t.content);
		}
		
		// sleep(1000);
		// System.out.println(content.toString());
		
	}

	
}