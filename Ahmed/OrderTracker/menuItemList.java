import java.util.ArrayList;

//superclass of all the food item categories
abstract class menuItemList {
    protected ArrayList<String[]> items;

    public menuItemList() {
        items = new ArrayList<>();
    }

    // methods used by all the different categories
    protected abstract void printMenu();

    protected String[] getMenuItem(int index) {
        return items.get(index);
    }

    protected void addMenuItem(String item, String price, String category) {
        items.add(new String[] { item, price, category });
    }

}

class mealList extends menuItemList {
    protected void printMenu() {
        System.out.println("Set Meals: ");
        for (int x = 0; x < items.size(); x++) {
            System.out.println((x + 1) + ". " + items.get(x)[0]);
            System.out.println("Price: $" + items.get(x)[1]);
        }
    }
}

class burgerList extends menuItemList {
    protected void printMenu() {
        System.out.println("Burgers: ");
        for (int x = 0; x < items.size(); x++) {
            System.out.println((x + 1) + ". " + items.get(x)[0]);
            System.out.println("Price: $" + items.get(x)[1]);
        }
    }
}

class drinkList extends menuItemList {
    protected void printMenu() {
        System.out.println("Drinks: ");
        for (int x = 0; x < items.size(); x++) {
            System.out.println((x + 1) + ". " + items.get(x)[0]);
            System.out.println("Price: $" + items.get(x)[1]);
        }
    }
}

class sideList extends menuItemList {
    protected void printMenu() {
        System.out.println("Sides: ");
        for (int x = 0; x < items.size(); x++) {
            System.out.println((x + 1) + ". " + items.get(x)[0]);
            System.out.println("Price: $" + items.get(x)[1]);
        }
    }
}
