# 스프링부트 인터셉터 예제

이 프로젝트는 스프링부트에서 인터셉터를 사용하여 로그인 체크와 페이지 접근 제어를 구현한 예제입니다.

## 기술 스택
- Java 11
- Spring Boot 2.7.18
- Gradle
- JSP
- Bootstrap 5.1.3

## 주요 기능
1. 로그인 체크 인터셉터
2. 로깅 인터셉터
3. 페이지 접근 제어
4. 세션 기반 인증

## 실행 방법
1. 프로젝트를 IDE에서 실행
2. 브라우저에서 `http://localhost:8081` 접속

## 테스트 계정
- 아이디: `test`
- 비밀번호: `test1234`

## 사용 방법

### 로그인하지 않은 상태
1. 홈페이지(`/`)와 로그인 페이지(`/login`)만 접근 가능
2. 소개 페이지(`/about`) 접근 시도 시 자동으로 로그인 페이지로 리다이렉트
3. 로그인 페이지에서 테스트 계정으로 로그인

### 로그인한 상태
1. 모든 페이지 접근 가능
2. 네비게이션 바에 로그인한 사용자 이름 표시
3. 로그아웃 버튼으로 세션 종료 가능

## 인터셉터 동작 확인
- 모든 페이지 접근 시 콘솔에서 로그 확인 가능
- 로그인 체크 인터셉터가 동작하는 것을 로그를 통해 확인 가능
- 로그인하지 않은 상태에서 보호된 페이지 접근 시 로그인 페이지로 리다이렉트되는 것을 확인 가능

## 로그인 프로세스
1. 로그인하지 않은 상태에서 보호된 페이지 접근 시도
2. 로그인 체크 인터셉터가 세션 확인
3. 로그인 페이지로 리다이렉트
4. 테스트 계정으로 로그인
5. 로그인 성공 시 원래 접근하려던 페이지로 자동 이동

## 프로젝트 구조
```
src/main/java/com/example/interceptor/
├── InterceptorApplication.java
├── config/
│   ├── LoggingInterceptor.java
│   ├── LoginCheckInterceptor.java
│   └── WebConfig.java
└── controller/
    ├── HomeController.java
    └── LoginController.java

src/main/webapp/WEB-INF/views/
├── header.jsp
├── footer.jsp
├── home.jsp
├── about.jsp
└── login.jsp
```

## 참고사항
- 이 예제는 실제 데이터베이스 연동 없이 하드코딩된 테스트 계정을 사용합니다.
- 실제 프로덕션 환경에서는 보안을 강화하고 데이터베이스 연동이 필요합니다. 