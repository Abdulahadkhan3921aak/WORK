import java.util.Scanner;
import java.util.ArrayList;

public class OrderPlace implements MenuInterface {
    // menu is an ArrayLists of all the categories and their items
    private ArrayList<menuItemList> menu;
    private ArrayList<orderItemList> orderList;
    private orderItemList Order;
    private int dineChoice;

    Scanner sc = new Scanner(System.in);

    public OrderPlace(String branchName) {
        orderList = new ArrayList<>();
        menu = new ArrayList<>();
        menu.add(new mealList());
        menu.add(new burgerList());
        menu.add(new drinkList());
        menu.add(new sideList());

        // stores all the items from menu_list into menu
        readMenu menu_read = new readMenu();
        menu_read.generateMenu(menu, branchName);
    }

    protected void dineOption() {
        System.out.println("\n Choose one of the following options: \n");
        System.out.println("1. Dine-in \n" + "2. Takeaway \n");

        // Exception handling missing
        dineChoice = sc.nextInt();
    }

    public int getDineChoice() {
        return dineChoice;
    }

    protected void menuDisplay() {
        // print out the menu items available in that branch
        for (menuItemList menuList : menu) {
            menuList.printMenu();
            System.out.println("");
        }
    }

    // Input asking for quantity missing
    protected void orderAdd() {
        this.orderList = new ArrayList<orderItemList>();
        boolean isDone = false;
        int choice = 0;
        int itemNo = 0;

        do {
            System.out.println("(1) Set Meal");
            System.out.println("(2) Burger");
            System.out.println("(3) Side");
            System.out.println("(4) Drink");
            System.out.println("(0) Exit");
            System.out.print("Choice: ");
            choice = sc.nextInt();

            // can be improved
            switch (choice) {
                case 1:
                    menu.get(0).printMenu();
                    System.out.println("");
                    System.out.println("Which item would you like to add to the cart?");
                    itemNo = sc.nextInt();
                    // exception handling is missing
                    orderList.add(Order.addOrder(menu, 0, itemNo));
                    System.out.println("");
                    break;
                case 2:
                    menu.get(1).printMenu();
                    System.out.println("");
                    System.out.println("Which item would you like to add to the cart?");
                    itemNo = sc.nextInt();
                    // exception handling is missing
                    orderList.addOrder(menu, 1, itemNo);
                    System.out.println("");
                    break;
                case 3:
                    menu.get(3).printMenu();
                    System.out.println("");
                    System.out.println("Which item would you like to add to the cart?");
                    itemNo = sc.nextInt();
                    // exception handling is missing
                    orderList.addOrder(menu, 3, itemNo);
                    System.out.println("");
                    break;
                case 4:
                    menu.get(2).printMenu();
                    System.out.println("");
                    System.out.println("Which item would you like to add to the cart?");
                    itemNo = sc.nextInt();
                    // exception handling is missing
                    orderList.addOrder(menu, 2, itemNo);
                    System.out.println("");
                    break;
                case 0:
                    isDone = true;
                    break;
            }
        } while (!isDone);
    }

    protected void orderCustomise() {
        orderList.printOrder();
        System.out.printf("Total cost: $%d\n", orderList.getTotalOrderCost());
        do {
            System.out.print("Which item would you like to remove (type 0 to exit): ");
            // Exception handling missing
            int itemNo = sc.nextInt();
            if (itemNo == 0)
                break;
            orderList.removeOrder(itemNo);
        } while (true);
    }

    public void loadMenuOptions() {
        boolean isDone = false;
        dineOption();

        do {
            System.out.println("====== Customer Menu ======");
            System.out.println("Select:");
            System.out.println("(1) Display Menu");
            System.out.println("(2) Add Order");
            System.out.println("(3) Customise Order");
            System.out.println("(4) Proceed to Checkout");
            System.out.println("Choice: ");
            int choice = sc.nextInt();
            
            switch(choice) {
                case 1: 
                    menuDisplay();
                    break;
                case 2: 
                    orderAdd();
                    break
                case 3: 
                    orderCustomise();
                    break;
                case 4:
                    //orderSummary();
                    System.out.printf("Your total order is $%d\n. Please proceed to payment.", orderList.getTotalOrderCost());
                    isDone = true;
                    break;
            }
        } while(!isDone);
    }
}
