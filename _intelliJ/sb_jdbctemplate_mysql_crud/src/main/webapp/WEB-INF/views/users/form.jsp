<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>사용자 정보</title>
    <link rel="stylesheet" href="/webjars/bootstrap/5.1.3/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-5">
        <h2 class="mb-4">${user.id == null ? '새 사용자 등록' : '사용자 정보 수정'}</h2>
        
        <form:form action="/users" method="post" modelAttribute="user">
            <form:hidden path="id"/>
            
            <div class="mb-3">
                <label for="name" class="form-label">이름</label>
                <form:input path="name" class="form-control" required="true"/>
            </div>
            
            <div class="mb-3">
                <label for="email" class="form-label">이메일</label>
                <form:input path="email" type="email" class="form-control" required="true"/>
            </div>
            
            <div class="mb-3">
                <label for="phone" class="form-label">전화번호</label>
                <form:input path="phone" type="tel" class="form-control" required="true"/>
            </div>
            
            <button type="submit" class="btn btn-primary">저장</button>
            <a href="<c:url value='/users'/>" class="btn btn-secondary">취소</a>
        </form:form>
    </div>
    
    <script src="/webjars/jquery/3.6.0/jquery.min.js"></script>
    <script src="/webjars/bootstrap/5.1.3/js/bootstrap.bundle.min.js"></script>
</body>
</html> 