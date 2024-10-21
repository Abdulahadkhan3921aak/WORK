package javafx;

public class Song {
    private String title;
    private String artist;
    private String album;
    private int duration;
    private String genre;

    public Song(String title, String artist, String album, int duration, String genre) {
        this.title = title;
        this.artist = artist;
        this.album = album;
        this.duration = duration;
        this.genre = genre;
    }

    @Override
    public String toString() {
        return String.format("%s by %s (%s) [%d sec] - %s", title, artist, album, duration, genre);
    }

    public String getTitle() {
        return title;
    }
}
