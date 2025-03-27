# 스프링부트 MSA 프로젝트

## 프로젝트 소개
이 프로젝트는 스프링부트 3.1.5를 기반으로 한 마이크로서비스 아키텍처(MSA) 예제입니다.

## 기술 스택
- Spring Boot 3.1.5
- JDK 17
- Gradle
- Spring Cloud Gateway
- Eureka Server
- H2 Database
- JavaScript (Frontend)

## 프로젝트 구조
```
sb3_msa3/
├── gateway-service (포트: 8000)
├── eureka-server (포트: 8761)
├── product-service (포트: 8001)
└── order-service (포트: 8002)
```

## 서비스 설명
1. Gateway Service (8000)
   - API Gateway 역할
   - 프론트엔드 UI 제공
   - 서비스 라우팅

2. Eureka Server (8761)
   - 서비스 디스커버리
   - 서비스 등록/관리

3. Product Service (8001)
   - 상품 관리 서비스
   - CRUD API 제공

4. Order Service (8002)
   - 주문 관리 서비스
   - CRUD API 제공

## 실행 방법
1. 프로젝트 클론
2. 각 서비스 디렉토리에서 다음 명령어 실행:
   ```bash
   ./gradlew bootRun
   ```
3. 브라우저에서 http://localhost:8000 접속

## API 엔드포인트
### Product Service
- GET /api/products - 상품 목록 조회
- GET /api/products/{id} - 상품 상세 조회
- POST /api/products - 상품 등록
- PUT /api/products/{id} - 상품 수정
- DELETE /api/products/{id} - 상품 삭제

### Order Service
- GET /api/orders - 주문 목록 조회
- GET /api/orders/{id} - 주문 상세 조회
- POST /api/orders - 주문 등록
- PUT /api/orders/{id} - 주문 수정
- DELETE /api/orders/{id} - 주문 삭제 