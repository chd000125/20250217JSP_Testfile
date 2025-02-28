<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="DTO.boardDTO" %>
<%@ page import="DAO.boardDAO" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>글 작성 완료</title>
</head>
<body>
    <header>
        <h1>글 작성 완료</h1>
    </header>
    <div class="container">
        <%
            // 사용자 입력값 가져오기
            int id = Integer.parseInt(request.getParameter("id"));
            String title = request.getParameter("title");
            String content = request.getParameter("content");
            int price = Integer.parseInt(request.getParameter("price"));
            int seller_id = Integer.parseInt(request.getParameter("seller_id"));
            
            // boardDTO 객체 생성
            boardDTO newBoard = new boardDTO(id, title, content, price, seller_id);

            // boardDAO 객체를 사용하여 글 저장
            boardDAO dao = new boardDAO();
            boolean isInserted = dao.createBoard(newBoard);
            
            // 글 저장 결과 확인
            if (isInserted) {
                out.println("<p>글이 성공적으로 작성되었습니다.</p>");
                out.println("<a href='index.jsp'>메인 페이지로 돌아가기</a>");
            } else {
                out.println("<p>글 작성에 실패했습니다. 다시 시도해 주세요.</p>");
            }
        %>
    </div>
</body>
</html>
