<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>로그인</title>
    <link rel="stylesheet" type="text/css" href="css/loginStyle.css">
</head>
<body>
    <h2>로그인</h2>
    <form action="loginProcess.jsp" method="post">
    아이디: <input type="text" name="userId" required><br>
    비밀번호: <input type="password" name="userPw" required><br>
    <input type="submit" value="로그인">
</form>

    <a href="register.jsp">회원가입</a>
</body>
</html>
