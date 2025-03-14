# 스프링 빈 라이프사이클 데모

이 프로젝트는 스프링 부트에서 Bean의 라이프사이클을 시각적으로 보여주는 웹 애플리케이션입니다.

## 기술 스택

- Java 11
- Spring Boot 2.7.14
- JSP (Java Server Pages)
- Maven

## 주요 기능

1. 스프링 빈 라이프사이클 단계 시각화
   - 생성자 호출
   - 세터 주입
   - @PostConstruct 메서드 호출
   - InitializingBean 인터페이스 메서드 호출
   - 커스텀 초기화 메서드 호출
   - @PreDestroy 메서드 호출
   - DisposableBean 인터페이스 메서드 호출
   - 커스텀 소멸 메서드 호출

2. 스프링 컨텍스트 이벤트 모니터링
   - ContextRefreshedEvent
   - ContextStartedEvent
   - ContextStoppedEvent
   - ContextClosedEvent

3. 빈 상태 변경 및 모니터링
   - 빈 메시지 업데이트
   - 빈 상태 변경 로그 확인

## 프로젝트 구조

- `MyBean`: 다양한 라이프사이클 콜백을 구현한 빈 클래스
- `BeanConfig`: 커스텀 빈 설정 클래스
- `BeanLifecycleListener`: 스프링 컨텍스트 이벤트 리스너
- `BeanLifecycleService`: 빈 라이프사이클 로그 관리 서비스
- `BeanLifecycleController`: 웹 요청 처리 컨트롤러
- `home.jsp`: 메인 뷰 페이지

## 실행 방법

1. 프로젝트 클론
2. Maven으로 빌드:
   - `mvn clean package`
3. 애플리케이션 실행:
   - `java -jar target/bean-lifecycle-demo-0.0.1-SNAPSHOT.jar`
   - 또는 인텔리제이에서 `BeanLifecycleDemoApplication` 클래스를 실행
4. 웹 브라우저에서 접속: `http://localhost:8080`

## 라이프사이클 확인 방법

1. 애플리케이션 시작 시 콘솔에 출력되는 로그 확인
2. 웹 페이지에서 빈 라이프사이클 로그 확인
3. 빈 메시지 업데이트를 통해 세터 메서드 호출 확인
4. 애플리케이션 종료 시 소멸 관련 메서드 호출 확인 