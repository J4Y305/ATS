<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fmt2" uri="http://java.sun.com/jstl/fmt_rt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<jsp:include page="include/header.jsp" />


<main id="main"> <!-- ======= Breadcrumbs ======= -->
<section id="breadcrumbs" class="breadcrumbs ">
	<div class="section-title">
		<h2>채용 공고</h2>
	</div>
	<!-- End Breadcrumbs -->
	<div class="container aos-init aos-animate" data-aos="fade-up">
		<div class="card " data-aos="fade-up">
			<div class="card-body">
				<h5 class="card-title"></h5>
				<div class="col-lg-20" data-aos="fade-up" data-aos-delay="100">
					<div class="card justify-content-center" style="padding-top: 1px;">
						<div class="card-body">


							<!-- General Form Elements -->
							<form class="row g-3" role="form" method="get" name="frm"
								action="appRegister">

								<input type='hidden' name='page' value="${cri.page}"> <input
									type='hidden' name='perPageNum' value="${cri.perPageNum}">
								<input type='hidden' name='searchType' value="${cri.searchType}">
								<input type='hidden' name='keyword' value="${cri.keyword}">
								<input type="hidden" name="annNum" class="form-control"
									value='${annVO.annNum}'> <input type="hidden"
									name="userId" class="form-control" value='${login.userId}'>
								<h2>${annVO.annName}</h2>
								<hr />
								<ul style="color: #000;">
									<ol>
										<li><strong>모집분야</strong>: ${annVO.annField}</li>
									</ol>
									<ol>
										<li><strong>모집 기간</strong>: <fmt:formatDate
												pattern="yyyy-MM-dd" value="${annVO.annStartDate}" /> - <fmt:formatDate
												pattern="yyyy-MM-dd" value="${annVO.annEndDate}" /></li>
									</ol>
									<hr />
								</ul>
								<h3>
									<strong>공고 내용</strong>
								</h3>
								<c:if test="${!empty annImageVO}">
									<ul class="dropzone-previews">

										<c:forEach items="${annImageVO}" var="annImageVO"
											varStatus="status">
											<ol class="justify-content-center">
												<img src="/displayFile?fileName=${annImageVO.fileLocation}" class="img-fluid">
											</ol>
										</c:forEach>
									</ul>
								</c:if>
								<c:if test="${empty annImageVO}">
								</c:if>
								<br> <br>
								<div class="portfolio-description">
									<p style="white-space:pre-line;">${annVO.detail}</p>
								</div>
								<hr />

								<c:if test="${!empty annFileVO}">

									<h3>
										<strong>첨부파일</strong>
									</h3>
									<ul>
										<c:forEach items="${annFileVO}" var="annFileVO"
											varStatus="status">
											<c:set var="annFileName" value="${annFileVO.annFileName}" />
											<c:set var="annFileNum" value="${fn:toLowerCase(annFileName)}" />
											<li>
												<div>
													<div class="p-2">
														<div class="row align-items-center">
															<div class="col">
																<div class="icon">
																	<i class="bi bi-box-arrow-down"> <a
																		href="/displayFile?fileName=${annFileVO.fileLocation}" text-muted font-weight-bold data-dz-name="">
																			${annFileVO.annFileName}</a></i>
																</div>
															</div>
														</div>
													</div>

												</div>
											</li>
										</c:forEach>
									</ul>
								</c:if>
								<c:if test="${empty annFileVO}">

								</c:if>
							</form>
						</div>


					</div>
					<div class="row mb-3 p-4 justify-content-center">
						<div class="col-sm-10 d-flex justify-content-center">
							<button type="submit" onclick="" class="btn btn-outline-success"
								style="margin: 10px">지원하기</button>
							<button type="submit" onclick="" class="btn btn-outline-primary"
								style="margin: 10px">목록</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		</div>
	</section>

<!-- End Contact Section --> </main>
<!-- End #main -->

<jsp:include page="include/footer.jsp" />

<script>
	$(document).ready(function() {

		var formObj = $("form[role='form']");

		console.log(formObj);

		$(".btn-outline-primary").on("click", function() {
			formObj.attr("method", "get");
			formObj.attr("action", "/annListMainPage");
			formObj.submit();
		});

		$(".btn-outline-success").on("click", function() {
			formObj.attr("method", "get");
			formObj.attr("action", "/appRegister");
			formObj.submit();
		});

	});
	function checkImageType(fileName) {

		var pattern = /jpg|gif|png|jpeg/i;

		return noticeFileName.match(pattern);

	}
</script>
<script>
	$(document).ready(function() {
		var formObj = $("form[role='form']");

		console.log(formObj);

		$(".btn-primary").on("click", function() {

			formObj.submit();
		});

		$(".btn-outline-danger").on("click", function() {
			self.location = "/admin/mngList";
		});
	});
</script>