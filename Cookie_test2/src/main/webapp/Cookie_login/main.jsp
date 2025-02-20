<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String loginId = null;
    Cookie[] cookies = request.getCookies();
    
    if(cookies != null) {
    	// 쿠키 찾기
        for(Cookie cookie : cookies) {
            if(cookie.getName().equals("loginId")) {
                loginId = cookie.getValue();
                break;
            }
        }
    }
    
    // 로그인 체크
    if(loginId == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>메인 페이지</title>
</head>
<body>
    <h2>메인 페이지</h2>
    <p><%=loginId%>님 환영합니다!</p>
    <a href="logout.jsp">로그아웃</a>
</body>
</html> 