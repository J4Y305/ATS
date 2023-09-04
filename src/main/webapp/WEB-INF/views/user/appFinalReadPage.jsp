<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fmt2" uri="http://java.sun.com/jstl/fmt_rt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<jsp:include page="../include/user_header.jsp" />
<main id="main" class="main" style="padding-top: 50px;">


<!-- End Page Title -->
<section class="section">
<div class="row justify-content-center">
	<div class="col-lg-10">
<div class="pagetitle">
	<h1>제출 완료한 지원서</h1>

</div>
	<div class="card">
				<div class="card-body mt-5" style="height: 1750px;">
						<div class="card-body" style="height: 550px;">
			<!-- General Form Elements -->
			<form class="row g-3" role="form" method="post" name="frm"
				action="mngModifyPage">
				<div class="card">
					<input type="hidden" name="userId" class="form-control"
						value='${login.userId}'> <input type="hidden"
						name="appNum" class="form-control" value='${appVO.appNum}'>
					<div class="card-body">
						<h5 class="card-title">공고 정보</h5>
						<div class="row mb-3 ">
							<label class="col-sm-3 col-form-label">공고명 :</label>
							<div class="col-sm-5">
								<div class="col-lg-9 col-md-8">${annVO.annName}</div>
							</div>
						</div>
						<div class="row mb-3">
							<label class="col-sm-3 col-form-label">모집분야 :</label>
							<div class="col-sm-5">
								<div class="col-lg-9 col-md-8">${annVO.annField}</div>
							</div>
						</div>
					</div>
				</div>
				<div class="card">
				<div class="row justify-content-center">
					<div id="example1" style="height: 80rem; width: 50rem;"></div>
					<script>
						PDFObject.embed("/file/${appVO.appFile}", "#example1");
					</script>
				</div>
				<div class="row mb-3 p-4 justify-content-center">
									<div class="col-sm-10 d-flex justify-content-center">
						<button type="button" class="btn btn-outline-primary btn-lg" style="margin:10px">목록</button>
					</div>
				</div>
			</div>
			
			</form>
		</div>

	</div>
	</div>
	</div>
	</div>

</section>
</main>
<jsp:include page="../include/admin_footer.jsp" />
<script>
	$(document).ready(function() {

		var formObj = $("form[role='form']");

		console.log(formObj);


		$(".btn-outline-primary").on("click", function() {
			self.location = "/user/appFinalList";
		});

	});
</script>