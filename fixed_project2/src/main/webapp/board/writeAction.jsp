<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="util.DatabaseUtil"%>
<%
    request.setCharacterEncoding("UTF-8");
    
    if(session.getAttribute("username") == null) {
        response.sendRedirect("../login.jsp");
        return;
    }
    
    String title = request.getParameter("title");
    String content = request.getParameter("content");
    String writer = (String)session.getAttribute("username");
    
    Connection conn = null;
    PreparedStatement pstmt = null;
    
    try {
        conn = DatabaseUtil.getConnection();
        String sql = "INSERT INTO board (title, content, writer) VALUES (?, ?, ?)";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, title);
        pstmt.setString(2, content);
        pstmt.setString(3, writer);
        
        int result = pstmt.executeUpdate();
        
        if(result > 0) {
            response.sendRedirect("list.jsp");
        } else {
            out.println("<script>alert('글 작성에 실패했습니다.'); history.back();</script>");
        }
    } catch(Exception e) {
        e.printStackTrace();
        out.println("<script>alert('오류가 발생했습니다.'); history.back();</script>");
    } finally {
        if(pstmt != null) try { pstmt.close(); } catch(Exception e) {}
        if(conn != null) try { conn.close(); } catch(Exception e) {}
    }
%> 