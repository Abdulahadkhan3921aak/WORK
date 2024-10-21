import java.util.Scanner;

class Employee {
    int employee_id;
    String name;
    String position;
    String department;
    String email;

    Employee(int employee_id, String name, String position, String department, String email) {
        this.employee_id = employee_id;
        this.name = name;
        this.position = position;
        this.department = department;
        this.email = email;
    }

    @Override
    public String toString() {
        return "Employee ID: " + employee_id + ", Name: " + name + ", Position: " + position + 
               ", Department: " + department + ", Email: " + email;
    }
}

class BSTNode {
    Employee data;
    BSTNode left, right;

    public BSTNode(Employee data) {
        this.data = data;
        this.left = this.right = null;
    }
}

class EmployeeBST {
    private BSTNode root;

    public EmployeeBST() {
        root = null;
    }

    public void insert(Employee employee) {
        root = insertRec(root, employee);
    }

    private BSTNode insertRec(BSTNode root, Employee employee) {
        if (root == null) {
            root = new BSTNode(employee);
            return root;
        }
        if (employee.employee_id < root.data.employee_id)
            root.left = insertRec(root.left, employee);
        else if (employee.employee_id > root.data.employee_id)
            root.right = insertRec(root.right, employee);
        return root;
    }

    public void delete(int employee_id) {
        root = deleteRec(root, employee_id);
    }

    private BSTNode deleteRec(BSTNode root, int employee_id) {
        if (root == null)
            return root;

        if (employee_id < root.data.employee_id)
            root.left = deleteRec(root.left, employee_id);
        else if (employee_id > root.data.employee_id)
            root.right = deleteRec(root.right, employee_id);
        else {
            if (root.left == null)
                return root.right;
            else if (root.right == null)
                return root.left;
            root.data = minValue(root.right);
            root.right = deleteRec(root.right, root.data.employee_id);
        }
        return root;
    }

    private Employee minValue(BSTNode root) {
        Employee minValue = root.data;
        while (root.left != null) {
            minValue = root.left.data;
            root = root.left;
        }
        return minValue;
    }

    public Employee search(int employee_id) {
        return searchRec(root, employee_id);
    }

    private Employee searchRec(BSTNode root, int employee_id) {
        if (root == null || root.data.employee_id == employee_id)
            return root != null ? root.data : null;
        if (root.data.employee_id > employee_id)
            return searchRec(root.left, employee_id);
        return searchRec(root.right, employee_id);
    }

    public void inorder() {
        inorderRec(root);
    }

    private void inorderRec(BSTNode root) {
        if (root != null) {
            inorderRec(root.left);
            System.out.println(root.data);
            inorderRec(root.right);
        }
    }

    public void preorder() {
        preorderRec(root);
    }

    private void preorderRec(BSTNode root) {
        if (root != null) {
            System.out.println(root.data);
            preorderRec(root.left);
            preorderRec(root.right);
        }
    }

    public void postorder() {
        postorderRec(root);
    }

    private void postorderRec(BSTNode root) {
        if (root != null) {
            postorderRec(root.left);
            postorderRec(root.right);
            System.out.println(root.data);
        }
    }

    public void levelOrder() {
        if (root == null)
            return;
        int height = height(root);
        for (int i = 1; i <= height; i++) {
            printCurrentLevel(root, i);
        }
    }

    private int height(BSTNode root) {
        if (root == null)
            return 0;
        else {
            int leftHeight = height(root.left);
            int rightHeight = height(root.right);
            return Math.max(leftHeight, rightHeight) + 1;
        }
    }

    private void printCurrentLevel(BSTNode root, int level) {
        if (root == null)
            return;
        if (level == 1)
            System.out.println(root.data);
        else if (level > 1) {
            printCurrentLevel(root.left, level - 1);
            printCurrentLevel(root.right, level - 1);
        }
    }
}

public class EmployeeDirectory {
    public static void main(String[] args) {
        EmployeeBST bst = new EmployeeBST();
        Scanner scanner = new Scanner(System.in);
        while (true) {
            System.out.println("1. Insert Employee");
            System.out.println("2. Delete Employee");
            System.out.println("3. Search Employee");
            System.out.println("4. Display Inorder");
            System.out.println("5. Display Preorder");
            System.out.println("6. Display Postorder");
            System.out.println("7. Display Level Order");
            System.out.println("8. Exit");
            System.out.print("Enter your choice: ");
            int choice = scanner.nextInt();
            switch (choice) {
                case 1:
                    System.out.print("Enter Employee ID: ");
                    int id = scanner.nextInt();
                    scanner.nextLine(); // Consume newline
                    System.out.print("Enter Name: ");
                    String name = scanner.nextLine();
                    System.out.print("Enter Position: ");
                    String position = scanner.nextLine();
                    System.out.print("Enter Department: ");
                    String department = scanner.nextLine();
                    System.out.print("Enter Email: ");
                    String email = scanner.nextLine();
                    bst.insert(new Employee(id, name, position, department, email));
                    break;
                case 2:
                    System.out.print("Enter Employee ID to delete: ");
                    int delId = scanner.nextInt();
                    bst.delete(delId);
                    break;
                case 3:
                    System.out.print("Enter Employee ID to search: ");
                    int searchId = scanner.nextInt();
                    Employee employee = bst.search(searchId);
                    if (employee != null) {
                        System.out.println("Employee found: " + employee);
                    } else {
                        System.out.println("Employee not found.");
                    }
                    break;
                case 4:
                    System.out.println("Inorder traversal:");
                    bst.inorder();
                    break;
                case 5:
                    System.out.println("Preorder traversal:");
                    bst.preorder();
                    break;
                case 6:
                    System.out.println("Postorder traversal:");
                    bst.postorder();
                    break;
                case 7:
                    System.out.println("Level order traversal:");
                    bst.levelOrder();
                    break;
                case 8:
                    System.out.println("Exiting...");
                    scanner.close();
                    System.exit(0);
                default:
                    System.out.println("Invalid choice. Please try again.");
            }
        }
    }
}
