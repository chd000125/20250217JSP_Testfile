<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="../common/header.jsp">
    <jsp:param name="title" value="${board.title}"/>
</jsp:include>

<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-10">
            <div class="card">
                <div class="card-header">
                    <h2 class="card-title h4 mb-2">${board.title}</h2>
                    <div class="text-muted small">
                        작성자: ${board.author} | 
                        작성일: <fmt:formatDate value="${board.createdAt}" pattern="yyyy-MM-dd HH:mm"/>
                        <c:if test="${board.updatedAt != null}">
                            | 수정일: <fmt:formatDate value="${board.updatedAt}" pattern="yyyy-MM-dd HH:mm"/>
                        </c:if>
                    </div>
                </div>
                <div class="card-body">
                    <p class="card-text" style="white-space: pre-wrap;">${board.content}</p>
                </div>
            </div>
            <div class="mt-3 d-grid gap-2 d-md-flex justify-content-md-end">
                <a href="/board" class="btn btn-secondary me-2">목록</a>
                <a href="/board/${board.id}/edit" class="btn btn-primary me-2">수정</a>
                <form action="/board/${board.id}/delete" method="post" style="display: inline;">
                    <button type="submit" class="btn btn-danger" onclick="return confirm('정말 삭제하시겠습니까?')">삭제</button>
                </form>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html> 