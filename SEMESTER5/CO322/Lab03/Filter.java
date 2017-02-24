import java.io.*;

public class Filter {

	private String pathToFile;
	private String letters;

	private boolean [] sampleLetterCheck;
	private boolean [] wordLetterCheck;

	public Filter(String pathToFile, String letters){

		this.pathToFile = pathToFile;
		this.letters = letters;

		// Initialising arrays with false
		this.sampleLetterCheck = new boolean [26];
		this.wordLetterCheck = new boolean [26];
	}

	// Returns a boolean array containing the letter positions of given as input argument as true
	public void getSampleCheck(){

		char [] charLetters = letters.toCharArray();

		// Marking presence of given characters
		for (char c : charLetters ) {

			int index = c - 'a';	// getting the letter index corresponding to alpabet numbered from 0 - 25 (a - z)
			sampleLetterCheck[index] = true;	// making respective letter position of alphabet true
			
		}
	}

	// Displays words containing given letters
	public void printWords() throws IOException {

		BufferedReader br = new BufferedReader(new FileReader(pathToFile));

		String line;

		// Read file
		while ((line = br.readLine()) != null) {

			char [] word = line.toCharArray();

			wordLetterCheck = new boolean [26]; // Initialising false for current word

			boolean match = true; // Initialising match detector

			for (char c : word ) {

				// filter characters belonging to alphabet
				if((c >= 'a') && (c <= 'z') ){

					int index = c - 'a';
					wordLetterCheck[index] = true;

					// Check whether current letter is contained in the sample letters given
					if(!sampleLetterCheck[index]){

						match = false;
						break;
					}

				} else {

					match = false;
					break;
				}

			}

			// displaying words found
			if (match){

				System.out.println(line);

			}
			
		}


	}


	public static void main(String[] args) throws IOException {

		String pathToFile = args[0];
		String letters = args[1];

		Filter filter = new Filter(pathToFile, letters);

		filter.getSampleCheck();
		filter.printWords();

		/*
		RUN TIME COMPLEXITY ANALYSIS
		------------------------------

		Let,
		
		Number of characters given as input = n
		Number of words in the text file = N
		Maximum word length = M

		Consider the getSample() funcyion:

		Complexity of running through given string = O(n)
		

		Consider the printWords() funcyion:

		Complexity of running through each character in a word = M operations 
		Complexity of running through each word in the file = N operations
		Complexity of running through each word in the file and running through each character of the word = N * M operations = O(N * M)

		Total Complexity of the implementation = O(n) + O (N * M)

		----------------------------------------------------
		Complexity of the final implementation = O (N * M)
		----------------------------------------------------


		*/
		
	}

}