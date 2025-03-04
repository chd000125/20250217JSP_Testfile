<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
    <title>게시판</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .board-container { max-width: 1000px; margin: 30px auto; }
        .table th { background-color: #f8f9fa; }
        .btn-write { margin-bottom: 20px; }
        .pagination { justify-content: center; }
    </style>
</head>
<body>
    <div class="board-container">
        <h2 class="text-center mb-4">게시판</h2>
        
        <div class="text-end">
            <a href="write.do" class="btn btn-primary btn-write">글쓰기</a>
        </div>
        
        <table class="table table-hover">
            <thead>
                <tr>
                    <th width="10%">번호</th>
                    <th width="40%">제목</th>
                    <th width="15%">작성자</th>
                    <th width="20%">등록일</th>
                    <th width="15%">조회수</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${boardList}" var="board">
                    <tr>
                        <td>${board.id}</td>
                        <td><a href="view.do?id=${board.id}" class="text-decoration-none">${board.title}</a></td>
                        <td>${board.writer}</td>
                        <td><fmt:formatDate value="${board.regdate}" pattern="yyyy-MM-dd HH:mm"/></td>
                        <td>${board.viewcount}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        
        <nav>
            <ul class="pagination">
                <c:forEach begin="1" end="${totalPages}" var="i">
                    <li class="page-item ${currentPage == i ? 'active' : ''}">
                        <a class="page-link" href="?page=${i}">${i}</a>
                    </li>
                </c:forEach>
            </ul>
        </nav>
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html> 