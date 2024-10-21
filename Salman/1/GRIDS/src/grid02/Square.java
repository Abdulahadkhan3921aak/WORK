package grid02;

import grid01.Ship;

public class Square {

    private int number;
    private boolean firedAt;
    private Ship theShip;

    public Square() {
        // Constructor for an empty square
    }

    public Square(int number) {
        setNumber(number);
    }

    public boolean isThereAShip() {
        return theShip != null;
    }

    public boolean isFiredAt() {
        return firedAt;
    }

    public void setFiredAt(boolean firedAt) {
        this.firedAt = firedAt;
    }

    public Ship getShip() {
        return theShip;
    }

    public void setShip(Ship theShip) {
        this.theShip = theShip;
    }

    public void setNumber(int number) {
        this.number = number;
    }

    public int getNumber() {
        return this.number;
    }
}
