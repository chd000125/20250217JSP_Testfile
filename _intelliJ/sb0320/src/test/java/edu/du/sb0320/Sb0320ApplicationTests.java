package edu.du.sb0320;

import edu.du.sb0320.entity.MyUser;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.PersistenceContext;
import jakarta.persistence.PersistenceUnit;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class Sb0320ApplicationTests {

    @PersistenceUnit
    private EntityManagerFactory emf;

    @Test
    void contextLoads() {
        EntityManager em = emf.createEntityManager();
        em.getTransaction().begin();

        MyUser myUser = MyUser.builder()
                .name("홍길동")
                .email("hong@gmail.com")
                .build(); // 객체 생성
        em.persist(myUser); // 영속성
        // em.merge(myUser); // Update
        em.getTransaction().commit();
        em.close();
    }

    @Test
    void test1() {
        EntityManager em = emf.createEntityManager();
        em.getTransaction().begin();

        MyUser myUser = em.find(MyUser.class, 1);
        System.out.println(myUser);

        em.getTransaction().commit();
        em.close();
    }

}
