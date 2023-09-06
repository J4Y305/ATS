<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="../include/mng_header.jsp" />

<body>
	<main id="main" class="main">

	<div class="pagetitle">
		<h1>진행 중인 공고</h1>
		
	</div>
	<!-- End Page Title -->

	<section class="section">
		<div class="row">
			<div class="col-lg-6">
				<div class="card">
					<div class="card-body">
						<h5 class="card-title">공고 정보</h5>
						<div class="row">
							<div class="col-lg-3 col-md-4 label fw-bold">공고명:</div>
							<div class="col-lg-9 col-md-8">${annVO.annName}</div>
						</div>

						<div class="row">
							<div class="col-lg-3 col-md-4 label fw-bold">모집 분야:</div>
							<div class="col-lg-9 col-md-8">${annVO.annField}</div>
						</div>

						<div class="row">
							<div class="col-lg-3 col-md-4 label fw-bold" >접수 시작일</div>
							<div class="col-lg-9 col-md-8">
							<fmt:formatDate pattern="yyyy-MM-dd"
								value="${annVO.annStartDate}" />
								</div>
						</div>

						<div class="row">
							<div class="col-lg-3 col-md-4 label fw-bold">접수 마감일:</div>
							<div class="col-lg-9 col-md-8">
								<fmt:formatDate pattern="yyyy-MM-dd" value="${annVO.annEndDate}" />
							</div>
						</div>



					</div>
				</div>
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
							<th scope="col">제출 여부</th>
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
									href="/mng/appReadPage${pageMaker.makeSearch(pageMaker.cri.page)}
								&annNum=${appVO.annNum}&appNum=${appVO.appNum}&userId=${appVO.userId}">${appVO.userId}</a></td>
								<td>${appVO.appNum}</td>
								<td><fmt:formatDate pattern="yyyy-MM-dd"
										value="${appVO.appRegDate}" /></td>
								<td><c:if test="${0 eq appVO.appSave}">임시저장됨
								</c:if>
								<c:if test="${1 eq appVO.appSave}">최종제출됨 </c:if>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>

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
							<li class="page-item"><a class="page-link" aria-label="Next"
								href="list${pageMaker.makeSearch(pageMaker.endPage +1) }"><span
									aria-hidden="true">&raquo;</span></a></li>
						</c:if>

					</ul>
				</nav>
				<!-- End Pagination with icons -->

			</div>
		</div>
		<button type="submit" class="btn btn-outline-primary">목록</button>
		<!-- /.box-body -->

	</section>


	</main>
	<!-- End #main -->
	<script>
		$(document).ready(function() {

			var formObj = $("form[role='form']");

			console.log(formObj);

			$("btn-outline-primary").on("click", function() {
				formObj.attr("method", "get");
				formObj.attr("action", "/annIngList");
				formObj.submit();
			});

		});
	</script>


	<jsp:include page="../include/admin_footer.jsp" />

</body>

</html>