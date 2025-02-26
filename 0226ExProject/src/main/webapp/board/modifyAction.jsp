<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="util.DBConnection" %>

<%
    String uploadPath = "C:/boardUpload";
    int size = 10 * 1024 * 1024;

    MultipartRequest multi = new MultipartRequest(request, uploadPath, size, "UTF-8", new DefaultFileRenamePolicy());

    String id = multi.getParameter("id");
    String title = multi.getParameter("title");
    String writer = multi.getParameter("writer");
    String content = multi.getParameter("content");
    String deleteFile = multi.getParameter("deleteFile");
    File file = multi.getFile("file");
    
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    
    try {
        conn = DBConnection.getConnection();
        
        // 기존 파일 정보 조회
        String sql = "SELECT filename FROM board WHERE board_id = ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, id);
        rs = pstmt.executeQuery();
        
        String oldFilename = null;
        if(rs.next()) {
            oldFilename = rs.getString("filename");
        }
        
        // 파일 처리
        String filename = null;
        long filesize = 0;
        
        if(file != null) {  // 새 파일이 업로드된 경우
            filename = multi.getFilesystemName("file");
            filesize = file.length();
            // 기존 파일 삭제
            if(oldFilename != null) {
                File oldFile = new File(uploadPath + File.separator + oldFilename);
                if(oldFile.exists()) oldFile.delete();
            }
        } else if("1".equals(deleteFile)) {  // 파일 삭제가 체크된 경우
            if(oldFilename != null) {
                File oldFile = new File(uploadPath + File.separator + oldFilename);
                if(oldFile.exists()) oldFile.delete();
            }
        } else {  // 파일 변경이 없는 경우
            filename = oldFilename;
        }
        
        // DB 업데이트
        sql = "UPDATE board SET title=?, writer=?, content=?, filename=?, filesize=? WHERE board_id=?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, title);
        pstmt.setString(2, writer);
        pstmt.setString(3, content);
        pstmt.setString(4, filename);
        pstmt.setLong(5, filesize);
        pstmt.setString(6, id);
        pstmt.executeUpdate();
        
        response.sendRedirect("view.jsp?id=" + id);
        
    } catch(Exception e) {
        e.printStackTrace();
    } finally {
        if(rs != null) rs.close();
        if(pstmt != null) pstmt.close();
        if(conn != null) conn.close();
    }
%> 