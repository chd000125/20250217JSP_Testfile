package com.example.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class WebController {
    
    @GetMapping("/")
    public String index() {
        return "index";
    }

    @GetMapping("/write")
    public String write() {
        return "write";
    }

    @GetMapping("/view/{id}")
    public String view() {
        return "view";
    }

    @GetMapping("/edit/{id}")
    public String edit() {
        return "edit";
    }
} 