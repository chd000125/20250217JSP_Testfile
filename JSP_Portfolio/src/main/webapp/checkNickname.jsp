<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>

<%
    String username = request.getParameter("username");
    if (username == null || username.trim().isEmpty()) {
        out.print("닉네임을 입력하세요.");
        return;
    }

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    String dbURL = "jdbc:mysql://localhost:3309/portfolio"; // DB URL 변경
    String dbUser = "root";
    String dbPassword = "1234";

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);
        String sql = "SELECT COUNT(*) FROM userInfo WHERE username = ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, username);
        rs = pstmt.executeQuery();

        if (rs.next() && rs.getInt(1) > 0) {
            out.print("이미 사용 중인 닉네임입니다.");
        } else {
            out.print("사용 가능한 닉네임입니다.");
        }
    } catch (Exception e) {
        out.print("오류 발생");
        e.printStackTrace();
    } finally {
        if (rs != null) try { rs.close(); } catch (Exception e) {}
        if (pstmt != null) try { pstmt.close(); } catch (Exception e) {}
        if (conn != null) try { conn.close(); } catch (Exception e) {}
    }
%>
