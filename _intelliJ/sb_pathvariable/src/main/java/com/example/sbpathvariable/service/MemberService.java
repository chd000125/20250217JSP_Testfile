package com.example.sbpathvariable.service;

import com.example.sbpathvariable.domain.Member;
import com.example.sbpathvariable.exception.MemberNotFoundException;
import com.example.sbpathvariable.mapper.MemberMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Slf4j
@Service
@RequiredArgsConstructor
@Transactional(readOnly = true)
public class MemberService {
    private final MemberMapper memberMapper;

    public List<Member> findAll() {
        log.info("회원 전체 조회");
        List<Member> members = memberMapper.findAll();
        log.info("조회된 회원 목록: {}", members);
        return members;
    }

    public Member findById(Long id) {
        log.info("회원 단건 조회, id: {}", id);
        Member member = memberMapper.findById(id);
        if (member == null) {
            throw new MemberNotFoundException("ID가 " + id + "인 회원을 찾을 수 없습니다.");
        }
        return member;
    }

    @Transactional
    public void save(Member member) {
        log.info("회원 저장: {}", member);
        memberMapper.insert(member);
    }

    @Transactional
    public void update(Member member) {
        log.info("회원 수정: {}", member);
        Member existingMember = findById(member.getId());
        memberMapper.update(member);
    }

    @Transactional
    public void delete(Long id) {
        log.info("회원 삭제, id: {}", id);
        Member member = findById(id);
        memberMapper.delete(id);
    }
} 