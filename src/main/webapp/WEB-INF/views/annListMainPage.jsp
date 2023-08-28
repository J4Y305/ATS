<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="include/header.jsp" />

<main id="main"> <!-- ======= Breadcrumbs ======= -->
<section id="breadcrumbs" class="breadcrumbs">
	<div class="container">
		<h2>채용 공고</h2>
		<!-- End Breadcrumbs -->
		<section id="pricing" class="pricing" style="padding-top: 1px;">
			<div class="container" data-aos="fade-up">
				<div class="row">
					<div class="col-lg-20" data-aos="fade-up" data-aos-delay="100">
						<div class="box">

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
												<td>${var.count }</td>
											</c:if>
											<c:if test="${pageMaker.cri.page != 1 }">
												<td>${var.count + ((pageMaker.cri.page-1)*10) }</td>
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
											<td><c:if test="${0 eq annVO.deadline}">
													<div class="col-lg-9 col-md-8">모집중</div>
												</c:if> <c:if test="${1 eq annVO.deadline}">
													<div class="col-lg-9 col-md-8">모집 마감</div>
												</c:if></td>
											
										</tr>

									</c:forEach>
								</tbody>
							</table>
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