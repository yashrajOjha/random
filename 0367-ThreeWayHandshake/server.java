import java.util.*;
import java.io.*;
import java.net.*;
public class server {
    public static void main(String args[]){
        try{
            // Scanner scan = new Scanner(System.in);
            ServerSocket s = new ServerSocket(998); //port number to connect to the socket
            System.out.println("Connection Ready");
            Socket s1 = s.accept();
            DataOutputStream dos = new DataOutputStream(s1.getOutputStream());
            DataInputStream dis = new DataInputStream(s1.getInputStream());
            System.out.println(dis.readUTF());
            String path = dis.readUTF();
            System.out.println("Request Received");
            try{
                File myFile = new File(path);
                Scanner scan = new Scanner(myFile);
                String st = scan.nextLine();
                System.out.println("Contents of the File");
                System.out.println(st);
                dos.writeUTF(st);
                dos.close();
                s1.close();
                s.close();
                scan.close();
            }
            catch(FileNotFoundException e){
                System.out.println("File not found");
                dos.writeUTF("File not found");
            }
        }
        catch(IOException e){
            System.out.println("Error Message "+e.getMessage());
        }
        finally{
            System.out.println("Connection Terminated");
        }
    }
}
