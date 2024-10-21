package de.buw.se;

import javafx.scene.control.Alert;
import javafx.scene.control.Alert.AlertType;
import javafx.scene.control.ButtonType;
import javafx.stage.Modality;


public class Prompt {
     public static void showPrompt(String prompt) {
        // Create an alert
        Alert alert = new Alert(AlertType.INFORMATION);
        alert.setTitle("Information");
        alert.setHeaderText(null);
        alert.setContentText(prompt);

        // Set the alert's modality so that it blocks input to other windows
        alert.initModality(Modality.APPLICATION_MODAL);

        // Add an "OK" button 
        alert.getButtonTypes().clear();
        alert.getButtonTypes().add(ButtonType.OK);

        // Show the alert
        alert.showAndWait();
    }

   



    
}
