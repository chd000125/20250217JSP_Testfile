package DTO;

public class boardDTO {
    private int id;
    private String title;
    private String content;
    private int price;
    private int sellerId;

    public boardDTO() {}

    public boardDTO(int id, String title, String content, int price, int sellerId) {
        this.id = id;
        this.title = title;
        this.content = content;
        this.price = price;
        this.sellerId = sellerId;
    }

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getTitle() { return title; }
    public void setTitle(String title) { this.title = title; }

    public String getContent() { return content; }
    public void setContent(String content) { this.content = content; }

    public int getPrice() { return price; }
    public void setPrice(int price) { this.price = price; }

    public int getSellerId() { return sellerId; }
    public void setSellerId(int sellerId) { this.sellerId = sellerId; }
}
