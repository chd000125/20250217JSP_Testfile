<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Spring MVC Sample</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 40px;
            text-align: center;
        }
        .message {
            color: #333;
            font-size: 24px;
            margin: 20px;
        }
    </style>
</head>
<body>
    <h1>Spring MVC Sample Project</h1>
    <div class="message">${message}</div>
</body>
</html> 