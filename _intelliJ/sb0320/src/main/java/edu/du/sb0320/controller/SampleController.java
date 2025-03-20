package edu.du.sb0320.controller;


import edu.du.sb0320.dto.SampleDTO;
import edu.du.sb0320.entity.MyUser;
import edu.du.sb0320.repository.MyUserRepository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

@Controller
@RequestMapping("/sample")
@Slf4j
public class SampleController {

    @Autowired
    private MyUserRepository myUserRepository;

    @GetMapping("/ex1")
    public String ex1(Model model) {
//        MyUser myUser = myUserRepository.findById(1L).get();
        MyUser myUser = myUserRepository.findByName("test2");
        log.info("사용자 정보 : {}", myUser);
        model.addAttribute("myUser", myUser);
        model.addAttribute("name1", "홍길동");
        return "sample/sample1";
    }

    @GetMapping("/ex2")
    public String ex2(Model model) {
        List<SampleDTO> list = IntStream.rangeClosed(1, 20)
                .asLongStream()
                .mapToObj(i -> {
                    SampleDTO dto = new SampleDTO().builder()
                            .id(i)
                            .name("테스트" + i)
                            .age(20 + i)
                            .build();
                    return dto;
                }).collect(Collectors.toList());
        log.info(list.toString());
        model.addAttribute("list", list);
        return "sample/sample2";
    }
        @GetMapping("/ex3")
        public String ex3(Model model) {
            List<MyUser> list = myUserRepository.findAll();
            log.info(list.toString());
            model.addAttribute("list", list);
            return "sample/sample3";
    }
}
