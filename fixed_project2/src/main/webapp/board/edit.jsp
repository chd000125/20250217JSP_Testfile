<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="util.DatabaseUtil"%>
<%
    if(session.getAttribute("username") == null) {
        response.sendRedirect("../login.jsp");
        return;
    }
    
    String idStr = request.getParameter("id");
    if(idStr == null) {
        response.sendRedirect("list.jsp");
        return;
    }
    
    int id = Integer.parseInt(idStr);
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    
    try {
        conn = DatabaseUtil.getConnection();
        String sql = "SELECT * FROM board WHERE id = ? AND writer = ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setInt(1, id);
        pstmt.setString(2, (String)session.getAttribute("username"));
        rs = pstmt.executeQuery();
        
        if(rs.next()) {
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>글 수정</title>
    <link rel="stylesheet" href="../css/style.css">
</head>
<body>
    <div class="board-container">
        <div class="board-header">
            <h2>글 수정</h2>
            <div class="board-nav">
                <a href="../index.jsp">홈</a>
                <a href="list.jsp">게시판</a>
            </div>
        </div>
        <form action="editAction.jsp" method="post">
            <input type="hidden" name="id" value="<%=id%>">
            <div class="form-group">
                <input type="text" name="title" value="<%=rs.getString("title")%>" required>
            </div>
            <div class="form-group">
                <textarea name="content" required><%=rs.getString("content")%></textarea>
            </div>
            <div class="board-buttons">
                <button type="submit">수정</button>
                <a href="view.jsp?id=<%=id%>" class="btn">취소</a>
            </div>
        </form>
    </div>
</body>
</html>
<%
        } else {
            out.println("<script>alert('권한이 없습니다.'); history.back();</script>");
        }
    } catch(Exception e) {
        e.printStackTrace();
    } finally {
        if(rs != null) try { rs.close(); } catch(Exception e) {}
        if(pstmt != null) try { pstmt.close(); } catch(Exception e) {}
        if(conn != null) try { conn.close(); } catch(Exception e) {}
    }
%> 