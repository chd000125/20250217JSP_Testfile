package com.example.aop.aspect;

import com.example.aop.dto.AopExecutionEvent;
import com.example.aop.service.AopEventService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;

import java.time.LocalDateTime;

@Aspect
@Component
@Slf4j
@RequiredArgsConstructor
public class LoggingAspect {

    private final AopEventService aopEventService;
    
    @Pointcut("execution(* com.example.aop.service..*.*(..)) && !execution(* com.example.aop.service.AopEventService.*(..))")
    public void servicePointcut() {}

    @Before("servicePointcut()")
    public void logBefore(JoinPoint joinPoint) {
        String methodName = joinPoint.getSignature().getName();
        String className = joinPoint.getTarget().getClass().getSimpleName();
        
        log.info("Before executing: {}.{}", className, methodName);
        
        AopExecutionEvent event = AopExecutionEvent.builder()
                .methodName(methodName)
                .className(className)
                .eventType("BEFORE")
                .message("메서드 실행 전")
                .executionTime(0)
                .timestamp(LocalDateTime.now())
                .build();
        
        aopEventService.sendAopEvent(event);
    }

    @Around("servicePointcut()")
    public Object logExecutionTime(ProceedingJoinPoint joinPoint) throws Throwable {
        String methodName = joinPoint.getSignature().getName();
        String className = joinPoint.getTarget().getClass().getSimpleName();
        
        long startTime = System.currentTimeMillis();
        
        // Around Advice 시작 이벤트
        AopExecutionEvent startEvent = AopExecutionEvent.builder()
                .methodName(methodName)
                .className(className)
                .eventType("AROUND_START")
                .message("Around Advice 시작")
                .executionTime(0)
                .timestamp(LocalDateTime.now())
                .build();
        
        aopEventService.sendAopEvent(startEvent);
        
        Object result = joinPoint.proceed();
        
        long endTime = System.currentTimeMillis();
        long executionTime = endTime - startTime;
        
        log.info("Method: {}.{} executed in {} ms", 
                className,
                methodName, 
                executionTime);
        
        // Around Advice 종료 이벤트
        AopExecutionEvent endEvent = AopExecutionEvent.builder()
                .methodName(methodName)
                .className(className)
                .eventType("AROUND_END")
                .message("메서드 실행 완료")
                .executionTime(executionTime)
                .timestamp(LocalDateTime.now())
                .build();
        
        aopEventService.sendAopEvent(endEvent);
        
        return result;
    }
    
    @After("servicePointcut()")
    public void logAfter(JoinPoint joinPoint) {
        String methodName = joinPoint.getSignature().getName();
        String className = joinPoint.getTarget().getClass().getSimpleName();
        
        log.info("After executing: {}.{}", className, methodName);
        
        AopExecutionEvent event = AopExecutionEvent.builder()
                .methodName(methodName)
                .className(className)
                .eventType("AFTER")
                .message("메서드 실행 후")
                .executionTime(0)
                .timestamp(LocalDateTime.now())
                .build();
        
        aopEventService.sendAopEvent(event);
    }
} 