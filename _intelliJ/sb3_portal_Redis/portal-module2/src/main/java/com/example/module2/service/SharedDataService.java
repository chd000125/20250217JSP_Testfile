package com.example.module2.service;

import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;

@Service
public class SharedDataService {
    
    private final RedisTemplate<String, Object> redisTemplate;
    
    public SharedDataService(RedisTemplate<String, Object> redisTemplate) {
        this.redisTemplate = redisTemplate;
    }
    
    public void saveData(String key, String value) {
        redisTemplate.opsForValue().set(key, value);
    }
    
    public String getData(String key) {
        Object value = redisTemplate.opsForValue().get(key);
        return value != null ? value.toString() : null;
    }
} 