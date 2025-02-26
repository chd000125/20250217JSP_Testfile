<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="util.DatabaseUtil"%>
<%
    if(session.getAttribute("username") == null) {
        response.sendRedirect("../login.jsp");
        return;
    }
    
    String idStr = request.getParameter("id");
    
    Connection conn = null;
    PreparedStatement pstmt = null;
    
    try {
        conn = DatabaseUtil.getConnection();
        String sql = "DELETE FROM board WHERE id = ? AND writer = ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setInt(1, Integer.parseInt(idStr));
        pstmt.setString(2, (String)session.getAttribute("username"));
        
        int result = pstmt.executeUpdate();
        
        if(result > 0) {
            response.sendRedirect("list.jsp");
        } else {
            out.println("<script>alert('삭제에 실패했습니다.'); history.back();</script>");
        }
    } catch(Exception e) {
        e.printStackTrace();
        out.println("<script>alert('오류가 발생했습니다.'); history.back();</script>");
    } finally {
        if(pstmt != null) try { pstmt.close(); } catch(Exception e) {}
        if(conn != null) try { conn.close(); } catch(Exception e) {}
    }
%> 