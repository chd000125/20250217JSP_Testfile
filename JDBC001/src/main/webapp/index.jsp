<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String URL = "jdbc:mysql://localhost:3306/spring5fs";
	String user = "root", pw = "1234";
	Class.forName("com.mysql.cj.jdbc.Driver");
	System.out.println("드라이버 로딩");
	try (Connection conn = DriverManager.getConnection(URL, user, pw)){
		System.out.println("MYSQL 접속 성공");	
	}catch(Exception e){
		e.printStackTrace();
	}
	
%>
</body>
</html>