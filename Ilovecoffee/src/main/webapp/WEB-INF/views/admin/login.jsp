<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="utf-8">
    <title>관리자 페이지</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Favicon -->
    <link href="/img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600;700&display=swap" rel="stylesheet">
    
    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="/lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />

    <!-- Customized Bootstrap Stylesheet -->
    <link href="/css/admin/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="/css/admin/adminstyle.css" rel="stylesheet">
</head>

<body>
        <!-- Sign Up Start -->
        <form action="/admin/loginProc" method="post">
	    <div class="container-xxl position-relative bg-white d-flex p-0">
	        <div class="container-fluid">
	            <div class="row h-100 align-items-center justify-content-center" style="min-height: 100vh;">
	                <div class="col-12 col-sm-8 col-md-6 col-lg-5 col-xl-4">
	                    <div class="bg-light rounded p-4 p-sm-5 my-4 mx-3">
	                        <div class="d-flex align-items-center justify-content-between mb-3">
	                            <a href="index.html" class="">
	                                <h3 class="text-primary"><i class="fa fa-hashtag me-2"></i>관리자 로그인</h3>
	                            </a>
	                        </div>
	                        <div class="form-floating mb-3">
	                            <input type="text" class="form-control" id="floatingText" name="userid" placeholder="jhondoe">
	                            <label for="floatingText">adminID</label>
	                        </div>
	                        <div class="form-floating mb-4">
	                            <input type="password" class="form-control" id="floatingPassword" name="pwd" placeholder="Password">
	                            <label for="floatingPassword">Password</label>
	                        </div>
	                        <div class="d-flex align-items-center justify-content-between mb-4">
	                            <a href="/admin/findPW">비밀번호 찾기</a>
	                        </div>
	                        <button type="submit" class="btn btn-primary py-3 w-100 mb-4">로그인</button>
	                        <p class="text-center mb-0">회원가입하기 <a href="/admin/signup">Sign up</a></p>
	                    </div>
	                </div>
	            </div>
	        </div>
	    </div>
        </form>
        <!-- Sign Up End -->

    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="lib/chart/chart.min.js"></script>
    <script src="lib/easing/easing.min.js"></script>
    <script src="lib/waypoints/waypoints.min.js"></script>
    <script src="lib/owlcarousel/owl.carousel.min.js"></script>
    <script src="lib/tempusdominus/js/moment.min.js"></script>
    <script src="lib/tempusdominus/js/moment-timezone.min.js"></script>
    <script src="lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

    <!-- Template Javascript -->
    <script src="js/main.js"></script>
</body>

</html>