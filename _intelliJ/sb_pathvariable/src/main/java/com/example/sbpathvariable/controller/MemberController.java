package com.example.sbpathvariable.controller;

import com.example.sbpathvariable.domain.Member;
import com.example.sbpathvariable.service.MemberService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Slf4j
@Controller
@RequiredArgsConstructor
@RequestMapping("/members")
public class MemberController {
    private final MemberService memberService;

    @GetMapping
    public String list(Model model) {
        log.info("회원 목록 조회");
        List<Member> members = memberService.findAll();
        log.info("조회된 회원 수: {}", members.size());
        model.addAttribute("members", members);
        return "member/list";
    }

    @GetMapping("/{id}")
    public String view(@PathVariable Long id, Model model) {
        log.info("회원 상세 조회, id: {}", id);
        Member member = memberService.findById(id);
        log.info("조회된 회원: {}", member);
        model.addAttribute("member", member);
        return "member/view";
    }

    @GetMapping("/new")
    public String createForm() {
        return "member/form";
    }

    @PostMapping
    public String create(@ModelAttribute Member member) {
        log.info("회원 등록: {}", member);
        memberService.save(member);
        return "redirect:/members";
    }

    @GetMapping("/{id}/edit")
    public String editForm(@PathVariable Long id, Model model) {
        log.info("회원 수정 폼, id: {}", id);
        Member member = memberService.findById(id);
        model.addAttribute("member", member);
        return "member/editForm";
    }

    @PostMapping("/{id}/edit")
    public String edit(@PathVariable Long id, @ModelAttribute Member member) {
        log.info("회원 수정, id: {}, member: {}", id, member);
        member.setId(id);
        memberService.update(member);
        return "redirect:/members";
    }

    @PostMapping("/{id}/delete")
    public String delete(@PathVariable Long id) {
        log.info("회원 삭제, id: {}", id);
        memberService.delete(id);
        return "redirect:/members";
    }
} 