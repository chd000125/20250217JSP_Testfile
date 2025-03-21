<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="../common/header.jsp">
    <jsp:param name="title" value="게시판"/>
</jsp:include>

<div class="container mt-5">
    <h2 class="mb-4">게시판</h2>
    <div class="text-end mb-3">
        <a href="/board/write" class="btn btn-primary">글쓰기</a>
    </div>
    <div class="card">
        <div class="card-body">
            <table class="table table-hover">
                <thead class="table-light">
                    <tr>
                        <th>번호</th>
                        <th>제목</th>
                        <th>작성자</th>
                        <th>작성일</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${boards}" var="board">
                        <tr>
                            <td>${board.id}</td>
                            <td><a href="/board/${board.id}" class="text-decoration-none">${board.title}</a></td>
                            <td>${board.author}</td>
                            <td><fmt:formatDate value="${board.createdAt}" pattern="yyyy-MM-dd HH:mm"/></td>
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