package com.example.sbpathvariable.controller;

import com.example.sbpathvariable.service.MemberService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Slf4j
@Controller
@RequiredArgsConstructor
@RequestMapping("/statistics")
public class StatisticsController {
    
    private final MemberService memberService;
    
    @GetMapping
    public String statistics(Model model) {
        log.info("의도적으로 에러를 냄");
        // 존재하지 않는 ID로 조회하여 예외 발생
        memberService.findById(999L);
        model.addAttribute("totalMembers", memberService.findAll().size());
        return "statistics/index";
    }
} 