<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="util.DBConnection" %>

<%
    String id = request.getParameter("id");
    
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    
    try {
        conn = DBConnection.getConnection();
        
        // 파일 정보 조회
        String sql = "SELECT filename FROM board WHERE board_id = ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, id);
        rs = pstmt.executeQuery();
        
        if(rs.next()) {
            String filename = rs.getString("filename");
            if(filename != null) {
                // 실제 파일 삭제
                String uploadPath = "C:/boardUpload";
                File file = new File(uploadPath + File.separator + filename);
                if(file.exists()) file.delete();
            }
        }
        
        // DB에서 게시글 삭제
        sql = "DELETE FROM board WHERE board_id = ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, id);
        pstmt.executeUpdate();
        
        response.sendRedirect("list.jsp");
        
    } catch(Exception e) {
        e.printStackTrace();
    } finally {
        if(rs != null) rs.close();
        if(pstmt != null) pstmt.close();
        if(conn != null) conn.close();
    }
%> 