<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//사용자가 입력한 아이디와 비밀번호
	String userid = request.getParameter("userid");
	String password = request.getParameter("password");
	
	//실제 프로젝트에서는 DB에서 사용자 인증
	// 지금은 간단한 예시로 고정된 값 사용
	if( userid.equals("admin") && password.equals("1234")){
		//로그인 성공
		session.setAttribute("userid", userid);
		response.sendRedirect("main.jsp");
	}
	else {
		// 로그인 실패
		response.sendRedirect("main.jsp");
	}
%>