import java.util.*;
import java.net.*;
import java.io.*;
public class client{
    public static void main(String args[]){
        try{
            Scanner scan = new Scanner(System.in);
            Socket s = new Socket("192.168.0.166",998); //ip address and port number
            DataOutputStream dos = new DataOutputStream(s.getOutputStream());
            DataInputStream dis = new DataInputStream(s.getInputStream());
            dos.writeUTF("Connected to 192.168.0.166");
            System.out.println("Enter the file path which must be fetched");
            String path = scan.nextLine();
            dos.writeUTF(path);
            System.out.println(new String(dis.readUTF()));
            dis.close();
            dos.close();
            s.close();
            scan.close();
        }
        catch(IOException e){
            System.out.println("Error Message "+e.getMessage());
        }
    }
}