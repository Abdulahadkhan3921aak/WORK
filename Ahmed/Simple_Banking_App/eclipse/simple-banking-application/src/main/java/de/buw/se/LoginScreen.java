package de.buw.se;

import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.control.PasswordField;
import javafx.scene.control.TextField;
import javafx.scene.layout.Pane;
import javafx.stage.Stage;

public class LoginScreen {

    private Stage stage;
    private Pane layout;

    public LoginScreen(Stage stage) {
        this.stage = stage;
        layout = new Pane();
    }

    public void show() {
        Label usernameLabel = new Label("Username:");
        usernameLabel.setLayoutX(150);
        usernameLabel.setLayoutY(50);

        TextField usernameField = new TextField();
        usernameField.setLayoutX(250);
        usernameField.setLayoutY(50);

        Label passwordLabel = new Label("Password:");
        passwordLabel.setLayoutX(150);
        passwordLabel.setLayoutY(100);

        PasswordField passwordField = new PasswordField();
        passwordField.setLayoutX(250);
        passwordField.setLayoutY(100);

        Button loginButton = new Button("Login");
        loginButton.setLayoutX(250);
        loginButton.setLayoutY(150);
        loginButton.setOnAction(e -> handleLogin(usernameField, passwordField));

        Button registerButton = new Button("Register");
        registerButton.setLayoutX(320);
        registerButton.setLayoutY(150);
        registerButton.setOnAction(e -> handleRegister());

        layout.getChildren().addAll(usernameLabel, usernameField, passwordLabel, passwordField, loginButton, registerButton);

        Scene scene = new Scene(layout, 640, 480);
        stage.setScene(scene);
        stage.show();
    }

    private void handleLogin(TextField usernameField, PasswordField passwordField) {
        String username = usernameField.getText();
        String password = passwordField.getText();
        Integer userId = DataStoreSql.authenticateUser(username, password);

        if (userId != null) {
            AppGUI.startMainApp(stage, userId);
        } else {
            Prompt.showPrompt("Login failed: Invalid username or password.");
        }
    }

    private void handleRegister() {
        RegistrationScreen registrationScreen = new RegistrationScreen(stage);
        registrationScreen.show();
    }
}
