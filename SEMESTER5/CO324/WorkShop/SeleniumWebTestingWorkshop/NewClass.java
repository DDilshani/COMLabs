import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;


public class NewClass {   
    
       
    
    public static String ReadData() throws Exception {
        BufferedReader br = null;

        String credentials  = null; 
        
               
        try {
            
            // read text file 
            br = new BufferedReader(new FileReader("E:\\dataNew.txt"));
            String line;

            while ((line = br.readLine()) != null) {          
                             
               credentials =line;
                             
            }
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            try {
                if (br != null) {
                    br.close();
                }
            } catch (IOException ex) {
                ex.printStackTrace();
            }
        }
        // return text file data with row count 
        return  credentials ;
    }
}