<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp" %>

<h2>회원 등록</h2>

<form action="/members" method="post">
    <div class="mb-3">
        <label for="name" class="form-label">이름</label>
        <input type="text" class="form-control" id="name" name="name" required>
    </div>
    <div class="mb-3">
        <label for="email" class="form-label">이메일</label>
        <input type="email" class="form-control" id="email" name="email" required>
    </div>
    <div class="mt-3">
        <button type="submit" class="btn btn-primary">등록</button>
        <a href="/members" class="btn btn-secondary">취소</a>
    </div>
</form>

<%@ include file="../layout/footer.jsp" %> 