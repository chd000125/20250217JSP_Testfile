package com.example.interceptor.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(produces = "text/html;charset=UTF-8")
public class HomeController {

    @GetMapping("/")
    public String home(Model model) {
        model.addAttribute("message", "인터셉터 예제에 오신 것을 환영합니다!");
        return "home";
    }

    @GetMapping("/about")
    public String about(Model model) {
        model.addAttribute("message", "이 페이지는 인터셉터의 동작을 보여줍니다.");
        return "about";
    }
} 