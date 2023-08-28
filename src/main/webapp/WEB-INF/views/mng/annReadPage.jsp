<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fmt2" uri="http://java.sun.com/jstl/fmt_rt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%> 
<jsp:include page="../include/mng_header.jsp" />
<main id="main" class="main">

<div class="pagetitle">
	<h1>공고 정보</h1>

</div>
<!-- End Page Title -->
<section class="section">
	<div class="row">
		<div class="col-lg-10">

			<div class="card">
				<div class="card-body">
					<h5 class="card-title">공고 정보</h5>

					<!-- General Form Elements -->
					<form class="row g-3" role="form" method="post" name="frm"
						action="mngModifyPage">
						<input type='hidden' name='page' value="${cri.page}"> <input
							type='hidden' name='perPageNum' value="${cri.perPageNum}">
						<input type='hidden' name='searchType' value="${cri.searchType}">
						<input type='hidden' name='keyword' value="${cri.keyword}">
						<input type="hidden" name="mngId" class="form-control"
							value='${login.mngId}'> <input type="hidden"
							name="annNum" class="form-control" value='${annVO.annNum}'>
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
						<div class="row mb-3">
							<label class="col-sm-3 col-form-label">공고 시작일 :</label>
							<div class="col-sm-5">
								<fmt:formatDate pattern="yyyy-MM-dd"
									value="${annVO.annStartDate}" />
							</div>
						</div>
						<div class="row mb-3">
							<label class="col-sm-3 col-form-label">공고 마감일:</label>
							<div class="col-sm-5">
								<fmt:formatDate pattern="yyyy-MM-dd" value="${annVO.annEndDate}" />
							</div>
						</div>
						<div class="row mb-3">
							<label class="col-sm-3 col-form-label">공고 내용:</label>
							<div class="col-sm-5">
								<textarea class="form-control" style="height: 100px">${annVO.detail}</textarea>
							</div>
							
							<c:if test="${!empty annImageVO}">
								<div class="form-group">
									<label for="exampleInputEmail1" class="col-form-label">공고 이미지</label>
								</div>

								<ul class="dropzone-previews">

									<c:forEach items="${annImageVO}" var="annImageVO"
										varStatus="status">
										<div class="col-sm-5"><img src="/displayFile?fileName=${annImageVO.fileLocation}"></div>
										
											
									</c:forEach>
								</ul>
							</c:if>
							<c:if test="${empty annImageVO}">
							</c:if>
							<br> <br>
							
					
						<c:if test="${!empty annFileVO}">
							<div class="form-group">
								<label for="exampleInputEmail1" class="col-form-label">첨부파일</label>
							</div>

							<ul class="dropzone-previews">

								<c:forEach items="${annFileVO}" var="annFileVO"
									varStatus="status">
									<c:set var="annFileName" value="${annFileVO.annFileName}" />
									<c:set var="annFileNum" value="${fn:toLowerCase(annFileName)}" />

									<li class="dropzone-previews mt-3">
										<div
											class="card mt-1 mb-0 shadow-none border dz-processing dz-image-preview dz-success dz-complete">
											<div class="p-2">
												<div class="row align-items-center">
													<c:forTokens var="token" items="${annFileNum}" delims="."
														varStatus="status">
														<c:if test="${status.last}">
															<c:choose>
																<c:when test="${token eq 'hwp'}">
																	<img data-dz-thumbnail=""
																		class="avatar-sm rounded bg-light"
																		src="/resources/dist/img/hwp.png" alt="${annFileName}" />
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
																		src="/resources/dist/img/pdf.png" alt="${annFileName}" />
																</c:when>
																<c:when test="${token eq 'ppt' }">
																	<img data-dz-thumbnail=""
																		class="avatar-sm rounded bg-light"
																		src="/resources/dist/img/ppt.png" alt="${annFileName}" />
																</c:when>
																<c:otherwise>
																	<img data-dz-thumbnail=""
																		class="avatar-sm rounded bg-light"
																		src="/resources/dist/img/file.svg"
																		alt="${annFileName}" />
																</c:otherwise>
															</c:choose>
														</c:if>
													</c:forTokens>
													<div class="col pl-0">
														<a href="/displayFile?fileName=${annFileVO.fileLocation}"
															text-muted font-weight-bold data-dz-name="">
															${annFileVO.annFileName}</a>
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
						<h5 class="card-title">공고 활성화 여부</h5>
						<div class="row">
							<div class="col-lg-3 col-md-4 label">활성여부</div>
							<c:if test="${0 eq annVO.annAct}">
								<div class="col-lg-9 col-md-8">비활성</div>
							</c:if>
							<c:if test="${1 eq annVO.annAct}">
								<div class="col-lg-9 col-md-8">활성</div>
							</c:if>
						</div>
						<div class="row mb-3">
							<div class="col-sm-10">
								<button type="submit" onclick="" class="btn btn-outline-danger">삭제</button>
								<button type="submit" onclick="" class="btn btn-outline-warning">수정</button>
								<button type="submit" onclick="" class="btn btn-outline-primary">목록</button>
							</div>
						</div>
					</form>
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

		$(".btn-outline-warning").on("click", function() {
			formObj.attr("action", "/mng/annModifyPage");
			formObj.attr("method", "get");
			formObj.submit();
		});

		$(".btn-outline-danger").on("click", function() {
			formObj.attr("action", "/mng/annRemovePage");
			formObj.submit();
		});

		$(".btn-outline-primary").on("click", function() {
			formObj.attr("method", "get");
			formObj.attr("action", "/mng/annList");
			formObj.submit();
		});

	});
	function checkImageType(fileName) {

		var pattern = /jpg|gif|png|jpeg/i;

		return noticeFileName.match(pattern);

	}
</script>