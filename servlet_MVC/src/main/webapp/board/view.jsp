<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>글 보기</title>
</head>
<body>
    <h2>글 보기</h2>
    <table border="1">
        <tr>
            <th>제목</th>
            <td>${board.title}</td>
        </tr>
        <tr>
            <th>작성자</th>
            <td>${board.writer}</td>
        </tr>
        <tr>
            <th>작성일</th>
            <td><fmt:formatDate value="${board.regdate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
        </tr>
        <tr>
            <th>조회수</th>
            <td>${board.viewcount}</td>
        </tr>
        <tr>
            <th>내용</th>
            <td>${board.content}</td>
        </tr>
    </table>
    <p>
        <button onclick="location.href='edit.do?id=${board.id}'">수정</button>
        <button onclick="if(confirm('삭제하시겠습니까?')) location.href='delete.do?id=${board.id}'">삭제</button>
        <button onclick="location.href='list.do'">목록</button>
    </p>
</body>
</html> 