<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
Class.forName("com.mysql.cj.jdbc.Driver");
String URL = "jdbc:mysql://localhost:3309/spring5fs";
String sql = "select * from dept";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dept 내용</title>
</head>
<body>
<a href="formDept.jsp">dept 입력</a>
<table border="1">
<%
try(Connection conn = DriverManager.getConnection(URL, "root", "1234");
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		) {
	while(rs.next()) {
%>
<tr>
<td><%=rs.getString("deptno") %></td><td><%=rs.getString("dname") %></td><td><%=rs.getString("loc") %></td>
<tr>
<%
	}
} catch(Exception e) {
	e.printStackTrace();
}
%>
</table>
</body>
</html>