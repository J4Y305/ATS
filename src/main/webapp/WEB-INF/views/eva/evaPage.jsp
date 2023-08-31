<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="../include/rater_header.jsp" />

<body>
	<main id="main" class="main">

	<div class="pagetitle">
		<h1>평가</h1>
	</div>
	<!-- End Page Title -->

	<section class="section">
		<div class="row">
			<div class="col-lg-6">
				<div class="card">
					<div class="card-body">
						<h5 class="card-title">평가 정보</h5>
						<div class="row">
							<div class="col-lg-3 col-md-4 label ">평가명:</div>
							<div class="col-lg-9 col-md-8">${evaVO.evaName}</div>
						</div>

						<div class="row">
							<div class="col-lg-3 col-md-4 label">평가 공고명:</div>
							<div class="col-lg-9 col-md-8">${annVO.annName}</div>
						</div>

						<div class="row">
							<div class="col-lg-3 col-md-4 label">평가 차수</div>
							<div class="col-lg-9 col-md-8">${evaVO.degree}차</div>
						</div>

						<div class="row">
							<div class="col-lg-3 col-md-4 label">평가 시작일:</div>
							<div class="col-lg-9 col-md-8">
								<fmt:formatDate pattern="yyyy-MM-dd" value="${evaVO.evaStartDate}" />
							</div>
						</div>
						
						<div class="row">
							<div class="col-lg-3 col-md-4 label">평가 마감일:</div>
							<div class="col-lg-9 col-md-8">
								<fmt:formatDate pattern="yyyy-MM-dd" value="${evaVO.evaEndDate}" />
							</div>
						</div>
						
						<div class="row">
							<div class="col-lg-3 col-md-4 label">평가 생성일:</div>
							<div class="col-lg-9 col-md-8">
								<fmt:formatDate pattern="yyyy-MM-dd" value="${evaVO.evaRegDate}" />
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
							<th scope="col">평가 여부</th>
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
							<c:if test="${0 eq appVO.evaEnd}">	
							<td scope="row"><a
								href="/eva/evaRegister${pageMaker.makeSearch(pageMaker.cri.page)}&evaNum=${evaVO.evaNum}
								&annNum=${appVO.annNum}&appNum=${appVO.appNum}&userId=${appVO.userId}&raterId=${login.raterId}">${appVO.userId}</a></td>
							</c:if>
							<c:if test="${1 eq appVO.evaEnd}">
							<td scope="row"><a
								href="/eva/evaDetailReadPage${pageMaker.makeSearch(pageMaker.cri.page)}&evaNum=${evaVO.evaNum}
								&annNum=${appVO.annNum}&appNum=${appVO.appNum}&userId=${appVO.userId}&raterId=${login.raterId}">${appVO.userId}</a></td>
							</c:if>	
							<td>${appVO.appNum}</td>
							<td><fmt:formatDate pattern="yyyy-MM-dd" value="${appVO.appRegDate}" /></td>
							<td><c:if test="${0 eq appVO.evaEnd}">
									<div class="col-lg-9 col-md-8">X</div>
								</c:if>
								<c:if test="${1 eq appVO.evaEnd}">
									<div class="col-lg-9 col-md-8">O</div>
								</c:if></td>
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

		<!-- /.box-body -->

		<div class="box-footer">
			<div style="display: flex; justify-content: center;">
					<button type="submit" class="btn btn-outline-primary" id="submitBtn">평가 완료</button>
					</div>
		</div>
	</section>


	</main>
	<!-- End #main -->
	<script>
	
	</script>
	
	<script>
		$(document).ready(function() {

			var formObj = $("form[role='form']");

			console.log(formObj);

			$(".btn-warning").on("click", function() {
				formObj.attr("action", "/rater/modifyPage");
				formObj.attr("method", "get");
				formObj.submit();
			});

			$(".btn-danger").on("click", function() {
				formObj.attr("action", "/rater/removePage");
				formObj.submit();
			});

			$(".btn-primary").on("click", function() {
				formObj.attr("method", "get");
				formObj.attr("action", "/rater/list");
				formObj.submit();
			});

		});
	</script>


	<jsp:include page="../include/admin_footer.jsp" />

</body>

</html>