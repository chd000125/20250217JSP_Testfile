package com.board.model;

import java.sql.Timestamp;

public class BoardDTO {
    private int id;
    private String title;
    private String content;
    private String writer;
    private Timestamp regdate;
    private int viewcount;
    
    // Getter/Setter
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public String getTitle() {
        return title;
    }
    public void setTitle(String title) {
        this.title = title;
    }
    public String getContent() {
        return content;
    }
    public void setContent(String content) {
        this.content = content;
    }
    public String getWriter() {
        return writer;
    }
    public void setWriter(String writer) {
        this.writer = writer;
    }
    public Timestamp getRegdate() {
        return regdate;
    }
    public void setRegdate(Timestamp regdate) {
        this.regdate = regdate;
    }
    public int getViewcount() {
        return viewcount;
    }
    public void setViewcount(int viewcount) {
        this.viewcount = viewcount;
    }
} 