<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/main_top.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- 실제 작업 공간 -->
<head>
<script type="text/javascript">
function setDisplay(){
	if($('input:radio[id=pickup]').is(':checked')){
		$("#table1").hide();
	}else{
		$("#table1").show();
	}
}
</script>

<style type="text/css">
	.total{
		text-align: center;
	}
</style>
</head>
<!-- Page Header Start -->
<div
	class="container-fluid page-header mb-5 position-relative overlay-bottom">
	<div
		class="d-flex flex-column align-items-center justify-content-center pt-0 pt-lg-5"
		style="min-height: 400px">
		<h1 class="display-4 mb-3 mt-0 mt-lg-5 text-white text-uppercase">Order</h1>
		<div class="d-inline-flex mb-lg-5">
			<p class="m-0 text-white">
				<a class="text-white" href="/">Home</a>
			</p>
			<p class="m-0 text-white px-2">/</p>
			<p class="m-0 text-white">Order</p>
		</div>
	</div>
</div>
<!-- Page Header End -->
<div>
	<h2 style="text-align: center;">My Order</h2><br>
	<div style="text-align: center;">
		<input type="radio" id="delivery" name="orderType" value="10" onchange="setDisplay()" checked="checked"> 배송주문
		<input type="radio" id="pickup" name="orderType" value="00" onchange="setDisplay()"> 픽업주문
	</div>
	<br><br>
	<table class="table">
	   <tr class="text-center">
	     <th>상품</th>
	     <th>가격</th>
	     <th>수량</th>
	   </tr>
	   
		<c:if test="${empty dto }">
			<tr class="text-center">
				<td colspan="5">주문할 상품이 없습니다.</td>
			</tr>
		</c:if>
		
		<c:if test="${!empty dto }">
		<c:forEach var="order" items="${dto }">
			<tr style="text-align: center;">
				<td>${order.productName }</td>
				<td>${order.price }</td>
				<td>${order.quantity }</td>
			</tr>
		</c:forEach>
		</c:if>
	</table>
	<br><br>
	<table id="table1" class="table">
		<tr class="text-center">
			<th>우편번호</th>
			<th>주소</th>
			<th>상세주소</th>
		</tr>
		<tr style="text-align: center;">
			<td>${vo.zipcode }</td>
			<td>${vo.address }</td>
			<td>${vo.addressDetail }</td>
		</tr>
	</table>
	
	<br><br><br>
	<div class="total">
		<h3>Order Totals</h3>
		<hr>
			<span style="font-weight: border;">Total</span>
		<hr>
			<span><fmt:formatNumber pattern="#,###" value="${total }"/> 원</span>
		<hr>
		<p class="text-center"><a href="/member/order" class="btn btn-primary py-3 px-4">order</a></p>
	</div>

</div>
<!-- 실제 작업 공간 끝 -->

<!-- footer -->
<%@ include file="../inc/main_bottom.jsp"%>