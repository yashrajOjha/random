import java.util.*;
public class crcalgo {
    public static String crcdiv(String div, String generator, String zeroes){
        int n = generator.length();
        String str = div;
        str = str.substring(0,n);
        System.out.println("Part to be divided - "+str);
        for(int i=0;i<n;i++){
            ArrayList<Character> list = new ArrayList<>();
            if(str.charAt(0)=='1'){
                for(int j=0;j<n;j++){
                    // System.out.println("Character of Str - "+str.charAt(j)+" and Character of generator - "+generator.charAt(j));
                    if(str.charAt(j)==generator.charAt(j)){
                        list.add('0');
                    }
                    else{ list.add('1'); }
                }   
            }
            if(str.charAt(0)=='0'){
                for(int j=0;j<n;j++){
                    // System.out.println("Character of Str - "+str.charAt(j)+" and Character of generator - "+zeroes.charAt(j));
                    if(str.charAt(j)==zeroes.charAt(i)){
                        list.add('0');
                    }
                    else{ list.add('1'); }
                } 
            }
            list.remove(0);
            if (n+i<div.length()){
                list.add(div.charAt(n+i));
            }
            else{ list.add('0');}
            // for(int k=0;k<list.size();k++){
            //     System.out.println(list.get(k));
            // }
            StringBuilder sb = new StringBuilder();
            for (Character ch: list) {
                sb.append(ch);
            }
            str= sb.toString();
            System.out.println("Next String to divided - "+str);      
        }
        return str;
    }
    public static void main(String args[]){
        Scanner scan = new Scanner(System.in);
        System.out.println("Enter data: ");
        String data = scan.nextLine();
        System.out.println("Enter generator: ");
        String generator = scan.nextLine();
        int n = generator.length()-1;
        StringBuilder str = new StringBuilder();
        for(int i=0;i<n;i++){
            str.append("0");
        }
        n=generator.length();
        StringBuilder zeroes = new StringBuilder();
        for(int i=0;i<n;i++){
            zeroes.append('0');
        }
        String div = data+str.toString();
        System.out.println("After adding zeroes to the data -"+div);
        System.out.println("Generator to be used -"+generator);
        String val = crcdiv(div,generator,zeroes.toString());
        val = val.substring(0,val.length());
        System.out.println(data+val);
        div = data+val;
        String output = crcdiv(div, generator, zeroes.toString());
        if(Integer.parseInt(output)==0){
            System.out.println("No Error");
        }else{
            System.out.println("Error");
        }
        scan.close();
 
    }
}