package edu.du.sb0324.entity;

import jakarta.persistence.*;
import lombok.*;

import java.time.LocalDateTime;

@Getter
@Setter
@ToString
@Entity
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class MyUser {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private String name;
    private String email;

    private String createdAt;

    @PrePersist
    protected void PrePersist() { createdAt = LocalDateTime.now().toString(); }
}
