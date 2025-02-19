<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.time.* " %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% out.print("나온다"); %><br>
<% out.println(LocalDate.now()); %><br>
<% out.println(LocalTime.now()); %>
</body>
</html>