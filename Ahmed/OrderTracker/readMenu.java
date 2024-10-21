import java.util.ArrayList;

public class readMenu {
    private ReadWriteCSV menu_list;

    public readMenu() {
        menu_list = new ReadWriteCSV();
    }

    public void generateMenu(ArrayList<menuItemList> menu, String branchName) {
        menu_list.setReadWriteCSV("menu_list.csv");
        String item="";
        String price="";
        String category="";

        for (int row = 1; row <= menu_list.sizeOfFile(); row++) {
            if (itemAvailable(menu_list, branchName, row)) {
                item = menu_list.readDataRow(row, 0);
                price = menu_list.readDataRow(row, 1);
                category = menu_list.readDataRow(row, 3);
            }

            // Store in the corresponding category's ArrayLists
            switch (category) {
                case "set meal":
                    // the indexes are based on the orders in the constructor of OrderPLace
                    menu.get(0).addMenuItem(item, price, category);
                    break;
                case "burger":
                    menu.get(1).addMenuItem(item, price, category);
                    break;
                case "drink":
                    menu.get(2).addMenuItem(item, price, category);
                    break;
                case "side":
                    menu.get(3).addMenuItem(item, price, category);
                    break;
                default:
                    break;
            }
        }
    }

    // check if menu item is available in that branch or not
    protected boolean itemAvailable(ReadWriteCSV menu, String branchName, int row) {
        if (menu.readDataRow(row, 2).equals(branchName) && menu.readDataRow(row, 4).equals("Yes"))
            return true;
        return false;
    }
}
