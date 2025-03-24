package com.example.module1.controller;

import com.example.module1.service.SharedDataService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Slf4j
@Controller
@RequestMapping("/module1/data")
public class SharedDataController {
    
    private final SharedDataService sharedDataService;
    
    public SharedDataController(SharedDataService sharedDataService) {
        this.sharedDataService = sharedDataService;
    }
    
    @GetMapping("/shared")
    public String showForm(Model model) {

        model.addAttribute("data", sharedDataService.getData("shared_key"));
        model.addAttribute("moduleName", "Module 1");
        model.addAttribute("otherModuleUrl", "http://localhost:8082/module2/data/shared");
        return "module1/index";
    }
    
    @PostMapping("/shared")
    public String saveData(@RequestParam String data) {
        log.info("저장 자료: {}", data);
        sharedDataService.saveData("shared_key", data);
        return "redirect:/module1/data/shared";
    }
} 