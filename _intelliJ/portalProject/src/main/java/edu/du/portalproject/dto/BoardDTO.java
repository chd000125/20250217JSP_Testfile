package edu.du.portalproject.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class BoardDTO {

    private long id;
    private String title;
    private String contents;
    private String userName;
    private String createdAt;
    private String updatedAt;
}
