package javafx;

import javafx.application.Application;
import javafx.scene.Scene;
import javafx.scene.control.*;
import javafx.scene.layout.VBox;
import javafx.stage.Stage;

public class Main extends Application {
    private DoublyLinkedList playlist = new DoublyLinkedList();
    private ListView<String> listView = new ListView<>();

    public static void main(String[] args) {
        launch(args);
    }

    @Override
    public void start(Stage primaryStage) {
        primaryStage.setTitle("Playlist Manager");

        TextField titleField = new TextField();
        titleField.setPromptText("Title");
        TextField artistField = new TextField();
        artistField.setPromptText("Artist");
        TextField albumField = new TextField();
        albumField.setPromptText("Album");
        TextField durationField = new TextField();
        durationField.setPromptText("Duration (in seconds)");
        TextField genreField = new TextField();
        genreField.setPromptText("Genre");

        Button addButton = new Button("Add Song");
        addButton.setOnAction(e -> {
            String title = titleField.getText();
            String artist = artistField.getText();
            String album = albumField.getText();
            int duration = Integer.parseInt(durationField.getText());
            String genre = genreField.getText();
            Song song = new Song(title, artist, album, duration, genre);
            playlist.addLast(song);
            updateListView();
            clearFields(titleField, artistField, albumField, durationField, genreField);
        });

        Button removeButton = new Button("Remove Song by Title");
        removeButton.setOnAction(e -> {
            String title = titleField.getText();
            playlist.deleteByTitle(title);
            updateListView();
        });

        Button traverseForwardButton = new Button("Display Playlist Forward");
        traverseForwardButton.setOnAction(e -> {
            listView.getItems().clear();
            Node current = playlist.getHead();
            while (current != null) {
                listView.getItems().add(current.data.toString());
                current = current.next;
            }
        });

        Button traverseBackwardButton = new Button("Display Playlist Backward");
        traverseBackwardButton.setOnAction(e -> {
            listView.getItems().clear();
            Node current = playlist.getTail();
            while (current != null) {
                listView.getItems().add(current.data.toString());
                current = current.prev;
            }
        });

        VBox layout = new VBox(10);
        layout.getChildren().addAll(
                titleField, artistField, albumField, durationField, genreField,
                addButton, removeButton, traverseForwardButton, traverseBackwardButton,
                listView);

        Scene scene = new Scene(layout, 400, 600);
        primaryStage.setScene(scene);
        primaryStage.show();
    }

    private void updateListView() {
        listView.getItems().clear();
        Node current = playlist.getHead();
        while (current != null) {
            listView.getItems().add(current.data.toString());
            current = current.next;
        }
    }

    private void clearFields(TextField... fields) {
        for (TextField field : fields) {
            field.clear();
        }
    }
}
