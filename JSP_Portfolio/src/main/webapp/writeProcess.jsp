<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="DAO.boardDAO, DTO.boardDTO" %>

<%
    request.setCharacterEncoding("UTF-8");

    // 파라미터 받기
    String title = request.getParameter("title");
    String content = request.getParameter("content");
    int price = Integer.parseInt(request.getParameter("price"));
    String sellerId = request.getParameter("seller_id");

    // DTO에 담기
    boardDTO board = new boardDTO();
    board.setTitle(title);
    board.setContent(content);
    board.setPrice(price);
    board.setSellerId(sellerId);

    // DAO 저장 실행
    boardDAO dao = new boardDAO();
    dao.saveBoard(board);

    // 완료 후 메인페이지로 이동
    response.sendRedirect("index.jsp");
%>
