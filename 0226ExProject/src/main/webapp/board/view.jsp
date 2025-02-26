<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="util.DBConnection" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>게시글 상세보기</title>
    <style>
        table { width: 100%; border-collapse: collapse; }
        th, td { padding: 8px; border: 1px solid #ddd; }
        th { background-color: #f4f4f4; width: 120px; }
        .content { min-height: 200px; vertical-align: top; }
        .button-group { margin-top: 20px; }
        .button-group a { 
            text-decoration: none;
            padding: 5px 10px;
            background-color: #f4f4f4;
            border: 1px solid #ddd;
            margin-right: 10px;
        }
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
    <h2>게시글 상세보기</h2>
    <table>
        <tr>
            <th>제목</th>
            <td><%=rs.getString("title")%></td>
        </tr>
        <tr>
            <th>작성자</th>
            <td><%=rs.getString("writer")%></td>
        </tr>
        <tr>
            <th>작성일</th>
            <td><%=rs.getString("reg_date")%></td>
        </tr>
        <tr>
            <th>첨부파일</th>
            <td>
                <% if(rs.getString("filename") != null) { %>
                    <a href="download.jsp?id=<%=rs.getInt("board_id")%>">
                        <%=rs.getString("filename")%>
                    </a>
                    (다운로드 횟수: <%=rs.getInt("downloads")%>)
                <% } else { %>
                    첨부파일 없음
                <% } %>
            </td>
        </tr>
        <tr>
            <th>내용</th>
            <td class="content"><%=rs.getString("content").replace("\n", "<br>")%></td>
        </tr>
    </table>
    
    <div class="button-group">
        <a href="list.jsp">목록으로</a>
        <a href="modify.jsp?id=<%=rs.getInt("board_id")%>">수정</a>
        <a href="javascript:void(0);" onclick="deletePost(<%=rs.getInt("board_id")%>)">삭제</a>
    </div>

    <script>
        function deletePost(id) {
            if(confirm('정말 삭제하시겠습니까?')) {
                location.href = 'deleteAction.jsp?id=' + id;
            }
        }
    </script>
    
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