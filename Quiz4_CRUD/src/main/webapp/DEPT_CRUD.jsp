<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
<%
	// JDBC 연결
	String URL ="jdbc:mysql://localhost:3309/spring5fs";
	String sql =""; // 기능마다 sql문을 따로 쓸 것 이므로 null로 초기화
	Class.forName("com.mysql.cj.jdbc.Driver");
	// 변수 초기화
	String action = request.getParameter("action");
	String dname = request.getParameter("dname");
	String loc = request.getParameter("loc");
	String deptno = request.getParameter("deptno");
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;	
	// 버튼 기능 구현 (if)
	if (action == null){
		sql = "select * from dept"; }
	else if (action.equals("create")){
		sql = "insert into dept (deptno, dname, loc) values (?, ?, ?)";}
	else if (action.equals("update")){
		sql = "update dept set dname = ?, loc = ?, where deptno = ?";}
	else if (action.equals("delete")){
		sql = "delete from dept where deptno = ?";
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%// 테이블 리스트 %>
<table border="1">
<%
try {conn = DriverManager.getConnection(URL, "root", "1234");
     pstmt = conn.prepareStatement(sql);
     rs = pstmt.executeQuery();  // try-with-resources에서 여는 중괄호 { 가 필요함.
    while (rs.next()) {
%>
<tr>
    <td><%= rs.getInt("deptno") %></td>
    <td><%= rs.getString("dname") %></td>
    <td><%= rs.getString("loc") %></td>
    <td><input class ="edit" type="button" value="수정" /></td>
    <td><input class = "del" type="button" value="삭제" /></td>
</tr>
<%  } // while 루프 닫기
     } catch (Exception e) {
    e.printStackTrace();
}
%>
</table>
</body>
</html>