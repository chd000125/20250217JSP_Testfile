<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.MemberDAO" %>
<%@ page import="dto.MemberDTO" %>
<%
    request.setCharacterEncoding("UTF-8");
    
    String id = request.getParameter("id");
    String password = request.getParameter("password");
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    
    MemberDTO member = new MemberDTO();
    member.setId(id);
    member.setPassword(password);
    member.setName(name);
    member.setEmail(email);
    
    MemberDAO dao = new MemberDAO();
    boolean success = dao.updateMember(member);
    
    if(success) {
        response.sendRedirect("memberView.jsp?id=" + id);
    } else {
%>
    <script>
        alert("회원 정보 수정 실패");
        history.back();
    </script>
<%
    }
%> 