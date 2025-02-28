<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원 등록</title>
    <style>
        .form-group { margin-bottom: 15px; }
        label { display: inline-block; width: 100px; }
    </style>
</head>
<body>
    <h2>회원 등록</h2>
    <form action="memberInsert.jsp" method="post">
        <div class="form-group">
            <label>아이디:</label>
            <input type="text" name="id" required>
        </div>
        <div class="form-group">
            <label>비밀번호:</label>
            <input type="password" name="password" required>
        </div>
        <div class="form-group">
            <label>이름:</label>
            <input type="text" name="name" required>
        </div>
        <div class="form-group">
            <label>이메일:</label>
            <input type="email" name="email" required>
        </div>
        <button type="submit">등록</button>
        <button type="button" onclick="location.href='memberList.jsp'">취소</button>
    </form>
</body>
</html> 