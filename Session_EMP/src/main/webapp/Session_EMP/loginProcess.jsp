<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
	// empno와 ename 들고오기.
	String empno = request.getParameter("empno");
	String ename = request.getParameter("ename");
	
	//
	String URL = "jdbc:mysql://localhost:3309/spring5fs";
	
	//
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		conn = DriverManager.getConnection(URL,"root","1234");
		
		String sql = "select * from emp where empno=? AND ename=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, empno);
		pstmt.setString(2, ename);
		
		rs = pstmt.executeQuery();
		
		if(rs.next()){
			session.setAttribute("userid", empno);
			session.setAttribute("ename", ename);
			response.sendRedirect("main.jsp");
		}else {
			response.sendRedirect("login.jsp");
		}
	}catch (Exception e){ e.printStackTrace(); }
	
%>