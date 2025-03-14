package com.example.aop.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class AopExecutionEvent {
    private String methodName;
    private String className;
    private String eventType; // BEFORE, AFTER, AROUND 등
    private String message;
    private long executionTime; // 실행 시간 (ms)
    private LocalDateTime timestamp;
} 