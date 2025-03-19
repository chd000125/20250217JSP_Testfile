<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp" %>

<h2>회원 상세 정보</h2>

<div class="card">
    <div class="card-body">
        <h5 class="card-title">회원 정보</h5>
        <table class="table">
            <tr>
                <th>ID</th>
                <td>${member.id}</td>
            </tr>
            <tr>
                <th>이름</th>
                <td>${member.name}</td>
            </tr>
            <tr>
                <th>이메일</th>
                <td>${member.email}</td>
            </tr>
            <tr>
                <th>가입일</th>
                <td>${member.createdAt}</td>
            </tr>
            <tr>
                <th>수정일</th>
                <td>${member.updatedAt}</td>
            </tr>
        </table>
    </div>
</div>

<div class="mt-3">
    <a href="/members/${member.id}/edit" class="btn btn-warning">수정</a>
    <a href="/members" class="btn btn-secondary">목록</a>
</div>

<%@ include file="../layout/footer.jsp" %> 