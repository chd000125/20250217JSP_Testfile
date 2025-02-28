<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.MemberDAO" %>
<%@ page import="dto.MemberDTO" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원 정보 수정</title>
    <style>
        .form-group { margin-bottom: 15px; }
        label { display: inline-block; width: 100px; }
    </style>
</head>
<body>
    <h2>회원 정보 수정</h2>
    <%
        String id = request.getParameter("id");
        MemberDAO dao = new MemberDAO();
        MemberDTO member = dao.getMember(id);
        
        if(member != null) {
    %>
    <form action="memberUpdate.jsp" method="post">
        <input type="hidden" name="id" value="<%=member.getId()%>">
        <div class="form-group">
            <label>아이디:</label>
            <span><%=member.getId()%></span>
        </div>
        <div class="form-group">
            <label>비밀번호:</label>
            <input type="password" name="password" required>
        </div>
        <div class="form-group">
            <label>이름:</label>
            <input type="text" name="name" value="<%=member.getName()%>" required>
        </div>
        <div class="form-group">
            <label>이메일:</label>
            <input type="email" name="email" value="<%=member.getEmail()%>" required>
        </div>
        <button type="submit">수정</button>
        <button type="button" onclick="location.href='memberList.jsp'">취소</button>
    </form>
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