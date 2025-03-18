<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>인터셉터 예제</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .navbar {
            background-color: #2c3e50;
        }
        .navbar-brand {
            color: white !important;
        }
        .nav-link {
            color: rgba(255,255,255,.8) !important;
        }
        .nav-link:hover {
            color: white !important;
        }
    </style>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark">
        <div class="container">
            <a class="navbar-brand" href="/">인터셉터 예제</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav me-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="/">홈</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/about">소개</a>
                    </li>
                </ul>
                <ul class="navbar-nav">
                    <c:choose>
                        <c:when test="${empty sessionScope.loginMember}">
                            <li class="nav-item">
                                <a class="nav-link" href="/login">로그인</a>
                            </li>
                        </c:when>
                        <c:otherwise>
                            <li class="nav-item">
                                <span class="nav-link">${sessionScope.loginMember}님 환영합니다</span>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="/logout">로그아웃</a>
                            </li>
                        </c:otherwise>
                    </c:choose>
                </ul>
            </div>
        </div>
    </nav>
    <div class="container mt-4"> 