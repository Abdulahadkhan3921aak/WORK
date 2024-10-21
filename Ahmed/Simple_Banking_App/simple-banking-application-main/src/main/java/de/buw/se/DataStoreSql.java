package de.buw.se;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class DataStoreSql {

    // name of dataset
    private static final String FILE_NAME = "src/main/resources/balance";

    private static Statement getSqlStatement() {
        try {
            Class.forName("org.h2.Driver");
            Connection conn = DriverManager.getConnection("jdbc:h2:./" + FILE_NAME, "", "");
            Statement stmt = conn.createStatement();

            // Create tables if they don't exist
            stmt.executeUpdate("CREATE TABLE IF NOT EXISTS Users (ID INT PRIMARY KEY AUTO_INCREMENT, USERNAME VARCHAR(50) UNIQUE, PASSWORD VARCHAR(50))");
            stmt.executeUpdate("CREATE TABLE IF NOT EXISTS Balance (USER_ID INT, BALANCE DOUBLE, FOREIGN KEY (USER_ID) REFERENCES Users(ID))");
            stmt.executeUpdate("CREATE TABLE IF NOT EXISTS Transactions (ID INT PRIMARY KEY AUTO_INCREMENT, USER_ID INT, AMOUNT DOUBLE, TYPE VARCHAR(10), DATE TIMESTAMP DEFAULT CURRENT_TIMESTAMP, FOREIGN KEY (USER_ID) REFERENCES Users(ID))");

            return stmt;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    // Register a new user
    public static boolean registerUser(String username, String password) {
        try {
            Statement stmt = getSqlStatement();
            String insertUserSql = "INSERT INTO Users (USERNAME, PASSWORD) VALUES ('" + username + "', '" + password + "')";
            stmt.executeUpdate(insertUserSql);
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Authenticate a user
    public static Integer authenticateUser(String username, String password) {
        try {
            Statement stmt = getSqlStatement();
            String selectUserSql = "SELECT ID FROM Users WHERE USERNAME = '" + username + "' AND PASSWORD = '" + password + "'";
            ResultSet rs = stmt.executeQuery(selectUserSql);
            if (rs.next()) {
                return rs.getInt("ID");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    // Get balance value for a specific user
    public static double getBalance(int userId) {
        try {
            Statement stmt = getSqlStatement();
            String selectBalanceSql = "SELECT BALANCE FROM Balance WHERE USER_ID = " + userId;
            ResultSet rs = stmt.executeQuery(selectBalanceSql);
            if (rs.next()) {
                return rs.getDouble("BALANCE");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0; // return 0 if balance is empty
    }

    // Store new balance for a specific user
    public static void setBalance(int userId, double newBalance) {
        try {
            Statement stmt = getSqlStatement();
            String selectBalanceSql = "SELECT * FROM Balance WHERE USER_ID = " + userId;
            ResultSet rs = stmt.executeQuery(selectBalanceSql);
            String updateBalanceSql;
            if (rs.next()) {
                updateBalanceSql = "UPDATE Balance SET BALANCE = " + newBalance + " WHERE USER_ID = " + userId;
            } else {
                updateBalanceSql = "INSERT INTO Balance (USER_ID, BALANCE) VALUES (" + userId + ", " + newBalance + ")";
            }
            stmt.executeUpdate(updateBalanceSql);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Log a transaction
    public static void logTransaction(int userId, double amount, String type) {
        try {
            Statement stmt = getSqlStatement();
            String logTransactionSql = "INSERT INTO Transactions (USER_ID, AMOUNT, TYPE) VALUES (" + userId + ", " + amount + ", '" + type + "')";
            stmt.executeUpdate(logTransactionSql);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Retrieve transaction history for a specific user
    public static List<Transaction> getTransactionHistory(int userId) {
        List<Transaction> transactions = new ArrayList<>();
        try {
            Statement stmt = getSqlStatement();
            String selectTransactionsSql = "SELECT * FROM Transactions WHERE USER_ID = " + userId + " ORDER BY DATE DESC";
            ResultSet rs = stmt.executeQuery(selectTransactionsSql);
            while (rs.next()) {
                transactions.add(new Transaction(
                        rs.getInt("ID"),
                        rs.getInt("USER_ID"),
                        rs.getDouble("AMOUNT"),
                        rs.getString("TYPE"),
                        rs.getTimestamp("DATE")
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return transactions;
    }
}
