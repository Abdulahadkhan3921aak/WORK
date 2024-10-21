package application;
public class Song {
    private String title;
    private String artist;
    private String album;
    private int duration; // duration in seconds
    private String genre;

    public Song(String title, String artist, String album, int duration, String genre) {
        this.title = title;
        this.artist = artist;
        this.album = album;
        this.duration = duration;
        this.genre = genre;
    }

    public String getTitle() {
        return title;
    }

    public String getArtist() {
        return artist;
    }

    @Override
    public String toString() {
        return String.format("%s by %s from the album %s [%d seconds] - Genre: %s",
                title, artist, album, duration, genre);
    }
}
