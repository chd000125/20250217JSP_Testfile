package com.example.beanlifecycledemo.controller;

import com.example.beanlifecycledemo.service.BeanLifecycleService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Slf4j
@Controller
public class BeanLifecycleController {

    private final BeanLifecycleService beanLifecycleService;
    private final ConfigurableApplicationContext applicationContext;

    @Autowired
    public BeanLifecycleController(BeanLifecycleService beanLifecycleService, 
                                  ConfigurableApplicationContext applicationContext) {
        this.beanLifecycleService = beanLifecycleService;
        this.applicationContext = applicationContext;
        log.info("BeanLifecycleController 생성자 호출: 의존성 주입 완료");
    }

    @GetMapping("/")
    public String home(Model model) {
        log.info("홈 페이지 요청 처리");
        
        List<String> logs = beanLifecycleService.getBeanLifecycleLogs();
        model.addAttribute("logs", logs);
        model.addAttribute("myCustomBeanMessage", beanLifecycleService.getMyCustomBeanMessage());
        model.addAttribute("anotherBeanMessage", beanLifecycleService.getAnotherBeanMessage());
        
        // 현재 활성화된 단계 결정
        String currentStage = determineCurrentStage(logs);
        model.addAttribute("currentStage", currentStage);
        
        return "home";
    }

    @PostMapping("/update-message")
    public String updateMessage(@RequestParam("message") String message) {
        log.info("메시지 업데이트 요청 처리: {}", message);
        beanLifecycleService.updateMyCustomBeanMessage(message);
        return "redirect:/";
    }
    
    @GetMapping("/trigger-event")
    public String triggerEvent(@RequestParam("event") String event) {
        log.info("이벤트 트리거 요청: {}", event);
        
        switch (event) {
            case "refresh":
                log.info("빈 새로고침 이벤트 실행");
                beanLifecycleService.refreshBean();
                break;
                
            case "destroy":
                log.info("빈 소멸 이벤트 실행");
                beanLifecycleService.destroyBean();
                break;
                
            case "recreate":
                log.info("빈 재생성 이벤트 실행");
                beanLifecycleService.recreateBean();
                break;
                
            case "shutdown":
                log.info("애플리케이션 종료 이벤트 실행");
                // 비동기로 애플리케이션 종료 (응답을 반환한 후 종료하기 위함)
                new Thread(() -> {
                    try {
                        Thread.sleep(1000); // 응답이 반환될 시간을 주기 위해 잠시 대기
                        applicationContext.close();
                    } catch (InterruptedException e) {
                        log.error("애플리케이션 종료 중 오류 발생", e);
                    }
                }).start();
                break;
                
            default:
                log.warn("알 수 없는 이벤트: {}", event);
        }
        
        return "redirect:/";
    }
    
    /**
     * 로그 내용을 분석하여 현재 빈 라이프사이클 단계를 결정합니다.
     */
    private String determineCurrentStage(List<String> logs) {
        if (logs.isEmpty()) {
            return "instantiate";
        }
        
        // 마지막 로그부터 역순으로 검사하여 현재 단계 결정
        for (int i = logs.size() - 1; i >= 0; i--) {
            String log = logs.get(i).toLowerCase();
            
            if (log.contains("커스텀 소멸")) {
                return "customdestroy";
            } else if (log.contains("destroy() 메서드") || log.contains("disposablebean")) {
                return "destroy";
            } else if (log.contains("@predestroy") || log.contains("predestroy")) {
                return "predestroy";
            } else if (log.contains("메시지 업데이트") || log.contains("서비스 생성")) {
                return "ready";
            } else if (log.contains("커스텀 초기화")) {
                return "custominit";
            } else if (log.contains("afterpropertiesset") || log.contains("initializingbean")) {
                return "afterproperties";
            } else if (log.contains("@postconstruct") || log.contains("postconstruct")) {
                return "postconstruct";
            } else if (log.contains("세터 주입") || log.contains("의존성 주입")) {
                return "populate";
            } else if (log.contains("생성자 호출")) {
                return "instantiate";
            }
        }
        
        return "instantiate"; // 기본값
    }
} 