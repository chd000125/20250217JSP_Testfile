package edu.du.sb0327.repository;

import edu.du.sb0327.member.Member;
import org.springframework.data.jpa.repository.JpaRepository;

public interface MemberRepository extends JpaRepository<Member, Long> {
    public Member findById(long id);
}