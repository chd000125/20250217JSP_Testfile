package com.example.sbpathvariable.controller;

import com.example.sbpathvariable.domain.Member;
import com.example.sbpathvariable.service.MemberService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Slf4j
@Controller
@RequiredArgsConstructor
public class HomeController {
    
    private final MemberService memberService;
    
    @GetMapping("/")
    public String home(Model model) {
        log.info("홈 컨트롤러 실행");
        List<Member> recentMembers = memberService.findAll();
        log.info("조회된 회원 수: {}", recentMembers.size());
        model.addAttribute("recentMembers", recentMembers);
        return "home";
    }
} 