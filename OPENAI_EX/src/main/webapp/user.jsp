<%@page import="dto.User123"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>객체 속성 접근 예제</title>
</head>
<body>
    <h1>JSP 표현 언어로 객체의 속성에 접근하기</h1>

    <%-- Java 코드로 User 객체 생성 --%>
    <%
        
        User123 user = new User123("John Doe", 25);
        request.setAttribute("user", user);  // User 객체를 request 속성으로 설정
        
    %>

    <h2>EL로 객체 속성 출력:</h2>
    <%=user.getName() %>
    <p>이름: ${user.name}</p>   <!-- EL을 사용해 user 객체의 name 속성 출력 --><!-- user.name이 getter를 호출 -->
    <p>나이: ${user.age}</p>    <!-- EL을 사용해 user 객체의 age 속성 출력 -->

</body>
</html>
