package edu.du.sb0320.repository;

import edu.du.sb0320.entity.MyUser;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface MyUserRepository extends JpaRepository<MyUser, Long> { // Entity 이름, Entity 에 해당되는 타입
    MyUser findByName(String name);
//    List<MyUser> findByMyUserByOrderByNameAsc();
}
