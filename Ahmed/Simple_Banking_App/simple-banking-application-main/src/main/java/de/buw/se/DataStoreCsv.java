package de.buw.se;

import java.io.BufferedWriter;
import java.io.IOException;
import java.io.Reader;
import java.nio.file.Files;
import java.nio.file.Paths;

import org.apache.commons.csv.CSVFormat;
import org.apache.commons.csv.CSVParser;
import org.apache.commons.csv.CSVRecord;

public class DataStoreCsv {
  private static final String FILE_NAME = "src/main/resources/balance.csv";

  /**
   * Read balance from the CSV file
   * 
   * @return balance
   */
  public static double readBalance() {
    double balance = 0; 
    
    try (Reader reader = Files.newBufferedReader(Paths.get(FILE_NAME));
         @SuppressWarnings("deprecation")
        CSVParser csvParser = new CSVParser(reader, CSVFormat.DEFAULT
                 .withFirstRecordAsHeader()
                 .withIgnoreHeaderCase()
                 .withTrim());) {
        
              for (CSVRecord csvRecord : csvParser) {
              String balanceStr = csvRecord.get("balance"); 
             
            try {

                balance = Double.parseDouble(balanceStr);
               
            } catch (NumberFormatException e) {
                System.err.println("Error: Invalid balance value - " + balanceStr);
                
            }
          }
        
    } catch (IOException e) {
        e.printStackTrace();
    }
    
    return balance;
}


  public static void modifyBalance(String amount) {
      double balance = readBalance();
      double amountValue = Double.parseDouble(amount);

      //Add user input to the balance
      balance += amountValue;


    // add new balance to the CSV file
    try (BufferedWriter writer = Files.newBufferedWriter(Paths.get(FILE_NAME))){
      // write the new balance
      writer.write("balance"); 
      writer.newLine();       
      writer.write(Double.toString(balance)); 


    } catch (IOException e) {
      e.printStackTrace();      
    }
  }
  
}  
