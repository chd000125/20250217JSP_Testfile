<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../layout/header.jsp" %>

<h2>회원 목록</h2>

<div class="table-responsive">
    <table class="table table-striped">
        <thead>
            <tr>
                <th>ID</th>
                <th>이름</th>
                <th>이메일</th>
                <th>가입일</th>
                <th>관리</th>
            </tr>
        </thead>
        <tbody>
            <c:if test="${not empty members}">
                <c:forEach items="${members}" var="member">
                    <tr>
                        <td>${member.id}</td>
                        <td>${member.name}</td>
                        <td>${member.email}</td>
                        <td>${member.createdAt}</td>
                        <td>
                            <a href="/members/${member.id}" class="btn btn-info btn-sm">상세</a>
                            <a href="/members/${member.id}/edit" class="btn btn-warning btn-sm">수정</a>
                            <form action="/members/${member.id}/delete" method="post" style="display: inline;">
                                <button type="submit" class="btn btn-danger btn-sm" onclick="return confirm('정말 삭제하시겠습니까?')">삭제</button>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </c:if>
            <c:if test="${empty members}">
                <tr>
                    <td colspan="5" class="text-center">등록된 회원이 없습니다.</td>
                </tr>
            </c:if>
        </tbody>
    </table>
</div>

<%@ include file="../layout/footer.jsp" %> 