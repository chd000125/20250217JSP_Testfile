<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>글 수정</title>
</head>
<body>
    <h2>글 수정</h2>
    <form action="edit.do" method="post">
        <input type="hidden" name="id" value="${board.id}">
        <p>제목: <input type="text" name="title" value="${board.title}" required></p>
        <p>작성자: ${board.writer}</p>
        <p>내용: <textarea name="content" rows="10" cols="50" required>${board.content}</textarea></p>
        <p>
            <button type="submit">저장</button>
            <button type="button" onclick="location.href='view.do?id=${board.id}'">취소</button>
        </p>
    </form>
</body>
</html> 