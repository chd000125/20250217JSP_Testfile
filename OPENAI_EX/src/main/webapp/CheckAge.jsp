<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <!-- JSTL 디렉티브 추가 -->

<html>
<head>
    <title>조건문 예제</title>
</head>
<body>
    <h1>나이에 따른 조건문 예제</h1>

    <%-- Java 코드로 나이 설정 --%>
    <%
        int age = 20;
        request.setAttribute("age", age);  // age 값을 request 속성으로 설정
        String name = "홍길동";
        request.setAttribute("name", name);
    %>
    
    <%
    if (age == 20) { %>
    	<p>성인입니다.</p>
    <% } else { %>
    	<p>미성년자입니다.</p>
  <%} %>
    
    %>
    ${1==1} ${1!=1}
	<h2>이름 비교:</h2>
	<c:choose>
		<c:when test="${name == '홍길동'}">
			<p>맞습니다.</p>
		</c:when>
	</c:choose>
	
	
    <h2>나이에 따라 메시지 출력:</h2>
    <c:choose>
        <c:when test="${age >= 18}">
            <p>성인입니다.</p>   <!-- 나이가 18 이상이면 "성인입니다." 출력 -->
        </c:when>
        <c:otherwise>
            <p>미성년자입니다.</p> <!-- 나이가 18 미만이면 "미성년자입니다." 출력 -->
        </c:otherwise>
    </c:choose>

</body>
</html>