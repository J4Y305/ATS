<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>	ATS - Applicant Tracking System</title>
<meta content="" name="description">
<meta content="" name="keywords">

<!-- Favicons -->
<link href="/resources/user/assets/img/favicon.png" rel="icon">
<link href="/resources/user/assets/img/apple-touch-icon.png"
	rel="apple-touch-icon">
<!-- jQuery -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Jost:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
	rel="stylesheet">

<!-- Vendor CSS Files -->
<link href="/resources/user/assets/vendor/aos/aos.css" rel="stylesheet">
<link
	href="/resources/user/assets/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="/resources/admin/assets/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="/resources/admin/assets/vendor/bootstrap-icons/bootstrap-icons.css"
	rel="stylesheet">	
<link
	href="/resources/user/assets/vendor/bootstrap-icons/bootstrap-icons.css"
	rel="stylesheet">
<link href="/resources/user/assets/vendor/boxicons/css/boxicons.min.css"
	rel="stylesheet">
<link
	href="/resources/user/assets/vendor/glightbox/css/glightbox.min.css"
	rel="stylesheet">
<link href="/resources/user/assets/vendor/remixicon/remixicon.css"
	rel="stylesheet">
<link href="/resources/user/assets/vendor/swiper/swiper-bundle.min.css"
	rel="stylesheet">
	

<!-- Template Main CSS File -->
<link href="/resources/user/assets/css/style.css" rel="stylesheet">


<!-- =======================================================
  * Template Name: Arsha
  * Updated: Jul 27 2023 with Bootstrap v5.3.1
  * Template URL: https://bootstrapmade.com/arsha-free-bootstrap-html-template-corporate/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
  <link rel="stylesheet" href="https://unpkg.com/aos@next/dist/aos.css" />
</head>

<body>
	<!-- ======= Header ======= -->
	<header id="header" class="fixed-top ">
		<div class="container d-flex align-items-center">

			<h1 class="logo me-auto">
				<a href="/">Greeting-ATS</a>
			</h1>
			<nav id="navbar" class="navbar">
        <ul>
          <li><a class="nav-link scrollto" href="/#hero">Home</a></li>
          <li><a class="nav-link scrollto" href="/#about">About</a></li>
          <li><a class="nav-link scrollto" href="/#contact">Contact</a></li>
          <li><a class="nav-link scrollto" href="/annListMainPage#annListMainPage">채용공고</a></li>
          
          <li><c:if test="${null eq login.userId}">
          <a class="getstarted scrollto" href="/user/login">로그인</a></c:if></li>
          <li><c:if test="${null eq login.userId}">
          <a class="nav-link scrollto" href="/user/userRegister">회원가입</a></c:if></li>
          <li><c:if test="${null ne login.userId}">
          <a class="nav-link scrollto" href="/user" onclick="submitFormWithUserId()">마이페이지</a>
          <form id="userIdForm" action="/user" method="GET" style="display: none;">
			<input type="hidden" name="userId" id="userIdInput"></form></c:if></li>
          <li><c:if test="${null ne login.userId}">
          <a class="nav-link scrollto" href="/user/logout">로그아웃</a></c:if></li>
          
          
          
        </ul>
        <i class="bi bi-list mobile-nav-toggle"></i>
      </nav><!-- .navbar -->


		</div>

	</header>
	<!-- End Header -->
	



	<script>
		function submitFormWithUserId() {
			var userId = "${login.userId}"; // 여기서 사용자 아이디 값을 설정합니다.
			document.getElementById("userIdInput").value = userId;
			document.getElementById("userIdForm").submit();
		}
	</script>
<style>
#header.header-scrolled,
#header.header-inner-pages {
  background: rgba(40, 58, 90, 0.9);
}
#header:hover{
  padding:15px;
  
}
#header{
	background: rgba(40, 58, 90, 0.9);
}

.logo:hover {
  text-shadow: 0 0 10px rgba(221, 221, 221, 0.8),
               0 0 20px rgba(221, 221, 221, 0.8);
}

.nav-up {
    top: -73px;
}

</style>
<script src="https://unpkg.com/aos@next/dist/aos.js"></script>
  <script>
  AOS.init();
  </script>
<script>
// Hide Header on on scroll down
var didScroll;
var lastScrollTop = 0;
var delta = 5;
var navbarHeight = $('header').outerHeight();

$(window).scroll(function(event){
    didScroll = true;
});

setInterval(function() {
    if (didScroll) {
        hasScrolled();
        didScroll = false;
    }
}, 250);

function hasScrolled() {
    var st = $(this).scrollTop();
    
    // Make sure they scroll more than delta
    if(Math.abs(lastScrollTop - st) <= delta)
        return;
    
    // If they scrolled down and are past the navbar, add class .nav-up.
    // This is necessary so you never see what is "behind" the navbar.
    if (st > lastScrollTop && st > navbarHeight){
        // Scroll Down
        $('header').removeClass('nav-down').addClass('nav-up');
    } else {
        // Scroll Up
        if(st + $(window).height() < $(document).height()) {
            $('header').removeClass('nav-up').addClass('nav-down');
        }
    }
    
    lastScrollTop = st;
}
</script>