<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="layout/header.jsp" %>

<div class="container">
    <div class="row">
        <div class="col-md-12 text-center mb-5">
            <h1 class="display-4">회원 관리 시스템</h1>
            <p class="lead">스프링 부트와 MyBatis를 활용한 회원 관리 시스템입니다.</p>
        </div>
    </div>

    <div class="row">
        <div class="col-md-4">
            <div class="card mb-4">
                <div class="card-body text-center">
                    <h5 class="card-title">회원 목록</h5>
                    <p class="card-text">등록된 회원들의 목록을 확인할 수 있습니다.</p>
                    <a href="/members" class="btn btn-primary">목록 보기</a>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card mb-4">
                <div class="card-body text-center">
                    <h5 class="card-title">회원 등록</h5>
                    <p class="card-text">새로운 회원을 등록할 수 있습니다.</p>
                    <a href="/members/new" class="btn btn-success">회원 등록</a>
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

    <div class="row mt-5">
        <div class="col-md-12">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">최근 등록된 회원</h5>
                    <div class="table-responsive">
                        <table class="table table-hover">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>이름</th>
                                    <th>이메일</th>
                                    <th>가입일</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:if test="${not empty recentMembers}">
                                    <c:forEach items="${recentMembers}" var="member">
                                        <tr>
                                            <td>${member.id}</td>
                                            <td>${member.name}</td>
                                            <td>${member.email}</td>
                                            <td>${member.createdAt}</td>
                                        </tr>
                                    </c:forEach>
                                </c:if>
                                <c:if test="${empty recentMembers}">
                                    <tr>
                                        <td colspan="4" class="text-center">등록된 회원이 없습니다.</td>
                                    </tr>
                                </c:if>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<%@ include file="layout/footer.jsp" %> 