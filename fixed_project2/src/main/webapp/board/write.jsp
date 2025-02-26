<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    if(session.getAttribute("username") == null) {
        response.sendRedirect("../login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>글쓰기</title>
    <link rel="stylesheet" href="../css/style.css">
</head>
<body>
    <div class="board-container">
        <div class="board-header">
            <h2>글쓰기</h2>
            <div class="board-nav">
                <a href="../index.jsp">홈</a>
                <a href="list.jsp">게시판</a>
            </div>
        </div>
        <form action="writeAction.jsp" method="post">
            <div class="form-group">
                <input type="text" name="title" placeholder="제목" required>
            </div>
            <div class="form-group">
                <textarea name="content" placeholder="내용" required></textarea>
            </div>
            <div class="board-buttons">
                <button type="submit">등록</button>
                <a href="list.jsp" class="btn">취소</a>
            </div>
        </form>
    </div>
</body>
</html> 