<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp" %>

<h2>회원 수정</h2>

<form action="/members/${member.id}/edit" method="post">
    <div class="mb-3">
        <label for="name" class="form-label">이름</label>
        <input type="text" class="form-control" id="name" name="name" value="${member.name}" required>
    </div>
    <div class="mb-3">
        <label for="email" class="form-label">이메일</label>
        <input type="email" class="form-control" id="email" name="email" value="${member.email}" required>
    </div>
    <div class="mt-3">
        <button type="submit" class="btn btn-primary">수정</button>
        <a href="/members/${member.id}" class="btn btn-secondary">취소</a>
    </div>
</form>

<%@ include file="../layout/footer.jsp" %> 