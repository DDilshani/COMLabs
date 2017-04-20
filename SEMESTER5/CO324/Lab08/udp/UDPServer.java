// UDPServer.java: A simple UDP server program.

import java.net.*;
import java.io.*;
import java.util.*;

public class UDPServer {
    final static int PORT = 1200;
    final static int BUFSIZE = 1024;
    
    
    public static void main(String args[]) {

        int count = 0;
        long receiveStart = 0;

        // while (!Thread.interrupted())
        for (int i=0; i<100; i++) {
        
            try (DatagramSocket aSocket = new DatagramSocket(PORT);) {
                byte[] bufferRecieve = new byte[BUFSIZE];          
                DatagramPacket recievePacket = new DatagramPacket(bufferRecieve, BUFSIZE);
    			
                if (i==0) {
                    
                    receiveStart = System.currentTimeMillis();
                }

    			aSocket.receive(recievePacket);
                count++;
                
    			// DatagramPacket replyPacket = new DatagramPacket(
       //                  recievePacket.getData(), recievePacket.getLength(), 
       //                  recievePacket.getAddress(), recievePacket.getPort());

       //          aSocket.send(replyPacket);   


            } catch (Exception e) {            
                System.out.println("Socket: " + e.getMessage());            
            } 
        }

        long receiveEnd = System.currentTimeMillis();
        System.out.println("Throughput: " + (count * 1000/(receiveStart - receiveEnd)));
    }
}
