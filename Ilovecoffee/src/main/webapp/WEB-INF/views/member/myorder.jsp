<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/main_top.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
</head>
<!-- 메인헤더 -->
<div class="container-fluid page-header mb-5 position-relative overlay-bottom">
    <div class="d-flex flex-column align-items-center justify-content-center pt-0 pt-lg-5">
        <h1 class="display-4 mb-3 mt-0 mt-lg-5 text-white text-uppercase">My Order</h1>
        <div class="d-inline-flex mb-lg-5">
            <p class="m-0 text-white"><a class="text-white" href="">Home</a></p>
            <p class="m-0 text-white px-2">/</p>
            <p class="m-0 text-white">My Order</p>
        </div>
    </div>
</div>

<!-- 실제 작업 공간 시작 -->
<div>
<h2 style="text-align: center;">My Order</h2><br>
	<table class="table">
		<tr class="text-center">
		  <th>주문번호</th>
		  <th>가격</th>
		  <th>주문 현황</th>
		</tr>
		
		<c:if test="${empty list }">
			<tr class="text-center">
				<td colspan="3">주문내역이 없습니다.</td>
			</tr>
		</c:if>
		
		<c:if test="${!empty list }">
		<c:forEach var="order" items="${list }">
			<tr class="text-center">
				<td>${order.orderNo }</td>
				<td>${order.totalPrice }</td>
				<td>${order.deliverystatuss }</td>
			</tr>
		</c:forEach>
		</c:if>
		
	</table>
</div>
<!-- 실제작업 공간 끝 -->

<!-- footer -->
<%@ include file="../inc/main_bottom.jsp" %>
<!-- footer 끝 -->