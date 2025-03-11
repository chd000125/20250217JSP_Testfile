package com.example.model;

import lombok.Data;

@Data
public class Task {
    private Long id;
    private String title;
    private String description;
    private String status;
    private String dueDate;
} 