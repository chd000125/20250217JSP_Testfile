package edu.du.sb0320.entity;

import com.fasterxml.jackson.annotation.JsonTypeId;
import jakarta.persistence.*;
import lombok.*;

import java.time.LocalDate;

@Entity
@Getter
@Setter
@ToString
@Table(name = "my_user")
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class MyUser {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String name;
    private String email;

    private LocalDate createdAt;

    @PrePersist
    public void prePersist() {createdAt = LocalDate.now();}

}
