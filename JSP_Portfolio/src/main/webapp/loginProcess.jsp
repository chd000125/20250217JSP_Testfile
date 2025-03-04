<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="DTO.userDTO, DAO.userDAO" %>

<%
request.setCharacterEncoding("UTF-8");

// 폼에서 전송된 데이터 받기
String userId = request.getParameter("userId");
String userPw = request.getParameter("userPw");

// DAO 생성 및 로그인 처리
userDAO dao = new userDAO();
userDTO user = dao.login(userId, userPw);

if (user != null) {
    // 로그인 성공 (세션에 정보 저장)
    session.setAttribute("loginUser", user);
    out.println("<script>alert('로그인 성공!'); location.href='index.jsp';</script>");
} else {
    // 로그인 실패
    out.println("<script>alert('아이디 또는 비밀번호가 올바르지 않습니다.'); history.back();</script>");
}
%>
