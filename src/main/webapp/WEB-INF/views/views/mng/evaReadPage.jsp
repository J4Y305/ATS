<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="../include/mng_header.jsp" />
<main id="main" class="main" style="padding-top: 50px;"> <!-- End Page Title -->

<section class="section">
	<div class="row justify-content-center">
		<div class="col-lg-12">
			<div class="pagetitle">
				<h1>평가 상세</h1>
			</div>
			<!-- End Page Title -->

			<div class="card p-4">
				<div class="card-body">
					<!-- General Form Elements -->
					<div class="card">
						<div class="card-body">
							<div class="icon">
								<h5 class="card-title fw-bold">
									<i class="bi bi bi-tags mx-3"></i>평가 기본 정보
								</h5>
							</div>
							<div class="row mb-3 ">
								<label class="col-sm-3 col-form-label fw-bold">평가명:</label>
								<div class="col-sm-5">
									<div class="pt-2">${evaVO.evaName}</div>
								</div>
							</div>
							<div class="row mb-3 ">
								<label class="col-sm-3 col-form-label fw-bold">평가 공고명:</label>
								<div class="col-sm-5">
									<div class="pt-2">${annVO.annName}</div>
								</div>
							</div>
							<div class="row mb-3 ">
								<label class="col-sm-3 col-form-label fw-bold">평가 차수 :</label>
								<div class="col-sm-5">
									<div class="pt-2">
										<c:if test="${0 eq evaVO.degree}">
											<div class="col-sm-5 pt-2">1차</div>
										</c:if>
										<c:if test="${1 eq evaVO.degree}">
											<div class="col-sm-5 pt-2">2차</div>
										</c:if>
									</div>
								</div>
							</div>
							<div class="row mb-3 ">
								<label class="col-sm-3 col-form-label fw-bold">평가 시작일:</label>
								<div class="col-sm-5">
									<div class="pt-2">
										<fmt:formatDate pattern="yyyy-MM-dd"
											value="${evaVO.evaStartDate}" />
									</div>
								</div>
							</div>
							<div class="row mb-3 ">
								<label class="col-sm-3 col-form-label fw-bold">평가 마감일:</label>
								<div class="col-sm-5">
									<div class="pt-2">
										<fmt:formatDate pattern="yyyy-MM-dd"
											value="${evaVO.evaEndDate}" />
									</div>
								</div>
							</div>
							<div class="row mb-3 ">
								<label class="col-sm-3 col-form-label fw-bold">평가 생성일:</label>
								<div class="col-sm-5">
									<div class="pt-2">
										<fmt:formatDate pattern="yyyy-MM-dd"
											value="${evaVO.evaRegDate}" />
									</div>
								</div>
							</div>
						</div>
					</div>

					<div class="card">
						<div class="card-body">
							<div class="icon">
								<h5 class="card-title fw-bold">
									<i class="bi bi-file-text mx-3"></i>평가서 목록
								</h5>
							</div>
							<table class="table table-hover">
								<thead>
									<tr>
										<th scope="col">번호</th>
										<th scope="col">아이디</th>
										<th scope="col">접수번호</th>
										<th scope="col">평가 일자</th>
										<th scope="col">평가자</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${list}" var="appEvaVO" varStatus="var">
										<tr>
											<c:if test="${pageMaker.cri.page == 1 }">
												<td>${var.count }</td>
											</c:if>
											<c:if test="${pageMaker.cri.page != 1 }">
												<td>${var.count + ((pageMaker.cri.page-1)*10) }</td>
											</c:if>
											<td scope="row"><a
												href="/mng/evaDetailReadPage${pageMaker.makeSearch(pageMaker.cri.page)}&evaNum=${evaVO.evaNum}
								&annNum=${evaVO.annNum}&appNum=${appEvaVO.appNum}&userId=${appEvaVO.userId}&raterId=${appEvaVO.raterId}">${appEvaVO.userId}</a></td>
											<td>${appEvaVO.appNum}</td>
											<td><fmt:formatDate pattern="yyyy-MM-dd"
													value="${appEvaVO.scoreRegDate}" /></td>
											<td>${appEvaVO.raterId}</td>
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
					<div class="box-footer">
						<div style="display: flex; justify-content: center;">
							<button type="submit" class="btn btn-outline-primary">목록</button>
							<!-- /.box-body -->
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
			formObj.attr("method", "get");
			formObj.attr("action", "/evaList");
			formObj.submit();
		});

	});
</script>


<jsp:include page="../include/admin_footer.jsp" />

</body>

</html>