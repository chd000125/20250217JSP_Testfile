<%@ page contentType="text/html; charset=UTF-8" isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
    <title>404 에러</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .error-container { 
            max-width: 600px; 
            margin: 100px auto; 
            text-align: center; 
        }
    </style>
</head>
<body>
    <div class="error-container">
        <h1 class="display-1">404</h1>
        <h2 class="mb-4">페이지를 찾을 수 없습니다</h2>
        <p class="lead mb-4">요청하신 페이지가 존재하지 않거나 이동되었을 수 있습니다.</p>
        <a href="${pageContext.request.contextPath}/list.do" class="btn btn-primary">메인으로 돌아가기</a>
    </div>
</body>
</html> 