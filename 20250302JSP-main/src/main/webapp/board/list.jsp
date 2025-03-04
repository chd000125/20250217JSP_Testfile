<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>게시판</title>
</head>
<body>
    <h2>게시판</h2>
    <table border="1">
        <tr>
            <th>번호</th>
            <th>제목</th>
            <th>작성자</th>
            <th>작성일</th>
            <th>조회수</th>
        </tr>
        <c:forEach var="board" items="${list}">
        <tr>
            <td>${board.id}</td>
            <td><a href="view.do?id=${board.id}">${board.title}</a></td>
            <td>${board.writer}</td>
            <td><fmt:formatDate value="${board.regdate}" pattern="yyyy-MM-dd"/></td>
            <td>${board.viewcount}</td>
        </tr>
        </c:forEach>
    </table>
    <p><a href="write.do">글쓰기</a></p>
</body>
</html> 