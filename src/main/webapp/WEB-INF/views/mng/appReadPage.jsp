<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fmt2" uri="http://java.sun.com/jstl/fmt_rt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<jsp:include page="../include/mng_header.jsp" />
<main id="main" class="main" style="padding-top: 50px;"> <!-- End Page Title -->

<section class="section">
	<div class="row justify-content-center">
		<div class="col-lg-8">
			<div class="pagetitle">
				<h1>제출 완료한 지원서</h1>
			</div>
			<!-- General Form Elements -->
			<form class="row g-3" role="form" method="post" name="frm"
				action="mngModifyPage">
				<%-- <input type="hidden" name="userId" class="form-control"
					value='${login.userId}'> <input type="hidden" name="appNum"
					class="form-control" value='${appVO.appNum}'> --%>
				<div class="card p-4">
					<div class="card-body">
						<div class="card">
							<div class="card-body">
								<div class="icon">
									<h5 class="card-title fw-bold">
										<i class="bi bi bi-tags mx-3"></i>지원한 공고 기본 정보
									</h5>
								</div>
								<div class="row mb-3 ">
									<label class="col-sm-3 col-form-label fw-bold">공고명 :</label>
									<div class="col-sm-5">
										<div class="pt-2">${annVO.annName}</div>
									</div>
								</div>
								<div class="row mb-3">
									<label class="col-sm-3 col-form-label fw-bold">모집분야 :</label>
									<div class="col-sm-5">
										<div class="pt-2">${annVO.annField}</div>
									</div>
								</div>
								<div class="row mb-3">
									<label class="col-sm-3 col-form-label fw-bold">공고 시작일 :</label>
									<div class="col-sm-5 pt-2">
										<fmt:formatDate pattern="yyyy-MM-dd"
											value="${annVO.annStartDate}" />
									</div>
								</div>
								<div class="row mb-3">
									<label class="col-sm-3 col-form-label fw-bold">공고 마감일:</label>
									<div class="col-sm-5 pt-2">
										<fmt:formatDate pattern="yyyy-MM-dd"
											value="${annVO.annEndDate}" />
									</div>
								</div>
							</div>
						</div>
						<div class="card">
							<div class="card-body justify-content-center">
								<div class="icon">
									<h5 class="card-title fw-bold">
										<i class="bi bi-file-text mx-3"></i>지원서 파일
									</h5>
								</div>
								<div id="example1"
									style="height: 80rem;"></div>
								<script>
									PDFObject.embed("/file/${appVO.appFile}",
											"#example1");
								</script>
							</div>
						</div>
						<div class="row mb-3 p-4 justify-content-center">
							<div class="col-sm-10 d-flex justify-content-center">

								<button type="button" class="btn btn-outline-primary btn-lg">목록</button>

							</div>
						</div>
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

		$(".btn-outline-primary").on("click", function() {
			self.location = "/user/appFinalList";
		});

	});
</script>