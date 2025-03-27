package edu.du.sb0327;

import edu.du.sb0327.member.Member;
import edu.du.sb0327.repository.MemberRepository;
import jakarta.annotation.PostConstruct;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class Sb0327Application {

    @Autowired
    private MemberRepository memberRepository;

    public static void main(String[] args) {
        SpringApplication.run(Sb0327Application.class, args);
    }

    @PostConstruct
    public void init() {
        for (int i = 0; i < 10; i++) {
            Member member = Member.builder()
                    .name("홍길"+i)
                    .email("hong"+i+"@gmail.com")
                    .build();
            memberRepository.save(member);
        }
    }

}