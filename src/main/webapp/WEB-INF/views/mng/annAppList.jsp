<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="../include/mng_header.jsp" />
<main id="main" class="main" style="padding-top: 50px;"> <!-- End Page Title -->
<section class="section">
	<div class="row justify-content-center">
		<div class="col-lg-8">
			<div class="pagetitle">
				<h1>공고 정보</h1>
			</div>
			<div class="card p-4">
				<div class="card-body">
					<div class="card">
						<div class="card-body">
							<div class="icon">
								<h5 class="card-title fw-bold">
									<i class="bi bi bi-tags mx-3"></i>공고 기본 정보
								</h5>
							</div>
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
									<label class="col-sm-3 col-form-label fw-bold px-5">공고명
										:</label>
									<div class="col-sm-5">
										<div class="col-lg-9 col-md-8 pt-2">${annVO.annName}</div>
									</div>
								</div>
								<div class="row mb-3">
									<label class="col-sm-3 col-form-label fw-bold px-5">모집분야
										:</label>
									<div class="col-sm-5">
										<div class="col-lg-9 col-md-8 pt-2">${annVO.annField}</div>
									</div>
								</div>
								<div class="row mb-3">
									<label class="col-sm-3 col-form-label fw-bold px-5">공고
										시작일 :</label>
									<div class="col-sm-5 pt-2">
										<fmt:formatDate pattern="yyyy-MM-dd"
											value="${annVO.annStartDate}" />
									</div>
								</div>
								<div class="row mb-3">
									<label class="col-sm-3 col-form-label fw-bold px-5">공고
										마감일:</label>
									<div class="col-sm-5 pt-2">
										<fmt:formatDate pattern="yyyy-MM-dd"
											value="${annVO.annEndDate}" />
									</div>
								</div>
							</form>
						</div>
					</div>

					<div class="card">
						<div class="card-body">
							<h5 class="card-title">지원자 목록</h5>
							<table class="table table-hover">
								<thead>
									<tr>
										<th scope="col">번호</th>
										<th scope="col">이름</th>
										<th scope="col">접수번호</th>
										<th scope="col">지원서 등록 날짜</th>
										<th scope="col">평가 여부</th>
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
											<td>${appVO.appSave}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>

							<!-- Pagination with icons -->
							<div class="d-flex justify-content-center">
								<nav aria-label="Page navigation example">
									<ul class="pagination">
										<c:if test="${pageMaker.prev}">
											<li class="page-item"><a class="page-link"
												href="list${pageMaker.makeSearch(pageMaker.startPage - 1) }"
												aria-label="Previous"><span aria-hidden="true">&raquo;</span>
											</a></li>
										</c:if>
										<c:forEach begin="${pageMaker.startPage }"
											end="${pageMaker.endPage }" var="idx">
											<li class="page-item"
												<c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
												<a class="page-link" href="list${pageMaker.makeSearch(idx)}">${idx}</a>
											</li>
										</c:forEach>
										<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
											<li class="page-item"><a class="page-link"
												aria-label="Next"
												href="list${pageMaker.makeSearch(pageMaker.endPage +1) }"><span
													aria-hidden="true">&raquo;</span></a></li>
										</c:if>

									</ul>
								</nav>
								<!-- End Pagination with icons -->
							</div>
						</div>
					</div>
					<div class="row mb-3 p-2 justify-content-center">
						<div class="col-sm-10 d-flex justify-content-center">
							<button type="submit" class="btn btn-outline-primary">목록</button>
						</div>
					</div>

				</div>
			</div>
		</div>
	</div>
</section>
</main>
<!-- End #main -->
<script>
	$(document).ready(function() {

		var formObj = $("form[role='form']");

		console.log(formObj);

		$("btn-outline-primary").on("click", function() {
			self.location = "/mng/annIngList";
		});

	});
</script>


<jsp:include page="../include/admin_footer.jsp" />

</body>

</html>