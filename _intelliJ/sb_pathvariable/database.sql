-- 데이터베이스 생성
CREATE DATABASE IF NOT EXISTS sb_pathvariable;
USE sb_pathvariable;

-- 회원 테이블 생성
CREATE TABLE IF NOT EXISTS member (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- 테스트 데이터 삽입
INSERT INTO member (name, email) VALUES
('김철수', 'kim@example.com'),
('이영희', 'lee@example.com'),
('박민수', 'park@example.com'),
('최지우', 'choi@example.com'),
('정수진', 'jung@example.com'); 