<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="css/style.css">
    <title>당근마켓 클론</title>
</head>
<body>
<!-- 글쓰기와 로그인 버튼 -->
<div class="container">
    <form action="inputList.jsp">
        <input type="submit" value="글쓰기" />
    </form>
    <form action="login/login.jsp">
        <input type="submit" value="로그인" />
    </form>
    <form action="member/member_Main.jsp">
        <input type="submit" value="회원가입" />
    </form>
</div>
    <!-- 헤더 -->
    <div class="header">당근마켓</div>
    

    
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
    </div>
</body>
</html>
