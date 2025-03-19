package com.example.demo.repository;

import com.example.demo.entity.Member;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.transaction.annotation.Transactional;

import static org.assertj.core.api.Assertions.assertThat;

@SpringBootTest
@Transactional
class MemberRepositoryTest {

    @Autowired
    MemberRepository memberRepository;

    @Test
    void createMemberTest() {
        // given
        Member member = Member.builder()
                .name("홍길동")
                .email("hong@test.com")
                .build();

        // when
        Member savedMember = memberRepository.save(member);

        // then
        assertThat(savedMember.getId()).isNotNull();
        assertThat(savedMember.getName()).isEqualTo("홍길동");
        assertThat(savedMember.getEmail()).isEqualTo("hong@test.com");
    }

    @Test
    void readMemberTest() {
        // given
        Member member = Member.builder()
                .name("김철수")
                .email("kim@test.com")
                .build();
        memberRepository.save(member);

        // when
        Member foundMember = memberRepository.findById(member.getId())
                .orElseThrow(() -> new RuntimeException("Member not found"));

        // then
        assertThat(foundMember.getName()).isEqualTo("김철수");
        assertThat(foundMember.getEmail()).isEqualTo("kim@test.com");
    }

    @Test
    void updateMemberTest() {
        // given
        Member member = Member.builder()
                .name("이영희")
                .email("lee@test.com")
                .build();
        memberRepository.save(member);

        // when
        member.updateName("이영희2");
        member.updateEmail("lee2@test.com");
        Member updatedMember = memberRepository.save(member);

        // then
        assertThat(updatedMember.getName()).isEqualTo("이영희2");
        assertThat(updatedMember.getEmail()).isEqualTo("lee2@test.com");
    }

    @Test
    void deleteMemberTest() {
        // given
        Member member = Member.builder()
                .name("박지성")
                .email("park@test.com")
                .build();
        memberRepository.save(member);

        // when
        memberRepository.delete(member);

        // then
        assertThat(memberRepository.findById(member.getId())).isEmpty();
    }
} 