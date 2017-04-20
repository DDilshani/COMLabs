// UDPClient.java: A simple UDP client program.

import java.net.*;
import java.io.*;
import java.lang.*;

public class UDPClient {

    final static String data = "Hello there!";
    final static int PORT = 1200;
    final static int BUFSIZE = 1024;

    public static void main(String args[]) {

        try ( DatagramSocket aSocket = new DatagramSocket();) {
            InetAddress aHost = InetAddress.getByName(args[0]);
            
            // int count = 0;
            // long receiveStart = 0;

            for (int i=0; i<100 ; i++) {

                byte[] dataArray = data.getBytes();
                DatagramPacket requestPacket = new DatagramPacket(dataArray, dataArray.length, aHost, PORT);
                aSocket.send(requestPacket);

                byte[] buffer = new byte[BUFSIZE];
                DatagramPacket recievePacket = new DatagramPacket(buffer, buffer.length);
                // receiveStart = System.currentTimeMillis();
                aSocket.receive(recievePacket);
                // count++;
                System.out.println("Reply:" + new String(recievePacket.getData()));

           } 

           // long receiveEnd = System.currentTimeMillis();
           // long difference = receiveEnd - receiveStart;
           // long throughput = count / difference;
           // System.out.println("Throughput: " + throughput);

        } catch (Exception e) {
            System.out.println("Socket: " + e.getMessage());
        } 
    }
}
