<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String userId = request.getParameter("userId");
    String userPw = request.getParameter("userPw");
    String rememberId = request.getParameter("rememberId");
    
    // 간단한 로그인 체크 (실제로는 DB 조회를 해야 함)
    if(userId.equals("admin") && userPw.equals("1234")) {
        // 로그인 성공 시 쿠키 생성
        Cookie loginCookie = new Cookie("loginId", userId);
        loginCookie.setMaxAge(60*60*24); // 24시간
        response.addCookie(loginCookie);
        
        // 아이디 기억하기 체크한 경우
        if(rememberId != null) {
            Cookie rememberCookie = new Cookie("rememberId", userId);
            //rememberCookie.setMaxAge(60*60*24*30); // 30일
            rememberCookie.setMaxAge(60); // 1분
            response.addCookie(rememberCookie);
        } else {
            Cookie rememberCookie = new Cookie("rememberId", "");
            rememberCookie.setMaxAge(0); // 쿠키 삭제
            response.addCookie(rememberCookie);
        }
        
        response.sendRedirect("main.jsp");
    } else {
        // 로그인 실패
%>
        <script>
            alert("아이디 또는 비밀번호가 일치하지 않습니다.");
            history.back();
        </script>
<%
    }
%> 