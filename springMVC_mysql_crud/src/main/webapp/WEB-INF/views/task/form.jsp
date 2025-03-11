<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>${task.id == null ? '새 할 일 추가' : '할 일 수정'}</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card">
                    <div class="card-header">
                        <h3 class="card-title mb-0">${task.id == null ? '새 할 일 추가' : '할 일 수정'}</h3>
                    </div>
                    <div class="card-body">
                        <form action="${pageContext.request.contextPath}/tasks${task.id == null ? '' : '/update'}" method="post">
                            <input type="hidden" name="id" value="${task.id}">
                            
                            <div class="mb-3">
                                <label for="title" class="form-label">제목</label>
                                <input type="text" class="form-control" id="title" name="title" 
                                       value="${task.title}" required>
                            </div>
                            
                            <div class="mb-3">
                                <label for="description" class="form-label">설명</label>
                                <textarea class="form-control" id="description" name="description" 
                                          rows="3" required>${task.description}</textarea>
                            </div>
                            
                            <div class="mb-3">
                                <label for="status" class="form-label">상태</label>
                                <select class="form-select" id="status" name="status" required>
                                    <option value="진행중" ${task.status == '진행중' ? 'selected' : ''}>진행중</option>
                                    <option value="완료" ${task.status == '완료' ? 'selected' : ''}>완료</option>
                                </select>
                            </div>
                            
                            <div class="mb-3">
                                <label for="dueDate" class="form-label">마감일</label>
                                <input type="date" class="form-control" id="dueDate" name="dueDate" 
                                       value="${task.dueDate}" required>
                            </div>
                            
                            <div class="d-grid gap-2">
                                <button type="submit" class="btn btn-primary">저장</button>
                                <a href="${pageContext.request.contextPath}/tasks" 
                                   class="btn btn-secondary">취소</a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html> 