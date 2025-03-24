package com.example.module2.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/module3")
public class Module3Controller {

    @GetMapping({"", "/"})
    public String index() {
        return "module3/index";
    }
} 