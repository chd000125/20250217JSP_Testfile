<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>글쓰기</title>
</head>
<body>
    <h2>글쓰기</h2>
    <form action="write.do" method="post">
        <p>제목: <input type="text" name="title" required></p>
        <p>작성자: <input type="text" name="writer" required></p>
        <p>내용: <textarea name="content" rows="10" cols="50" required></textarea></p>
        <p>
            <button type="submit">저장</button>
            <button type="button" onclick="location.href='list.do'">취소</button>
        </p>
    </form>
</body>
</html> 