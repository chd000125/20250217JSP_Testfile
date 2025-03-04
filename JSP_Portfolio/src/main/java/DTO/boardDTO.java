package DTO;

import java.sql.Timestamp;

public class boardDTO {
    private int id;
    private String title;
    private String content;
    private int price;
    private String sellerId;
    private Timestamp createdAt;

    public boardDTO() {}

    public boardDTO(int id, String title, String content, int price, String sellerId, Timestamp createdAt) {
        this.id = id;
        this.title = title;
        this.content = content;
        this.price = price;
        this.sellerId = sellerId;
        this.createdAt = createdAt;
    }

    // Getter & Setter
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getTitle() { return title; }
    public void setTitle(String title) { this.title = title; }

    public String getContent() { return content; }
    public void setContent(String content) { this.content = content; }

    public int getPrice() { return price; }
    public void setPrice(int price) { this.price = price; }

    public String getSellerId() { return sellerId; }
    public void setSellerId(String sellerId) { this.sellerId = sellerId; }

    public Timestamp getCreatedAt() { return createdAt; }
    public void setCreatedAt(Timestamp createdAt) { this.createdAt = createdAt; }
}
