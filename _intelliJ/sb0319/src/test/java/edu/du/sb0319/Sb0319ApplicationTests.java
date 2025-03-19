package edu.du.sb0319;

import edu.du.sb0319.entity.Memo;
import edu.du.sb0319.repository.MomoRepository;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import javax.transaction.Transactional;

import static org.assertj.core.api.Assertions.assertThat;

@SpringBootTest
@Transactional
class Sb0319ApplicationTests {

    @Autowired
    MomoRepository momoRepository;

    @Test
    void memo() {
        //given
        Memo memo = Memo.builder()
                .content("테스트")
                .build();
//        Memo memo = new Memo();
//        memo.setContent("테스트");
        //when
        momoRepository.save(memo);
//      System.out.println("입력성공");
        //then
//        assertThat(1==1).isTrue();
//        assertThat(momoRepository.findById(memo.getId())).isEmpty();

    }
}
