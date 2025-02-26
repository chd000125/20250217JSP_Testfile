<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>게시글 작성</title>
</head>
<body>
    <h2>게시글 작성</h2>
    <form action="writeAction.jsp" method="post" enctype="multipart/form-data">
        <p>제목: <input type="text" name="title" required></p>
        <p>작성자: <input type="text" name="writer" required></p>
        <p>내용: <textarea name="content" rows="10" cols="50"></textarea></p>
        <p>파일: <input type="file" name="file"></p>
        <input type="submit" value="등록">
    </form>
</body>
</html> 