<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>EL 예제</title>
</head>
<body>
    <h1>JSP 표현 언어 기본 예제</h1>
    
    <%-- Java 코드로 변수 설정 --%>
    <%
        String message = "Hello, JSP Expression Language!";
        request.setAttribute("msg", message);  // message를 request 속성으로 설정
    %>

    <h2>EL로 출력:</h2>
    <p>메시지: ${msg}</p>  <!-- EL을 사용하여 message 출력 -->
    <%=message %>
</body>
</html>
