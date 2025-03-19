package edu.du.sb0319.repository;

import edu.du.sb0319.entity.Memo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.JpaRepository;

public interface MomoRepository extends JpaRepository<Memo, Long> { // JpaRepository<DB이름, PRI키 속성>

}
