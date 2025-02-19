<%@page import="java.awt.print.PrinterException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
Class.forName("com.mysql.cj.jdbc.Driver");
String URL = "jdbc:mysql://localhost:3309/spring5fs";
String sql = "select * from emp";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EMP TABLE INFO</title>
</head>
<body>
<a href = "insert_emp.jsp">emp 추가</a>
<table border="1">
<tr>
<td>EMPNO</td><td>ENAME</td><td>JOB</td><td>MGR</td><td>HIREDATE</td><td>SAL</td><td>COMM</td><td>DEPTNO</td>
</tr>
<%
	try(Connection conn = DriverManager.getConnection(URL, "root", "1234");
	Statement stmt = conn.createStatement();
	ResultSet rs = stmt.executeQuery(sql);){
		while(rs.next()){
%>		
		<tr>
		<td><a href = "updateFormEmp.jsp"><%=rs.getInt("EMPNO") %></a>.
		</td><td><%=rs.getString("ENAME") %></td><td><%=rs.getString("JOB") %></td>
		<td><%=rs.getInt("MGR") %></td><td><%=rs.getString("HIREDATE") %></td><td><%=rs.getInt("SAL") %></td><td><%=rs.getInt("COMM") %></td>
		<td><%=rs.getInt("DEPTNO") %></td>
		</tr>
<%
		}
	}catch(Exception e){ e.printStackTrace();}
%>

</table>
</body>
</html>