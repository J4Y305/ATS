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
<main id="main" class="main" style="padding-top: 50px;"> <!-- End Page Title -->

<section class="section">
	<div class="row justify-content-center">
		<div class="col-lg-12">
			<div class="pagetitle">
				<h1>지원서 상세</h1>
			</div>
			<div class="card p-4">
				<div class="card-body">
					<div class="card">
						<div class="card-body">
							<div class="icon">
								<h5 class="card-title fw-bold">
									<i class="bi bi bi-tags mx-3"></i>지원자 기본 정보
								</h5>
							</div>
							<div class="row mb-3 ">
								<label class="col-sm-3 col-form-label fw-bold">이름:</label>
								<div class="col-sm-5">
									<div class="pt-2">${userVO.userName}</div>
								</div>
							</div>
							<div class="row mb-3 ">
								<label class="col-sm-3 col-form-label fw-bold">접수번호:</label>
								<div class="col-sm-5">
									<div class="pt-2">${appVO.appNum}</div>
								</div>
							</div>
							<div class="row mb-3 ">
								<label class="col-sm-3 col-form-label fw-bold">평가 차수 :</label>
								<div class="col-sm-5">
									<div class="pt-2">
										<c:if test="${0 eq evaVO.degree}">
											<div class="col-lg-9 col-md-8">1차</div>
										</c:if>
										<c:if test="${1 eq evaVO.degree}">
											<div class="col-lg-9 col-md-8">2차</div>
										</c:if>
									</div>
								</div>
							</div>
							<div class="row mb-3 ">
								<label class="col-sm-3 col-form-label fw-bold">생년월일:</label>
								<div class="col-sm-5">
									<div class="pt-2">${userVO.birthDay}</div>
								</div>
							</div>
							<div class="row mb-3 ">
								<label class="col-sm-3 col-form-label fw-bold">성별:</label>
								<div class="col-sm-5">
									<div class="pt-2">
										<c:if test="${0 eq userVO.gender}">
											<div class="col-lg-9 col-md-8">남자</div>
										</c:if>
										<c:if test="${1 eq userVO.gender}">
											<div class="col-lg-9 col-md-8">여자</div>
										</c:if>
									</div>
								</div>
							</div>
							<div class="row mb-3 ">
								<label class="col-sm-3 col-form-label fw-bold">지원서 생성일:</label>
								<div class="col-sm-5">
									<div class="pt-2">
										<fmt:formatDate pattern="yyyy-MM-dd"
											value="${appVO.appRegDate}" />
									</div>
								</div>
							</div>
							<div class="icon">
								<h5 class="card-title fw-bold">
									<i class="bi bi bi-tags mx-3"></i>비고
								</h5>
								<div class="row mb-3 ">
									<div class="col-sm-5">
										<div class="pt-2">${appVO.etc}</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>

	<div class="card p-4">
		<div class="card-body">
			<div class="row">
				<div class="col-lg-6">
					<div class="card" style="height: 838px;">
						<div class="card-body">
							<h5 class="card-title">지원서</h5>
							<div id="example1" style="height: 750px;"></div>
							<script>
								PDFObject.embed("/file/${appVO.appFile}",
										"#example1");
							</script>
						</div>
					</div>
				</div>

				<div class="col-lg-6">
					<div class="card" style="">
						<div class="card-body">
							<h5 class="card-title">평가 항목</h5>
							<form id="evaScoreForm" class="row g-3" role="form" method="post" name="frm">
								<input type='hidden' name='page' value="${cri.page}"> <input
									type='hidden' name='perPageNum' value="${cri.perPageNum}">
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

											<input type="hidden" name="evaItemNum"
												value="${evaItemVO.evaItemNum}">
											<tr>
												<th scope="row">${var.count}</th>
												<td>${evaItemVO.evaPlot}</td>
												<td>
													<div class="row">
														<input type="text"
															value="${detailList[var.index].evaDetailScore}"
															name="evaDetailScore" readonly="readonly"
															class="form-control eva-score-input" style="width: 20%">
														<div class="pt-2 col-sm-3">/${evaItemVO.evaScore}</div>
													</div>
												</td>
											</tr>
										</c:forEach>

										<td></td>
										<th>종합점수</th>
										<td><div class="row">
												<input type="text" id="evaScoreSum" name="scoreSum"
													class="form-control" style="width: 20%" readonly="readonly"
													value="${detail.scoreSum}">
												<div class="pt-2 col-sm-3"></div>
											</div></td>

									</tbody>
								</table>
								<div class="card">
									<div class="card-body">
										<h5 class="card-title">종합 의견</h5>
										<textarea id="scoreComment" name="scoreComment"
											class="form-control" rows="6">${detail.scoreComment }</textarea>
									</div>
								</div>

							</form>
						</div>
					</div>
				</div>
				<div style="display: flex; justify-content: center;">
					<button type="button" class="btn btn-outline-primary">목록</button>
				</div>
			</div>
		</div>
	</div>
</section>


</main>
<jsp:include page="../include/admin_footer.jsp" />

</body>
<script>
	PDFObject.embed("/file/${appVO.appFile}", "#example1");
	
	$(document).ready(function() {
		var formObj = $("form[role='form']");
		$(".btn-outline-primary").on("click", function() {
			formObj.attr("method", "get");
			formObj.attr("action", "/eva/evaPage");
			formObj.submit();
		});

	});
</script>
</html>