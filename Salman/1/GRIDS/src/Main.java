import java.util.Scanner;
import grid01.Grid;

public class Main {

    public static void main(String[] args) {
        Grid grid = new Grid();

        
        grid.placeShipsRandomly();
        
        int totalShots = 0;
        int totalPoints = 0;

        Scanner scanner = new Scanner(System.in);

        while (totalShots < 10 ) {


            System.out.print("Enter the row (1-10): ");
            int row = scanner.nextInt();
            System.out.print("Enter the square (1-10): ");
            int square = scanner.nextInt();

            if (grid.fireAtSquare(row, square)) {
                totalPoints += grid.getPointsAtSquare(row, square);
                totalShots++;
            } else {
            	System.out.println("Grid allready Fired at");
            }

            

            if (grid.allShipsSunk()) {
                System.out.println("Congratulations! You sunk all the ships.");
            } else if (totalShots >= 10) {
                System.out.println("Game over. You have reached the maximum number of shots.");
            }
            
            if (!grid.isDebugMode()) {
                System.out.println("Grid:");
                grid.displayGrid();
            }
            
            System.out.println("Total Points: " + totalPoints);
        }
        if (!grid.isDebugMode()) {
            System.out.println("Grid:");
            grid.displayGrid();
        }

        
        System.out.println("Game Over");
        System.out.println("Total Points: " + totalPoints);

        // Close the scanner
        scanner.close();
    }
}
