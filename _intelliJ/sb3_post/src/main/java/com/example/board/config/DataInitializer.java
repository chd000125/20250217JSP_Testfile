package com.example.board.config;

import com.example.board.entity.Post;
import com.example.board.repository.PostRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.boot.CommandLineRunner;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.time.LocalDateTime;
import java.util.Arrays;
import java.util.List;

@Configuration
@RequiredArgsConstructor
public class DataInitializer {

    private final PostRepository postRepository;

    @Bean
    public CommandLineRunner initData() {
        return args -> {
            if (postRepository.count() == 0) {
                List<String> titles = Arrays.asList(
                    "스프링부트 게시판 만들기",
                    "JPA를 활용한 데이터베이스 설계",
                    "타임리프와 부트스트랩으로 예쁜 UI 만들기",
                    "RESTful API 설계 가이드",
                    "스프링 시큐리티 적용하기",
                    "마이크로서비스 아키텍처 설계",
                    "도커와 쿠버네티스로 컨테이너화하기",
                    "CI/CD 파이프라인 구축하기",
                    "테스트 주도 개발(TDD) 실습",
                    "코드 품질 향상을 위한 리팩토링"
                );

                for (int i = 0; i < 50; i++) {
                    Post post = new Post();
                    post.setTitle(titles.get(i % titles.size()) + " - " + (i + 1));
                    post.setContent("이것은 샘플 게시글 " + (i + 1) + "입니다.\n\n" +
                            "여기에 다양한 내용이 들어갈 수 있습니다.\n" +
                            "스프링부트와 JPA를 활용한 게시판 구현 예제입니다.\n" +
                            "타임리프와 부트스트랩을 사용하여 예쁜 UI를 구현했습니다.");
                    post.setAuthor("작성자" + ((i % 5) + 1));
                    post.setCreatedAt(LocalDateTime.now().minusDays(i));
                    post.setViewCount((long) (Math.random() * 1000));
                    postRepository.save(post);
                }
            }
        };
    }
} 