import java.io.BufferedReader;
import java.io.FileReader;
import java.io.*;

public class regEx {


	public static void main(String[] args) throws Exception {

		String pathToFile = args[0];
		String letters = args[1];

		char [] charLetters = letters.toCharArray();

		BufferedReader br = new BufferedReader(new FileReader(pathToFile));

		String line = br.readLine();

		while (line != null) {

			// System.out.println(line);
			char [] word = line.toCharArray();
			int count = 0;

			for (char c : word ) {

				for (char s : charLetters ) {

					if ( c == s) {

						count++;
						
					}	
				}

				if (count == 0) {
					
					break;
				}

			}
			

			if (count == line.length()){

				if (line == " ") {
					
					break;
				}
				
				System.out.println(line);

			}

	
			line = br.readLine();
			
		}
		
	}
}