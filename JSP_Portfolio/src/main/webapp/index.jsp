<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="DAO.boardDAO, DTO.boardDTO, java.util.List, DTO.userDTO" %>
<%
    // 게시글 목록 가져오기
    boardDAO boardDAO = new boardDAO();
    List<boardDTO> boardList = boardDAO.getAllBoards();

    // 로그인 여부 확인
    userDTO loginUser = (userDTO) session.getAttribute("loginUser");
%>
<!DOCTYPE html>
<html>
<head>
    <title>중고거래 사이트</title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
    <!-- 헤더 -->
    <header>
        <h1>중고거래 마켓</h1>
        <div class="header-buttons">
            <% if (loginUser != null) { // 로그인 상태 %>
                <span><strong><%= loginUser.getNickname() %></strong>님 환영합니다!</span>
                <a href="write.jsp">글쓰기</a>
                <a href="logout.jsp">로그아웃</a>
            <% } else { // 비로그인 상태 %>
                <a href="write.jsp">글쓰기</a>
                <a href="register.jsp">회원가입</a>
                <a href="login.jsp">로그인</a>
            <% } %>
        </div>
    </header>

    <!-- 게시판 목록 -->
    <main>
        <h2>상품 목록</h2>
        <div class="board-container">
            <% for (boardDTO board : boardList) { %>
                <div class="board-item">
                    <a href="view.jsp?id=<%= board.getId() %>">
                        <h3><%= board.getTitle() %></h3>
                        <p><%= board.getPrice() %>원</p>
                    </a>
                </div>
            <% } %>
        </div>
    </main>
</body>
</html>
