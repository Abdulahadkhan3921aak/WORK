package grid01;

public class BattleShips {

	private Grid theGrid = new Grid();
	private enum Boats {
	    PATROL_BOAT(1),
	    DESTROYER(2),
	    SUBMARINE(3),
	    BATTLESHIP(4),
	    AIRCRAFT_CARRIER(5);

	    private int size;

	    Boats(int size) {
	        this.size = size;
	    }

	    public int getSize() {
	        return size;
	    }
	}

	public void play() {
		int row, square;
		// setting up the ships
		//Ship s1 = new Ship();// you can add values
		row = 4;
		square = 5;
		//this.theGrid.addShip(s1, 4, 5);
		//this.theGrid.addShip(s1, 4, 6);
		//this.theGrid.addShip(s1, 4, 7);

		// ask user for x and y
		row = 4;
		square = 5;
		boolean test;
		test = this.theGrid.isThereAShipOn(row, square);

		System.out.println(test);

	}
}
