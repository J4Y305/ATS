<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<jsp:include page="../include/admin_header.jsp" />
<main id="main" class="main" style="padding-top: 50px;"> <!-- End Page Title -->

<section class="section">
	<div class="row justify-content-center">
		<div class="col-lg-10">
			<div class="pagetitle">
				<h1>회원 목록</h1>
			</div>
			<div class="card">
				<div class="card-body" style="height: 750px;">
					<h5 class="card-title"></h5>
					<div class="card">
						<div class="card-body" style="height:600px;">

							<form role="form" action="/admin/userRemovePage" method="POST">
								<input type="hidden" name="userId" class="form-control userIdField" 
								value='${userVO.userId}' />								
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
												<td>${userVO.birthDay}</td>
												<td><c:choose>
														<c:when test="${1 eq userVO.gender}">남자 </c:when>
														<c:when test="${2 eq userVO.gender}">여자</c:when>
														<c:otherwise>0</c:otherwise>
													</c:choose></td>
												<td>${userVO.userEmail}</td>

												
												<td><button id="delBtn" class="btn btn-outline-danger" 
												type="button" data-userid="${userVO.userId}">삭제</button>
												
												</td>
														

											</tr>

										</c:forEach>
									</tbody>

								</table>
							</form>
						</div>
					</div>
					<!-- End Table with hoverable rows -->
					<div class="d-flex justify-content-center">
						<!-- Pagination with icons -->
						<nav aria-label="Page navigation example">
							<ul class="pagination">
								<c:if test="${pageMaker.prev}">
									<li class="page-item"><a class="page-link"
										href="userList${pageMaker.makeSearch(pageMaker.startPage - 1) }"
										aria-label="Previous"><span aria-hidden="true">&raquo;</span>
									</a></li>
								</c:if>
								<c:forEach begin="${pageMaker.startPage }"
									end="${pageMaker.endPage }" var="idx">
									<li class="page-item"
										<c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
										<a class="page-link"
										href="userList${pageMaker.makeSearch(idx)}">${idx}</a>
									</li>
								</c:forEach>
								<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
									<li class="page-item"><a class="page-link"
										aria-label="Next"
										href="userList${pageMaker.makeSearch(pageMaker.endPage +1) }"><span
											aria-hidden="true">&raquo;</span></a></li>
								</c:if>

							</ul>
						</nav>
					</div>
				</div>
				<!-- End Pagination with icons -->

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
</script>

<script>
	$(document).ready(function() {
		var formObj = $("form[role='form']");

		console.log(formObj);

				$('#searchBtn').on(
						"click",
						function(event) {

							self.location = "list"
									+ '${pageMaker.makeQuery(1)}'
									+ "&searchType="
									+ $("select option:selected").val()
									+ "&keyword=" + $('#keywordInput').val();

						});
				
				$('.btn-outline-danger').on("click", function() {
					if(confirm("삭제하시겠습니까?")){
						var userId = $(this).data("userid");
						formObj.find(".userIdField").val(userId);
						formObj.attr("action", "/admin/userRemovePage");
						formObj.submit();
					}
					
				})

			});
</script>
