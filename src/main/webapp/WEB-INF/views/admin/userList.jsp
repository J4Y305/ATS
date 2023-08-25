<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="../include/admin_header.jsp" />
<main id="main" class="main">

<div class="pagetitle">
	<h1>회원 목록</h1>
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
										<th scope="col">이름</th>
										<th scope="col">아이디</th>
										<th scope="col">생년월일</th>
										<th scope="col">성별</th>
										<th scope="col">이메일</th>
										<th scope="col">삭제</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${list}" var="userVO" varStatus="var">
										<tr>

											<c:if test="${pageMaker.cri.page == 1 }">
												<td>${var.count }</td>
											</c:if>
											<c:if test="${pageMaker.cri.page != 1 }">
												<td>${var.count + ((pageMaker.cri.page-1)*10) }</td>
											</c:if>
											<td>${userVO.userName}</td>
											<td>${userVO.userId}</td>
											<td>${userVO.birthDay}"</td>
											<td><c:choose>
													<c:when test="${1 eq userVO.gender}">남 </c:when>

													<c:otherwise>0</c:otherwise>
												</c:choose></td>
											<td>${userVO.userEmail}</td>
											<form role="form" action="userRemovePage" method="POST">
												<input type="hidden" name="userId" class="form-control"
													value='${userVO.userId}'>
											<td><button id="delBtn" class="btn btn-outline-danger"
													type="submit" formmethod="post">삭제</button></td>
											</form>
										</tr>

									</c:forEach>
								</tbody>
							</table>
							</form>
							<!-- End Table with hoverable rows -->
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

			});
</script>
