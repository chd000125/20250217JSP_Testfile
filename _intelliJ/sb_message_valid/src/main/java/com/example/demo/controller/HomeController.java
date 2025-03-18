package com.example.demo.controller;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.demo.dto.UserForm;

@Controller
public class HomeController {
    
    @GetMapping("/")
    public String home(Model model) {
        model.addAttribute("title", "스프링부트 웹 프로젝트");
        return "home";
    }
    
    @GetMapping("/form")
    public String showForm(Model model) {
        model.addAttribute("userForm", new UserForm());
        return "form";
    }
    
    @PostMapping("/form")
    public String submitForm(@Valid @ModelAttribute UserForm userForm,
                           BindingResult bindingResult,
                           RedirectAttributes redirectAttributes) {
        if (bindingResult.hasErrors()) {
            return "form";
        }
        redirectAttributes.addFlashAttribute("message", "회원가입이 완료되었습니다!");
        return "redirect:/";
    }
} 