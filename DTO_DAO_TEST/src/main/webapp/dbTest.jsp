<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.MemberDAO" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>DB 연결 테스트</title>
</head>
<body>
    <h2>DB 연결 테스트</h2>
    <%
    	MemberDAO memberDAO = new MemberDAO();
        try {
        	Connection conn = memberDAO.connect(100);
            //Class.forName("com.mysql.cj.jdbc.Driver");
            //String url = "jdbc:mysql://localhost:3309/jspdb?useUnicode=true&characterEncoding=UTF-8&serverTimezone=Asia/Seoul";
            //Connection conn = DriverManager.getConnection(url, "root", "1234");
            
            if(conn != null) {
                out.println("<p style='color: green;'>데이터베이스 연결 성공!</p>");
                conn.close();
            }
        } catch(Exception e) {
            out.println("<p style='color: red;'>데이터베이스 연결 실패: " + e.getMessage() + "</p>");
            e.printStackTrace();
        }
    %>
</body>
</html> 