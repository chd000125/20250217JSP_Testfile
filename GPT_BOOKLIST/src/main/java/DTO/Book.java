package DTO;

public class Book {
    private int id;
    private String title;
    private String author;
    private String publisher;
    private int year;
    private String genre;

    // 기본 생성자
    public Book() {}

    // 파라미터화된 생성자
    public Book(int id, String title, String author, String publisher, int year, String genre) {
        this.id = id;
        this.title = title;
        this.author = author;
        this.publisher = publisher;
        this.year = year;
        this.genre = genre;
    }

    // getter, setter
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getTitle() { return title; }
    public void setTitle(String title) { this.title = title; }

    public String getAuthor() { return author; }
    public void setAuthor(String author) { this.author = author; }

    public String getPublisher() { return publisher; }
    public void setPublisher(String publisher) { this.publisher = publisher; }

    public int getYear() { return year; }
    public void setYear(int year) { this.year = year; }

    public String getGenre() { return genre; }
    public void setGenre(String genre) { this.genre = genre; }
}
