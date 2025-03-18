<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>${title}</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .hero-section {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 100px 0;
            margin-bottom: 50px;
        }
        .feature-card {
            border: none;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease;
        }
        .feature-card:hover {
            transform: translateY(-5px);
        }
        #messageToast {
            position: fixed;
            top: 20px;
            right: 20px;
            z-index: 1000;
        }
    </style>
</head>
<body>
    <div id="messageToast" class="toast align-items-center text-white bg-success border-0" role="alert" aria-live="assertive" aria-atomic="true">
        <div class="d-flex">
            <div class="toast-body">
                ${message}
            </div>
            <button type="button" class="btn-close btn-close-white me-2 m-auto" data-bs-dismiss="toast" aria-label="Close"></button>
        </div>
    </div>

    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container">
            <a class="navbar-brand" href="/">${title}</a>
            <div class="navbar-nav ms-auto">
                <a class="nav-link" href="/form">회원가입</a>
            </div>
        </div>
    </nav>

    <div class="hero-section">
        <div class="container text-center">
            <h1 class="display-4 mb-4"><spring:message code="welcome.message"/></h1>
            <p class="lead">스프링부트와 JSP를 활용한 웹 프로젝트입니다.</p>
        </div>
    </div>

    <div class="container">
        <div class="row">
            <div class="col-md-4 mb-4">
                <div class="card feature-card h-100">
                    <div class="card-body text-center">
                        <h5 class="card-title">Spring Boot</h5>
                        <p class="card-text">최신 스프링부트 프레임워크를 활용한 웹 애플리케이션 개발</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4 mb-4">
                <div class="card feature-card h-100">
                    <div class="card-body text-center">
                        <h5 class="card-title">JSP</h5>
                        <p class="card-text">JSP를 활용한 동적 웹 페이지 구현</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4 mb-4">
                <div class="card feature-card h-100">
                    <div class="card-body text-center">
                        <h5 class="card-title">Validation</h5>
                        <p class="card-text">@Valid를 활용한 폼 데이터 검증</p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <footer class="bg-dark text-white text-center py-3 mt-5">
        <p class="mb-0">&copy; 2024 ${title}. All rights reserved.</p>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const message = '${message}';
            if (message) {
                const toast = new bootstrap.Toast(document.getElementById('messageToast'));
                toast.show();
                
                // 3초 후 자동으로 토스트 숨기기
                setTimeout(() => {
                    toast.hide();
                }, 3000);
            }
        });
    </script>
</body>
</html> 