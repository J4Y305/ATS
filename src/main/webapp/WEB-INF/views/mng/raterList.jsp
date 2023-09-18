<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="../include/mng_header.jsp" />
<main id="main" class="main" style="padding-top: 50px;"> <!-- End Page Title -->

<section class="section">
	<div class="row justify-content-center">
		<div class="col-lg-10">
			<div class="pagetitle">
				<h1>평가자 목록</h1>
			</div>
			
			<div class="card" style="height: 750px;">
				<div class="card-body" >
				<h5 class="card-title"></h5>
					<div class="card">
						<div class="card-body" style="height: 550px;">

							<!-- Table with hoverable rows -->
							<table class="table table-hover">
								<thead>
									<tr>
										<th scope="col">번호</th>
										<th scope="col">아이디</th>
										<th scope="col">이름</th>
										<th scope="col">비밀번호</th>
										<th scope="col">직급</th>
										<th scope="col">전화번호</th>
										<th scope="col">등록인</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${list}" var="raterVO" varStatus="var">

										<tr>
											<c:if test="${pageMaker.cri.page == 1 }">
												<td>${var.count }</td>
											</c:if>
											<c:if test="${pageMaker.cri.page != 1 }">
												<td>${var.count + ((pageMaker.cri.page-1)*10) }</td>
											</c:if>
											<td><a
												href='/mng/raterReadPage${pageMaker.makeSearch(pageMaker.cri.page) }&raterId=${raterVO.raterId}'>
													${raterVO.raterId}</a></td>
											<td>${raterVO.raterName}</td>
											<td>${raterVO.raterPwd}</td>
											<td>${raterVO.raterRank}</td>
											<td>${raterVO.raterPhone}</td>
											<td>${raterVO.mngId}</td>
										</tr>

									</c:forEach>
								</tbody>
							</table>
						
						
						<div class="d-flex justify-content-center">
							<!-- Pagination with icons -->
							<nav aria-label="Page navigation example ">
								<ul class="pagination ">
									<c:if test="${pageMaker.prev}">
										<li class="page-item d-flex"><a class="page-link"
											href="raterList${pageMaker.makeSearch(pageMaker.startPage - 1) }"
											aria-label="Previous"><span aria-hidden="true">&raquo;</span>
										</a></li>
									</c:if>
									<c:forEach begin="${pageMaker.startPage }"
										end="${pageMaker.endPage }" var="idx">
										<li class="page-item"
											<c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
											<a class="page-link" href="raterList${pageMaker.makeSearch(idx)}">${idx}</a>
										</li>
									</c:forEach>
									<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
										<li class="page-item"><a class="page-link"
											aria-label="Next"
											href="raterList${pageMaker.makeSearch(pageMaker.endPage +1) }"><span
												aria-hidden="true">&raquo;</span></a></li>
									</c:if>

								</ul>
							</nav>
							<!-- End Pagination with icons -->
						</div>
					</div>
					
				</div>
				<div class="d-flex justify-content-end">
						<button id="newBtn" class="btn btn-outline-primary ">평가자 등록</button>
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
var result = '${msg}';

if (result == 'SUCCESS') {
   alert("처리가 완료되었습니다.");
}
else if(result =='FAIL'){
	alert("이미 평가가 존재합니다.")
}
</script>

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

					self.location = "/mng/raterRegister";

				});

			});
</script>