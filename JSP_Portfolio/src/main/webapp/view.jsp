<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="DAO.boardDAO, DTO.boardDTO" %>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    boardDAO boardDAO = new boardDAO();
    boardDTO board = boardDAO.getAllBoards(id);
%>
<!DOCTYPE html>
<html>
<head>
    <title><%= board.getTitle() %></title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
    <header>
        <h1>중고거래 마켓</h1>
    </header>

    <main>
        <h2><%= board.getTitle() %></h2>
        <p>가격: <%= board.getPrice() %>원</p>
        <p><%= board.getContent() %></p>
    </main>
</body>
</html>
