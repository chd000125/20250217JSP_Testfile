<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>게시글 작성</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .write-container { max-width: 800px; margin: 30px auto; }
    </style>
</head>
<body>
    <div class="write-container">
        <h2 class="text-center mb-4">게시글 작성</h2>
        
        <form action="writeAction.do" method="post">
            <div class="mb-3">
                <label for="title" class="form-label">제목</label>
                <input type="text" class="form-control" id="title" name="title" required>
            </div>
            
            <div class="mb-3">
                <label for="writer" class="form-label">작성자</label>
                <input type="text" class="form-control" id="writer" name="writer" required>
            </div>
            
            <div class="mb-3">
                <label for="content" class="form-label">내용</label>
                <textarea class="form-control" id="content" name="content" rows="10" required></textarea>
            </div>
            
            <div class="text-center">
                <button type="submit" class="btn btn-primary">등록</button>
                <a href="list" class="btn btn-secondary">취소</a>
            </div>
        </form>
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html> 