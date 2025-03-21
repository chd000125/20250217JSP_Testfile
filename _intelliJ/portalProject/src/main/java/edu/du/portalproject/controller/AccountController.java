package edu.du.portalproject.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class AccountController {

    @GetMapping("/register")
    public String showRegisterForm() {
        return "register"; // register.html 렌더링
    }

    @PostMapping("/register")
    public String handleRegister(
            @RequestParam String email,
            @RequestParam String name,
            @RequestParam String password,
            RedirectAttributes redirectAttributes) {

        // 회원가입 로직 (예: DB 저장, 검증 등)
        redirectAttributes.addFlashAttribute("message", "회원가입이 완료되었습니다!");
        return "redirect:/login"; // 회원가입 후 로그인 페이지로 이동
    }
}
