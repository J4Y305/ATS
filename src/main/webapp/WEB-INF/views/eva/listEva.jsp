<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="../include/mng_header.jsp" />
<main id="main" class="main" style="padding-top: 50px;">

<section class="section">
	<div class="row justify-content-center">
		<div class="col-lg-10">
			<div class="pagetitle">
				<h1>평가 결과</h1>
			</div>

			<div class="card" style="height: 750px;">
				<div class="card-body">
					<h5 class="card-title"></h5>
					<div class="card">
						<div class="card-body" style="height: 550px;">

							<!-- Table with hoverable rows -->
							<table class="table table-hover">
								<thead>
									<tr>
										<th scope="col">번호</th>
										<th scope="col">평가명</th>
										<th scope="col">평가 차수</th>
										<th scope="col">평가 공개일</th>
										<th scope="col">결과 등록 여부</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${list}" var="evaVO" varStatus="var">

										<tr>
											<c:if test="${pageMaker.cri.page == 1 }">
												<td>${var.count }</td>
											</c:if>
											<c:if test="${pageMaker.cri.page != 1 }">
												<td>${var.count + ((pageMaker.cri.page-1)*10) }</td>
											</c:if>
											<td><c:if test="${0 eq evaVO.evaPass}">
													<a
														href="/eva/listEvaPass${pageMaker.makeSearch(pageMaker.cri.page) }&evaNum=${evaVO.evaNum}">
														${evaVO.evaName} </a>
												</c:if> <c:if test="${0 ne evaVO.evaPass}">
													<a
														href="/eva/readEvaPass${pageMaker.makeSearch(pageMaker.cri.page) }&evaNum=${evaVO.evaNum}">
														${evaVO.evaName} </a>
												</c:if></td>
											<td><c:if test="${0 eq evaVO.degree}">
													<div class="col-lg-9 col-md-8">1차</div>
												</c:if> <c:if test="${1 eq evaVO.degree}">
													<div class="col-lg-9 col-md-8">2차</div>
												</c:if></td>
											<td><fmt:formatDate pattern="yyyy-MM-dd"
													value="${evaVO.evaRegDate}" /></td>
											<td><c:if test="${0 eq evaVO.evaPass}">
													<c:out value="등록 미완료"></c:out>
												</c:if> <c:if test="${0 ne evaVO.evaPass}">
													<c:out value="등록 완료"></c:out>
												</c:if></td>
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

					self.location = "mngRegister";

				});

			});
</script>