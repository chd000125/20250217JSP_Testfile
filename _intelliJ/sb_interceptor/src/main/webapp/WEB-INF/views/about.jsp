<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="header.jsp" %>

<div class="row">
    <div class="col-md-8 offset-md-2">
        <div class="card">
            <div class="card-body">
                <h2 class="card-title text-center mb-4"><c:out value="${message}"/></h2>
                <div class="card-text">
                    <h4>인터셉터란?</h4>
                    <p>인터셉터는 스프링 MVC에서 컨트롤러에 들어오는 요청과 컨트롤러가 응답하는 응답을 가로채서 처리할 수 있게 해주는 기능입니다.</p>
                    
                    <h4 class="mt-4">인터셉터의 주요 메서드</h4>
                    <ul>
                        <li><strong>preHandle</strong>: 컨트롤러 실행 전에 호출됩니다.</li>
                        <li><strong>postHandle</strong>: 컨트롤러 실행 후, 뷰 실행 전에 호출됩니다.</li>
                        <li><strong>afterCompletion</strong>: 뷰 실행 후에 호출됩니다.</li>
                    </ul>
                    
                    <div class="alert alert-info mt-4">
                        <h5>현재 페이지의 로그 확인</h5>
                        <p>이 페이지에 접근할 때 인터셉터가 생성한 로그를 콘솔에서 확인할 수 있습니다.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<%@ include file="footer.jsp" %> 