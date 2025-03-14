package com.example.aop.service;

import com.example.aop.dto.AopExecutionEvent;
import lombok.RequiredArgsConstructor;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class AopEventService {

    private final SimpMessagingTemplate messagingTemplate;

    public void sendAopEvent(AopExecutionEvent event) {
        messagingTemplate.convertAndSend("/topic/aop-events", event);
    }
}