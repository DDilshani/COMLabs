// UDPClient.java: A simple UDP client program.

import java.net.*;
import java.io.*;

public class UDPClient {

    final static String data = "Hello there!";
    final static int PORT = 1234;
    final static int BUFSIZE = 1024;
    final static int PCKTS = 30000;

    public static void main(String args[]) {

        try ( DatagramSocket aSocket = new DatagramSocket();) {
            InetAddress aHost = InetAddress.getByName(args[0]);
            

                byte[] dataArray = data.getBytes();
                DatagramPacket requestPacket = new DatagramPacket(dataArray, dataArray.length, aHost, PORT);
            
            // For throughput test
            System.out.println("---------------Throughput Test-------------------");

            for (int i=0; i < PCKTS ; i++) {
                aSocket.send(requestPacket);
                System.out.println(i + " Packet sent!");

            }

            //For RTT test
            System.out.println("-------------------RTT Test-------------------");
            byte[] buffer = new byte[BUFSIZE];
            DatagramPacket recievePacket = new DatagramPacket(buffer, buffer.length);

            for (int i=0; i<3 ; i++) {
                
                long startTime = System.currentTimeMillis();
                
                aSocket.send(requestPacket);
                aSocket.receive(recievePacket);

                long endTime = System.currentTimeMillis();

                System.out.println("Reply:" + new String(recievePacket.getData()));

                long rtt = endTime - startTime;
                System.out.println("RTT for packet " + i+ " : " + rtt+ " ms");
            }

        } catch (Exception e) {
            System.out.println("Socket: " + e.getMessage());
        }

    }
}
