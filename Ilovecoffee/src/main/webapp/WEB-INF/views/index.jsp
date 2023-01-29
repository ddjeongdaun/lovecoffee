<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="inc/main_top.jsp" %>
<!-- 메인 header -->
    <!-- Carousel Start -->
    <div class="container-fluid p-0 mb-5">
        <div id="blog-carousel" class="carousel slide overlay-bottom" data-ride="carousel">
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img class="w-100" src="img/carousel-1.jpg" alt="Image">
                    <div class="carousel-caption d-flex flex-column align-items-center justify-content-center">
                    	<c:if test="${empty name_session }">
                    		<h1 style="color: white;">환영합니다</h1>
                    	</c:if>
                    	<c:if test="${!empty name_session }">
                    		<h1 style="color: white;">${name_session }님 환영합니다</h1>
                    	</c:if>
                    	<p class="mb-4 mb-md-5">한 잔의 커피를 넘어 문화를 마시다</p>
                        <h2 style="color: white;">I LOVE COFFEE</h2>
                        <p><a href="/shop" class="btn btn-primary p-3 px-xl-4 py-xl-3">Order Now</a></p>
                    </div>
                </div>
                <div class="carousel-item">
                    <img class="w-100" src="img/carousel-2.jpg" alt="Image">
                    <div class="carousel-caption d-flex flex-column align-items-center justify-content-center">
                        <h1 style="color: white;">부드러운 맛 &amp; 아름다운 공간</h1>
                        <p class="mb-4 mb-md-5">당신에게 최상의 서비스를 제공하겠습니다</p>
                        <h2 style="color: white;">I LOVE COFFEE</h2>
                        <p><a href="/shop" class="btn btn-primary p-3 px-xl-4 py-xl-3">Order Now</a></p>
                    </div>
                </div>
            </div>
            <a class="carousel-control-prev" href="#blog-carousel" data-slide="prev">
                <span class="carousel-control-prev-icon"></span>
            </a>
            <a class="carousel-control-next" href="#blog-carousel" data-slide="next">
                <span class="carousel-control-next-icon"></span>
            </a>
        </div>
    </div>
    <!-- Carousel End -->


    <!-- About Start -->
    <div class="container-fluid py-5">
        <div class="container">
            <div class="section-title">
                <h4 class="text-primary text-uppercase" style="letter-spacing: 5px;">About Us</h4>
                <h1 class="display-4">Since 1950</h1>
            </div>
            <div class="row">
                <div class="col-lg-4 py-0 py-lg-5">
                    <h1 class="mb-3">Our Story</h1>
                    <h5 class="mb-3">Eos kasd eos dolor vero vero, lorem stet diam rebum. Ipsum amet sed vero dolor sea</h5>
                    <p>Takimata sed vero vero no sit sed, justo clita duo no duo amet et, nonumy kasd sed dolor eos diam lorem eirmod. Amet sit amet amet no. Est nonumy sed labore eirmod sit magna. Erat at est justo sit ut. Labor diam sed ipsum et eirmod</p>
                    <a href="/about" class="btn btn-secondary font-weight-bold py-2 px-4 mt-2">About us</a>
                </div>
                <div class="col-lg-4 py-5 py-lg-0" style="min-height: 500px;">
                    <div class="position-relative h-100">
                        <img class="position-absolute w-100 h-100" src="img/about.png" style="object-fit: cover;">
                    </div>
                </div>
                <div class="col-lg-4 py-0 py-lg-5">
                    <h1 class="mb-3">Our Vision</h1>
                    <p>Invidunt lorem justo sanctus clita. Erat lorem labore ea, justo dolor lorem ipsum ut sed eos, ipsum et dolor kasd sit ea justo. Erat justo sed sed diam. Ea et erat ut sed diam sea ipsum est dolor</p>
                    <h5 class="mb-3"><i class="fa fa-check text-primary mr-3"></i>신선한 최상의 원두</h5>
                    <h5 class="mb-3"><i class="fa fa-check text-primary mr-3"></i>홈페이지로 미리주문하기</h5>
                    <h5 class="mb-3"><i class="fa fa-check text-primary mr-3"></i>온라인으로 자리예약까지</h5>
                    <a href="/about" class="btn btn-primary font-weight-bold py-2 px-4 mt-2">About us</a>
                </div>
            </div>
        </div>
    </div>
    <!-- About End -->


    <!-- Service Start -->
    <div class="container-fluid pt-5">
        <div class="container">
            <div class="section-title">
                <h4 class="text-primary text-uppercase" style="letter-spacing: 5px;">Our Services</h4>
                <h1 class="display-4">Fresh & Organic Beans</h1>
            </div>
            <div class="row">
                <div class="col-lg-6 mb-5">
                    <div class="row align-items-center">
                        <div class="col-sm-5">
                            <img class="img-fluid mb-3 mb-sm-0" src="img/service-1.jpg" alt="">
                        </div>
                        <div class="col-sm-7">
                            <h4><i class="fa fa-truck service-icon"></i>아이러브커피로 더욱 풍성하게!</h4>
                            <p class="m-0">홈페이지에서 미리 주문하여
                            			시간을 절약하세요!</p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 mb-5">
                    <div class="row align-items-center">
                        <div class="col-sm-5">
                            <img class="img-fluid mb-3 mb-sm-0" src="img/service-2.jpg" alt="">
                        </div>
                        <div class="col-sm-7">
                            <h4><i class="fa fa-coffee service-icon"></i>신선한 원두</h4>
                            <p class="m-0">최상의 커피를 위해
                            			가장 신선한 원두만을 사용합니다.</p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 mb-5">
                    <div class="row align-items-center">
                        <div class="col-sm-5">
                            <img class="img-fluid mb-3 mb-sm-0" src="img/service-3.jpg" alt="">
                        </div>
                        <div class="col-sm-7">
                            <h4><i class="fa fa-award service-icon"></i>취향에 맞는 원두 선택</h4>
                            <p class="m-0">취향에 맞는 원두 선택으로 더 다양하게,
                            				더 맛있게</p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 mb-5">
                    <div class="row align-items-center">
                        <div class="col-sm-5">
                            <img class="img-fluid mb-3 mb-sm-0" src="img/service-4.jpg" alt="">
                        </div>
                        <div class="col-sm-7">
                            <h4><i class="fa fa-table service-icon"></i>온라인 자리예약까지</h4>
                            <p class="m-0">커피 테이크 아웃 예약 뿐만이 아니라,
                            				카페 자리까지 예약해보세요.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Service End -->

<%@ include file="inc/main_bottom.jsp" %>