package de.buw.se;

import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.control.PasswordField;
import javafx.scene.control.TextField;
import javafx.scene.layout.Pane;
import javafx.stage.Stage;

public class RegistrationScreen {

    private Stage stage;
    private Pane layout;

    public RegistrationScreen(Stage stage) {
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

        Button registerButton = new Button("Register");
        registerButton.setLayoutX(250);
        registerButton.setLayoutY(150);
        registerButton.setOnAction(e -> handleRegister(usernameField, passwordField));

        Button backButton = new Button("Back");
        backButton.setLayoutX(330);
        backButton.setLayoutY(150);
        backButton.setOnAction(e -> handleBack());

        layout.getChildren().addAll(usernameLabel, usernameField, passwordLabel, passwordField, registerButton, backButton);

        Scene scene = new Scene(layout, 640, 480);
        stage.setScene(scene);
        stage.show();
    }

    private void handleRegister(TextField usernameField, PasswordField passwordField) {
        String username = usernameField.getText();
        String password = passwordField.getText();
        boolean isRegistered = DataStoreSql.registerUser(username, password);

        if (isRegistered) {
            Prompt.showPrompt("Registration successful. Please log in.");
            handleBack();
        } else {
            Prompt.showPrompt("Registration failed: Username might be already taken.");
        }
    }

    private void handleBack() {
        LoginScreen loginScreen = new LoginScreen(stage);
        loginScreen.show();
    }
}
