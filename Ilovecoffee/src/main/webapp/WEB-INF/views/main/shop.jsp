<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/main_top.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
<style type="text/css">
.menu{
	margin:10px;
}

</style>
</head>
<!-- 실제 작업 공간 -->

<!-- Page Header Start -->
    <div class="container-fluid page-header mb-5 position-relative overlay-bottom">
        <div class="d-flex flex-column align-items-center justify-content-center pt-0 pt-lg-5" style="min-height: 400px">
            <h1 class="display-4 mb-3 mt-0 mt-lg-5 text-white text-uppercase">Shop</h1>
            <div class="d-inline-flex mb-lg-5">
                <p class="m-0 text-white"><a class="text-white" href="/">Home</a></p>
                <p class="m-0 text-white px-2">/</p>
                <p class="m-0 text-white">Shop</p>
            </div>
        </div>
    </div>
<!-- Page Header End -->

<!-- Menu Start -->
    <div class="container-fluid pt-5">
        <div class="container">
            <div class="section-title">
                <h4 class="text-primary text-uppercase" style="letter-spacing: 5px;">Menu & Pricing</h4>
                <h1 class="display-4">MENU</h1>
            </div>
            <div class="row">
            
            	<c:if test="${empty list }">
            		<div class="col-lg-6">
            			<h1 class="mb-5">조회되는 메뉴가 없습니다.</h1>
            		</div>
            	</c:if>
            	
            	<c:if test="${!empty list }">
            	<c:forEach var="m" items="${list }">
	                <div class="col-lg-6">
	                    <h1 class="mb-5">
	                    <c:if test="${m.categoryNo eq 1}">ICE</c:if>
	                    <c:if test="${m.categoryNo eq 2}">HOT</c:if>
	                    </h1>
	                    <div class="row align-items-center mb-5">
	                        <div class="col-4 col-sm-3">
	                            <img class="w-100 rounded-circle mb-3 mb-sm-0" src="/img/${m.imageURL }" alt="">
	                            <h5 class="menu-price">${m.price }</h5>
	                        </div>
	                        <div class="col-8 col-sm-9">
	                            <h4>${m.productName }</h4>
	                            <p class="m-0">${m.explains }</p>
	                            <p><a href="/member/cartIn?productNo=${m.productNo }" class="btn btn-primary btn-outline-primary">Add to Cart</a></p>
	                        </div>
	                    </div>
	                </div>
            	</c:forEach>
            	</c:if>
            </div>
        </div>
    </div>
    <!-- Menu End -->
	
<!-- 실제 작업 공간 끝 -->

<!-- footer -->
<%@ include file="../inc/main_bottom.jsp" %>