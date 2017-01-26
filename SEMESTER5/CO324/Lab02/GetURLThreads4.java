import java.net.*;
import java.io.*;
import java.util.*;
import java.lang.*;

//get contents of more than 1 url using a shared buffer
public class GetURLThreads4 extends Thread {

	// static 	StringBuffer content = new StringBuffer();
	private StringBuffer content;
	URL url;

	public GetURLThreads4(String url) throws MalformedURLException {

		this.url = new URL(url);
		this.content = new StringBuffer();

	}

	@Override
	public void run() {

		try {

			BufferedReader in = new BufferedReader(new InputStreamReader(url.openStream()));

			this.content.append("BEGIN DOWNLOAD " + url +"\n");
			String inputLine;

			while ((inputLine = in.readLine()) != null) {

	            this.content.append(inputLine);
	            yield();
			}

			in.close();
			this.content.append("END DOWNLOAD " + url +"\n");

		} catch (Exception e){

			System.out.println(e);
		// 	System.exit(-1);
		}
		

	}


	public static void main(String[] args) throws Exception {

		ArrayList <GetURLThreads4> threads = new ArrayList <GetURLThreads4>();

		for (String s : args) {

			GetURLThreads4 t = new GetURLThreads4(s);
			t.start();
			threads.add(t);

		}

		for (GetURLThreads4 t : threads ) {
			t.join();
			System.out.println(t.content);
		}
		
		// sleep(1000);
		// System.out.println(content.toString());
		
	}

	
}