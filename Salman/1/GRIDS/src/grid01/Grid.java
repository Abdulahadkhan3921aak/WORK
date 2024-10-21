package grid01;

import java.util.ArrayList;
import java.util.Random;

public class Grid {
	
	private ArrayList <Row> theRows = new ArrayList <Row> ();
	private final int NUMBER_OF_ROWS = 10;
	private boolean[][] firedSquares = new boolean[NUMBER_OF_ROWS][NUMBER_OF_ROWS];
	
	public Grid() {
		Row tempRow;
		for(int loop = 1; loop <= this.NUMBER_OF_ROWS; loop++) {
			tempRow = new Row(loop);
			this.theRows.add(tempRow);
			for(int j = 0 ; j < this.NUMBER_OF_ROWS ; j++) {
				firedSquares[loop - 1][j] = false;
			}
		}
	}//end Grid
	
	
	
	
	private boolean isSquareAlreadyFired(int row, int square) {
	    // Check if the square has already been fired at
		theRows.get(row-1).getTheSquares().get(square-1).setFiredAt(true);;
	    return firedSquares[row-1][square-1];
	}
	
	
	public boolean fireAtSquare(int row, int square) {
		
		// Check if the square has already been fired at
	    if (isSquareAlreadyFired(row, square)) {
	        // Square has already been fired at
	        return false;
	    }
		
	    // Check if the square contains a ship
	    else if (isThereAShipOn(row, square)) {
	        // Mark the square as fired at
	        markSquareAsFired(row, square);
	        
	        System.out.println("You hit a ship!");
	        
	        // You can also return the points for hitting the ship, if needed
	        return true; // Hit
	    } else {
	        // Mark the square as fired at
	        markSquareAsFired(row, square);
	        System.out.println("You missed.");
	        return true; // Miss
	    }
	}

	private void markSquareAsFired(int row, int square) {
	    // Check if the square has already been fired at
	    firedSquares[row-1][square-1] = true;
	}

	
	public int getPointsAtSquare(int row, int square) {
	    // Check if the square contains a ship
	    if (isThereAShipOn(row, square)) {
	        // Find the ship on the square and return its associated points
	        return findShipAtSquare(row, square).getPoints();
	    } else {
	        return 0; // No points for a miss
	    }
	}

	private Ship findShipAtSquare(int row, int square) {
	    // Find the ship associated with the specified square
	    for (Row tempRow : theRows) {
	        if (tempRow.getNumber() == row) {
	            for (Square tempSquare : tempRow.getTheSquares()) {
	                if (tempSquare.getNumber() == square && tempSquare.isThereAShip()) {
	                    return tempSquare.getShip();
	                }
	            }
	        }
	    }
	    return null; // No ship found
	}

	
	public boolean allShipsSunk() {
	    for (Row tempRow : theRows) {
	        for (Square tempSquare : tempRow.getTheSquares()) {
	            // Check if the square contains a ship that has not been fired at
	            if (tempSquare.isThereAShip() && !tempSquare.isFiredAt()) {
	                return false; // Not all ships are sunk
	            }
	        }
	    }
	    return true; // All ships are sunk
	}
	
	private enum ShipType {
	    PATROL_BOAT(1, "Patrol Boat", 10),
	    DESTROYER(2, "Destroyer", 8),
	    SUBMARINE(3, "Submarine", 6),
	    BATTLESHIP(4, "Battleship", 4),
	    AIRCRAFT_CARRIER(5, "Aircraft Carrier", 2);

	    private final int size;
	    private final String name;
	    private final int points;

	    ShipType(int size, String name, int points) {
	        this.size = size;
	        this.name = name;
	        this.points = points;
	    }
	    
	    public static ShipType getRandomShipType() {
	        Random random = new Random();
	        return values()[random.nextInt(values().length)];
	    }

	    public int getSize() {
	        return size;
	    }

	    public String getName() {
	        return name;
	    }

	    public int getPoints() {
	        return points;
	    }
	}


