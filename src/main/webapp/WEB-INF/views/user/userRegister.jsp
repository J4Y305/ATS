<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>ATS</title>
<meta content="" name="description">
<meta content="" name="keywords">

<!-- Favicons -->
<link href="/resources/admin/assets/img/favicon.png" rel="icon">
<link href="/resources/admin/assets/img/apple-touch-icon.png"
	rel="apple-touch-icon">

<!-- Google Fonts -->
<link href="https://fonts.gstatic.com" rel="preconnect">
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
	rel="stylesheet">

<!-- Vendor CSS Files -->
<link
	href="/resources/admin/assets/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="/resources/admin/assets/vendor/bootstrap-icons/bootstrap-icons.css"
	rel="stylesheet">
<link
	href="/resources/admin/assets/vendor/boxicons/css/boxicons.min.css"
	rel="stylesheet">
<link href="/resources/admin/assets/vendor/quill/quill.snow.css"
	rel="stylesheet">
<link href="/resources/admin/assets/vendor/quill/quill.bubble.css"
	rel="stylesheet">
<link href="/resources/admin/assets/vendor/remixicon/remixicon.css"
	rel="stylesheet">
<link href="/resources/admin/assets/vendor/simple-datatables/style.css"
	rel="stylesheet">

<!-- Template Main CSS File -->
<link href="/resources/admin/assets/css/style.css" rel="stylesheet">

<!-- =======================================================
  * Template Name: NiceAdmin
  * Updated: Jul 27 2023 with Bootstrap v5.3.1
  * Template URL: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
