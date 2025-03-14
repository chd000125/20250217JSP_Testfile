# Spring Boot AOP 예제 프로젝트

이 프로젝트는 Spring Boot에서 AOP(Aspect-Oriented Programming)를 학습하기 위한 JSP 기반 웹 애플리케이션 예제입니다.

## 프로젝트 구조

- `UserController`: 사용자 관련 페이지를 제공하는 컨트롤러
- `UserService`: 비즈니스 로직을 처리하는 서비스
- `LoggingAspect`: 메서드 실행 시간을 측정하고 로깅하는 AOP Aspect
- JSP 뷰: 사용자 인터페이스를 제공하는 JSP 페이지들

## AOP 설명

이 프로젝트에서는 다음과 같은 AOP 기능을 구현했습니다:

1. 서비스 계층의 모든 메서드 실행 시간 측정
2. 메서드 실행 전/후 로깅

## 페이지 구성

- `/users/home`: 홈 페이지
- `/users/`: 사용자 목록 페이지
- `/users/{id}`: 사용자 정보 페이지
- `/users/{id}/details`: 사용자 상세 정보 페이지

## 실행 방법

```bash
./gradlew bootRun
```

웹 브라우저에서 다음 URL로 접속하세요: http://localhost:8989

## 요구사항

- Java 11
- Gradle 