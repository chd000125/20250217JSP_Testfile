<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>회원가입</title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
    <h2>회원가입</h2>
    <form action="registerProcess.jsp" method="post">
    아이디: <input type="text" name="userId" required><br>
    닉네임: <input type="text" name="nickname" required><br>
    비밀번호: <input type="password" name="userPw" required><br>
    이메일: <input type="email" name="userEm" required><br>
    <input type="submit" value="회원가입">
</form>
    <a href="login.jsp">로그인</a>
</body>
</html>
