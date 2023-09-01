<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>

<head>

<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>ATS - Login</title>
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

<script type="text/javascript">
<!--

//-->
</script>


<script>
$(function(){
/*     $("#idc").click(function(){
    
        let userId= $("#userId").val();
         
        $.ajax({
            type:'post', //post 형식으로 controller 에 보내기위함!!
            url:"user", // 컨트롤러로 가는 mapping 입력
            data: {"userId":userId}, 
            success: function(data){ 
                if(data == "N"){ // 만약 성공할시
                    result = "사용 가능한 아이디입니다.";
                    $("#idc").html(result).css("color", "green");
                    $("#userPwd").trigger("focus");
                 
             }else{ // 만약 실패할시
                 result="이미 사용중인 아이디입니다.";
                     $("#idc").html(result).css("color","red");
                     $("#userId").val("").trigger("focus");
             }
                 
         },
            error : function(error){alert(error);}
        });
        
    });
    
}); */

 
 
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
						<a href="index.html" class="logo d-flex align-items-center w-auto">
							<img src="assets/img/logo.png" alt=""> <span
							class="d-none d-lg-block">ATS</span>
						</a>
					</div>
					<!-- End Logo -->

					<div class="card mb-3">

						<div class="card-body">

							<div class="pt-4 pb-2">
								<h5 class="card-title text-center pb-0 fs-4">평가자 로그인</h5>
								<p class="text-center small">Enter your username & password
									to login</p>
							</div>

							<form class="row g-3 needs-validation" action="/rater/loginPost"
								method="POST" novalidate>

								<div class="col-12">
									<label for="yourUsername" class="form-label">ID</label> <input
										type="text" name="raterId" class="form-control" id="raterId"
										required>
									<div class="invalid-feedback">Please enter your ID.</div>

								</div>

								<div class="col-12">
									<label for="yourPassword" class="form-label">Password</label> <input
										type="password" name="raterPwd" class="form-control"
										id="raterPwd" required>
									<div class="invalid-feedback">Please enter your password!</div>
								</div>

								<div class="col-12">
									<button class="btn btn-primary w-100" type="submit">Login</button>
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
