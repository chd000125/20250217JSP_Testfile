<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
String URL = "jdbc:mysql://localhost:3309/spring5fs";
String sql = "select * from dept where deptno = "+request.getParameter("deptno");
int deptno = 0;
String dname = "";
String loc = "";
String user = "root", pw = "1234";
Class.forName("com.mysql.cj.jdbc.Driver");
System.out.println("드라이버 로딩");
try (Connection conn = DriverManager.getConnection(URL, user, pw);
		Statement stmt = conn.createStatement();	
		ResultSet rs = stmt.executeQuery(sql);
){
	if(rs.next()){
		deptno = rs.getInt("deptno");
		dname = rs.getString("dname");
		loc = rs.getString("loc");
		// system.out.println(deptno + ", " + dname + ", " + loc);
	}
	
}catch(Exception e){
	e.printStackTrace();
}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="updateDept.jsp">
	번호 : <input type="text" name = "deptno" value="<%=deptno %>" /><br>
	부서 : <input type="text" name = "dname"  value="<%=dname %>"  /><br>
	도시 : <input type="text" name = "loc"    value="<%=loc %>"  /><br>
	<input type="submit" value="수정" />
</form>
</body>
</html>