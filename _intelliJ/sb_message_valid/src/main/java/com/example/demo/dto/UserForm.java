package com.example.demo.dto;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

import lombok.Data;

@Data
public class UserForm {
    
    @NotBlank(message = "{error.required}")
    @Size(min = 2, max = 20, message = "이름은 2~20자 사이여야 합니다.")
    private String name;
    
    @NotBlank(message = "{error.required}")
    @Email(message = "{error.email}")
    private String email;
    
    @NotBlank(message = "{error.required}")
    @Size(min = 6, max = 20, message = "비밀번호는 6~20자 사이여야 합니다.")
    private String password;
    
    private String phone;
} 