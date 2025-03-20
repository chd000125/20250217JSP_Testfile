package edu.du.portalproject.dto;

import lombok.Data;

@Data
public class BoardDTO {

    private long id;
    private String title;
    private String contents;
    private String userName;
    private String createdAt;
    private String updatedAt;
}
