package edu.du.sb0327.controller;


import edu.du.sb0327.member.Member;
import edu.du.sb0327.repository.MemberRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import java.util.List;

@Controller
public class RestController {

    @Autowired
    private MemberRepository memberRepository;

    @GetMapping("/data")
    public List<Member> data() {
        return memberRepository.findAll();
    }

    @GetMapping("/data/{id}")
    public String data(@PathVariable Long id) {
        return memberRepository.findById(id).orElse(null);
    }
}
