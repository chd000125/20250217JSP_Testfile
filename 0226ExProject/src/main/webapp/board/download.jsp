<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="util.DBConnection" %>

<%
    String id = request.getParameter("id");
    
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    FileInputStream fis = null;
    ServletOutputStream sos = null;
    
    try {
        conn = DBConnection.getConnection();
        // downloads 카운트를 증가시키는 쿼리 추가
        String updateSql = "UPDATE board SET downloads = downloads + 1 WHERE board_id=?";
        pstmt = conn.prepareStatement(updateSql);
        pstmt.setString(1, id);
        pstmt.executeUpdate();
        pstmt.close();
        
        String sql = "SELECT filename FROM board WHERE board_id=?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, id);
        rs = pstmt.executeQuery();
        
        if(rs.next()) {
            String filename = rs.getString("filename");
            String uploadPath = "C:/boardUpload";  // C드라이브 경로로 변경
            File file = new File(uploadPath + File.separator + filename);
            
            if(file.exists()) {  // 파일이 존재하는지 확인
                byte[] b = new byte[4096];
                fis = new FileInputStream(file);
                
                String mimeType = getServletContext().getMimeType(file.toString());
                if(mimeType == null) {
                    mimeType = "application/octet-stream";
                }
                
                // 한글 파일명 처리
                String userAgent = request.getHeader("User-Agent");
                String encodedFilename;
                if (userAgent.contains("MSIE") || userAgent.contains("Trident")) {
                    encodedFilename = URLEncoder.encode(filename, "UTF-8").replaceAll("\\+", "%20");
                } else {
                    encodedFilename = new String(filename.getBytes("UTF-8"), "ISO-8859-1");
                }
                
                response.setContentType(mimeType);
                response.setHeader("Content-Disposition", "attachment; filename=" + encodedFilename);
                response.setHeader("Content-Length", String.valueOf(file.length()));
                
                sos = response.getOutputStream();
                int numRead;
                while((numRead = fis.read(b, 0, b.length)) != -1) {
                    sos.write(b, 0, numRead);
                }
                
                sos.flush();
            } else {
                response.setContentType("text/html; charset=UTF-8");
                out.println("<script>alert('파일이 존재하지 않습니다.'); history.back();</script>");
            }
        }
    } catch(Exception e) {
        e.printStackTrace();
    } finally {
        if(sos != null) sos.close();
        if(fis != null) fis.close();
        if(rs != null) rs.close();
        if(pstmt != null) pstmt.close();
        if(conn != null) conn.close();
    }
%> 