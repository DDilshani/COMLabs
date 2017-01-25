import java.net.*;
import java.io.*;

public class ex2 {

	public static void main(String[] args) throws Exception {

		URL url = new URL(args[0]);

		URLConnection cn = url.openConnection();

		BufferedReader in = new BufferedReader(new InputStreamReader(cn.getInputStream()));

		String inputLine;

		while ((inputLine = in.readLine()) != null) {
            System.out.println(inputLine);
		}

        in.close();
		
	}
}