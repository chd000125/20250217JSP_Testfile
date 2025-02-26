<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="util.DatabaseUtil"%>
<%
    // 페이징 처리
    int pageSize = 3; // 한 페이지에 보여줄 게시글 수
    int pageNum = 1; // 기본 페이지 번호
    
    // 페이지 번호가 전달되었다면 해당 값으로 설정
    String pageNumStr = request.getParameter("pageNum");
    if(pageNumStr != null) {
        pageNum = Integer.parseInt(pageNumStr);
    }
    
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    
    try {
        conn = DatabaseUtil.getConnection();
        
        // 전체 게시글 수 조회
        String countSql = "SELECT COUNT(*) FROM board";
        pstmt = conn.prepareStatement(countSql);
        rs = pstmt.executeQuery();
        rs.next();
        int totalCount = rs.getInt(1);
        int totalPages = (totalCount + pageSize - 1) / pageSize;
        
        // 게시글 목록 조회
        String sql = "SELECT b.*, u.name FROM board b JOIN users u ON b.writer = u.username ORDER BY b.id DESC LIMIT ?, ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setInt(1, (pageNum - 1) * pageSize);
        pstmt.setInt(2, pageSize);
        rs = pstmt.executeQuery();
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>게시판</title>
    <link rel="stylesheet" href="../css/style.css">
</head>
<body>
    <div class="board-container">
        <div class="board-header">
            <h2>게시판</h2>
            <div class="board-nav">
                <a href="../index.jsp">홈</a>
                <a href="list.jsp">게시판</a>
                <% if(session.getAttribute("username") != null) { %>
                    <a href="write.jsp">글쓰기</a>
                <% } %>
            </div>
        </div>
        
        <table class="board-table">
            <thead>
                <tr>
                    <th>번호</th>
                    <th>제목</th>
                    <th>작성자</th>
                    <th>작성일</th>
                    <th>조회수</th>
                </tr>
            </thead>
            <tbody>
                <% while(rs.next()) { %>
                <tr>
                    <td><%=rs.getInt("id")%></td>
                    <td><a href="view.jsp?id=<%=rs.getInt("id")%>"><%=rs.getString("title")%></a></td>
                    <td><%=rs.getString("name")%></td>
                    <td><%=rs.getTimestamp("regdate")%></td>
                    <td><%=rs.getInt("viewcount")%></td>
                </tr>
                <% } %>
            </tbody>
        </table>
        
        <!-- 페이징 -->
        <div class="pagination">
            <% if(pageNum > 1) { %>
                <a href="?pageNum=<%=pageNum-1%>">&lt;</a>
            <% } %>
            
            <% for(int i=1; i<=totalPages; i++) { %>
                <a href="?pageNum=<%=i%>" <%=pageNum==i?"class='active'":""%>><%=i%></a>
            <% } %>
            
            <% if(pageNum < totalPages) { %>
                <a href="?pageNum=<%=pageNum+1%>">&gt;</a>
            <% } %>
        </div>
    </div>
</body>
</html>
<%
    } catch(Exception e) {
        e.printStackTrace();
    } finally {
        if(rs != null) try { rs.close(); } catch(Exception e) {}
        if(pstmt != null) try { pstmt.close(); } catch(Exception e) {}
        if(conn != null) try { conn.close(); } catch(Exception e) {}
    }
%> 