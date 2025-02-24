<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 등록</title>

<style>
    /* 전체 페이지 스타일 */
    body {
        font-family: Arial, sans-serif; /* 기본 글꼴 */
        background-color: #f4f4f4; /* 연한 회색 배경 */
        display: flex;
        justify-content: center; /* 중앙 정렬 */
        align-items: center; /* 세로 중앙 정렬 */
        height: 100vh; /* 화면 전체 높이 사용 */
        margin: 0;
    }

    /* 입력 폼 컨테이너 스타일 */
    .container {
        background: #fff; /* 흰색 배경 */
        padding: 25px;
        border-radius: 12px; /* 둥근 모서리 */
        box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1); /* 그림자 효과 */
        width: 420px; /* 적절한 너비 설정 */
    }

    /* 제목 스타일 */
    h2 {
        text-align: center; /* 중앙 정렬 */
        margin-bottom: 20px;
        font-weight: bold;
    }

    /* 입력 필드 라벨 스타일 */
    label {
        font-weight: bold;
        display: block; /* 줄 바꿈 적용 */
        margin-top: 12px;
    }

    /* 입력 필드 스타일 */
    input, textarea {
        width: 100%; /* 입력 창이 컨테이너 너비를 가득 채우도록 설정 */
        padding: 12px;
        margin-top: 5px;
        margin-right : 5px;
        border: 1px solid #ccc;
        border-radius: 8px; /* 모서리 둥글게 */
        font-size: 16px;
        transition: 0.2s;
    }

    /* 입력 필드 focus & hover 효과 */
    input:focus, textarea:focus {
        outline: none;
        border-color: #007BFF; /* 파란색 강조 */
        box-shadow: 0 0 5px rgba(0, 123, 255, 0.3);
    }

    /* 텍스트 입력창 스타일 */
    textarea {
        height: 100px;
        resize: none; /* 사용자가 크기 조절 불가능하도록 설정 */
    }

    /* 파일 업로드 버튼 스타일 (기본 input 숨기고 커스텀 버튼 사용) */
    .custom-file-upload {
        display: inline-block;
        padding: 10px 15px;
        background-color: #007BFF;
        color: white;
        border-radius: 6px;
        cursor: pointer;
        font-size: 14px;
        text-align: center;
    }

    /* 파일 업로드 버튼 hover 효과 */
    .custom-file-upload:hover {
        background-color: #0056b3;
    }

    /* 실제 파일 선택 input 숨기기 */
    #imgFile {
        display: none;
    }

    /* 등록 버튼 스타일 */
    .btn-submit {
        width: 100%;
        background-color: #007BFF; /* 파란색 버튼 */
        color: white;
        border: none;
        padding: 12px;
        font-size: 18px;
        font-weight: bold;
        cursor: pointer;
        border-radius: 8px; /* 둥근 버튼 */
        margin-top: 15px;
        transition: 0.3s;
    }

    /* 버튼 hover 효과 */
    .btn-submit:hover {
        background-color: #0056b3;
    }
</style>

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
