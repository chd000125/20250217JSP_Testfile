<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="java.sql.*" %>
<%@ page import="util.DBConnection" %>
<%@ page import="java.io.File" %>

<%
    // 업로드 경로를 C드라이브로 변경
    String uploadPath = "C:/boardUpload";  // C드라이브에 boardUpload 폴더 생성 필요
    
    // 업로드 폴더가 없으면 생성
    File uploadDir = new File(uploadPath);
    if (!uploadDir.exists()) {
        uploadDir.mkdirs();
    }
    
    int size = 10 * 1024 * 1024; // 최대 10MB

    MultipartRequest multi = new MultipartRequest(request, uploadPath, size, "UTF-8", new DefaultFileRenamePolicy());

    String title = multi.getParameter("title");
    String writer = multi.getParameter("writer");
    String content = multi.getParameter("content");
    String filename = multi.getFilesystemName("file");
    File file = multi.getFile("file");
    long filesize = 0;
    if (file != null) {
        filesize = file.length();
    }

    Connection conn = null;
    PreparedStatement pstmt = null;
    
    try {
        conn = DBConnection.getConnection();
        String sql = "INSERT INTO board (title, writer, content, filename, filesize) VALUES (?, ?, ?, ?, ?)";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, title);
        pstmt.setString(2, writer);
        pstmt.setString(3, content);
        pstmt.setString(4, filename);
        pstmt.setLong(5, filesize);
        pstmt.executeUpdate();
        
        response.sendRedirect("list.jsp");
    } catch(Exception e) {
        e.printStackTrace();
    } finally {
        if(pstmt != null) pstmt.close();
        if(conn != null) conn.close();
    }
%> 