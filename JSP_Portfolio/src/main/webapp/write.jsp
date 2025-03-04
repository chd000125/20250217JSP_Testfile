<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="DTO.userDTO" %>

<%
    // 로그인 체크
    userDTO loginUser = (userDTO) session.getAttribute("loginUser");
    if (loginUser == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <title>게시글 작성</title>
    <link rel="stylesheet" href="css/writeStyle.css">
</head>
<body>
    <h1>게시글 작성</h1>
    <form action="writeProcess.jsp" method="POST">
        <div class="form-group">
            <label for="title">제목</label>
            <input type="text" id="title" name="title" required placeholder="제목을 입력하세요">
        </div>

        <div class="form-group">
            <label for="content">내용</label>
            <textarea id="content" name="content" rows="6" required placeholder="내용을 입력하세요"></textarea>
        </div>

        <div class="form-group">
            <label for="price">가격</label>
            <input type="number" id="price" name="price" required placeholder="가격을 입력하세요">
        </div>

        <input type="hidden" name="seller_id" value="<%= loginUser.getUserId() %>">

        <button type="submit">등록</button>
    </form>
</body>
</html>
