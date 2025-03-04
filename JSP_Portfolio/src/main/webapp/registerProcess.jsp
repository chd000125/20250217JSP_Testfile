<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="DTO.userDTO, DAO.userDAO" %>

<%
request.setCharacterEncoding("UTF-8");

// 회원가입 폼에서 보낸 데이터 받기
String userId = request.getParameter("userId");
String nickname = request.getParameter("nickname");
String userPw = request.getParameter("userPw");
String userEm = request.getParameter("userEm");

// userDTO 객체에 데이터 저장
userDTO user = new userDTO(userId, nickname, userPw, userEm);

// DAO 객체 생성
userDAO dao = new userDAO();

try {
    dao.register(user);
    out.println("<script>alert('회원가입이 완료되었습니다.'); location.href='login.jsp';</script>");
} catch (Exception e) {
    e.printStackTrace();
    out.println("<script>alert('회원가입 중 오류가 발생했습니다.'); history.back();</script>");
}
%>
