<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="../include/user_header.jsp" />
<main id="main" class="main" style="padding-top: 50px;"> <!-- End Page Title -->

<section class="section">
	<div class="row justify-content-center">
		<div class="col-lg-10 ">
			<div class="pagetitle">
				<h1>지원 결과</h1>
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
										<th scope="col">접수 번호</th>
										<th scope="col">공고명</th>
										<th scope="col">접수일</th>
										<th scope="col">결과 개시일</th>
										<th scope="col">합격 여부</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${list}" var="appPassDTO" varStatus="var">
										<tr>
											<td>${appPassDTO.appNum}</td>
											<td>${appPassDTO.annName}</td>
											<td><fmt:formatDate pattern="yyyy-MM-dd"
													value="${appPassDTO.appRegDate}" /></td>
											<td><fmt:formatDate pattern="yyyy-MM-dd"
													value="${appPassDTO.evaRegDate}" /></td>
											<td>${appPassDTO.passMsg}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>

						<div class="d-flex justify-content-center">
							<!-- Pagination with icons -->
							<nav aria-label="Page navigation example ">
								<ul class="pagination ">
									<c:if test="${pageMaker.prev}">
										<li class="page-item d-flex"><a class="page-link"
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
</section>

</main>

<jsp:include page="../include/admin_footer.jsp" />
