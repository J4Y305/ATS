<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="../include/mng_header.jsp" />
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<main id="main" class="main">

<div class="pagetitle">
	<h1>공고 목록</h1>
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
										<th scope="col">공고명</th>
										<th scope="col">접수 시작일</th>
										<th scope="col">접수 마감일</th>
										<th scope="col">마감 D-day</th>
										<th scope="col">작성자</th>
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
												href='/mng/annAppList${pageMaker.makeSearch(pageMaker.cri.page) }&annNum=${annVO.annNum}'>
													${annVO.annName} </a></td>
											<td><fmt:formatDate pattern="yyyy-MM-dd"
													value="${annVO.annStartDate}" /></td>
											<td><fmt:formatDate pattern="yyyy-MM-dd"
													value="${annVO.annEndDate}" /></td>
											<td class="dDayCell"></td>
											<td>${annVO.mngId}</td>
										</tr>
										<div class="annEd">
						<input type=hidden value="${annVO.annEndDate}" name="annEndDate" class="annEndInput">
						</div>
									</c:forEach>
								</tbody>
							</table>
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

	// 시작일 날짜형으로 변환
	$('#startDate').change(function() {
		var sd = new Date($('#startDate').val());
		console.log(sd);
		$('input[name=annStartDate]').val(sd);
	});
	// 마감일 날짜형으로 변환
	$('#endDate').change(function() {
		var ed = new Date($('#endDate').val());
		console.log(ed);
		$('input[name=annEndDate]').val(ed);
	});

</script>
<script>
        $(document).ready(function() {
            $('.annEd').each(function(index, element) {
                var today = new Date();
                var ed = $(element).find('.annEdInput').val();
                var deadline = new Date(ed);
                var difference = deadline.getTime() - today.getTime();
                var dDay = Math.ceil(difference / (1000 * 60 * 60 * 24));
                
                // 해당 클래스가 있는 요소의 내용을 변경하여 dDay 값을 표시합니다.
                $('.dDayCell').eq(index).text("D - " + dDay);
            });
        });
</script>