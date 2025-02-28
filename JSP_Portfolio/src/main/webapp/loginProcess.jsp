<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="DAO.userDAO, DTO.userDTO" %>

<%
    if (request.getMethod().equals("POST")) {
        // 입력값 가져오기
        String userId = request.getParameter("userId");
        String userPw = request.getParameter("userPw");

        // DAO를 활용하여 로그인 처리
        userDAO dao = new userDAO();
        userDTO user = dao.login(userId, userPw);

        // 로그인 성공 여부 확인
        if (user != null) {
            session.setAttribute("user", user);
            response.sendRedirect("boardList.jsp"); // 로그인 성공 시 게시판 목록 페이지로 이동
        } else {
            out.println("<script>alert('로그인 실패: 아이디 또는 비밀번호를 확인하세요.'); history.back();</script>");
        }
    }
%>
