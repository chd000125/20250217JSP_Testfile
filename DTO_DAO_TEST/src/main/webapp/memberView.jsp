<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.MemberDAO" %>
<%@ page import="dto.MemberDTO" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원 정보</title>
    <style>
        .info-group { margin-bottom: 15px; }
        label { display: inline-block; width: 100px; font-weight: bold; }
    </style>
</head>
<body>
    <h2>회원 정보</h2>
    <%
        String id = request.getParameter("id");
        MemberDAO dao = new MemberDAO();
        MemberDTO member = dao.getMember(id);
        
        if(member != null) {
    %>
    <div class="info-group">
        <label>아이디:</label>
        <span><%=member.getId()%></span>
    </div>
    <div class="info-group">
        <label>이름:</label>
        <span><%=member.getName()%></span>
    </div>
    <div class="info-group">
        <label>이메일:</label>
        <span><%=member.getEmail()%></span>
    </div>
    <div class="info-group">
        <label>가입일:</label>
        <span><%=member.getRegDate()%></span>
    </div>
    <button onclick="location.href='memberUpdateForm.jsp?id=<%=member.getId()%>'">수정</button>
    <button onclick="location.href='memberList.jsp'">목록</button>
    <%
        } else {
    %>
    <p>존재하지 않는 회원입니다.</p>
    <button onclick="location.href='memberList.jsp'">목록</button>
    <%
        }
    %>
</body>
</html> 