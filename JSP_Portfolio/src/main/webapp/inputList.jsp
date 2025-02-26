<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="css/inputStyle.css">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 등록</title>
</head>
<body>

    <!-- 입력 폼을 감싸는 컨테이너 -->
    <div class="container">
        <h2>상품 등록</h2>

        <!-- 입력 데이터를 inputData.jsp로 전송하는 폼 -->
        <form action="inputData.jsp" method="post" enctype="multipart/form-data">
            <!-- 제목 입력 -->
            <label for="title">제목</label>
            <input type="text" id="title" name="title" required>

            <!-- 가격 입력 -->
            <label for="price">가격</label>
            <input type="text" id="price" name="price" required>

            <!-- 제품 설명 입력 -->
            <label for="content">제품 설명</label>
            <textarea id="content" name="content" required></textarea>

            <!-- 파일 업로드 -->
            <label>제품 이미지 선택</label>
            <label class="custom-file-upload">
                <input type="file" id="imgFile" name="imgFile" accept="image/*" required>
                파일 선택
            </label>

            <!-- 등록 버튼 -->
            <input type="submit" value="등록" class="btn-submit">
        </form>
    </div>

</body>
</html>
