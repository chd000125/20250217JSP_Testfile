package com.example.interceptor.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Slf4j
@Controller
@RequestMapping(produces = "text/html;charset=UTF-8")
public class LoginController {

    @GetMapping("/login")
    public String loginForm(@RequestParam(defaultValue = "/") String redirectURL, Model model) {
        model.addAttribute("redirectURL", redirectURL);
        return "login";
    }

    @PostMapping("/login")
    public String login(@RequestParam String username,
                       @RequestParam String password,
                       @RequestParam(defaultValue = "/") String redirectURL,
                       HttpServletRequest request,
                       Model model) {
        log.info("로그인 시도: {}", username);

        // 실제로는 DB에서 사용자 정보를 확인해야 합니다.
        // 여기서는 간단한 예제를 위해 하드코딩된 값을 사용합니다.
        if ("test".equals(username) && "test1234".equals(password)) {
            HttpSession session = request.getSession();
            session.setAttribute("loginMember", username);
            log.info("로그인 성공: {}", username);
            return "redirect:" + redirectURL;
        }

        model.addAttribute("error", "아이디 또는 비밀번호가 일치하지 않습니다.");
        model.addAttribute("redirectURL", redirectURL);
        return "login";
    }

    @GetMapping("/logout")
    public String logout(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate();
        }
        return "redirect:/";
    }
} 