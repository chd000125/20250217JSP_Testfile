<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>당근마켓 클론</title>
    <style>
        /* 기본 스타일 */
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f8f9fa;
            margin: 0;
            padding: 0;
        }

        /* 헤더 스타일 */
        .header {
            background-color: #ff6f0f;
            color: white;
            text-align: center;
            padding: 15px;
            font-size: 20px;
            font-weight: bold;
        }
        form {
        width: 100%; /* form의 너비를 100%로 설정 */
        text-align: left; /* 버튼을 왼쪽 정렬 */
        padding: 10px; /* 여백 */
    }
		.add{
			 display : flex;
   			 justify-content: flex-start; /* 버튼을 왼쪽으로 정렬 */
    		 padding: 10px; /* 버튼 주변 여백을 추가할 수 있습니다 */
		}
        /* 상품 리스트 스타일 */
        .product-list {
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 10px;
        }

        .product-item {
            background-color: white;
            width: 90%;
            max-width: 400px;
            margin: 10px 0;
            padding: 15px;
            border-radius: 10px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            display: flex;
            align-items: center;
            cursor: pointer;
            transition: transform 0.2s ease-in-out;
        }

        .product-item:hover {
            transform: scale(1.03);
        }

        /* 상품 이미지 스타일 */
        .product-image {
            width: 80px;
            height: 80px;
            border-radius: 10px;
            object-fit: cover;
            margin-right: 15px;
        }

        /* 상품 정보 스타일 */
        .product-info {
            flex-grow: 1;
        }

        .product-title {
            font-size: 18px;
            font-weight: bold;
            color: #333;
        }

        .product-price {
            font-size: 16px;
            color: #ff6f0f;
            font-weight: bold;
        }

        .product-location {
            font-size: 14px;
            color: #666;
        }
    </style>
</head>
<body>

    <!-- 헤더 -->
    <div class="header">당근마켓</div>
    <form action="inputList.jsp">
    	<input class="add" type="submit" value="글쓰기" />
	</form>
    <!-- 상품 리스트 -->
    <div class="product-list">
        <div class="product-item">
            <img class="product-image" src="https://via.placeholder.com/80" alt="상품 이미지">
            <div class="product-info">
                <div class="product-title">중고 아이패드 판매</div>
                <div class="product-price">₩350,000</div>
                <div class="product-location">서울 강남구</div>
            </div>
        </div>

        <div class="product-item">
            <img class="product-image" src="https://via.placeholder.com/80" alt="상품 이미지">
            <div class="product-info">
                <div class="product-title">나이키 운동화</div>
                <div class="product-price">₩50,000</div>
                <div class="product-location">부산 해운대구</div>
            </div>
        </div>
    </div>

</body>
</html>
