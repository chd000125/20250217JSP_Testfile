CREATE DATABASE jsp_company;
USE jsp_company;

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(100) NOT NULL,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(100)
);

-- 테스트용 계정 생성 (비밀번호: test123)
INSERT INTO users (username, password, name, email) 
VALUES ('test', 'test123', '테스트', 'test@test.com');

CREATE TABLE board (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(200) NOT NULL,
    content TEXT NOT NULL,
    writer VARCHAR(50) NOT NULL,
    regdate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    viewcount INT DEFAULT 0,
    FOREIGN KEY (writer) REFERENCES users(username)
);

-- 테스트용 게시글 추가
INSERT INTO board (title, content, writer) VALUES 
('테스트 게시글 1', '테스트 내용입니다 1', 'test'),
('테스트 게시글 2', '테스트 내용입니다 2', 'test'),
('테스트 게시글 3', '테스트 내용입니다 3', 'test'); 