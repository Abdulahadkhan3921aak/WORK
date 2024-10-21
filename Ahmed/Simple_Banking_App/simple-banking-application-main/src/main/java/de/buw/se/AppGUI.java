package de.buw.se;

import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.application.Application;
import javafx.scene.control.TextField;
import javafx.scene.layout.Pane;
import javafx.scene.text.Font;
import javafx.stage.Stage;

import java.util.List;

public class AppGUI extends Application {

    private BalanceService balanceService;
    private Label balanceLabel ;

    @Override
    public void start(Stage stage) {
        LoginScreen loginScreen = new LoginScreen(stage);
        loginScreen.show();
    }

    public static void startMainApp(Stage stage, int userId) {
        AppGUI app = new AppGUI();
        app.balanceService = new BalanceService(new DataStoreSql(), userId);
        app.showMainApp(stage);
    }

    private void showMainApp(Stage stage) {
        stage.setTitle("Simple Banking Application");

        balanceLabel = new Label("Balance: $" + getBalance());
        balanceLabel.setTranslateX(170);
        balanceLabel.setTranslateY(70);
        balanceLabel.setFont(Font.font("Constantia", 40));

        TextField addAmountField = createTextField("Enter amount you want to deposit", 200);
        TextField withdrawAmountField = createTextField("Enter amount you want to withdraw", 250);

        Button withdrawBtn = createButton("Withdraw Balance", 400, 250);
        withdrawBtn.setOnAction(e -> handleWithdraw(withdrawAmountField));

        Button addBtn = createButton("Add Balance", 400, 200);
        addBtn.setOnAction(e -> handleDeposit(addAmountField));

        Button transactionHistoryBtn = createButton("Transaction History", 400, 300);
        transactionHistoryBtn.setOnAction(e -> handleTransactionHistory());

        Pane layout = new Pane();
        layout.getChildren().addAll(balanceLabel, withdrawAmountField, withdrawBtn, addAmountField, addBtn, transactionHistoryBtn);

        Scene scene = new Scene(layout, 640, 480);
        stage.setScene(scene);
        stage.show();
    }

    private TextField createTextField(String promptText, int layoutY) {
        TextField textField = new TextField();
        textField.setPromptText(promptText);
        textField.setLayoutX(150);
        textField.setLayoutY(layoutY);
        textField.setPrefSize(200, 20);
        return textField;
    }

    private Button createButton(String text, int layoutX, int layoutY) {
        Button button = new Button(text);
        button.setLayoutX(layoutX);
        button.setLayoutY(layoutY);
        return button;
    }

    private void handleDeposit(TextField addAmountField) {
        try {
            double amountToAdd = Double.parseDouble(addAmountField.getText());
            if (amountToAdd < 0) {
                throw new IllegalArgumentException("Error: Amount cannot be negative.");
            }
            double newBalance = balanceService.deposit(amountToAdd);
            showBalance(newBalance);
            addAmountField.clear();
        } catch (NumberFormatException ex) {
            Prompt.showPrompt("Error: Please enter a valid number.");
            addAmountField.clear();
        } catch (IllegalArgumentException ex) {
            Prompt.showPrompt(ex.getMessage());
            addAmountField.clear();
        }
    }

    private void handleWithdraw(TextField withdrawAmountField) {
        try {
            double amountToWithdraw = Double.parseDouble(withdrawAmountField.getText());
            if (amountToWithdraw < 0) {
                throw new IllegalArgumentException("Error: Amount cannot be negative.");
            }
            double newBalance = balanceService.withdraw(amountToWithdraw);
            showBalance(newBalance);
            withdrawAmountField.clear();
        } catch (NumberFormatException ex) {
            Prompt.showPrompt("Error: Please enter a valid number.");
            withdrawAmountField.clear();
        } catch (IllegalArgumentException ex) {
            Prompt.showPrompt(ex.getMessage());
            withdrawAmountField.clear();
        }
    }

    private void handleTransactionHistory() {
        List<Transaction> transactions = balanceService.getTransactionHistory();
        StringBuilder history = new StringBuilder("Transaction History:\n");
        for (Transaction transaction : transactions) {
            history.append(transaction).append("\n");
        }
        Prompt.showPrompt(history.toString());
    }

    private double getBalance() {
        return balanceService.getBalance();
    }

    private void showBalance(double newBalance) {
        balanceLabel.setText("Balance: $" + String.format("%.2f", newBalance));
    }

    public static void main(String[] args) {
        launch();
    }
}
