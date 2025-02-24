<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%
	// jdbc 연동에 필요한 정보
	String jdbcUrl = "jdbc:mysql://localhost:3309/spring5fs";
	String dbId = "root";
	String dbPass = "1234";
	
	//업로드 경로 변경
	String uploadPath = "C:/upload";
	
	//업로드 디렉토리가 없으면 생성
	File uploadDir = new File(uploadPath);
	if (!uploadDir.exists()){
		uploadDir.mkdirs();
	}
	
	int maxSize = 10 * 1024 * 1024; // 최대 10MB
	String encoding = "UTF-8";
	
	MultipartRequest multi = new MultipartRequest(request, uploadPath, maxSize,
			encoding, new DefaultFileRenamePolicy());
	
	String fileName = multi.getFilesystemName("image");
	String originalFileName = multi.getOriginalFileName("image");
	String title = request.getParameter("title");
	String price = request.getParameter("price");
	String content = request.getParameter("content");
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
		
		String sql = "INSERT INTO JSPportfolio_DB (title, price, original_file_name, upload_date) values (?, ?, ?, NOW()) ";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, title);
		pstmt.setString(2, price);
	    pstmt.setString(3, originalFileName);
	    
	    pstmt.executeUpdate();
	    
	    out.println("<script>alert('등록되었습니다.'); location.href='main.jsp;</script>");
	} catch(Exception e){
		out.println("오류 발생 : " + e.getMessage());
	} finally {
		if(pstmt != null) try { pstmt.close(); } catch(Exception e) {}
		if(conn != null) try {pstmt.close();} catch(Exception e) {}
	}
%>