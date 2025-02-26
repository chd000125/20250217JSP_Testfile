<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="util.DBConnection" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>게시판</title>
</head>
<body>
    <h2>게시판</h2>
    <table border="1">
        <tr>
            <th>번호</th>
            <th>제목</th>
            <th>작성자</th>
            <th>작성일</th>
            <th>첨부파일</th>
            <th>다운로드수</th>
        </tr>
        <%
            Connection conn = null;
            PreparedStatement pstmt = null;
            ResultSet rs = null;
            
            try {
                conn = DBConnection.getConnection();
                String sql = "SELECT * FROM board ORDER BY board_id DESC";
                pstmt = conn.prepareStatement(sql);
                rs = pstmt.executeQuery();
                
                while(rs.next()) {
        %>
        <tr>
            <td><%=rs.getInt("board_id")%></td>
            <td><a href="view.jsp?id=<%=rs.getInt("board_id")%>"><%=rs.getString("title")%></a></td>
            <td><%=rs.getString("writer")%></td>
            <td><%=rs.getString("reg_date")%></td>
            <td>
                <% if(rs.getString("filename") != null) { %>
                    <a href="download.jsp?id=<%=rs.getInt("board_id")%>"><%=rs.getString("filename")%></a>
                <% } %>
            </td>
            <td><%=rs.getInt("downloads")%></td>
        </tr>
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
    </table>
    <p><a href="write.jsp">글쓰기</a></p>
</body>
</html> 