<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="../include/mng_header.jsp" />
<main id="main" class="main">

<div class="pagetitle">
	<h1>공고 목록</h1>
</div>
<!-- End Page Title -->

<section class="section">
	<div class="row">
		<div class="col-lg-10">

			<div class="card">
				<div class="card-body">
					<h5 class="card-title"></h5>
					<div class="card">
						<div class="card-body">

							<!-- Table with hoverable rows -->
							<table class="table table-hover">
								<thead>
									<tr>
										<th scope="col">번호</th>
										<th scope="col">공고명</th>
										<th scope="col">접수 시작일</th>
										<th scope="col">접수 마감일</th>
										<th scope="col">활성 여부</th>
										<th scope="col">작성자</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${list}" var="annVO" varStatus="var">

										<tr>
											<c:if test="${pageMaker.cri.page == 1 }">
												<td>${var.count }</td>
											</c:if>
											<c:if test="${pageMaker.cri.page != 1 }">
												<td>${var.count + ((pageMaker.cri.page-1)*10) }</td>
											</c:if>
											<td><a
												href='/admin/annReadPage${pageMaker.makeSearch(pageMaker.cri.page) }&annNum=${annVO.annNum}'>
													${annVO.annName} </a></td>
											<td><fmt:formatDate pattern="yyyy-MM-dd" value="${annVO.annStartDate}"/></td>
											<td><fmt:formatDate pattern="yyyy-MM-dd" value="${annVO.annEndDate}"/></td>
											<td><c:if test="${0 eq annVO.annAct}">
													<div class="col-lg-9 col-md-8">비활성</div>
												</c:if> <c:if test="${1 eq annVO.annAct}">
													<div class="col-lg-9 col-md-8">활성</div>
												</c:if></td>
											<td>${annVO.mngId}</td>
										</tr>

									</c:forEach>
								</tbody>
							</table>
							<!-- End Table with hoverable rows -->
							<button id="newBtn" class="btn btn-outline-primary">공고등록</button>
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
			</div>
</section>

</main>
<!-- End #main -->

<jsp:include page="../include/admin_footer.jsp" />
<script>
	$(document).ready(
			function() {

				$('#searchBtn').on(
						"click",
						function(event) {

							self.location = "list"
									+ '${pageMaker.makeQuery(1)}'
									+ "&searchType="
									+ $("select option:selected").val()
									+ "&keyword=" + $('#keywordInput').val();

						});

				$('#newBtn').on("click", function(evt) {

					self.location = "/mng/annRegister";

				});

			});
</script>