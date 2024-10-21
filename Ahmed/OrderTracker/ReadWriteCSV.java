import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.FileReader;
import java.io.PrintWriter;
import java.io.IOException;
import java.util.Scanner;


/**
 *
 * @author Jia Wei
 */
public class ReadWriteCSV {
    Scanner sc = new Scanner(System.in);
    String file;
    String filetemp = "temp.csv";
    BufferedReader reader = null;
    BufferedWriter writer = null;
    String line = "";

    /**
     * Set file to csv file path
     */
    public void setReadWriteCSV(String file){
        this.file = file;
    }


    /**
     *
     * @return the number of rows (excluding header) in CSV file
     */
    public int sizeOfFile(){
        int size = 0;

        try {
            reader = new BufferedReader(new FileReader(file));
            while ((line = reader.readLine()) != null) {
                size++;

            }
        }
        catch (Exception e) {
            e.printStackTrace();
        }
        finally {
            try {
                reader.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

        //System.out.println("size =" + (size-1));
        return size-1;
    }

    /**
     *
     * @return no of cols in csv file
     */
    public int sizeOfFileCol(){
        int size = 0;
        BufferedReader reader = null;

        try {
            reader = new BufferedReader(new FileReader(file));
            String line = reader.readLine();
            if (line != null) {
                String[] columns = line.split(",");
                size = columns.length;
            }
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            try {
                if (reader != null) {
                    reader.close();
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

        return size;
    }

    /**
     *
     * @param print based on the row index and col index in csv file
     */
    public void printDataRow(int rowIndex, int colIndex) {
        int count = 0;

        try {
            reader = new BufferedReader(new FileReader(file));
            while ((line = reader.readLine()) != null) {


                if (count == rowIndex) {
                    String[] row = line.split(",");
                    if (row.length > 0) {
                        System.out.printf("%-20s%n", row[colIndex]);
                        break;
                    }

                }

                count++;

            }
        }
        catch (Exception e) {
            e.printStackTrace();
        }
        finally {
            try {
                reader.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    /**
     *
     * @param rowIndex in csv file
     * @param colIndex in csv file
     * @return the String of the corresponding rowIndex and colIndex in csv file
     */
    public String readDataRow(int rowIndex, int colIndex) {
        int count = 0;

        try {
            reader = new BufferedReader(new FileReader(file));
            while ((line = reader.readLine()) != null) {


                if (count == rowIndex) {
                    String[] row = line.split(",");
                    if (row.length > 0) {
                        return row[colIndex];

                    }

                }

                count++;

            }
        }
        catch (Exception e) {
            e.printStackTrace();
        }
        finally {
            try {
                reader.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

        return null;
    }

    /**
     * adds a new row of data to csv file (each child class has their own specific implementation)
     */
    public void addDataRow(){
        return;
    }

    /**
     *
     * @param rowIndex of csv to edit
     * @param colIndex of csv to edit
     * @param newInput to replace at corresponding rowIndex x colIndex
     * @return 1 if success, 0 if unsuccessful
     */
    public int editData(int rowIndex, int colIndex, String newInput) {
        int count = -1;

        if (rowIndex > 0 && rowIndex <= sizeOfFile()) {
            try {
                writer = new BufferedWriter(new FileWriter(filetemp));
                reader = new BufferedReader(new FileReader(file));
                PrintWriter pWriter = new PrintWriter(writer);

                while ((line = reader.readLine()) != null) {
                    count++;

                    if (count != rowIndex) {
                        writer.write(line + "\n");
                    }
                    else if (count == rowIndex) {
                        String[] row = line.split(",");
                        for (int x = 0; x < sizeOfFileCol(); x++) {
                            if (x == colIndex) {
                                writer.write(newInput);
                            } else {
                                writer.write(row[x]);
                            }
                            if (x != sizeOfFileCol() - 1) {
                                writer.write(",");
                            }
                        }
                        writer.write("\n");
                    }
                }
            }
            catch (IOException e) {
                e.printStackTrace();
            }
            finally {
                try {
                    reader.close();
                    writer.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }

            File originalFile = new File(file);
            File temp = new File(filetemp);
            if (originalFile.delete()) {
                if (!temp.renameTo(originalFile)) {
                    System.out.println("Error renaming file");
                    return 0;
                }
            }
            else {
                System.out.println("Error deleting file");
                return 0;
            }

            return 1;
        }
        else {
            return 0;
        }
    }



    /**
     *
     * @param index of row to delete
     * @return returns 1 if successful, 0 if unsuccessful
     */
    public int removeDataRow(int index){
        int rowIndex=-1;


        if (index > 0 && index <= sizeOfFile()){
            try {
                writer = new BufferedWriter(new FileWriter(filetemp));
                reader = new BufferedReader(new FileReader(file));
                PrintWriter pWriter = new PrintWriter(writer);

                while ((line = reader.readLine()) != null) {
                    rowIndex++;

                    if (rowIndex!=index){
                        writer.write(line + "\n");
                    }
                }

            }
            catch (IOException e) {
                e.printStackTrace();
            }
            finally {
                try {
                    reader.close();
                    writer.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }

            File originalFile = new File(file);
            File temp = new File(filetemp);
            if (originalFile.delete()) {
                if (!temp.renameTo(originalFile)) {
                    System.out.println("Error renaming file");
                    return 0;
                }
            } else {
                System.out.println("Error deleting file");
                return 0;
            }

            return 1;
        }
        // No such index
        else return 0;
    }




}
