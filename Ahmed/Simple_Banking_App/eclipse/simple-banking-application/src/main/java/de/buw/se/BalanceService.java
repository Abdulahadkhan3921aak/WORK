package de.buw.se;

import java.util.List;


public class BalanceService {

    //private final DataStoreSql dataStore;
    private final int userId;

    public BalanceService(DataStoreSql dataStore, int userId) {
        //this.dataStore = dataStore;
        this.userId = userId;
    }

    public double getBalance() {
        return DataStoreSql.getBalance(userId);
    }

    public double deposit(double amount) {
        if (amount < 0) {
            throw new IllegalArgumentException("Amount to deposit cannot be negative.");
        }
        double newBalance = getBalance() + amount;
        DataStoreSql.setBalance(userId, newBalance);
        DataStoreSql.logTransaction(userId, amount, "deposit");
        return newBalance;
    }

    public double withdraw(double amount) {
        if (amount < 0) {
            throw new IllegalArgumentException("Amount to withdraw cannot be negative.");
        }
        double currentBalance = getBalance();
        if (amount > currentBalance) {
            throw new IllegalArgumentException("Insufficient balance.");
        }
        double newBalance = currentBalance - amount;
        DataStoreSql.setBalance(userId, newBalance);
        DataStoreSql.logTransaction(userId, amount, "withdraw");
        return newBalance;
    }

    public List<Transaction> getTransactionHistory() {
        return DataStoreSql.getTransactionHistory(userId);
    }
}
