<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>로그인</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <div class="login-container">
        <h2>로그인</h2>
        <form action="loginAction.jsp" method="post">
            <div class="form-group">
                <input type="text" name="username" placeholder="아이디" required>
            </div>
            <div class="form-group">
                <input type="password" name="password" placeholder="비밀번호" required>
            </div>
            <button type="submit">로그인</button>
            <p class="login-link">계정이 없으신가요? <a href="join.jsp">회원가입</a></p>
        </form>
    </div>
</body>
</html> 