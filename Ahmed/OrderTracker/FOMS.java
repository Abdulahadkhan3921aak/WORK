import java.util.Scanner;

import javafx.scene.control.Menu;

public class FOMS {

    public void start(){
        boolean end = false;
        do{

            int interfaceChoice = -1;
            int branchName;
            String[] staff;

            while (interfaceChoice == -1){
                interfaceChoice = selectInterface();
                switch(interfaceChoice){
                    case 1: // Customer
                        // select branch
                        branchName = selectBranch();

                        // select dinein or takeaway
                        boolean DineIn = SelectDineIN();
                        // select branch specific menu items
                        menu = loadMenu(branchName);
                        // while not check out, add, edit or delete items from cart
                        checkout = false;
                        while(!checkout){

                        }
                        // select payment method (simulate payment)
                        PaymentMethod pay = new PaymentMethod();
                        pay.
                        // print receipt with order ID

                        // check order status w order ID

                        // collected food -> changes order status to completed

                        break;
                    case 2: // Staff;

                        // Login with accountID and password (default: password) -> initialised at startup
                        staff =  staffLogin();

                        // option to change password
                        if(staff[3].equals("S")) {
	                    	MenuInterface menu = new StaffMenu();
	                      	menu.loadMenuOptions();
                       }
						else if(staff[3].equals("M")) {
							MenuInterface menu = new ManagerMenu(staff);
						  	menu.loadMenuOptions();
						}
						else if(staff[3].equals("A")) {
							MenuInterface menu = new AdminMenu();
						  	menu.loadMenuOptions();
						}
						else
							System.out.println("Error: Invalid Role!");
                        break;
                    default:
                        System.out.println("Please select a valid option");
                }
            }
        }while (!end);
    }

    /**
     *
     * @return 1 for customer interface, 2 if staff interface
     */
    public int selectInterface() {
        Scanner sc = new Scanner(System.in);

        int choice;

        System.out.println("====== FOMS Main Menu ======");
        System.out.println("Select:");
        System.out.println("(1) Customer");
        System.out.println("(2) Staff");

        choice = sc.nextInt();

        while (choice != 1 || choice!= 2){
            switch (choice) {
                case 1: // Customer
                    return 1;
                case 2: // Staff
                    return 2;
                default:
                    System.out.println("Please select a valid option");
                    return -1;
            }
        }

        return -1;
    }

    /**
     *
     * @return the number of branches
     */
    public int noOfBranch(){
        ReadWriteCSV branchList = new ReadWriteCSV();
        branchList.setReadWriteCSV("branch_list.csv");
        return branchList.sizeOfFile();
    }

    /**
     *
     * @return index of select branch as per in branchlist csv file
     */
    public int selectBranch(){
        int choice = 0;
        ReadWriteCSV branchList = new ReadWriteCSV();
        branchList.setReadWriteCSV("branch_list.csv");
        Scanner sc = new Scanner(System.in);


        System.out.println("====== Branch Selection ======");
        System.out.println("Select branch:");

        // While loop to repeat if invalid option is selected
        while (choice == 0) {
            // For loop to print all branches
            for (int x = 1; x <= branchList.sizeOfFile(); x++) {
                System.out.print("(" + x + ") ");
                branchList.printDataRow(x, 0);
            }
            choice = sc.nextInt();


            if (choice > noOfBranch()  || choice <= 0) {
                choice = 0;
                System.out.println("Please select a valid option");
            } else {
                System.out.print("Selected branch: ");
                branchList.printDataRow(choice, 0);
                //System.out.print("\n");
                return choice;
            }
        }

        return -1;
    }


    public String[] staffLogin() {
        ReadWriteCSV stafflist = new ReadWriteCSV();
        stafflist.setReadWriteCSV("staff_list.csv");
        Scanner sc = new Scanner(System.in);
        String loginID, password;
        loginID = null;
        boolean validID = false;
        String[] staff = new String[7];

        System.out.println("====== Staff Login ======");

        // loops to check whether loginID is valid
        while (!validID){
            System.out.println("Enter LoginID:");
            loginID = sc.nextLine();
            for (int x = 1; x <= stafflist.sizeOfFile(); x++){
                if (loginID.equals(stafflist.readDataRow(x,1))){
                    validID = true;
                }
                else {
                    if (x == stafflist.sizeOfFile() && !validID){
                        System.out.println("Invalid loginID");
                    }
                }
            }
        }

        // loops to check whether password is valid
        while (true){
            for (int x = 1; x <= stafflist.sizeOfFile(); x++) {
                // LoginID matches
                if (loginID.equals(stafflist.readDataRow(x,1))){
                    System.out.println("Enter password:");
                    password = sc.nextLine();

                    // Check whether password matches
                    if (stafflist.readDataRow(x,2).equals("")){
                        if (! password.equals("password")){
                            System.out.println("Invalid password");
                        }
                        else {
                            System.out.println("Logged in to " + loginID + " (" + stafflist.readDataRow(x,3) + ")");
                            staffChangePassword(loginID);
                            staff[0] = stafflist.readDataRow(x, 0);
                            staff[1] = stafflist.readDataRow(x, 1);
                            staff[2] = stafflist.readDataRow(x, 2);
                            staff[3] = stafflist.readDataRow(x, 3);
                            staff[4] = stafflist.readDataRow(x, 4);
                            staff[5] = stafflist.readDataRow(x, 5);
                            staff[6] = stafflist.readDataRow(x, 6);
                            return staff;
                        }
                    }
                    else {
                        if (password.equals(stafflist.readDataRow(x,2))){
                            System.out.println("Logged in to " + loginID + " (" + stafflist.readDataRow(x,3) + ")");
                            staffChangePassword(loginID);
                            staff[0] = stafflist.readDataRow(x, 0);
                            staff[1] = stafflist.readDataRow(x, 1);
                            staff[2] = stafflist.readDataRow(x, 2);
                            staff[3] = stafflist.readDataRow(x, 3);
                            staff[4] = stafflist.readDataRow(x, 4);
                            staff[5] = stafflist.readDataRow(x, 5);
                            staff[6] = stafflist.readDataRow(x, 6);
                            return staff;
                        }
                        else {
                            System.out.println("Invalid password");
                        }
                    }

                }

            }
        }

    }

    /**
     *
     * @param loginID
     */
    public void staffChangePassword(String loginID){
        Scanner sc = new Scanner(System.in);
        ReadWriteCSV stafflist = new ReadWriteCSV();
        stafflist.setReadWriteCSV("staff_list.csv");
        int choice = 0;
        int count=1;
        String newPassword;

        while (choice == 0) {

            System.out.println("Do you want to change your password?");
            System.out.println("Select:");
            System.out.println("(1) Yes");
            System.out.println("(2) No");
            choice = sc.nextInt();
            sc.nextLine();
            switch(choice){
                case 1: // Change password
                    System.out.println("Enter new password");
                    newPassword = sc.nextLine();

                    for (int x = 1; x <= stafflist.sizeOfFile(); x++) {
                        if (loginID.equals(stafflist.readDataRow(x, 1))) {
                            break;
                        }
                        count++;
                    }

                    //System.out.println("edit");
                    stafflist.editData(count,2,newPassword);
                    System.out.println("Password has been updated");
                    break;
                case 2:
                    break;
                default:
                    choice = 0;
                    System.out.println("Please select a valid option");
            }


        }

    }

}

