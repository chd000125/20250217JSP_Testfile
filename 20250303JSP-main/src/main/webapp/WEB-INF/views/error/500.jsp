<%@ page contentType="text/html; charset=UTF-8" isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
    <title>500 에러</title>
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
        <h1 class="display-1">500</h1>
        <h2 class="mb-4">서버 오류가 발생했습니다</h2>
        <p class="lead mb-4">죄송합니다. 서버에 문제가 발생했습니다. 잠시 후 다시 시도해주세요.</p>
        <a href="${pageContext.request.contextPath}/list.do" class="btn btn-primary">메인으로 돌아가기</a>
    </div>
</body>
</html> 