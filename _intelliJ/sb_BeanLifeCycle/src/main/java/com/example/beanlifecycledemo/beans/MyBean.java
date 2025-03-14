package com.example.beanlifecycledemo.beans;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.DisposableBean;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;
import javax.annotation.PreDestroy;

@Slf4j
@Component
public class MyBean implements InitializingBean, DisposableBean {

    private String message;

    public MyBean() {
        this.message = "기본 메시지";
        log.info("1. 생성자 호출: MyBean이 생성되었습니다.");
    }

    public void setMessage(String message) {
        this.message = message;
        log.info("2. 세터 주입: 메시지가 '{}' 로 설정되었습니다.", message);
    }

    public String getMessage() {
        return message;
    }

    @PostConstruct
    public void postConstruct() {
        log.info("3. @PostConstruct 어노테이션 메서드 호출");
    }

    @Override
    public void afterPropertiesSet() throws Exception {
        log.info("4. InitializingBean 인터페이스의 afterPropertiesSet() 메서드 호출");
    }

    public void customInit() {
        log.info("5. 커스텀 초기화 메서드 호출");
    }

    @PreDestroy
    public void preDestroy() {
        log.info("6. @PreDestroy 어노테이션 메서드 호출");
    }

    @Override
    public void destroy() throws Exception {
        log.info("7. DisposableBean 인터페이스의 destroy() 메서드 호출");
    }

    public void customDestroy() {
        log.info("8. 커스텀 소멸 메서드 호출");
    }
} 