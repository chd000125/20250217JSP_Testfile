package com.example.beanlifecycledemo.config;

import com.example.beanlifecycledemo.beans.MyBean;
import lombok.extern.slf4j.Slf4j;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Slf4j
@Configuration
public class BeanConfig {

    @Bean(initMethod = "customInit", destroyMethod = "customDestroy")
    public MyBean myCustomBean() {
        MyBean bean = new MyBean();
        bean.setMessage("커스텀 빈 설정으로 생성된 메시지");
        log.info("BeanConfig: myCustomBean 메서드에서 Bean 생성 및 설정");
        return bean;
    }
    
    @Bean
    public MyBean anotherBean() {
        MyBean bean = new MyBean();
        bean.setMessage("다른 빈 인스턴스");
        log.info("BeanConfig: anotherBean 메서드에서 Bean 생성 및 설정");
        return bean;
    }
} 