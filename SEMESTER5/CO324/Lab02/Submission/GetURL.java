import java.net.*;
import java.io.*;
import java.util.*;
import java.lang.*;

//get more than 1 url
public class GetURL {

	public static void main(String[] args) throws Exception {

		StringBuffer content = new StringBuffer();

		for (String s : args) {

			URL url = new URL(s);

			URLConnection cn = url.openConnection();

			BufferedReader in = new BufferedReader(new InputStreamReader(cn.getInputStream()));

			String inputLine;

			while ((inputLine = in.readLine()) != null) {
	            content.append(inputLine);
			}

			in.close();

		}

		System.out.println("buffer = " + content.toString());

	}
}