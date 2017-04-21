// UDPServer.java: A simple UDP server program.

import java.net.*;
import java.io.*;
import java.util.*;
import java.lang.*;

public class UDPServer {
    final static int PORT = 1234;
    final static int BUFSIZE = 1024;
    final static int PCKTS = 100;
    
    
    public static void main(String args[]) {

        int count = 0;
        long receiveStart = 0;

        while (!Thread.interrupted()){
        // for (int i=0; i<= PCKTS; i++) {
        
    		// System.out.println("server in");
            try (DatagramSocket aSocket = new DatagramSocket(PORT);) {
    			System.out.println("try in");
                byte[] bufferRecieve = new byte[BUFSIZE];          
                DatagramPacket recievePacket = new DatagramPacket(bufferRecieve, BUFSIZE);
    			
                if (count==0) {
                    
    			System.out.println("i = 0");
                    receiveStart = System.currentTimeMillis();
                }

    			aSocket.receive(recievePacket);
    			System.out.println("Packet received!");
                count++;

                if (count == PCKTS){
                	long receiveEnd = System.currentTimeMillis();
        			System.out.println("Throughput: " + (count * 1000/(receiveStart - receiveEnd)));
        			count = 0;
                }
                
    			// DatagramPacket replyPacket = new DatagramPacket(
       //                  recievePacket.getData(), recievePacket.getLength(), 
       //                  recievePacket.getAddress(), recievePacket.getPort());

       //          aSocket.send(replyPacket);   


            } catch (Exception e) {            
                System.out.println("Socket: " + e.getMessage());            
            } 
        // }

        }
    }
}
