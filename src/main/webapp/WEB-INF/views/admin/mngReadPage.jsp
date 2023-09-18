<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="../include/admin_header.jsp" />
<main id="main" class="main" style="padding-top: 50px;"> <!-- End Page Title -->

<section class="section">
	<div class="row justify-content-center">
		<div class="col-lg-8">
			<div class="pagetitle">
				<h1>기업 담당자 정보</h1>
			</div>
			<form class="row g-3" role="form" method="post" name="frm"
				action="mngModifyPage">
				<div class="card p-4">
					<div class="card-body">
						<!-- General Form Elements -->

						<div class="card">
							<div class="card-body">
								<div class="icon">
									<h5 class="card-title fw-bold">
										<i class="bi bi bi-tags mx-3"></i>기업 기본 정보
									</h5>
								</div>
								<input type='hidden' name='entNum' value="${entVO.entNum}">
								<input type='hidden' name='mngId' value="${mngVO.mngId}">
								<input type='hidden' name='page' value="${cri.page}"> <input
									type='hidden' name='perPageNum' value="${cri.perPageNum}">
								<input type='hidden' name='searchType' value="${cri.searchType}">
								<input type='hidden' name='keyword' value="${cri.keyword}">

								<div class="row mb-3 ">
									<div class="col-sm-3 col-form-label fw-bold">기업명:</div>
									<div class="col-sm-5">
										<div class="pt-2">${entVO.entName}</div>
									</div>
								</div>
								<div class="row mb-3 ">
									<div class="col-sm-3 col-form-label fw-bold">업종:</div>
									<div class="col-sm-5">
										<div class="pt-2">${entVO.category}</div>
									</div>
								</div>
								<div class="row mb-3 ">
									<div class="col-sm-3 col-form-label fw-bold">주소:</div>
									<div class="col-sm-5">
										<div class="pt-2">${entVO.address}</div>
									</div>
								</div>
								<div class="row mb-3 ">
									<div class="col-sm-3 col-form-label fw-bold">대표 전화번호:</div>
									<div class="col-sm-5">
										<div class="pt-2">${entVO.entPhone}</div>
									</div>
								</div>
								<div class="row mb-3 py-4">
									<div class="col-sm-3 col-form-label fw-bold pt-3">사업자
										등록증:</div>
									<c:choose>
										<c:when test="${null eq entVO.registration}">
											<div class="col-sm-5">
												<div class="pt-2">등록된 정보가 없습니다.</div>
											</div>
										</c:when>
										<c:otherwise>
											<div class="col-sm-5">
												<ul>
													<li style="list-style: none;">
														<div
															class="card mt-1 mb-0 shadow-none border dz-processing dz-image-preview dz-success dz-complete">
															<div class="p-2">
																<div class="row align-items-center">
																	<div class="col">
																		<div class="icon">
																			<i class="bi bi-box-arrow-down"></i> <a
																				href="/displayFile?fileName=${entVO.registration}"
																				text-muted font-weight-bold data-dz-name="">
																				${entVO.fileName}</a>
																		</div>
																	</div>
																</div>
															</div>
														</div>
													</li>
												</ul>
											</div>
										</c:otherwise>
									</c:choose>
								</div>
							</div>
						</div>
						<div class="card">
							<div class="card-body">
								<div class="icon">
									<h5 class="card-title fw-bold">
										<i class="bi bi bi-tags mx-3"></i>기업 담당자 정보
									</h5>
								</div>
								<div class="row mb-3 ">
									<div class="col-sm-3 col-form-label fw-bold">담당자명:</div>
									<div class="col-sm-5">
										<div class="pt-2">${mngVO.mngName}</div>
									</div>
								</div>
								<div class="row mb-3 ">
									<div class="col-sm-3 col-form-label fw-bold">부서:</div>
									<div class="col-sm-5">
										<div class="pt-2">${mngVO.mngDept}</div>
									</div>
								</div>
								<div class="row mb-3 ">
									<div class="col-sm-3 col-form-label fw-bold">직급:</div>
									<div class="col-sm-5">
										<div class="pt-2">${mngVO.mngRank}</div>
									</div>
								</div>
								<div class="row mb-3 ">
									<div class="col-sm-3 col-form-label fw-bold">전화번호:</div>
									<div class="col-sm-5">
										<div class="pt-2">${mngVO.mngPhone}</div>
									</div>
								</div>
								<div class="row mb-3 ">
									<div class="col-sm-3 col-form-label fw-bold">아이디:</div>
									<div class="col-sm-5">
										<div class="pt-2">${mngVO.mngId}</div>
									</div>
								</div>
								<div class="row mb-3 ">
									<div class="col-sm-3 col-form-label fw-bold">비밀번호:</div>
									<div class="col-sm-5">
										<div class="pt-2">${mngVO.mngPwd}</div>
									</div>
								</div>

								<div class="row mb-3">
									<label class="col-sm-3 col-form-label fw-bold ">활성여부 </label>
									<div class="col-sm-5">
										<c:if test="${0 eq mngVO.mngAct}">
											<div class="col-lg-9 col-md-8 pt-2">비활성</div>
										</c:if>
										<c:if test="${1 eq mngVO.mngAct}">
											<div class="col-lg-9 col-md-8 pt-2">활성</div>
										</c:if>
									</div>
								</div>
								<div class="row mb-3 p-4 justify-content-center">
									<div class="col-sm-10 d-flex justify-content-center">
										<button type="submit" onclick=""
											class="btn btn-outline-danger">삭제</button>
										<button type="submit" onclick=""
											class="btn btn-outline-warning mx-4">수정</button>
										<button type="submit" onclick=""
											class="btn btn-outline-primary">목록</button>
									</div>
								</div>
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

		$(".btn-outline-warning").on("click", function() {
			formObj.attr("action", "/admin/mngModifyPage");
			formObj.attr("method", "get");
			formObj.submit();
		});

		$(".btn-outline-danger").on("click", function() {
			formObj.attr("action", "/admin/mngRemovePage");
			formObj.submit();
		});

		$(".btn-outline-primary").on("click", function() {
			formObj.attr("method", "get");
			formObj.attr("action", "/admin/mngList");
			formObj.submit();
		});

	});
	function checkImageType(fileName) {

		var pattern = /jpg|gif|png|jpeg/i;

		return noticeFileName.match(pattern);

	}
</script>