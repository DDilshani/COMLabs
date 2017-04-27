import java.net.*;
import java.io.*;
import java.util.*;

public class TCPServer{

	final static int PORT = 9000;


	public static void main(String[] args) {


		try{
			ServerSocket ss = new ServerSocket(PORT);

			while (true) {

					Socket socket = ss.accept();
					Scanner sin = new Scanner(socket.getInputStream());
					// PrintStream sout = new PrintStream(socket.getOutputStream());
					PrintWriter sout = new PrintWriter(socket.getOutputStream(), true);
					sout.println("Server says Hello!");
					System.out.println(sin.nextLine());
				
			}

		} catch(Exception e){

		}
		
	}


}