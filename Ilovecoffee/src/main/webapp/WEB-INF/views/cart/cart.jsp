<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/main_top.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- 실제 작업 공간 -->
<head>
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
		<h1 class="display-4 mb-3 mt-0 mt-lg-5 text-white text-uppercase">Cart</h1>
		<div class="d-inline-flex mb-lg-5">
			<p class="m-0 text-white">
				<a class="text-white" href="/">Home</a>
			</p>
			<p class="m-0 text-white px-2">/</p>
			<p class="m-0 text-white">Shop</p>
		</div>
	</div>
</div>
<!-- Page Header End -->
<div>
	<h2 style="text-align: center;">My Cart</h2><br>
				
	<table class="table">
	   <tr class="text-center">
	     <th>&nbsp;</th>
	     <th>&nbsp;</th>
	     <th>&nbsp;</th>
	     <th>상품</th>
	     <th>가격</th>
	     <th>수량</th>
	   </tr>
	   
		<c:if test="${empty list }">
			<tr class="text-center">
				<td colspan="6">장바구니에 담긴 상품이 없습니다.</td>
			</tr>
		</c:if>
		
		<c:if test="${!empty list }">
		<c:forEach var="cart" items="${list }">
			<tr style="text-align: center;">
			
				<td class="cart_info_td">
					<input type="hidden" class="individual_price_input" value="${cart.price}">
					<input type="hidden" class="individual_quantity_input" value="${cart.quantity}">
					<input type="hidden" class="individual_totalPrice_input" value="${cart.price * cart.quantity}">
					<input type="hidden" class="individual_productNo_input" value="${cart.productNo}">
				</td>
				
				<td><a href="/member/cart/delete?productNo=${cart.productNo }">X</a></td>
				<td class="image-prod"><div class="img" style="background-image:url(img/${cart.imageURL });"></div></td>
				<td>${cart.productName }</td>
				<td class="cart_price">${cart.price }</td>
				<td>
					<div class="quantity_div">
						<input type="text" value="${cart.quantity}" class="quantity_input" style="width: 40px; text-align: center;">
						<button class="plusBtn">+</button>
						<button class="minusBtn">-</button>
					</div>
					<a class="quantity_modify_btn" data-productNo="${cart.productNo }">변경</a>
				</td>
			</tr>
		</c:forEach>
		</c:if>
	</table>
	<br><br><br>
	<div class="total">
		<h3>Cart Totals</h3>
		<hr>
			<span style="font-weight: border;">Total</span>
		<hr>
			<span class="totalPrice_span">0</span> 원
		<hr>
		<p class="text-center"><input type="button" onclick="order()" class="btn btn-primary py-3 px-4" value="Order"></p>
	</div>
	
	<!-- 수량 조정 form -->
	<form action="/cartUpdate" method="post" class="quantity_update_form">
		<input type="hidden" name="productNo" class="update_productNo">
		<input type="hidden" name="quantity" class="update_quantity">
	</form>	

</div>
<!-- 실제 작업 공간 끝 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script type="text/javascript">

//수량 조정 (+/-)
$(".plusBtn").on("click", function(){
	let quantity = $(this).parent("div").find("input").val();
	$(this).parent("div").find("input").val(++quantity);
});

$(".minusBtn").on("click", function(){
	let quantity = $(this).parent("div").find("input").val();
	if(quantity > 1){
		$(this).parent("div").find("input").val(--quantity);
	}
});

//수량 수정 버튼
$(".quantity_modify_btn").on("click", function(){
	let productNo = $(this).data("productno");
	let quantity = $(this).parent("td").find("input").val();
	
	$(".update_productNo").val(productNo);
	$(".update_quantity").val(quantity);
	$(".quantity_updateForm").submit();
});

$(document).ready(function(){
	setTotal();
});

/*총 합계 function*/
function setTotal(){
	var totalPrice=0;
	
	$(".cart_info_td").each(function(index, element){
		totalPrice += parseInt($(element).find(".individual_totalPrice_input").val());
	});
	
	/* 가격 pattern/ Javscript Number 객체의 toLocaleString() */
	$(".totalPrice_span").text(totalPrice.toLocaleString());
}

</script>
<!-- footer -->
<%@ include file="../inc/main_bottom.jsp"%>