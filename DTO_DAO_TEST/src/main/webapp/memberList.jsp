<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.MemberDAO" %>
<%@ page import="dto.MemberDTO" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원 목록</title>
    <style>
        table { width: 100%; border-collapse: collapse; }
        th, td { padding: 8px; text-align: left; border-bottom: 1px solid #ddd; }
    </style>
</head>
<body>
    <h2>회원 목록</h2>
    <a href="memberForm.jsp">새 회원 등록</a>
    <table>
        <tr>
            <th>ID</th>
            <th>이름</th>
            <th>이메일</th>
            <th>가입일</th>
            <th>관리</th>
        </tr>
        <%
            MemberDAO dao = new MemberDAO();
            List<MemberDTO> memberList = dao.getAllMembers();
            for(MemberDTO member : memberList) {
        %>
        <tr>
            <td><%=member.getId()%></td>
            <td><%=member.getName()%></td>
            <td><%=member.getEmail()%></td>
            <td><%=member.getRegDate()%></td>
            <td>
                <a href="memberView.jsp?id=<%=member.getId()%>">상세</a>
                <a href="memberUpdateForm.jsp?id=<%=member.getId()%>">수정</a>
                <a href="memberDelete.jsp?id=<%=member.getId()%>" onclick="return confirm('정말 삭제하시겠습니까?')">삭제</a>
            </td>
        </tr>
        <%
            }
        %>
    </table>
</body>
</html> 