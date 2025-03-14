package com.example.aop.controller;

import com.example.aop.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/users")
@RequiredArgsConstructor
public class UserController {

    private final UserService userService;

    @GetMapping("/{id}")
    public String getUser(@PathVariable Long id, Model model) {
        String userInfo = userService.findUser(id);
        model.addAttribute("userInfo", userInfo);
        model.addAttribute("userId", id);
        return "user";
    }

    @GetMapping("/{id}/details")
    public String getUserDetails(@PathVariable Long id, Model model) {
        String userDetails = userService.findUserDetails(id);
        model.addAttribute("userDetails", userDetails);
        model.addAttribute("userId", id);
        return "userDetails";
    }
    
    @GetMapping("/")
    public String listUsers(Model model) {
        model.addAttribute("message", "사용자 목록 페이지입니다.");
        return "userList";
    }
    
    @GetMapping("/home")
    public String home() {
        return "home";
    }
} 