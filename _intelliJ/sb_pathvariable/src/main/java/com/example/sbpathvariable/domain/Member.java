package com.example.sbpathvariable.domain;

import lombok.Data;
import java.time.LocalDateTime;

@Data
public class Member {
    private Long id;
    private String name;
    private String email;
    private LocalDateTime createdAt;
    private LocalDateTime updatedAt;
} 