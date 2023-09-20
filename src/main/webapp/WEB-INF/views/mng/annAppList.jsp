<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<jsp:include page="../include/mng_header.jsp" />

<body>
	<main id="main" class="main" style="padding-top: 50px;">

	<section class="section">
		<div class="row justify-content-center">
			<div class="col-lg-8">
				<div class="pagetitle">
					<h1>진행 중인 공고</h1>
				</div>

				<div class="card p-4">
					<div class="card-body">
						<div class="card">
							<div class="card-body">
								<div class="icon">
									<h5 class="card-title fw-bold">
										<i class="bi bi bi-tags mx-3"></i>공고 정보
									</h5>
								</div>
								<div class="row mb-3">
									<label class="col-sm-3 col-form-label fw-bold">공고명 :</label>
									<div class="col-sm-5">
										<div class="pt-2">${annVO.annName}</div>
									</div>
								</div>

								<div class="row mb-3">
									<label class="col-sm-3 col-form-label fw-bold">모집 분야 :</label>
									<div class="col-sm-5">
										<div class="pt-2">${annVO.annField}</div>
									</div>
								</div>

								<div class="row mb-3">
									<label class="col-sm-3 col-form-label fw-bold">접수 시작일 :</label>
									<div class="col-sm-5 pt-2">
										<fmt:formatDate pattern="yyyy-MM-dd"
											value="${annVO.annStartDate}" />
									</div>
								</div>

								<div class="row mb-3">
									<label class="col-sm-3 col-form-label fw-bold">접수 마감일 :</label>
									<div class="col-sm-5 pt-2">
										<fmt:formatDate pattern="yyyy-MM-dd"
											value="${annVO.annEndDate}" />
									</div>
								</div>

							</div>
						</div>



						<div class="card">
							<div class="card-body">
								<div class="icon">
									<h5 class="card-title fw-bold">
										<i class="bi bi-person mx-3"></i>지원자 목록
									</h5>
								</div>
								<table class="table table-hover">
									<thead>
										<tr>
											<th scope="col">번호</th>
											<th scope="col">이름</th>
											<th scope="col">접수번호</th>
											<th scope="col">지원서 등록 날짜</th>
											<th scope="col">지원서 제출 여부</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${list}" var="appVO" varStatus="var">
											<tr>
												<c:if test="${pageMaker.cri.page == 1 }">
													<td>${var.count }</td>
												</c:if>
												<c:if test="${pageMaker.cri.page != 1 }">
													<td>${var.count + ((pageMaker.cri.page-1)*10) }</td>
												</c:if>
												<td scope="row"><a
													href="/mng/appReadPage${pageMaker.makeSearch(pageMaker.cri.page)}&evaNum=${evaVO.evaNum}
								&annNum=${appVO.annNum}&appNum=${appVO.appNum}&userId=${appVO.userId}">${appVO.userId}</a></td>
												<td>${appVO.appNum}</td>
												<td><fmt:formatDate pattern="yyyy-MM-dd"
														value="${appVO.appRegDate}" /></td>
												<td><c:if test="${ 1 eq appVO.appSave}">O</c:if> <c:if
														test="${ 0 eq appVO.appSave }">X</c:if></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>

								<div class="d-flex justify-content-center">
									<!-- Pagination with icons -->
									<nav aria-label="Page navigation example">
										<ul class="pagination">
										
											<c:if test="${pageMaker.prev}">
												<li class="page-item"><a class="page-link"
													href="annAppList${pageMaker.makeSearch(pageMaker.startPage - 1) }&annNum=${annVO.annNum}"
													aria-label="Previous"><span aria-hidden="true">&raquo;</span>
												</a></li>
											</c:if>
											<c:forEach begin="${pageMaker.startPage }"
												end="${pageMaker.endPage }" var="idx">
												<li class="page-item"
													<c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
													<a class="page-link"
													href="annAppList${pageMaker.makeSearch(idx)}&annNum=${annVO.annNum}">${idx}</a>
												</li>
											</c:forEach>
											<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
												<li class="page-item"><a class="page-link"
													aria-label="Next"
													href="annAppList${pageMaker.makeSearch(pageMaker.endPage +1) }&annNum=${annVO.annNum}"><span
														aria-hidden="true">&raquo;</span></a></li>
											</c:if>

										</ul>
									</nav>
									<!-- End Pagination with icons -->
								</div>
							</div>
						</div>
						<div class="box-footer">
							<div style="display: flex; justify-content: center;">
								<button type="button" class="btn btn-outline-primary">목록</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- /.box-body -->
	</section>


	</main>
	<!-- End #main -->
	<script>
		$(document).ready(function() {

			var formObj = $("form[role='form']");

			console.log(formObj);

			$(".btn-outline-primary").on("click", function() {
				/* formObj.attr("method", "get");
				formObj.attr("action", "/annIngList");
				formObj.submit(); */
				self.location = "/mng/annIngList";
			});

		});
	</script>


	<jsp:include page="../include/admin_footer.jsp" />