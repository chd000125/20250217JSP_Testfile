<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp" %>

<div class="container">
    <div class="row">
        <div class="col-md-12 text-center">
            <h1 class="display-1 text-danger">404</h1>
            <h2 class="mb-4">페이지를 찾을 수 없습니다</h2>
            <p class="lead">${errorMessage}</p>
            <a href="/" class="btn btn-primary">홈으로 돌아가기</a>
        </div>
    </div>
</div>

<%@ include file="../layout/footer.jsp" %> 