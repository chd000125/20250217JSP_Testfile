package edu.du.portalproject.dto;

import lombok.Data;

@Data
public class AccountDTO {

    private long id;
    private String email;
    private String name;
    private String password;

}
