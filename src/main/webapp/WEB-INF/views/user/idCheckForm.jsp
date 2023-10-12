<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>GreetingATS</title>
<meta content="" name="description">
<meta content="" name="keywords">
<!-- jQuery -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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
<div class="card">
	<div class="card-body">
		<h5 class="card-title">ID 중복확인</h5>
		<form method=post name=formm style="margin-right: 0"
			action="idCheckForm">
			<div class="row">
				<div class="form-group col-md-6">
					<input type=text name="userId" value="" class="form-control"
						id="userId" required> <input type=submit value="검색"
						class="submit btn btn-outline-primary my-3" ><br>
					<div class="modal-body">
						<c:if test="${message == 1}">
							<script type="text/javascript">
								opener.document.formm.id.value = "";
							</script>
        ${userId}는 이미 사용중인 아이디입니다.
      </c:if>
						<c:if test="${message==0}">
        ${userId}는 사용 가능한 ID입니다.
        <input type="button" value="사용" class="cancel" onclick="idok()">
						</c:if>
					</div>
				</div>
			</div>
		</form>
	</div>
</div>
<script type="text/javascript">
	function idok() {
		opener.userInfo.userId.value = "${userId}";
		//opener.userInfo.reid.value = "${userId}";
		self.close();
	}
</script>
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