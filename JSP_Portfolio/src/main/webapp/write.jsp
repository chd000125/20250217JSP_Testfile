<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>게시글 작성</title>
    <link rel="stylesheet" href="css/writeStyle.css"> <!-- 스타일시트 추가 -->
</head>
<body>
    <header>
        <h1>게시글 작성</h1>
        <nav>
            <a href="index.jsp">메인 페이지</a>
        </nav>
    </header>
    
    <div class="container">
        <form action="writeProcess.jsp" method="POST">
            <div class="form-group">
                <label for="title">제목</label>
                <input type="text" id="title" name="title" required placeholder="제목을 입력하세요">
            </div>

            <div class="form-group">
                <label for="content">내용</label>
                <textarea id="content" name="content" rows="6" required placeholder="내용을 입력하세요"></textarea>
            </div>

            <div class="form-group">
                <label for="price">가격</label>
                <input type="number" id="price" name="price" required placeholder="가격을 입력하세요">
            </div>

            <div class="form-group">
                <label for="seller_id">판매자 ID</label>
                <input type="hidden" name="seller_id" value="1"> <!-- 로그인한 사용자의 ID를 여기에 입력 -->
            </div>

            <button type="submit">작성 완료</button>
        </form>
    </div>

</body>
</html>
