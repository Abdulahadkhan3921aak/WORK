package de.buw.se;

import java.util.List;
import java.util.Scanner;

public class AppCLI {

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        Integer userId = null;

        while (userId == null) {
            System.out.println("1: Register");
            System.out.println("2: Login");
            System.out.print("Choose an option: ");
            int choice = Integer.parseInt(scanner.nextLine());

            System.out.print("Enter username: ");
            String username = scanner.nextLine();
            System.out.print("Enter password: ");
            String password = scanner.nextLine();

            if (choice == 1) {
                if (DataStoreSql.registerUser(username, password)) {
                    System.out.println("Registration successful. Please login.");
                } else {
                    System.out.println("Registration failed. Try again.");
                }
            } else if (choice == 2) {
                userId = DataStoreSql.authenticateUser(username, password);
                if (userId == null) {
                    System.out.println("Login failed. Try again.");
                } else {
                    System.out.println("Login successful.");
                }
            }
        }

        int command = 1;
        while (command != 0) {
            clearScreen();

            switch (command) {
                case 1:
                    System.out.println("Your balance is: $" + DataStoreSql.getBalance(userId));
                    break;
                case 2:
                    System.out.println("Enter the amount to deposit: ");
                    String moneyAdded = scanner.nextLine();
                    handleTransaction(userId, moneyAdded, "deposit");
                    break;
                case 3:
                    System.out.println("Enter the amount to withdraw: ");
                    String moneyWithdraw = scanner.nextLine();
                    handleTransaction(userId, moneyWithdraw, "withdraw");
                    break;
                case 4:
                    List<Transaction> transactions = DataStoreSql.getTransactionHistory(userId);
                    transactions.forEach(System.out::println);
                    break;
                default:
                    System.out.println("Unknown command " + command);
                    break;
            }

            System.out.println("Please enter next command (0 - quit, 1 - Balance, 2 - Add Money, 3 - Withdraw, 4 - Transaction History):");
            command = Integer.parseInt(scanner.nextLine());
        }

        scanner.close();
    }

    private static void handleTransaction(int userId, String amountStr, String type) {
        try {
            double amount = Double.parseDouble(amountStr);
            if (amount < 0) {
                throw new IllegalArgumentException("Amount cannot be negative.");
            }

            if (type.equals("withdraw") && amount > DataStoreSql.getBalance(userId)) {
                System.out.println("Insufficient funds.");
            } else {
                double newBalance = (type.equals("deposit"))
                        ? DataStoreSql.getBalance(userId) + amount
                        : DataStoreSql.getBalance(userId) - amount;
                DataStoreSql.setBalance(userId, newBalance);
                DataStoreSql.logTransaction(userId, amount, type);
                System.out.println("Transaction successful.");
            }
        } catch (NumberFormatException e) {
            System.out.println("Invalid input. Please enter a valid number.");
        } catch (IllegalArgumentException e) {
            System.out.println(e.getMessage());
        }
    }

    public static void clearScreen() {
        System.out.print("\033[H\033[2J");
        System.out.flush();
    }
}
