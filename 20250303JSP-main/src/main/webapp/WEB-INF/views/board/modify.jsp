<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>게시글 수정</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .modify-container { max-width: 800px; margin: 30px auto; }
    </style>
</head>
<body>
    <div class="modify-container">
        <h2 class="text-center mb-4">게시글 수정</h2>
        
        <form action="modifyAction.do" method="post">
            <input type="hidden" name="id" value="${board.id}">
            
            <div class="mb-3">
                <label for="title" class="form-label">제목</label>
                <input type="text" class="form-control" id="title" name="title" 
                       value="${board.title}" required>
            </div>
            
            <div class="mb-3">
                <label for="writer" class="form-label">작성자</label>
                <input type="text" class="form-control" value="${board.writer}" readonly>
            </div>
            
            <div class="mb-3">
                <label for="content" class="form-label">내용</label>
                <textarea class="form-control" id="content" name="content" 
                          rows="10" required>${board.content}</textarea>
            </div>
            
            <div class="text-center">
                <button type="submit" class="btn btn-primary">수정</button>
                <a href="list.do" class="btn btn-secondary">취소</a>
            </div>
        </form>
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html> 