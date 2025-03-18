<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="header.jsp" %>

<div class="row">
    <div class="col-md-8 offset-md-2">
        <div class="card">
            <div class="card-body">
                <h2 class="card-title text-center mb-4"><c:out value="${message}"/></h2>
                <div class="text-center">
                    <p class="lead">이 예제는 스프링 인터셉터의 동작을 보여줍니다.</p>
                    <p>페이지를 이동할 때마다 인터셉터가 요청을 가로채서 로그를 남깁니다.</p>
                    <a href="/about" class="btn btn-primary mt-3">자세히 알아보기</a>
                </div>
            </div>
        </div>
    </div>
</div>

<%@ include file="footer.jsp" %> 