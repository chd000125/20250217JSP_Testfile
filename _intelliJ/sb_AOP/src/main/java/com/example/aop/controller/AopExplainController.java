package com.example.aop.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/aop")
public class AopExplainController {

    @GetMapping("/explain")
    public String explainAop() {
        return "aopExplain";
    }
} 