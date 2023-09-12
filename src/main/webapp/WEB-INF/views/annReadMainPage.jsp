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

	<section id="pricing" class="pricing " style="padding-top: 1px;">
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
									<p>${annVO.detail}</p>
								</div>
								<hr />

								<c:if test="${!empty annFileVO}">

									<h3>
										<strong>첨부파일</strong>
									</h3>



									<ul class="dropzone-previews">

										<c:forEach items="${annFileVO}" var="annFileVO"
											varStatus="status">
											<c:set var="annFileName" value="${annFileVO.annFileName}" />
											<c:set var="annFileNum"
												value="${fn:toLowerCase(annFileName)}" />

											<li class="dropzone-previews mt-3">
												<div
													class="card mt-1 mb-0 shadow-none border dz-processing dz-image-preview dz-success dz-complete">
													<div class="p-2">
														<div class="row align-items-center">
															<%--<c:forTokens var="token" items="${annFileNum}"
																		delims="." varStatus="status">
																		<c:if test="${status.last}">
																			<c:choose>
																				<c:when test="${token eq 'hwp'}">
																					<img data-dz-thumbnail=""
																						class="avatar-sm rounded bg-light"
																						src="/resources/dist/img/hwp.png"
																						alt="${annFileName}" />
																				</c:when>
																				<c:when test="${token eq 'xls' || token eq 'xlsx' }">
																					<img data-dz-thumbnail=""
																						class="avatar-sm rounded bg-light"
																						src="/resources/dist/img/excelIcon.png" />
																				</c:when>
																				<c:when
																					test="${token eq 'jpg' || token eq 'gif' || token eq 'png' || token eq 'bmp' }">
																					<img data-dz-thumbnail=""
																						class="avatar-sm rounded bg-light"
																						src="/displayFile?fileName=${annFileVO.fileLocation}">
																				</c:when>
																				<c:when test="${token eq 'pdf'}">
																					<img data-dz-thumbnail=""
																						class="avatar-sm rounded bg-light"
																						src="/resources/dist/img/pdf.png"
																						alt="${annFileName}" />
																				</c:when>
																				<c:when test="${token eq 'ppt' }">
																					<img data-dz-thumbnail=""
																						class="avatar-sm rounded bg-light"
																						src="/resources/dist/img/ppt.png"
																						alt="${annFileName}" />
																				</c:when>
																				<c:otherwise>
																					<img data-dz-thumbnail=""
																						class="avatar-sm rounded bg-light"
																						src="/resources/dist/img/file.svg"
																						alt="${annFileName}" />
																				</c:otherwise>
																			</c:choose>
																		</c:if>
																	</c:forTokens> --%>
															<div class="col">
																<div class="icon">
																	<i class="bi bi-box-arrow-down"> <a
																		href="/displayFile?fileName=${annFileVO.fileLocation}"
																		text-muted font-weight-bold data-dz-name="">
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