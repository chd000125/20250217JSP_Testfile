package com.example.aop.service;

import org.springframework.stereotype.Service;

@Service
public class UserService {

    public String findUser(Long id) {
        // 실제로는 데이터베이스에서 사용자를 조회하는 로직이 들어갈 것입니다.
        return "User with ID: " + id;
    }

    public String findUserDetails(Long id) {
        // 실제로는 데이터베이스에서 사용자 상세 정보를 조회하는 로직이 들어갈 것입니다.
        return "User Details for ID: " + id;
    }
} 