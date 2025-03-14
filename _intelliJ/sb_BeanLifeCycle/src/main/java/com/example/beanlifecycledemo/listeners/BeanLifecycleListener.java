package com.example.beanlifecycledemo.listeners;

import lombok.extern.slf4j.Slf4j;
import org.springframework.context.ApplicationListener;
import org.springframework.context.event.ContextClosedEvent;
import org.springframework.context.event.ContextRefreshedEvent;
import org.springframework.context.event.ContextStartedEvent;
import org.springframework.context.event.ContextStoppedEvent;
import org.springframework.stereotype.Component;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

@Slf4j
@Component
public class BeanLifecycleListener implements 
        ApplicationListener<ContextRefreshedEvent> {

    private static final List<String> lifecycleEvents = new ArrayList<>();
    
    public static List<String> getLifecycleEvents() {
        return lifecycleEvents;
    }
    
    @Override
    public void onApplicationEvent(ContextRefreshedEvent event) {
        String timestamp = LocalDateTime.now().format(DateTimeFormatter.ofPattern("HH:mm:ss.SSS"));
        String message = timestamp + " - 컨텍스트 리프레시 이벤트 발생: 애플리케이션 컨텍스트 초기화 또는 리프레시 완료";
        log.info(message);
        lifecycleEvents.add(message);
    }
    
    @Component
    public static class ContextStartedListener implements ApplicationListener<ContextStartedEvent> {
        @Override
        public void onApplicationEvent(ContextStartedEvent event) {
            String timestamp = LocalDateTime.now().format(DateTimeFormatter.ofPattern("HH:mm:ss.SSS"));
            String message = timestamp + " - 컨텍스트 시작 이벤트 발생: start()가 호출됨";
            log.info(message);
            lifecycleEvents.add(message);
        }
    }
    
    @Component
    public static class ContextStoppedListener implements ApplicationListener<ContextStoppedEvent> {
        @Override
        public void onApplicationEvent(ContextStoppedEvent event) {
            String timestamp = LocalDateTime.now().format(DateTimeFormatter.ofPattern("HH:mm:ss.SSS"));
            String message = timestamp + " - 컨텍스트 중지 이벤트 발생: stop()이 호출됨";
            log.info(message);
            lifecycleEvents.add(message);
        }
    }
    
    @Component
    public static class ContextClosedListener implements ApplicationListener<ContextClosedEvent> {
        @Override
        public void onApplicationEvent(ContextClosedEvent event) {
            String timestamp = LocalDateTime.now().format(DateTimeFormatter.ofPattern("HH:mm:ss.SSS"));
            String message = timestamp + " - 컨텍스트 종료 이벤트 발생: 애플리케이션 컨텍스트가 종료됨";
            log.info(message);
            lifecycleEvents.add(message);
        }
    }
} 