	private boolean canPlaceShip(int row, int square, int size, int isHorizontal) {
	    // Check if the ship fits within the grid boundaries
	    if (isHorizontal == 1) {
	        if (square + size - 1 > NUMBER_OF_ROWS) {
	            return false; // Ship goes out of bounds horizontally
	        }
	    } else {
	        if (row + size - 1 > NUMBER_OF_ROWS) {
	            return false; // Ship goes out of bounds vertically
	        }
	    }

	    // Check if the squares are already occupied by other ships
	    for (int i = 0; i < size; i++) {
	        if (isHorizontal == 1) {
	            if (isThereAShipOn(row, square + i)) {
	                return false; // There's a ship in the way
	            }
	        } else {
	            if (isThereAShipOn(row + i, square)) {
	                return false; // There's a ship in the way
	            }
	        }
	    }

	    return true; // Ship can be placed at the specified location
	}

	
	
	
	public void placeShipsRandomly() {
        Random random = new Random();
        int shipsToPlace = 5; // Place 5 ships
        for (int i = 0; i < shipsToPlace; i++) {
            ShipType shipType = ShipType.getRandomShipType(); // Get a random ship type
            boolean placed = false;
            while (!placed) {
                int orientation = random.nextInt(2); // 0 for horizontal, 1 for vertical
                int row = random.nextInt(NUMBER_OF_ROWS);
                int square = random.nextInt(NUMBER_OF_ROWS);
                if (canPlaceShip(row, square, shipType.getSize(), orientation)) {
                    addShip(new Ship(shipType.getSize(), shipType.getName(), shipType.getPoints()), row, square, orientation);
                    placed = true;
                }
            }
        }
    }

	
	
	//is there a ship on a particular square
	public boolean isThereAShipOn(int row, int square) {
		for(Row tempRow : this.theRows) {
			if(tempRow.getNumber() == row) {
				//found the correct row
				for(Square tempSquare : tempRow.getTheSquares()) {
					if(tempSquare.getNumber() == square) {
						//found the correct square
						return tempSquare.isThereAShip();
					}
				}
			}
		}
		return false;
	}
	
	
	
	
	private boolean debugMode = false; // Debug mode flag

    public void setDebugMode(boolean debugMode) {
        this.debugMode = debugMode;
    }

    public boolean isDebugMode() {
        return debugMode;
    }
    
    
    
    
    
    public void displayGrid() {
        for (Row row : theRows) {
            for (Square square : row.getTheSquares()) {
                if (square.isThereAShip() && !square.isFiredAt() && !isDebugMode()) {
                    System.out.print("! "); // Unfired square (hidden in non-debug mode)
                } else if (square.isFiredAt() && square.isThereAShip()) {
                    System.out.print("X "); // Ship hit
                } else if (square.isFiredAt() && !square.isThereAShip()) {
                    System.out.print("O "); // Missed shot
                } else {
                    System.out.print("~ "); // Unfired square (visible in debug mode)
                }
            }
            System.out.println(); // Move to the next row
        }
        System.out.print("Legends : \n");
        System.out.println();
        System.out.print("Unfired square : ~\n ");
        System.out.println();
        System.out.print("Fired empty square : O \n");
        System.out.println();
        System.out.print("Fired Ship : X \n");
        System.out.println();
        System.out.print("Unfired Ship : ! \n");
        System.out.println();
    }

	
	
	
	
	
	public void addShip(Ship ship, int row, int square, int isHorizontal) {
	    // Check if the ship fits in the specified location
	    if (isHorizontal == 1) {
	        for (int i = 0; i < ship.getLength(); i++) {
	            if (row < 1 || row > NUMBER_OF_ROWS || square + i < 1 || square + i > NUMBER_OF_ROWS) {
	                // Ship doesn't fit within the grid boundaries
	                return;
	            }
	            if (isThereAShipOn(row, square + i)) {
	                // There's already a ship in the way
	                return;
	            }
	        }
	    } else {
	        for (int i = 0; i < ship.getLength(); i++) {
	            if (row + i < 1 || row + i > NUMBER_OF_ROWS || square < 1 || square > NUMBER_OF_ROWS) {
	                // Ship doesn't fit within the grid boundaries
	                return;
	            }
	            if (isThereAShipOn(row + i, square)) {
	                // There's already a ship in the way
	                return;
	            }
	        }
	    }

	    // Place the ship on the grid
	    if (isHorizontal == 1) {
	        for (int i = 0; i < ship.getLength(); i++) {
	            addShipToSquare(ship, row, square + i);
	        }
	    } else {
	        for (int i = 0; i < ship.getLength(); i++) {
	            addShipToSquare(ship, row + i, square);
	        }
	    }
	}

	private void addShipToSquare(Ship ship, int row, int square) {
	    for (Row tempRow : theRows) {
	        if (tempRow.getNumber() == row) {
	            for (Square tempSquare : tempRow.getTheSquares()) {
	                if (tempSquare.getNumber() == square) {
	                    tempSquare.setShip(ship);
	                }
	            }
	        }
	    }
	}


	
}//end class
