<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp" %>

<div class="container">
    <div class="row">
        <div class="col-md-12 text-center mb-5">
            <h1 class="display-4">에러 테스트</h1>
            <p class="lead">존재하지 않는 회원을 조회하여 예외 처리를 테스트합니다.</p>
        </div>
    </div>

    <div class="row">
        <div class="col-md-4">
            <div class="card mb-4">
                <div class="card-body text-center">
                    <h5 class="card-title">테스트 설명</h5>
                    <p class="card-text">이 페이지는 존재하지 않는 회원 ID(999)로 조회를 시도하여 예외 처리를 테스트합니다.</p>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card mb-4">
                <div class="card-body text-center">
                    <h5 class="card-title">예상 결과</h5>
                    <p class="card-text">MemberNotFoundException이 발생하고 404 에러 페이지가 표시됩니다.</p>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card mb-4">
                <div class="card-body text-center">
                    <h5 class="card-title">시스템 정보</h5>
                    <p class="card-text">스프링 부트 2.7.18<br>MySQL 8.0.33<br>MyBatis</p>
                </div>
            </div>
        </div>
    </div>
</div>

<%@ include file="../layout/footer.jsp" %> 