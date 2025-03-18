<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원가입</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .form-container {
            max-width: 500px;
            margin: 50px auto;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            border-radius: 10px;
        }
    </style>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container">
            <a class="navbar-brand" href="/">스프링부트 웹 프로젝트</a>
        </div>
    </nav>

    <div class="container">
        <div class="form-container">
            <h2 class="text-center mb-4">회원가입</h2>
            
            <form:form modelAttribute="userForm" action="/form" method="post">
                <div class="mb-3">
                    <label for="name" class="form-label">이름</label>
                    <form:input path="name" class="form-control" />
                    <form:errors path="name" class="text-danger" />
                </div>
                
                <div class="mb-3">
                    <label for="email" class="form-label">이메일</label>
                    <form:input path="email" class="form-control" type="email" />
                    <form:errors path="email" class="text-danger" />
                </div>
                
                <div class="mb-3">
                    <label for="password" class="form-label">비밀번호</label>
                    <form:input path="password" class="form-control" type="password" />
                    <form:errors path="password" class="text-danger" />
                </div>
                
                <div class="mb-3">
                    <label for="phone" class="form-label">전화번호</label>
                    <form:input path="phone" class="form-control" />
                </div>
                
                <div class="d-grid gap-2">
                    <button type="submit" class="btn btn-primary">가입하기</button>
                    <a href="/" class="btn btn-secondary">취소</a>
                </div>
            </form:form>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html> 