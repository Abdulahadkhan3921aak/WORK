import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.InputMismatchException;
import java.util.Map;
import java.util.Scanner;

public class ManagerMenu extends StaffMenu implements MenuInterface{
	
	private String[] managerInfo; 
	private ArrayList<String[]> menuItems;
	private HashMap<Integer, Integer> csvIndexMap;
	
	public ManagerMenu(String[] manager) {
	    super();
	    managerInfo = manager;
	    menuItems = new ArrayList<>();
	    csvIndexMap = new HashMap<>();
	    ReadWriteCSV menuList = new ReadWriteCSV();
	    menuList.setReadWriteCSV("menu_list.csv");
	    int csvRowIndex = 1; // Start from the first data row
	    for (int row = 1; row <= menuList.sizeOfFile(); row++) {
	        String name = menuList.readDataRow(row, 0);
	        String price = menuList.readDataRow(row, 1);
	        String branch = menuList.readDataRow(row, 2);
	        String category = menuList.readDataRow(row, 3);
	        String availability = menuList.readDataRow(row, 4);
	        
	        if (branch.equals(managerInfo[6])) {
	            menuItems.add(new String[] {name, price, category, availability});
	            // Map the index of the item in the ArrayList to the CSV file's row index
	            csvIndexMap.put(menuItems.size(), csvRowIndex);
	        }
	        csvRowIndex++;
	    }
	}

	
	public void loadMenuOptions() {
		boolean isDone = false;
		
		do {
			System.out.println("====== FOMS Staff Menu ======");
	        System.out.println("Select:");
	        System.out.println("(1) Display New Orders");
	        System.out.println("(2) View Order Details");
	        System.out.println("(3) Process Order");
	        System.out.println("(4) Display Staff List");
	        System.out.println("(5) Manage Menu Items");
	        System.out.println("(0) Exit");
	        System.out.println("Choice: ");
	        Scanner sc = new Scanner(System.in);
	        int choice = sc.nextInt();
	        
	        switch(choice) {
		        case 1: 
		        	//Display New this.orders
		        	displayNewOrders();
		        	break;
		        case 2: 
		        	//View Order Details
		        	viewOrderDetails();
		        	break;
		        case 3:
		        	//Process Order
		        	processOrder();
		        	break;
		        case 4:
		        	//Display Staff List
		        	displayStaffList();
		        	break;
		        case 5:
		        	//Manage Menu Items
		        	manageMenuItems();
		        	break;
		        case 0:
		        	isDone = true;
		        	break;
	        }
		}while(!isDone);
	}
	
	private void displayStaffList() {
		String managerBranch = this.managerInfo[6];
		
		ReadWriteCSV staffList = new ReadWriteCSV();
		staffList.setReadWriteCSV("staff_list.csv");
		System.out.println("====== Staff List ======");
		for(int row = 1; row <= staffList.sizeOfFile(); row++) {
			String name = staffList.readDataRow(row, 0);
			String gender = staffList.readDataRow(row, 4);
			String age = staffList.readDataRow(row, 5);
			String role = staffList.readDataRow(row, 3);
			String branch = staffList.readDataRow(row, 6);
			
			if(role.equals("S") && branch.equals(managerBranch)) {
	            System.out.printf("Name: %-15s | Age: %-3s | Gender: %-2s\n", name, age, gender);
			}
		}
	}
	
	private void manageMenuItems() {
		boolean isDone = false;
		do {
			System.out.println("====== Manage Menu Options ======");
			System.out.printf("\nMenu for %s branch:\n", managerInfo[6]);
			for (String[] items: menuItems) {
	            System.out.printf("Name: %-15s | Price: %-8s | Category: %-10s | Availability: %-5s\n", items[0],items[1],items[2],items[3]);
			}
			System.out.println("Select:");
	        System.out.println("(1) Add Menu Item");
	        System.out.println("(2) Edit Menu Item");
	        System.out.println("(3) Remove Menu Item");
	        System.out.println("(0) Exit");
	        System.out.println("Choice: ");
	        Scanner sc = new Scanner(System.in);
	        int choice = sc.nextInt();
	        
	        switch(choice) {
		        case 1: 
		        	addMenuItem();
		        	break;
		        case 2: 
		        	editMenuItem();
		        	break;
		        case 3:
		        	removeMenuItem();
		        	break;
		        case 0:
		        	isDone = true;
		        	break;
	        }
		}while(!isDone);
	}
	
