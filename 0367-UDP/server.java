import java.io.IOException;
import java.util.*;
import java.net.*;

public class server{
    public static void main(String args[]) throws IOException{
        //create a socket to listen at port
        DatagramSocket ds = new DatagramSocket(1234);
        byte[] receive = new byte[65535];
        DatagramPacket DpReceive = null;
        while(true){
            //create datagram packet to receive data 
            DpReceive = new DatagramPacket(receive,receive.length);
            //receive in byte buffer
            ds.receive(DpReceive);
            System.out.println("Client :"+data(receive));
            //exit if the client tells bye
            if(data(receive).toString().equals("bye")){
                System.out.println("Client sent bye");
                break;
            }
            //clearing buffer
            receive = new byte[65535];
        }
    }
        // string method to convert byte array
        public static StringBuilder data(byte a[]){
            if(a==null) return null;
            StringBuilder ret = new StringBuilder();
            int i=0;
            while(a[i]!=0){
                ret.append((char) a[i]);
                i++;
            }
            return ret;
        }
}