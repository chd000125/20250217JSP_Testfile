<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Greeting Page</title>
</head>
<body>
<h1>Welcome to the Greeting Page!</h1>

<form action="/greet" method="GET">
    <label for="name">Enter your name:</label>
    <input type="text" id="name" name="name" required>
    <button type="submit">Greet Me</button>
</form>

<c:if test="${not empty name}">
    <h2>Hello, ${name}!</h2>
</c:if>

</body>
</html>
