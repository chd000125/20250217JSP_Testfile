package com.example.beanlifecycledemo;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
public class BeanLifecycleDemoApplication {

    public static void main(String[] args) {
        SpringApplication.run(BeanLifecycleDemoApplication.class, args);
    }
} 