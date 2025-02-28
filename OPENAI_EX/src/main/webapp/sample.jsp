<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import = "java.util.*" %>
<%
    // 서블릿이나 컨트롤러에서 값을 세팅하는 부분 (여기선 JSP 내에서 바로 설정)
    request.setAttribute("userName", "홍길동");
    request.setAttribute("userAge", 30);

    Map<String, String> userInfo = new HashMap<>();
    userInfo.put("email", "hong@example.com");
    userInfo.put("phone", "010-1234-5678");
    request.setAttribute("userInfo", userInfo);

    List<String> hobbies = Arrays.asList("등산", "독서", "게임");
    request.setAttribute("hobbies", hobbies);
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>JSP 표현언어 예제</title>
</head>
<body>

<h2>표현언어(EL)로 데이터 출력하기</h2>

<p>이름: ${userName}</p>
<p>나이: ${userAge}</p>

<h3>Map 데이터 출력</h3>
<p>이메일: ${userInfo.email}</p>
<p>전화번호: ${userInfo.phone}</p>

<h3>List 데이터 출력</h3>
<ul>
    <c:forEach var="hobby" items="${hobbies}">
        <li>${hobby}</li>
    </c:forEach>
</ul>

<h3>파라미터 값 출력 (URL에서 전달된 값)</h3>
<!-- 예를 들어, ?search=JSP로 요청한 경우 -->
<p>검색어: ${param.search}</p>

<h3>조건 처리 예제</h3>
<%
    request.setAttribute("isMember", true);
%>
<c:choose>
    <c:when test="${isMember}">
        <p>회원입니다.</p>
    </c:when>
    <c:otherwise>
        <p>비회원입니다.</p>
    </c:otherwise>
</c:choose>

<h3>Null 체크와 기본값</h3>
<p>닉네임: ${empty nickname ? '없음' : nickname}</p>

</body>
</html>
