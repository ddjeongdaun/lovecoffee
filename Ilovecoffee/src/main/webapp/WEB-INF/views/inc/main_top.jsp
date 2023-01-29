<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <title>ILOVECOFFEE</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="Free Website Template" name="keywords">
    <meta content="Free Website Template" name="description">
    
    <!-- 폰트 -->
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Josefin+Sans:400,700" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Great+Vibes" rel="stylesheet">

    <!-- Favicon -->
    <link href="img/favicon.ico" rel="icon">

    <!-- Google Font -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@200;400&family=Roboto:wght@400;500;700&display=swap" rel="stylesheet"> 

    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />

    <!-- Customized Bootstrap Stylesheet -->
    <link
      rel="stylesheet"
      href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
      integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
      crossorigin="anonymous"
    />
    
    <link rel="stylesheet" href="/css/style.css">
    <link rel="stylesheet" href="/css/style.min.css">
    
    <script src="/js/jquery-3.6.0.js"></script>
	<script src="/js/jquery-3.6.0.min.js"></script>
	
</head>

<body>
    <!-- Navbar Start -->
    <div class="container-fluid p-0 nav-bar">
        <nav class="navbar navbar-expand-lg bg-none navbar-dark py-3">
            <a href="/" class="navbar-brand px-lg-4 m-0">
                <p class="m-0 display-4 text-uppercase text-white" style="font-size: 90%; font-weight: bold;">ILOVE<br><small>COFFEE</small></p>
            </a>
            <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse justify-content-between" id="navbarCollapse">
                <div class="navbar-nav ml-auto p-4">
                    <a href="/" class="nav-item nav-link active">Home</a>
                    <a href="/shop" class="nav-item nav-link">Shop</a>
                    <a href="/about" class="nav-item nav-link">About</a>
                    
                    <c:if test="${empty userid_session }">
                    <a href="/member/login" class="nav-item nav-link">Login</a>
                    </c:if>
                    
                    <c:if test="${!empty userid_session }">
                    <a href="/member/logout" class="nav-item nav-link">Logout</a>
                    <a href="/member/mypage" class="nav-item nav-link">Mypage</a>
                    <a href="/member/cart" class="nav-item nav-link">Cart</a>
                    </c:if>
                </div>
            </div>
        </nav>
    </div>
    <!-- Navbar End -->