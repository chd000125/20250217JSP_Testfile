package edu.du.sb0324.repository;

import edu.du.sb0324.entity.MyUser;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface MyUserRepository extends JpaRepository<MyUser, Long> {

    List<MyUser> findByName(String name);

    @Query("select m from MyUser m where m.name = :name")
    List<MyUser> findByName2(@Param("name")String name);

    @Query(value = "select * from my_user where name = :name ", nativeQuery = true)
    List<MyUser> findByName3(@Param("name")String name);
}
