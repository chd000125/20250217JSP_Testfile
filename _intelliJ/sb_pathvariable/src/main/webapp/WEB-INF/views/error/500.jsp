<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp" %>

<div class="container">
    <div class="row">
        <div class="col-md-12 text-center">
            <h1 class="display-1 text-danger">500</h1>
            <h2 class="mb-4">서버 오류</h2>
            <p class="lead">${errorMessage}</p>
            <a href="/" class="btn btn-primary">홈으로 돌아가기</a>
        </div>
    </div>
</div>

<%@ include file="../layout/footer.jsp" %> 