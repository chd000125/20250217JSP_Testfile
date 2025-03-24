package com.example.module2.controller;

import com.example.module2.service.SharedDataService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/module2/data")
@Slf4j
public class SharedDataController {
    
    private final SharedDataService sharedDataService;
    
    public SharedDataController(SharedDataService sharedDataService) {
        this.sharedDataService = sharedDataService;
    }
    
    @GetMapping("/shared")
    public String showForm(Model model) {
        log.info("공유한 자료:{}",sharedDataService.getData("shared_key"));
        model.addAttribute("data", sharedDataService.getData("shared_key"));
        model.addAttribute("moduleName", "Module 2");
        model.addAttribute("otherModuleUrl", "http://localhost:8081/module1/data/shared");
        return "module2/index";
    }
    
    @PostMapping("/shared")
    public String saveData(@RequestParam String data) {
        sharedDataService.saveData("shared_key", data);
        return "redirect:/module2/data/shared";
    }
} 