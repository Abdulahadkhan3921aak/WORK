import java.io.BufferedReader;
import java.io.FileWriter;
import java.io.FileReader;
import java.io.IOException;
import java.util.Scanner;

/**
 *  Run the main program here
 */
public class FOMS_App {
    public static void main(String[] args) {

        Scanner sc = new Scanner(System.in);

        // add start() FOM here
        FOMS foms = new FOMS();
        foms.start();

    }
}
