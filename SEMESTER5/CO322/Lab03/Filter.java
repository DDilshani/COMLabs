import java.io.BufferedReader;
import java.io.FileReader;
import java.io.*;

public class Filter {


	public static void main(String[] args) throws Exception {

		String pathToFile = args[0];
		String letters = args[1];

		char [] charLetters = letters.toCharArray();

		int [] sampleLetterSum = new int [26];

		for (char c : charLetters ) {

			int index = c - 'a';
			sampleLetterSum[index] = sampleLetterSum[index] + 1;
			
		}

		BufferedReader br = new BufferedReader(new FileReader(pathToFile));

		String line;

		while ((line = br.readLine()) != null) {

			// System.out.println(line);
			char [] word = line.toCharArray();
			int [] wordLetterSum = new int [26];
			boolean match = true;

			for (char c : word ) {

				if((c >= 'a') && (c <= 'z') ){

					int index = c - 'a';
					// System.out.println(index);
					wordLetterSum[index] = wordLetterSum[index] + 1;

					if(sampleLetterSum[index] == 0){

						match = false;
						break;
					}

				} else {

					match = false;
					break;
				}

			}

			if (match){

				System.out.println(line);

			}
			

	
			// line = br.readLine();
			
		}
		
	}

}