<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="loginResult.jsp">
	ID :       <input type="text" name="ID"/><br>
	EMAIL :    <input type="email" name="email"/><br>
	PASSWORD : <input type="password" name="password"/><br>
	성별 :
	남성<input type="radio" name = "gender" value = "male">
	여성<input type="radio" name = "gender" value = "female"><br>
	<input type="submit" value = "회원가입">
	</form>
</body>
</html>