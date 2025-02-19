<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
String deptno = request.getParameter("deptno");
String dname = request.getParameter("dname");
String loc = request.getParameter("loc");
if (!"".equals(deptno)&&!"".equals(dname)&&!"".equals(loc)) {
String URL = "jdbc:mysql://localhost:3309/spring5fs";
String sql = "insert into dept(deptno, dname, loc) values (" + deptno + ", '" + dname +"', '" + loc + "')";
Class.forName("com.mysql.cj.jdbc.Driver");
out.println("드라이버 로딩!<br>");
try (Connection conn = DriverManager.getConnection(URL, "root", "1234");
	 Statement stmt = conn.createStatement();
		)
{
	out.println("Mysql 접속 성공!");
	stmt.executeUpdate(sql);
} catch(Exception e) {
	e.printStackTrace();
}
response.sendRedirect("index.jsp");
}
%>