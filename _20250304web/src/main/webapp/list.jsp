<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>멤버목록</title>
</head>
<body>
    <h2>멤버목록</h2>
    <table border="1">
        <tr>
            <th>이름</th>
            <th>나이</th>
        </tr>
        <c:forEach var="member" items="${list}">
        <tr>
            <td>${member.username}</td>
            <td>${member.age}</td>
        </tr>
        </c:forEach>
    </table>
    <p><a href="index.do">처음으로</a></p>
</body>
</html> 