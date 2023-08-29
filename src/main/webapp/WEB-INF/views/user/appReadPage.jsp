<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fmt2" uri="http://java.sun.com/jstl/fmt_rt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<jsp:include page="../include/user_header.jsp" />
<main id="main" class="main">

<div class="pagetitle">
	<h1>공고 정보</h1>

</div>
<!-- End Page Title -->
<section class="section">
	<div class="row">
		<div class="col-lg-10">
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
					<div id="example1" style="height: 80rem; width: 50rem;"></div>
					<script>
						PDFObject.embed("/file/${appVO.appFile}", "#example1");
					</script>
				</div>
				<div class="row mb-3">
					<div class="col-sm-10">
						<button type="submit" onclick="" class="btn btn-outline-danger">삭제</button>
						<button type="submit" onclick="" class="btn btn-outline-warning">수정</button>
						<button type="button" class="btn btn-outline-primary">목록</button>
					</div>
				</div>

			</form>
		</div>

	</div>

</section>
</main>
<jsp:include page="../include/admin_footer.jsp" />
<script>
	$(document).ready(function() {

		var formObj = $("form[role='form']");

		console.log(formObj);

		$(".btn-outline-warning").on("click", function() {
			formObj.attr("action", "/user/appModifyPage");
			formObj.attr("method", "get");
			formObj.submit();
		});

		$(".btn-outline-danger").on("click", function() {
			formObj.attr("action", "/user/appRemovePage");
			formObj.submit();
		});

		$(".btn-outline-primary").on("click", function() {
			self.location = "/user/appStoreList";
		});

	});
</script>