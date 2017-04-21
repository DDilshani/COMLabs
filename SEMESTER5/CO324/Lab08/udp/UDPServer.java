// UDPServer.java: A simple UDP server program.

import java.net.*;
import java.io.*;
import java.util.*;
import java.lang.*;

public class UDPServer {
    final static int PORT = 1234;
    final static int BUFSIZE = 1024;
    final static int PCKTS = 30000;
    
    
    public static void main(String args[]) {

        int count = 0;
        long startTime = 0;

        // For throughput Test
        System.out.println("-------------------Throughput Test---------------------");
        for (int i = 0; i <= PCKTS ; i++) {
        
            try (DatagramSocket aSocket = new DatagramSocket(PORT);) {

                byte[] bufferRecieve = new byte[BUFSIZE];          
                DatagramPacket recievePacket = new DatagramPacket(bufferRecieve, BUFSIZE);
    			
                if (count == 0) {
                    startTime = System.currentTimeMillis();
                }

    			aSocket.receive(recievePacket);
    			// System.out.println("Packet received!");

                if (count == 1000){
                	long endTime = System.currentTimeMillis();
        			System.out.println("Throughput for 1000 packets: " + (count * 1000/(endTime - startTime)));
                }

                if (count == 2000){
                	long endTime = System.currentTimeMillis();
        			System.out.println("Throughput for 2000 packets: " + (count * 1000/(endTime - startTime)));
                }

                if (count == 5000){
                	long endTime = System.currentTimeMillis();
        			System.out.println("Throughput for 5000 packets: " + (count * 1000/(endTime - startTime)));
                }

                if (count == 10000){
                	long endTime = System.currentTimeMillis();
        			System.out.println("Throughput for 10000 packets: " + (count * 1000/(endTime - startTime)));
                	i = PCKTS;
                }

                count++; 

            } catch (Exception e) {            
                System.out.println("Socket: " + e.getMessage());            
            } 
        }
        
        //For RTT Test
        while (!Thread.interrupted())
        try (DatagramSocket aSocket = new DatagramSocket(PORT);) {

            byte[] bufferRecieve = new byte[BUFSIZE];          
            DatagramPacket recievePacket = new DatagramPacket(bufferRecieve, BUFSIZE);
			
			aSocket.receive(recievePacket);

			DatagramPacket replyPacket = new DatagramPacket(
                    recievePacket.getData(), recievePacket.getLength(), 
                    recievePacket.getAddress(), recievePacket.getPort());

            aSocket.send(replyPacket);  

        } catch (Exception e) {            
            System.out.println("Socket: " + e.getMessage());            
        } 
    }
}
