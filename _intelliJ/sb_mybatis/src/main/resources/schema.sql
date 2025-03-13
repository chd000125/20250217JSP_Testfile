CREATE DATABASE IF NOT EXISTS mybatis_db;
USE mybatis_db;

CREATE TABLE IF NOT EXISTS board (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(200) NOT NULL,
    content TEXT NOT NULL,
    author VARCHAR(100) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NULL ON UPDATE CURRENT_TIMESTAMP
);

-- 테스트 데이터 삽입
INSERT INTO board (title, content, author) VALUES
('첫 번째 게시글입니다.', '안녕하세요. 첫 번째 게시글의 내용입니다.', '관리자'),
('두 번째 게시글입니다.', '안녕하세요. 두 번째 게시글의 내용입니다.', '홍길동'),
('세 번째 게시글입니다.', '안녕하세요. 세 번째 게시글의 내용입니다.', '테스터'); 