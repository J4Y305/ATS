<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="include/header.jsp" />

<main id="main"> <!-- ======= Breadcrumbs ======= -->
<section id="annListMainPage" class="breadcrumbs">
	<div class="section-title">
			<h2>채용 공고</h2>
			
		
		<!-- End Breadcrumbs -->
		<section id="pricing" class="pricing" style="padding-top: 1px;">
			<div class="container" data-aos="fade-up">
				<div class="row">
					<div class="col-lg-20" data-aos="fade-up" data-aos-delay="100">
						<div class="card">
							<div class="card-body">
							
							<!-- Table with hoverable rows -->
							<table class="table table-hover">
								<thead>
									<tr>
										<th scope="col">번호</th>
										<th scope="col">공고명</th>
										<th scope="col">모집 분야</th>
										<th scope="col">모집 기간</th>
										<th scope="col">모집 여부</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${list}" var="annVO" varStatus="var">
										<tr>
											<c:if test="${pageMaker.cri.page == 1 }">
												<th scope="row">${var.count }</th>
											</c:if>
											<c:if test="${pageMaker.cri.page != 1 }">
												<th>${var.count + ((pageMaker.cri.page-1)*10) }</th>
											</c:if>
											<td><a
												href='/annReadMainPage${pageMaker.makeSearch(pageMaker.cri.page) }&annNum=${annVO.annNum}'>
													${annVO.annName} </a></td>
													<td>${annVO.annField}</td>
											<td><fmt:formatDate pattern="yyyy-MM-dd"
													value="${annVO.annStartDate}" />
													-
											<fmt:formatDate pattern="yyyy-MM-dd"
													value="${annVO.annEndDate}" /></td>
											<td scope="row" style="color: #dc3545"><c:if test="${0 eq annVO.deadline}">
													<span style="color: #198754">모집중</span>
												</c:if> <c:if test="${1 eq annVO.deadline}">
													<span style="color: #dc3545">모집마감</span>
												</c:if></td>
											
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
											href="annListMainPage${pageMaker.makeSearch(pageMaker.startPage - 1) }"
											aria-label="Previous"><span aria-hidden="true">&raquo;</span>
										</a></li>
									</c:if>
									<c:forEach begin="${pageMaker.startPage }"
										end="${pageMaker.endPage }" var="idx">
										<li class="page-item"
											<c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
											<a class="page-link" href="annListMainPage${pageMaker.makeSearch(idx)}">${idx}</a>
										</li>
									</c:forEach>
									<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
										<li class="page-item"><a class="page-link"
											aria-label="Next"
											href="annListMainPage${pageMaker.makeSearch(pageMaker.endPage +1) }"><span
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
		
		
		
	</div>
</section>
<!-- End Contact Section --> </main>
<!-- End #main -->

<jsp:include page="include/footer.jsp" />