	private void addMenuItem() {
		//We need from them
			//Menu Name
			//Menu Price
			//Category
		Scanner sc = new Scanner(System.in);
		
		System.out.println("Enter item name: ");
		String itemName = sc.nextLine();
		
		float itemPrice = getValidPrice();
		
		String itemCategory = getValidCategory();
		
		String[] newMenuItem = {itemName, String.valueOf(itemPrice), managerInfo[6], itemCategory, "Yes"};
		//Add to the ArrayList
		menuItems.add(new String[] {newMenuItem[0], newMenuItem[1], newMenuItem[3], newMenuItem[4]});
		
		//Add to the CSV
		addToCSV(newMenuItem);
	}
	private void editMenuItem() {
	}
	private void removeMenuItem() {
	    System.out.println("====== Remove Menu Items ======");
	    System.out.printf("\nMenu for %s branch:\n", managerInfo[6]);
	    int i = 1;
	    for (String[] items: menuItems) {
	        System.out.printf("(%d) Name: %-15s | Price: %-8s | Category: %-10s | Availability: %-5s\n", i, items[0],items[1],items[2],items[3]);
	        i++;
	    }
	    
	    int itemToRemove = getValidRemoveItem();
	    
	    // Map the itemToRemove to the CSV file's row index using csvIndexMap
	    Integer csvRowIndexToRemove = csvIndexMap.get(itemToRemove);
	    
	    // Remove the menu item from the ArrayList
	    menuItems.remove(itemToRemove - 1);
	    
	    // If we have a valid CSV row index, remove the row from the CSV file
	    if (csvRowIndexToRemove != null) {
	        ReadWriteCSV menuList = new ReadWriteCSV();
	        menuList.setReadWriteCSV("menu_list.csv");
	        int removalSuccess = menuList.removeDataRow(csvRowIndexToRemove);
	        
	        // Check if the removal from the CSV file was successful
	        if (removalSuccess == 1) {
	            System.out.println("Menu item removed successfully.");
	        } else {
	            System.out.println("Error removing menu item from the CSV file.");
	        }
	    } else {
	        System.out.println("Invalid item index. Removal failed.");
	    }
	}

	
	private float getValidPrice() {
		Scanner sc = new Scanner(System.in);
		// Initialize itemPrice and a flag for input validation
	    float itemPrice = 0.0f;
	    boolean isValidPrice = false;
	    
	    // Prompt for and validate item price
	    while (!isValidPrice) {
	        try {
	            System.out.println("Enter item price: ");
	            itemPrice = sc.nextFloat();
	            
	            // Check if the price is greater than zero (if required)
	            if (itemPrice > 0) {
	                isValidPrice = true; // Price is valid, exit loop
	            } else {
	                System.out.println("Price must be greater than zero. Please try again.");
	            }
	        } catch (InputMismatchException e) {
	            // Handle invalid input (not a number)
	            System.out.println("Invalid input. Please enter a valid number.");
	            // Clear the invalid input
	            sc.next(); // Consume the invalid input
	        }
	    }
	    sc.nextLine();
	    return itemPrice;
	}
	
	private String getValidCategory() {
		Scanner sc = new Scanner(System.in);
		// Initialize itemCategory and a flag for input validation
	    String itemCategory = "";
	    boolean isValidCategory = false;
	    
	    // Define a list of valid categories
	    String[] validCategories = {"side", "set meal", "burger", "drink"};
	    
	    // Prompt for and validate item category
	    while (!isValidCategory) {
	        System.out.println("Enter item category (side, set meal, burger, drink): ");
	        itemCategory = sc.nextLine().toLowerCase(); // Convert input to lowercase
	        
	        // Check if the input category is valid
	        for (String validCategory : validCategories) {
	            if (itemCategory.equals(validCategory)) {
	                isValidCategory = true; // Category is valid, exit loop
	                break;
	            }
	        }
	        
	        if (!isValidCategory) {
	            System.out.println("Invalid category. Please enter one of the following: side, set meal, burger, or drink.");
	        }
	    }
	    
	    return itemCategory;
	}
	
	private void addToCSV(String[] newMenuItem) {
		// Open the menu list CSV file in append mode
	    BufferedWriter writer = null;
	    try {
	        writer = new BufferedWriter(new FileWriter("menu_list.csv", true));

	        // Convert the new menu item array to a comma-separated string
	        String newMenuItemString = String.join(",", newMenuItem);
	        
	        // Write the new menu item to the CSV file
	        writer.write(newMenuItemString);
	        writer.newLine(); // Add a newline after the new row

	        System.out.println("Menu item added successfully.");
	    } catch (IOException e) {
	        System.out.println("Failed to add the menu item. Please try again.");
	        e.printStackTrace();
	        // Remove the item from the ArrayList if it wasn't added to the CSV file
	        menuItems.remove(newMenuItem);
	    } finally {
	        // Close the writer to save the data and release resources
	        if (writer != null) {
	            try {
	                writer.close();
	            } catch (IOException e) {
	                e.printStackTrace();
	            }
	        }
	    }
	}
	
	private int getValidRemoveItem() {
		// Prompt the user for the menu item to remove
		System.out.println("Menu item to remove: ");
	    Scanner sc = new Scanner(System.in);
	    int menuToRemove;
	    
	    // Input validation: ensure the user's input is within the range of menuItems size
	    while (true) {
	        try {
	            menuToRemove = sc.nextInt();
	            if (menuToRemove < 1 || menuToRemove > menuItems.size()) {
	                throw new InputMismatchException();
	            }
	            break; // Exit the loop if input is valid
	        } catch (InputMismatchException e) {
	            System.out.println("Invalid input. Please enter a valid menu item number.");
	            sc.nextLine(); // Clear invalid input
	        }
	    }
	    
	    return menuToRemove;
	}
}
