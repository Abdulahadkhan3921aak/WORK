package grid01;

public class Square {

    private int number;
    private boolean firedAt;
    private Ship theShip;

    public Square(int number) {
        setNumber(number);
    }

    public boolean isThereAShip() {
        return theShip != null;
    }

    // Getter and setter for the "firedAt" property
    public boolean isFiredAt() {
        return firedAt;
    }

    public void setFiredAt(boolean firedAt) {
        this.firedAt = firedAt;
    }

    // Getter and setter for the "theShip" property
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
