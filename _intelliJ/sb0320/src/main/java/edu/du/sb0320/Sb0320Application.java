package edu.du.sb0320;

import edu.du.sb0320.entity.MyUser;
import edu.du.sb0320.repository.MyUserRepository;
import jakarta.annotation.PostConstruct;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class Sb0320Application {

    @Autowired
    private MyUserRepository myUserRepository;

    public static void main(String[] args) {
        SpringApplication.run(Sb0320Application.class, args);
    }

        //@PostConstruct
        public void init() {
            MyUser myUser = new MyUser().builder()
                    .email("test1@gmail.com")
                    .name("Test1")
                    .build();
            myUserRepository.save(myUser);
            myUser = new MyUser().builder()
                    .email("test2@gmail.com")
                    .name("Test2")
                    .build();
            myUserRepository.save(myUser);
            myUser = new MyUser().builder()
                    .email("test3@gmail.com")
                    .name("Test3")
                    .build();
            myUserRepository.save(myUser);
        }
}
