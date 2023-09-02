<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="../include/user_header.jsp" />
<main id="main" class="main" style="padding-top: 50px;">


<!-- End Page Title -->

<section class="section">
<div class="row justify-content-center">
		<div class="col-lg-10">
			<div class="pagetitle">
				<h1>최종 제출한 지원서</h1>
			</div>
	
	<div class="card">
				<div class="card-body mt-5" style="height: 750px;">
					<div class="card">
						<div class="card-body" style="height: 550px;"> 

							<!-- Table with hoverable rows -->
							<table class="table table-hover">
								<thead>
									<tr>
										<th scope="col">번호</th>
										<th scope="col">접수번호</th>
										<th scope="col">공고명</th>
										<th scope="col">접수 기간</th>
										<th scope="col">저장일</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${list}" var="appListDTO" varStatus="var">

										<tr>
											<c:if test="${pageMaker.cri.page == 1 }">
												<td>${var.count }</td>
											</c:if>
											<c:if test="${pageMaker.cri.page != 1 }">
												<td>${var.count + ((pageMaker.cri.page-1)*10) }</td>
											</c:if>
											<td><a
												href='/user/appFinalReadPage${pageMaker.makeQuery(pageMaker.cri.page) }&appNum=${appListDTO.appNum}&annNum=${appListDTO.annNum}'>
													${appListDTO.appNum}</a></td>
											<td>${appListDTO.annName}</td>
											<td><fmt:formatDate pattern="yyyy-MM-dd"
													value="${appListDTO.annStartDate}" />
													-
											<fmt:formatDate pattern="yyyy-MM-dd"
													value="${appListDTO.annEndDate}" /></td>
											<td><fmt:formatDate pattern="yyyy-MM-dd"
													value="${appListDTO.appRegDate}" /></td>
										</tr>

									</c:forEach>
								</tbody>
							</table>
							<!-- End Table with hoverable rows -->
							<div class="d-flex justify-content-center">
							<!-- Pagination with icons -->
							<nav aria-label="Page navigation example">
								<ul class="pagination">
									<c:if test="${pageMaker.prev}">
										<li class="page-item"><a class="page-link"
											href="list${pageMaker.makeQuery(pageMaker.startPage - 1) }"
											aria-label="Previous"><span aria-hidden="true">&raquo;</span>
										</a></li>
									</c:if>
									<c:forEach begin="${pageMaker.startPage }"
										end="${pageMaker.endPage }" var="idx">
										<li class="page-item"
											<c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
											<a class="page-link" href="list${pageMaker.makeQuery(idx)}">${idx}</a>
										</li>
									</c:forEach>
									<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
										<li class="page-item"><a class="page-link"
											aria-label="Next"
											href="list${pageMaker.makeQuery(pageMaker.endPage +1) }"><span
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
