package com.example.beanlifecycledemo.service;

import com.example.beanlifecycledemo.beans.MyBean;
import com.example.beanlifecycledemo.listeners.BeanLifecycleListener;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

@Slf4j
@Service
public class BeanLifecycleService {

    private final ApplicationContext applicationContext;
    private final MyBean myCustomBean;
    private final MyBean anotherBean;
    private final List<String> beanLogs = new ArrayList<>();

    @Autowired
    public BeanLifecycleService(
            ApplicationContext applicationContext,
            @Qualifier("myCustomBean") MyBean myCustomBean,
            @Qualifier("anotherBean") MyBean anotherBean) {
        this.applicationContext = applicationContext;
        this.myCustomBean = myCustomBean;
        this.anotherBean = anotherBean;
        log.info("BeanLifecycleService 생성자 호출: 의존성 주입 완료");
        
        // 초기 로그 추가
        beanLogs.add("BeanLifecycleService 생성됨");
        beanLogs.add("myCustomBean 메시지: " + myCustomBean.getMessage());
        beanLogs.add("anotherBean 메시지: " + anotherBean.getMessage());
    }
    
    public List<String> getBeanLifecycleLogs() {
        List<String> allLogs = new ArrayList<>();
        allLogs.addAll(beanLogs);
        allLogs.addAll(BeanLifecycleListener.getLifecycleEvents());
        return allLogs;
    }
    
    public void addLog(String log) {
        beanLogs.add(log);
    }
    
    public String getMyCustomBeanMessage() {
        return myCustomBean.getMessage();
    }
    
    public String getAnotherBeanMessage() {
        return anotherBean.getMessage();
    }
    
    public void updateMyCustomBeanMessage(String message) {
        myCustomBean.setMessage(message);
        beanLogs.add("myCustomBean 메시지 업데이트: " + message);
    }
    
    /**
     * 빈 새로고침 이벤트를 처리합니다.
     * 이 메서드는 빈의 초기화 메서드를 다시 호출하는 시뮬레이션을 합니다.
     */
    public void refreshBean() {
        String timestamp = getCurrentTimestamp();
        
        try {
            // 초기화 메서드 시뮬레이션
            addLog(timestamp + " - 빈 새로고침 시작");
            
            // @PostConstruct 시뮬레이션
            addLog(timestamp + " - @PostConstruct 메서드 호출 시뮬레이션");
            myCustomBean.postConstruct();
            
            // afterPropertiesSet 시뮬레이션
            addLog(timestamp + " - afterPropertiesSet() 메서드 호출 시뮬레이션");
            myCustomBean.afterPropertiesSet();
            
            // 커스텀 초기화 시뮬레이션
            addLog(timestamp + " - 커스텀 초기화 메서드 호출 시뮬레이션");
            myCustomBean.customInit();
            
            addLog(timestamp + " - 빈 새로고침 완료");
        } catch (Exception e) {
            addLog(timestamp + " - 빈 새로고침 중 오류 발생: " + e.getMessage());
            log.error("빈 새로고침 중 오류 발생", e);
        }
    }
    
    /**
     * 빈 소멸 이벤트를 처리합니다.
     * 이 메서드는 빈의 소멸 메서드를 호출하는 시뮬레이션을 합니다.
     */
    public void destroyBean() {
        String timestamp = getCurrentTimestamp();
        
        try {
            // 소멸 메서드 시뮬레이션
            addLog(timestamp + " - 빈 소멸 시작");
            
            // @PreDestroy 시뮬레이션
            addLog(timestamp + " - @PreDestroy 메서드 호출 시뮬레이션");
            myCustomBean.preDestroy();
            
            // destroy() 시뮬레이션
            addLog(timestamp + " - destroy() 메서드 호출 시뮬레이션");
            myCustomBean.destroy();
            
            // 커스텀 소멸 시뮬레이션
            addLog(timestamp + " - 커스텀 소멸 메서드 호출 시뮬레이션");
            myCustomBean.customDestroy();
            
            addLog(timestamp + " - 빈 소멸 완료");
        } catch (Exception e) {
            addLog(timestamp + " - 빈 소멸 중 오류 발생: " + e.getMessage());
            log.error("빈 소멸 중 오류 발생", e);
        }
    }
    
    /**
     * 빈 재생성 이벤트를 처리합니다.
     * 이 메서드는 빈의 소멸 후 다시 초기화하는 시뮬레이션을 합니다.
     */
    public void recreateBean() {
        String timestamp = getCurrentTimestamp();
        
        try {
            // 소멸 프로세스
            addLog(timestamp + " - 빈 재생성 시작: 소멸 단계");
            destroyBean();
            
            // 재생성 프로세스
            addLog(timestamp + " - 빈 재생성 단계: 인스턴스화 시뮬레이션");
            
            // 생성자 호출 시뮬레이션
            addLog(timestamp + " - 생성자 호출 시뮬레이션");
            
            // 프로퍼티 설정 시뮬레이션
            addLog(timestamp + " - 프로퍼티 설정 시뮬레이션");
            myCustomBean.setMessage("재생성된 빈 메시지");
            
            // 초기화 메서드 호출
            refreshBean();
            
            addLog(timestamp + " - 빈 재생성 완료");
        } catch (Exception e) {
            addLog(timestamp + " - 빈 재생성 중 오류 발생: " + e.getMessage());
            log.error("빈 재생성 중 오류 발생", e);
        }
    }
    
    /**
     * 현재 타임스탬프를 반환합니다.
     */
    private String getCurrentTimestamp() {
        return LocalDateTime.now().format(DateTimeFormatter.ofPattern("HH:mm:ss.SSS"));
    }
} 