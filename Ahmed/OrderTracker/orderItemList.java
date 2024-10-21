import java.util.ArrayList;

public class orderItemList {
    private ArrayList<String[]> orderList;
    private int totalOrderCost=0;

    public orderItemList() {
        orderList = new ArrayList<>();
    }

    public int getTotalOrderPrice() {
        return totalOrderCost;
    }

    protected int getOrderPrice(ArrayList<menuItemList> menu, int category_index, int food_index) {
        String[] menuItem = menu.get(category_index).getMenuItem(food_index-1);
        return Integer.parseInt(menuItem[1]);
    }

    protected void addOrder(ArrayList<menuItemList> menu, int category_index, int food_index) {
        String[] menuItem = menu.get(category_index).getMenuItem(food_index-1);
        orderList.add(new String[]{menuItem[0], menuItem[1], menuItem[2]});
        totalOrderCost += getOrderPrice(menu,category_index, food_index);
        System.out.println("Item added succesfully!");
    }

    protected void removeOrder(int orderedfoodNumber) {
        totalOrderCost -= Integer.parseInt(orderList.get(orderedfoodNumber-1)[1]);
        orderList.remove(orderList.get(orderedfoodNumber-1));
        System.out.println("Item removed successfully!");
    }

    protected void printOrder() {
        for (int i=0;i<orderList.size();i++) {
            System.out.println((i+1)+". "+orderList.get(i)[0]+": $"+orderList.get(i)[1]);
        }
    }
}
