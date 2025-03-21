package edu.du.portalproject.controller;

import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class LoginController {

    private final UserService userService; // 유저 서비스 (DB에서 사용자 정보 조회)

    public LoginController(UserService userService) {
        this.userService = userService;
    }

    @PostMapping("/login")
    public String login(@RequestParam String email, @RequestParam String password, HttpSession session) {
        User user = userService.login(email, password); // 이메일, 비밀번호로 사용자 조회

        if (user != null) {
            session.setAttribute("userName", user.getName()); // DB에서 가져온 name을 세션에 저장
            return "redirect:/board/write"; // 로그인 성공 후 게시글 작성 페이지로 이동
        } else {
            return "redirect:/login?error"; // 로그인 실패 시 다시 로그인 페이지로 이동
        }
    }
}