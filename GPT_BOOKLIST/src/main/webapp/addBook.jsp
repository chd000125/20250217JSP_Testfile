<%@ page contentType="text/html; charset=UTF-8" %>
<html>
<head>
    <title>도서 추가</title>
</head>
<body>
    <h1>도서 추가</h1>
    <form action="addBookAction.jsp" method="POST">
        제목: <input type="text" name="title"><br>
        저자: <input type="text" name="author"><br>
        출판사: <input type="text" name="publisher"><br>
        연도: <input type="number" name="year"><br>
        장르: <input type="text" name="genre"><br>
        <input type="submit" value="추가">
    </form>
</body>
</html>
