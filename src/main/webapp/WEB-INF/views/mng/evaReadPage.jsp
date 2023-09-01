<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="../include/mng_header.jsp" />

<body>
	<main id="main" class="main" style="padding-top: 50px;">

	<section class="section justify-content-center">
	<div class="row">
		<div class="pagetitle">
		<h1>평가 상세</h1>
	</div>
			<div class="col-lg-6">
				<div class="card">
					<div class="card-body">
						<h5 class="card-title">평가 정보</h5>
						<div class="row">
							<div class="col-lg-3 col-md-4 label ">평가명:</div>
							<div class="col-lg-9 col-md-8">${evaVO.evaName}</div>
						</div>

						<div class="row">
							<div class="col-lg-3 col-md-4 label">해당 공고명:</div>
							<div class="col-lg-9 col-md-8">${annVO.annName}</div>
						</div>

						<div class="row">
							<div class="col-lg-3 col-md-4 label">평가 시작일</div>
							<div class="col-lg-9 col-md-8">
							<fmt:formatDate pattern="yyyy-MM-dd"
								value="${evaVO.evaStartDate}"/>
								</div>
						</div>

						<div class="row">
							<div class="col-lg-3 col-md-4 label">평가 마감일:</div>
							<div class="col-lg-9 col-md-8">
								<fmt:formatDate pattern="yyyy-MM-dd" value="${evaVO.evaEndDate}" />
							</div>
						</div>
						<div class="row">
							<div class="col-lg-3 col-md-4 label">차수:</div>
							<div class="col-lg-9 col-md-8"><c:if test="${0 eq evaVO.degree}">1차</c:if>
                                 <c:if test="${1 eq evaVO.degree}">2차</c:if></div>
						</div>


					</div>
				</div>
			</div>
		</div>

		<div class="card">
			<div class="card-body">
				<h5 class="card-title">평가 목록</h5>
				<table class="table table-hover">
					<thead>
						<tr>
							<th scope="col">번호</th>
							<th scope="col">이름</th>
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
									href="/mng/appEvaReadPage${pageMaker.makeSearch(pageMaker.cri.page)}&appNum=${appEvaVO.appNum}
								&evaNum=${evaVO.evaNum}">${appVO.userId}</a></td>
								<td><fmt:formatDate pattern="yyyy-MM-dd"
										value="${appEvaVO.scoreRegDate}" /></td>
								<td>${appEvaVO.raterId}</td>
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
		<div class="row mb-3 p-4 justify-content-center">
							<div class="col-sm-10 d-flex justify-content-center">
								<button type="submit" onclick="" class="btn btn-outline-danger btn-lg">삭제</button>
								<button type="submit" onclick="" class="btn btn-outline-warning btn-lg mx-4">수정</button>
								<button type="submit" onclick="" class="btn btn-outline-primary btn-lg ">목록</button>
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

			$("btn-outline-primary").on("click", function() {
				formObj.attr("method", "get");
				formObj.attr("action", "/evaList");
				formObj.submit();
			});
			
			$(".btn-outline-warning").on("click", function() {
				formObj.attr("action", "/mng/evaModifyPage");
				formObj.attr("method", "get");
				formObj.submit();
			});

			$(".btn-outline-danger").on("click", function() {
				formObj.attr("action", "/mng/evaRemovePage");
				formObj.submit();
			});

		});
	</script>


	<jsp:include page="../include/admin_footer.jsp" />

</body>

</html>