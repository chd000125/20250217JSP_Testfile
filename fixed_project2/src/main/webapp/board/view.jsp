<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="util.DatabaseUtil"%>
<%
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
        
        // 조회수 증가
        String updateSql = "UPDATE board SET viewcount = viewcount + 1 WHERE id = ?";
        pstmt = conn.prepareStatement(updateSql);
        pstmt.setInt(1, id);
        pstmt.executeUpdate();
        
        // 게시글 조회
        String sql = "SELECT b.*, u.name FROM board b JOIN users u ON b.writer = u.username WHERE b.id = ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setInt(1, id);
        rs = pstmt.executeQuery();
        
        if(rs.next()) {
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title><%=rs.getString("title")%></title>
    <link rel="stylesheet" href="../css/style.css">
</head>
<body>
    <div class="board-container">
        <div class="board-header">
            <h2><%=rs.getString("title")%></h2>
            <div class="board-nav">
                <a href="../index.jsp">홈</a>
                <a href="list.jsp">게시판</a>
                <% if(session.getAttribute("username") != null && 
                      session.getAttribute("username").equals(rs.getString("writer"))) { %>
                    <a href="edit.jsp?id=<%=id%>">수정</a>
                <% } %>
            </div>
        </div>
        <div class="board-info">
            <span>작성자: <%=rs.getString("name")%></span>
            <span>작성일: <%=rs.getTimestamp("regdate")%></span>
            <span>조회수: <%=rs.getInt("viewcount")%></span>
        </div>
        <div class="board-content">
            <%=rs.getString("content").replace("\n", "<br>")%>
        </div>
        <div class="board-buttons">
            <a href="list.jsp" class="btn">목록</a>
            <% if(session.getAttribute("username") != null && 
                  session.getAttribute("username").equals(rs.getString("writer"))) { %>
                <a href="javascript:void(0)" onclick="deletePost(<%=id%>)" class="btn">삭제</a>
            <% } %>
        </div>
    </div>
    <script>
        function deletePost(id) {
            if(confirm('정말 삭제하시겠습니까?')) {
                location.href = 'deleteAction.jsp?id=' + id;
            }
        }
    </script>
</body>
</html>
<%
        } else {
            out.println("<script>alert('존재하지 않는 게시글입니다.'); location.href='list.jsp';</script>");
        }
    } catch(Exception e) {
        e.printStackTrace();
    } finally {
        if(rs != null) try { rs.close(); } catch(Exception e) {}
        if(pstmt != null) try { pstmt.close(); } catch(Exception e) {}
        if(conn != null) try { conn.close(); } catch(Exception e) {}
    }
%> 