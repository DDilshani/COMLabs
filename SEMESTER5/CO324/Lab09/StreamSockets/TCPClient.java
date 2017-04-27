

public class TCPClient{

	public static void main(String[] args) {

		final static int PORT = 9000;
		
		try{
			
			InetAddress aHost = InetAddress.getByName(args[0]);

			Socket socket = new Socket(aHost, PORT);
		}
	}

}