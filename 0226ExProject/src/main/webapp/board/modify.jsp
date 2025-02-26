<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="util.DBConnection" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>게시글 수정</title>
    <style>
        table { width: 100%; border-collapse: collapse; }
        th, td { padding: 8px; border: 1px solid #ddd; }
        th { background-color: #f4f4f4; width: 120px; }
        .button-group { margin-top: 20px; }
        input[type="text"] { width: 90%; padding: 5px; }
        textarea { width: 90%; padding: 5px; }
    </style>
</head>
<body>
    <%
        String id = request.getParameter("id");
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        
        try {
            conn = DBConnection.getConnection();
            String sql = "SELECT * FROM board WHERE board_id = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, id);
            rs = pstmt.executeQuery();
            
            if(rs.next()) {
    %>
    <h2>게시글 수정</h2>
    <form action="modifyAction.jsp" method="post" enctype="multipart/form-data">
        <input type="hidden" name="id" value="<%=rs.getInt("board_id")%>">
        <table>
            <tr>
                <th>제목</th>
                <td><input type="text" name="title" value="<%=rs.getString("title")%>" required></td>
            </tr>
            <tr>
                <th>작성자</th>
                <td><input type="text" name="writer" value="<%=rs.getString("writer")%>" required></td>
            </tr>
            <tr>
                <th>내용</th>
                <td><textarea name="content" rows="10"><%=rs.getString("content")%></textarea></td>
            </tr>
            <tr>
                <th>현재 파일</th>
                <td>
                    <% if(rs.getString("filename") != null) { %>
                        <%=rs.getString("filename")%>
                        <input type="checkbox" name="deleteFile" value="1"> 파일 삭제
                    <% } else { %>
                        첨부된 파일 없음
                    <% } %>
                </td>
            </tr>
            <tr>
                <th>새 파일</th>
                <td><input type="file" name="file"></td>
            </tr>
        </table>
        <div class="button-group">
            <input type="submit" value="수정하기">
            <input type="button" value="취소" onclick="history.back()">
        </div>
    </form>
    <%
            }
        } catch(Exception e) {
            e.printStackTrace();
        } finally {
            if(rs != null) rs.close();
            if(pstmt != null) pstmt.close();
            if(conn != null) conn.close();
        }
    %>
</body>
</html> 