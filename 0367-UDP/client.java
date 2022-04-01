import java.io.IOException;
import java.net.*;
import java.util.*;

public class client{
    public static void main(String args[]) throws IOException{
        Scanner scan = new Scanner(System.in);
        //create create the socket object for carrying the data
        DatagramSocket ds = new DatagramSocket();
        InetAddress ip = InetAddress.getLocalHost();
        byte buf[] = null;
        //loop until user enters bye
        while(true){
            String inp = scan.nextLine();
            //convert string to bytes
            buf = inp.getBytes();
            //create datagram packet
            DatagramPacket DpSend = new DatagramPacket(buf,buf.length,ip,1234);
            //invoke send call
            ds.send(DpSend);
            //break the loop if user enters bye
            if(inp.equals("bye"));{
                break;
            }
        }
    }
}