<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>로그인</title>
</head>
<body>
    <h2>로그인</h2>
    <form action="loginProcess.jsp" method="post">
        <p>
            아이디: <input type="text" name="userId">
        </p>
        <p>
            비밀번호: <input type="password" name="userPw">
        </p>
        <p>
            <input type="checkbox" name="rememberId"> 아이디 기억하기
        </p>
        <input type="submit" value="로그인">
    </form>
</body>
</html> 