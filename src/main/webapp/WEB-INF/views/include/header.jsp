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
			<i class="bi bi-list toggle-sidebar-btn"></i>
			
    
			<!-- Uncomment below if you prefer to use an image logo -->
			<!-- <a href="index.html" class="logo me-auto"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->

			<nav id="navbar" class="navbar">
				<ul>
					<li><a class="nav-link scrollto active" href="/">Home</a></li>
					<li><a class="getstarted scrollto" href="#about">About</a></li>
					<li><a class="nav-link scrollto" href="/annListMainPage">채용
							공고</a></li>
					<li><c:if test="${null eq login.userId}">
							<a class="nav-link scrollto" href="/user/login">로그인</a>
						</c:if></li>
					<li><c:if test="${null eq login.userId}">
							<a class="nav-link scrollto" href="/user/userRegister">회원가입</a>
						</c:if></li>
					<li><c:if test="${null ne login.userId}">
							<a class="nav-link scrollto" href="/user"
								onclick="submitFormWithUserId()">마이페이지</a>
							<form id="userIdForm" action="/user" method="GET"
								style="display: none;">
								<input type="hidden" name="userId" id="userIdInput">
							</form>
						</c:if></li>
					<li><c:if test="${null ne login.userId}">
							<a class="nav-link scrollto" href="/user/logout">로그아웃</a>
						</c:if></li>


				</ul>
			</nav>
			<!-- .navbar -->


		</div>

	</header>
	<!-- End Header -->
	<aside id="sidebar" class="sidebar">

		<ul class="sidebar-nav" id="sidebar-nav">
		
			<li class="nav-item"><a class="nav-link " href="/user"> <i
					class="bi bi-house"></i> <span>HOME</span>
			</a></li>

			<li class="nav-item">
			<a class="nav-link " href="/annListMainPage"> 
			<i class="bi bi-card-list"></i> <span>채용공고</span>
			</a></li>
			
			<li class="nav-item">
			<c:if test="${null eq login.userId}">
			<a class="nav-link " href="/user/login"> 
			<i class="bi bi-key box-arrow-in-right"></i> <span>로그인</span>
			</a></c:if></li>
			
			<li class="nav-item">
			<c:if test="${null eq login.userId}">
			<a class="nav-link " href="/user/userRegister"> 
			<i class="bi bi-person-plus-fill"></i> <span>회원가입</span>
			</a></c:if></li>
			
			<li class="nav-item"><c:if test="${null ne login.userId}">
			<a class="nav-link " href="/user" onclick="submitFormWithUserId()"> 
			<i class="bi bi-person-fill"></i> <span>마이페이지</span></a>
			<form id="userIdForm" action="/user" method="GET" style="display: none;">
				<input type="hidden" name="userId" id="userIdInput">
			</form></c:if></li>
			
			<li class="nav-item">
			<c:if test="${null ne login.userId}">
			<a class="nav-link " href="/user/logout"> 
			<i class="bi bi-arrow-return-right"></i> <span>로그아웃</span>
			</a></c:if></li>
			
			
			
			</ul>
			</aside>



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
.navbar a:hover{
  transform: scale(1.2, 1.2);
}
.nav-up {
    top: -73px;
}
.sidebar {
  position: fixed;
  top: 78px;
  right: 0px;
  bottom: 0;
  width: 300px;
  z-index: 996;
  transition: all 0.3s;
  padding: 20px;
  overflow-y: auto;
  scrollbar-width: thin;
  scrollbar-color: #aab7cf transparent;
  box-shadow: 0px 0px 20px rgba(1, 41, 112, 0.1);
  background-color: #fff;
}

@media(min-width: 768px){

.toggle-sidebar-btn{
	display: none;	
}
.sidebar{
	display: none;
}
}

@media(max-width: 768px){

.toggle-sidebar-btn {
  display: block;
  font-size: 32px;
  padding-left: 10px;
  cursor: pointer;
  color: #f8f9fa;
}
.toggle-sidebar .sidebar {
	right: 0px;
}
.sidebar{
	right: -300px;
}
.sidebar-nav {
  padding: 0;
  margin: 0;
  list-style: none;
}

.sidebar-nav li {
  padding: 0;
  margin: 0;
  list-style: none;
}

.sidebar-nav .nav-item {
  margin-bottom: 5px;
}

.sidebar-nav .nav-heading {
  font-size: 11px;
  text-transform: uppercase;
  color: #899bbd;
  font-weight: 600;
  margin: 10px 0 5px 15px;
}

.sidebar-nav .nav-link {
  display: flex;
  align-items: center;
  font-size: 15px;
  font-weight: 600;
  color: #4154f1;
  transition: 0.3;
  background: #f6f9ff;
  padding: 10px 15px;
  border-radius: 4px;
}

.sidebar-nav .nav-link i {
  font-size: 16px;
  margin-right: 10px;
  color: #4154f1;
}

.sidebar-nav .nav-link.collapsed {
  color: #012970;
  background: #fff;
}

.sidebar-nav .nav-link.collapsed i {
  color: #899bbd;
}

.sidebar-nav .nav-link:hover {
  color: #4154f1;
  background: #f6f9ff;
}

.sidebar-nav .nav-link:hover i {
  color: #4154f1;
}

.sidebar-nav .nav-link .bi-chevron-down {
  margin-right: 0;
  transition: transform 0.2s ease-in-out;
}

.sidebar-nav .nav-link:not(.collapsed) .bi-chevron-down {
  transform: rotate(180deg);
}

.sidebar-nav .nav-content {
  padding: 5px 0 0 0;
  margin: 0;
  list-style: none;
}

.sidebar-nav .nav-content a {
  display: flex;
  align-items: center;
  font-size: 14px;
  font-weight: 600;
  color: #012970;
  transition: 0.3;
  padding: 10px 0 10px 40px;
  transition: 0.3s;
}

.sidebar-nav .nav-content a i {
  font-size: 6px;
  margin-right: 8px;
  line-height: 0;
  border-radius: 50%;
}

.sidebar-nav .nav-content a:hover,
.sidebar-nav .nav-content a.active {
  color: #4154f1;
}

.sidebar-nav .nav-content a.active i {
  background-color: #4154f1;
}


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

(function() {
	"use strict";
	
	const select = (el, all = false) => {
	    el = el.trim()
	    if (all) {
	      return [...document.querySelectorAll(el)]
	    } else {
	      return document.querySelector(el)
	    }
	  }
	const on = (type, el, listener, all = false) => {
	    if (all) {
	      select(el, all).forEach(e => e.addEventListener(type, listener))
	    } else {
	      select(el, all).addEventListener(type, listener)
	    }
	  }
	
	if (select('.toggle-sidebar-btn')) {
    on('click', '.toggle-sidebar-btn', function(e) {
      select('body').classList.toggle('toggle-sidebar')
    })
  }
})();
</script>