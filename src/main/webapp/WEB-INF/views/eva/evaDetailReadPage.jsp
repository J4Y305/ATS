<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="../include/rater_header.jsp" />
<style>
  .centered-card {
    display: flex;
    justify-content: center;
    align-items: center;
    height: 85vh; /* 이 부분은 필요한 높이로 조절해주세요 */
  }
</style>
<body>
	<main id="main" class="main">

	<div class="pagetitle">
		<h1>공고 평가</h1>
	</div>
	<!-- End Page Title -->

	<section class="section">
		<div class="row">
			<div class="col-lg-6">

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
				${appVO.etc}
			</div>
		</div>

		<div class="card">
			<div class="card-body">
				<h5 class="card-title">지원서</h5>
				<iframe width="100%" height="600" src="./compressed.tracemonkey-pldi-09.pdf"></iframe>
			</div>
		</div>

	<div class="centered-card">
		<div class="card" style="width: 70%">
			<div class="card-body">
				<h5 class="card-title">평가 항목</h5>
				<form id="evaScoreForm" method="GET" action="/eva/evaPage">
					<input type='hidden' name='page' value="${cri.page}"> 
					<input type='hidden' name='perPageNum' value="${cri.perPageNum}">
					<input type='hidden' name='searchType' value="${cri.searchType}">
					<input type='hidden' name='keyword' value="${cri.keyword}">
					<input type="hidden" name="evaNum" value="${evaVO.evaNum}">
					<input type="hidden" name="annNum" value="${annVO.annNum}">
					<input type="hidden" name="appNum" value="${appVO.appNum}">
					<input type="hidden" name="userId" value="${userVO.userId}">
					<input type="hidden" name="raterId" value="${login.raterId}"> 

					<table class="table table-hover">
						<thead>
							<tr>
								<th scope="col">번호</th>
								<th scope="col">평가항목</th>
								<th scope="col">점수</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${list}" var="evaItemVO" varStatus="var">
							
							<input type="hidden" name="evaItemNum" value="${evaItemVO.evaItemNum}"> 
								<tr>
									<th scope="row">${var.count}</th>
									<td>${evaItemVO.evaPlot}</td>
									<td>
									<input type="text" value="${detailList[var.index].evaDetailScore}" name="evaDetailScore" readonly="readonly" class="form-control eva-score-input" style="width: 10%" ></td>
								</tr>
							</c:forEach>

							<td></td>
							<th>종합점수</th>
							<td><input type="text" id="evaScoreSum"  name="scoreSum"  class="form-control"
								style="width: 15%" readonly="readonly" value="${detail.scoreSum}"></td>

						</tbody>
					</table>
					<div class="card">
						<div class="card-body">
							<h5 class="card-title">종합 의견</h5>
							<textarea id="scoreComment" name="scoreComment" class="form-control" rows="6">${detail.scoreComment }</textarea>
						</div>
					</div>
					<div style="display: flex; justify-content: center;">
					<button type="submit" class="btn btn-primary">확인</button>
					</div>
				</form>
			</div>
		</div>
	</div>


		<!-- /.box-body -->

		<div class="box-footer"></div>

	</section>


	</main>
	<jsp:include page="../include/admin_footer.jsp" />

</body>

</html>