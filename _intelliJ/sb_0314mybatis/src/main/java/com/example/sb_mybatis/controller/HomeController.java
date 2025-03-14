package com.example.sb_mybatis.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {
    
    @GetMapping("/")
    public String home() {
        return "home";
    }

    @GetMapping("/test")
    public String test() {
        return "/board/test";
    }
    
    @GetMapping("/mybatis-flow")
    public String mybatisFlow() {
        return "mybatis-flow";
    }
} 