</head>
<body>
	<script type="text/javascript">
	function openIdChk(){
        
        window.name = "parentForm";
        window.open("/user/idCheckForm",
                "chkForm", "width=500, height=300, resizable = no, scrollbars = no");    
    }
	
	function inputIdChk(){
        document.userInfo.idDuplication.value ="idUncheck";
    }
	
	function fn_joinMember(){
		var userInfo = document.userInfo;
		var id = userInfo.userId.value;
		
		if(userInfo.idDuplication.value != "idCheck"){
			alert("아이디 중복확인을 해주세요!");
			userInfo.userId.focus();
		}
	}
	</script>
	
	<main>
	<div class="container">

		<section
			class="section register min-vh-100 d-flex flex-column align-items-center justify-content-center py-4">
		<div class="container">
			<div class="row justify-content-center">
				<div
					class="col-lg-4 col-md-6 d-flex flex-column align-items-center justify-content-center">

					<div class="d-flex justify-content-center py-4">
						<a href="/" class="logo d-flex align-items-center w-auto">
							<img src="assets/img/logo.png" alt=""> <span
							class="d-none d-lg-block">Register</span>
						</a>
					</div>
					<!-- End Logo -->

					<div class="card mb-3">

						<div class="card-body">

							<div class="pt-4 pb-2">
								<h5 class="card-title text-center pb-0 fs-4">Create an
									Account</h5>
								<p class="text-center small">Enter your personal details to
									create account</p>
							</div>

							<form class="row g-3 needs-validation" method="post" name="userInfo" novalidate>
								<div class="col-12">
									<label for="yourUsername" class="form-label">ID</label> 
									<!-- <input type="text" name="userId" class="form-control" id="yourUsername" required> -->
									 <input type="text" name="userId" maxlength="50" onkeydown="inputIdChk()" 
									 class="form-control" id="yourUsername" required>
									 <input type="button" value="중복확인" onclick="openIdChk()" class="btn btn-outline-success">    
                        				<input type="hidden" name="idDuplication" value="idUncheck" >
									<div class="invalid-feedback">Please, enter your ID!</div>
									<!-- <button class="idc" type="button" id="idc" onclick="idc();"
										value="N">중복확인</button> -->
									<!-- <span class="id_ok" style="color: green; display: none;">사용가능한
										아이디입니다</span> <span class="id_already"
										style="color: red; display: none;">중복된 아이디입니다</span> -->
								</div>

								<div class="col-12">
									<label for="yourPassword" class="form-label">Password</label> <input
										type="password" name="userPwd" class="form-control"
										id="yourPassword" required>
									<div class="invalid-feedback">Please enter your password!</div>
								</div>

								<div class="col-12">
									<label for="yourPasswordcheck" class="form-label">Passwordcheck</label>
									<input type="password" name="pwdc" class="form-control"
										id="pwdc" required>
									<div class="invalid-feedback">Please enter your password
										onemore!</div>
								</div>

								<div class="col-12">
									<label for="yourName" class="form-label">Your Name</label> <input
										type="text" name="userName" class="form-control" id="yourName"
										required>
									<div class="invalid-feedback">Please choose a username!</div>
								</div>

								<div class="col-12">
									<label for="Birthday" class="form-label">Your Birthday</label>
									<input type="text" name="birthDay" class="form-control"
										id="birthDay" placeholder="YYYY-MM-DD" required>
									<div class="invalid-feedback">Please enter your birthday!</div>
								</div>

								<div class="col-12">
									<label for="PhoneNumber" class="form-label">Your
										PhoneNumber</label> <input type="text" name="userPhone"
										class="form-control" id="userPhone"
										placeholder="010-XXXX-XXXX" required>
									<div class="invalid-feedback">Please enter your
										PhoneNumber!</div>
								</div>

								<div class="col-12">
									<label for="Gender" class="form-label">Your Gender</label> <input
										type="radio" name="gender" value="1" required> 남자 
										<input type="radio" name="gender" value="2" required> 여자
									<div class="invalid-feedback">Please check your Gender!</div>
								</div>



								<div class="col-12">
									<label for="userEmail" class="form-label">Email</label>
									<div class="input-group has-validation">
										<span class="input-group-text" id="inputGroupPrepend">@</span>
										<input type="text" name="userEmail" class="form-control"
											id="userEmail" required>
										<div class="invalid-feedback">Please enter a valid
											Email.</div>
									</div>
								</div>


								<div class="col-12">
									<div class="form-check">
										<input class="form-check-input" name="terms" type="checkbox"
											value="" id="acceptTerms" required> <label
											class="form-check-label" for="acceptTerms">I agree
											and accept the <a href="#">terms and conditions</a>
										</label>
										<div class="invalid-feedback">You must agree before
											submitting.</div>
									</div>
								</div>
								<div class="col-12">
									<button class="btn btn-primary w-100" type="submit">Create
										Account</button>
								</div>
								<div class="col-12">
									<p class="small mb-0">
										Already have an account? <a href="/user/login">Log in</a>
									</p>
								</div>
							</form>

						</div>
					</div>

					<div class="credits">
						<!-- All the links in the footer should remain intact. -->
						<!-- You can delete the links only if you purchased the pro version. -->
						<!-- Licensing information: https://bootstrapmade.com/license/ -->
						<!-- Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/ -->
						Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
					</div>

				</div>
			</div>
		</div>

		</section>

	</div>
	</main>
	<!-- End #main -->

	<a href="#"
		class="back-to-top d-flex align-items-center justify-content-center"><i
		class="bi bi-arrow-up-short"></i></a>

	<!-- Vendor JS Files -->
	<script
		src="/resources/admin/assets/vendor/apexcharts/apexcharts.min.js"></script>
	<script
		src="/resources/admin/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="/resources/admin/assets/vendor/chart.js/chart.umd.js"></script>
	<script src="/resources/admin/assets/vendor/echarts/echarts.min.js"></script>
	<script src="/resources/admin/assets/vendor/quill/quill.min.js"></script>
	<script
		src="/resources/admin/assets/vendor/simple-datatables/simple-datatables.js"></script>
	<script src="/resources/admin/assets/vendor/tinymce/tinymce.min.js"></script>
	<script src="/resources/admin/assets/vendor/php-email-form/validate.js"></script>

	<!-- Template Main JS File -->
	<script src="/resources/admin/assets/js/main.js"></script>

</body>
</html>