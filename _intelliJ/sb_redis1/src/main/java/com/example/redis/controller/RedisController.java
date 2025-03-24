package com.example.redis.controller;

import com.example.redis.service.RedisService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.concurrent.TimeUnit;

@RestController
@RequestMapping("/api/redis")
@RequiredArgsConstructor
public class RedisController {

    private final RedisService redisService;

    @PostMapping("/{key}")
    public ResponseEntity<Void> setValue(@PathVariable String key, @RequestBody String value) {
        redisService.setValue(key, value);
        return ResponseEntity.ok().build();
    }

    @PostMapping("/{key}/expire")
    public ResponseEntity<Void> setValueWithExpiration(
            @PathVariable String key,
            @RequestBody String value,
            @RequestParam(defaultValue = "1") long timeout,
            @RequestParam(defaultValue = "HOURS") TimeUnit unit) {
        redisService.setValueWithExpiration(key, value, timeout, unit);
        return ResponseEntity.ok().build();
    }

    @GetMapping("/{key}")
    public ResponseEntity<String> getValue(@PathVariable String key) {
        String value = redisService.getValue(key);
        return ResponseEntity.ok(value);
    }

    @DeleteMapping("/{key}")
    public ResponseEntity<Void> deleteValue(@PathVariable String key) {
        redisService.deleteValue(key);
        return ResponseEntity.ok().build();
    }

    @GetMapping("/{key}/exists")
    public ResponseEntity<Boolean> hasKey(@PathVariable String key) {
        boolean exists = redisService.hasKey(key);
        return ResponseEntity.ok(exists);
    }
} 