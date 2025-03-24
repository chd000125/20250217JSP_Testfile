package edu.du.sb0324;

import edu.du.sb0324.entity.MyUser;
import edu.du.sb0324.repository.MyUserRepository;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.PersistenceUnit;
import jakarta.persistence.TypedQuery;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.event.annotation.PrepareTestInstance;

import java.util.List;

@SpringBootTest
class Sb0324ApplicationTests {

    @Autowired
    private MyUserRepository myUserRepository;

    @PersistenceUnit
    private EntityManagerFactory emf;

    @Test
    void test1() {
        EntityManager em = emf.createEntityManager();

        em.getTransaction().begin();

        MyUser myUser = MyUser.builder()
                .name("홍길동")
                .email("hong@gmail.com")
                .build();
        //Insert 기능.
        em.persist(myUser);
        //set 명령어로 Update 가 됨.
        myUser.setName("김길동");

        em.getTransaction().commit();
        em.close();
    }

    @Test
    void test2() {
        EntityManager em = emf.createEntityManager();
        em.getTransaction().begin();

        MyUser myUser = em.find(MyUser.class, 1);
        System.out.println(myUser);
        //myUser.setName("신길동");
//        em.merge(myUser);

        em.getTransaction().commit();
        em.close();
    }

    @Test
    void test3(){
        EntityManager em = emf.createEntityManager();
        em.getTransaction().begin();

        MyUser myUser = MyUser.builder()
                .name("홍길동")
                .email("hong@korea.com")
                .build();
        //Update 의 용도
        em.merge(myUser);

        em.getTransaction().commit();
        em.close();
    }

    @Test
    void test4(){
        EntityManager em = emf.createEntityManager();
        em.getTransaction().begin();
        MyUser myUser = em.find(MyUser.class, 2);
        myUser.setName("고길동");
        em.merge(myUser);
    }

    @Test
    void test5(){
        EntityManager em = emf.createEntityManager();
        TypedQuery<MyUser> query = em.createQuery("select m from MyUser m", MyUser.class);
        List<MyUser> list = query.getResultList(); // getResultList()를 사용하여 결과를 가져옴.
        for (MyUser myUser : list) {
            System.out.println(myUser);
        }
    }

    @Test
    void test6(){
        EntityManager em = emf.createEntityManager();
        //이름을 기준으로 검색하는 JPQL 쿼리 작성
        TypedQuery<MyUser> query = em.createQuery("select m from MyUser m WHERE m.name = :name", MyUser.class);

        // 파라미터 바인딩
        query.setParameter("name", "고길동");
        // 결과 리스트 가져오기
        List<MyUser> list = query.getResultList();
        for (MyUser myUser : list) {
            System.out.println(myUser);
        }
    }
    @Test
    void test7() {
        List<MyUser> list = myUserRepository.findByName("고길동");
        System.out.println(list);
    }

    @Test
    void test8() {
        List<MyUser> list = myUserRepository.findByName2("고길동");
        System.out.println(list);
    }


}
