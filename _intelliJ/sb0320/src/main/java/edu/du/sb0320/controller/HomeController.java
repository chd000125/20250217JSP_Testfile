package edu.du.sb0320.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {

    @GetMapping("/")
    public String home() {
        return "home";
    }

    @GetMapping("/test")
    public String sample() {
        return "sample/sample1";
    }
}
