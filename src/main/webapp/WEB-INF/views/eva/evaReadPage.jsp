<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="../include/rater_header.jsp" />

<body>
	<main id="main" class="main">

	<div class="pagetitle">
		<h1>공고 평가</h1>
		<nav>
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="index.html">Home</a></li>
				<li class="breadcrumb-item">Tables</li>
				<li class="breadcrumb-item active">General</li>
			</ol>
		</nav>
	</div>
	<!-- End Page Title -->

	<section class="section">
		<div class="row">
			<div class="col-lg-6">
				<form role="form" action="modifyPage" method="POST">
					<input type='hidden' name='raterId' value="${annVO.annNum}">
					<input type='hidden' name='entNum' value="${evaVO.evaNum}">
					<input type='hidden' name='page' value="${cri.page}"> <input
						type='hidden' name='perPageNum' value="${cri.perPageNum}">
					<input type='hidden' name='searchType' value="${cri.searchType}">
					<input type='hidden' name='keyword' value="${cri.keyword}">

				</form>
				<div class="card">
					<div class="card-body">
						<h5 class="card-title">지원자</h5>
						<div class="row">
							<div class="col-lg-3 col-md-4 label ">이름:</div>
							<div class="col-lg-9 col-md-8">${userVO.userName}</div>
						</div>

						<div class="row">
							<div class="col-lg-3 col-md-4 label">접수번호:</div>
							<div class="col-lg-9 col-md-8">${appVO.appNum}</div>
						</div>

						<div class="row">
							<div class="col-lg-3 col-md-4 label">평가 차수</div>
							<div class="col-lg-9 col-md-8">${evaVO.degree}차</div>
						</div>

						<div class="row">
							<div class="col-lg-3 col-md-4 label">생년월일:</div>
							<div class="col-lg-9 col-md-8">${userVO.birthDay}</div>
						</div>

						<div class="row">
							<div class="col-lg-3 col-md-4 label">성별:</div>
							<div class="col-lg-9 col-md-8">
								<c:if test="${0 eq userVO.gender}">
									<div class="col-lg-9 col-md-8">남자</div>
								</c:if>
								<c:if test="${1 eq userVO.gender}">
									<div class="col-lg-9 col-md-8">여자</div>
								</c:if>
							</div>
						</div>

						<div class="row">
							<div class="col-lg-3 col-md-4 label">지원서 생성일:</div>
							<div class="col-lg-9 col-md-8">
							<fmt:formatDate pattern="yyyy-MM-dd" value="${appVO.appRegDate}" />
							</div>
						</div>

					</div>
				</div>
			</div>
		</div>

		<div class="card">
            <div class="card-body">
              <h5 class="card-title">비고</h5>
              	어쩌구 저쩌구~
            </div>
          </div>
		
		<div class="card">
            <div class="card-body">
              <h5 class="card-title">지원서</h5>
              	PDF 뷰어!
            </div>
          </div>
		
		
		<div class="card">
			<div class="card-body">
				<h5 class="card-title">평가 항목</h5>
				<table class="table table-hover">
					<thead>
						<tr>
							<th scope="col">번호</th>
							<td scope="row"><a
								href="/rater/evaPage${pageMaker.makeSearch(pageMaker.cri.page)}&evaNum=${evaVO.evaNum}
								&annNum=${appVO.annNum}&userId={appVO.userId}">${appVO.userId}</a></td>
							<th scope="col">접수번호</th>
							<th scope="col">모집분야?</th>
							<th scope="col">평가 여부</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th scope="row">${evaVO.evaNum}</th>
							<td>정우제</td>
							<td>Designer</td>
							<td>28</td>
							<td>2016-05-25</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>

		<!-- /.box-body -->

		<div class="box-footer">
			<button type="submit" class="btn btn-primary">평가 완료</button>
		</div>
	</section>


	</main>
	<!-- End #main -->
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