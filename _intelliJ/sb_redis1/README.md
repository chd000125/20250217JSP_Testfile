# Spring Boot Redis 샘플 프로젝트

이 프로젝트는 Spring Boot 3.1과 Redis를 사용한 샘플 프로젝트입니다.

## 기술 스택

- Java 17
- Spring Boot 3.1.5
- Redis
- Gradle
- Docker

## 프로젝트 구조

```
src/main/java/com/example/redis/
├── RedisApplication.java
├── config/
│   └── RedisConfig.java
├── controller/
│   └── RedisController.java
└── service/
    └── RedisService.java
```

## Redis 설정

`application.properties` 파일의 Redis 설정:

```properties
# Redis 설정
spring.data.redis.host=localhost
spring.data.redis.port=6379
spring.data.redis.password=yourpassword
spring.data.redis.connect-timeout=5000

# Redis 커넥션 풀 설정
spring.data.redis.lettuce.pool.max-active=8
spring.data.redis.lettuce.pool.max-idle=8
spring.data.redis.lettuce.pool.min-idle=0
spring.data.redis.lettuce.pool.max-wait=-1

# 서버 포트 설정
server.port=8080
```

## 실행 방법

### 1. Redis 도커 컨테이너 실행

```powershell
docker-compose up -d
```

### 2. Redis 컨테이너 상태 확인

```powershell
docker ps
```

### 3. Redis CLI로 접속하여 테스트

```powershell
docker exec -it redis-sample redis-cli
```

Redis CLI에서 비밀번호 인증:
```
auth yourpassword
```

### 4. 스프링부트 애플리케이션 실행

```powershell
./gradlew bootRun
```

## API 테스트

### 1. 값 저장
```powershell
Invoke-RestMethod -Method Post -Uri "http://localhost:8080/api/redis/test-key" -Body "Hello Redis" -ContentType "text/plain"
```

### 2. 값 조회
```powershell
Invoke-RestMethod -Method Get -Uri "http://localhost:8080/api/redis/test-key"
```

### 3. 만료 시간이 있는 값 저장
```powershell
Invoke-RestMethod -Method Post -Uri "http://localhost:8080/api/redis/expire-key/expire?timeout=60&unit=SECONDS" -Body "Expiring Value" -ContentType "text/plain"
```

### 4. 값 삭제
```powershell
Invoke-RestMethod -Method Delete -Uri "http://localhost:8080/api/redis/test-key"
```

### 5. 키 존재 여부 확인
```powershell
Invoke-RestMethod -Method Get -Uri "http://localhost:8080/api/redis/test-key/exists"
```

## 컨테이너 중지

Redis 컨테이너를 중지하려면 다음 명령어를 실행하세요:

```powershell
docker-compose down
```

## API 엔드포인트

- POST `/api/redis/{key}`: 값 저장
- POST `/api/redis/{key}/expire`: 만료 시간이 있는 값 저장
- GET `/api/redis/{key}`: 값 조회
- DELETE `/api/redis/{key}`: 값 삭제
- GET `/api/redis/{key}/exists`: 키 존재 여부 확인 