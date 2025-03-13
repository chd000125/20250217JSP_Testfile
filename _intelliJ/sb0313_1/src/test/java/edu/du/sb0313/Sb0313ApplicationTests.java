package edu.du.sb0313;

import edu.du.sb0313.dao.UserDao;
import edu.du.sb0313.dto.Users;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.jdbc.core.JdbcTemplate;

import java.util.List;

@SpringBootTest
class Sb0313ApplicationTests {

    @Autowired
    private UserDao userDao;

    @Test
    void users테이블레코드개수() {
        System.out.println(userDao.count());
    }

    @Test
    void users_테이블_출력() {
//        System.out.println(userDao.getAllUsers());
        for (Users users : userDao.getAllUsers()) {
            System.out.println(users);
        }
    }

    @Test
    void users_테이블_입력() {
        Users users = new Users();
        users.setUsername("이순신");
        users.setPassword("123456");
        users.setEmail("lee@krea.com");
        userDao.addUser(users);
    }


}
