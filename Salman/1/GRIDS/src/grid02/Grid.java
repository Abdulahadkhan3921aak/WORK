package grid02;

public class Grid {

    private final int GRID_WIDTH = 10;
    private final int GRID_HEIGHT = 10;
    private Square[][] anotherGrid = new Square[GRID_WIDTH][GRID_HEIGHT];

    public Grid() {
        for (int x = 0; x < GRID_WIDTH; x++) {
            for (int y = 0; y < GRID_HEIGHT; y++) {
                anotherGrid[x][y] = new Square();
            }
        }
    }
}
