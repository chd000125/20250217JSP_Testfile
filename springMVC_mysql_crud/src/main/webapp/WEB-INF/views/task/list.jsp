<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>할 일 목록</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <h1 class="mb-4">할 일 목록</h1>
        <a href="${pageContext.request.contextPath}/tasks/new" class="btn btn-primary mb-3">새 할 일 추가</a>
        
        <div class="card">
            <div class="card-body">
                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th>제목</th>
                            <th>설명</th>
                            <th>상태</th>
                            <th>마감일</th>
                            <th>작업</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${tasks}" var="task">
                            <tr>
                                <td>${task.title}</td>
                                <td>${task.description}</td>
                                <td>
                                    <span class="badge bg-${task.status == '완료' ? 'success' : 'warning'}">
                                        ${task.status}
                                    </span>
                                </td>
                                <td>${task.dueDate}</td>
                                <td>
                                    <a href="${pageContext.request.contextPath}/tasks/edit/${task.id}" 
                                       class="btn btn-sm btn-primary">수정</a>
                                    <a href="${pageContext.request.contextPath}/tasks/delete/${task.id}" 
                                       class="btn btn-sm btn-danger"
                                       onclick="return confirm('정말 삭제하시겠습니까?')">삭제</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html> 