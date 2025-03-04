<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
    <title>게시글 상세</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .view-container { max-width: 800px; margin: 30px auto; }
        .content { min-height: 200px; margin: 20px 0; }
    </style>
</head>
<body>
    <div class="view-container">
        <h2 class="text-center mb-4">게시글 상세</h2>
        
        <div class="card">
            <div class="card-header">
                <h5 class="card-title">${board.title}</h5>
            </div>
            <div class="card-body">
                <div class="d-flex justify-content-between mb-3">
                    <span>작성자: ${board.writer}</span>
                    <span>
                        작성일: <fmt:formatDate value="${board.regdate}" pattern="yyyy-MM-dd HH:mm"/>
                        (조회수: ${board.viewcount})
                    </span>
                </div>
                
                <div class="content border p-3">
                    ${board.content}
                </div>
                
                <div class="text-center mt-4">
                    <a href="list.do" class="btn btn-primary">목록</a>
                    <a href="modify.do?id=${board.id}" class="btn btn-warning">수정</a>
                    <button onclick="deleteBoard(${board.id})" class="btn btn-danger">삭제</button>
                </div>
            </div>
        </div>
    </div>
    
    <script>
    function deleteBoard(id) {
        if (confirm('정말 삭제하시겠습니까?')) {
            location.href = 'delete.do?id=' + id;
        }
    }
    </script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html> 