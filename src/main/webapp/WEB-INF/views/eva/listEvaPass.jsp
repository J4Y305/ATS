<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="../include/mng_header.jsp" />

<body>
	<main id="main" class="main">
	<div class="pagetitle">
		<h1>합격자 결과 등록</h1>
	</div>
	<!-- End Page Title -->
	<form class="row g-3" role="form" method="post" name="frm">
		<input type='hidden' name='page' value="${cri.page}"> <input
			type='hidden' name='perPageNum' value="${cri.perPageNum}"> <input
			type='hidden' name='searchType' value="${cri.searchType}"> <input
			type='hidden' name='keyword' value="${cri.keyword}"> <input
			type="hidden" name="mngId" class="form-control"
			value="${login.mngId}">
		<section class="section">
			<div class="row">
				<div class="col-lg-12">
					<div class="card">
						<div class="card-body">
						<div class="icon">
								<h5 class="card-title fw-bold">
									<i class="bi bi bi-tags mx-3"></i>평가 기본 정보
								</h5>
							</div>
							<div class="row mb-3 ">
								<label class="col-sm-3 col-form-label fw-bold">평가명:</label>
								<div class="col-sm-5">
									<div class="pt-2">${evaVO.evaName}</div>
								</div>
							</div>
							
							<div class="row mb-3 ">
								<label class="col-sm-3 col-form-label fw-bold">평가 공고명:</label>
								<div class="col-sm-5">
									<div class="pt-2">${annVO.annName}</div>
								</div>
							</div>

							<div class="row mb-3 ">
								<label class="col-sm-3 col-form-label fw-bold">평가 차수 :</label>
								<div class="col-sm-5">
									<div class="pt-2">
										<c:if test="${0 eq evaVO.degree}">
											<div class="col-sm-5 pt-2">1차</div>
										</c:if>
										<c:if test="${1 eq evaVO.degree}">
											<div class="col-sm-5 pt-2">2차</div>
										</c:if>
									</div>
								</div>
							</div>

							<div class="row mb-3 ">
								<label class="col-sm-3 col-form-label fw-bold">평가 시작일:</label>
								<div class="col-sm-5">
									<div class="pt-2">
										<fmt:formatDate pattern="yyyy-MM-dd"
											value="${evaVO.evaStartDate}" />
									</div>
								</div>
							</div>

							<div class="row mb-3 ">
								<label class="col-sm-3 col-form-label fw-bold">평가 마감일:</label>
								<div class="col-sm-5">
									<div class="pt-2">
										<fmt:formatDate pattern="yyyy-MM-dd"
											value="${evaVO.evaEndDate}" />
									</div>
								</div>
							</div>
							<div class="row mb-3 ">
								<label class="col-sm-3 col-form-label fw-bold">평가 생성일:</label>
								<div class="col-sm-5">
									<div class="pt-2">
										<fmt:formatDate pattern="yyyy-MM-dd"
											value="${evaVO.evaRegDate}" />
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
							

			<div class="card">
				<div class="card-body">
					<div class="icon">
								<h5 class="card-title fw-bold">
									<i class="bi bi bi-tags mx-3"></i>지원자별 평가 결과
								</h5>
							</div>
					<table class="table table-bordered text-center">
						<thead>
							<tr  class="table-primary">
								<th scope="col">번호</th>
								<th scope="col">이름</th>
								<th scope="col">접수번호</th>
								<c:forEach items="${evaVO.evaItemList}" var="item"
									varStatus="var">
									<th scope="col"><c:out value="항목 ${var.count}"></c:out></th>
								</c:forEach>
								<th scope="col">평가자 별 총점</th>
								<th scope="col">전체 총점</th>
								<th scope="col">전체 평균</th>
								<th scope="col">합격 여부</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${list}" var="passVO" varStatus="var">
							<input type=hidden name="evaNum" value="${passVO.evaNum}">
								<tr>
									<td class='cnt'><fmt:parseNumber integerOnly="true"
											value="${var.count/ evaVO.raterArrayList.size()+(1-(var.count/ evaVO.raterArrayList.size()%1))%1}" />
									</td>
									<td class='username'><div class="col-lg-9 col-md-8"
											style="text-align: center">${passVO.userName}</div></td>
									<td class='appnum'><div class="col-lg-9 col-md-8"
											style="text-align: center">${passVO.appNum}</div></td>
									<c:forTokens var="token" items="${passVO.details}" delims=","
										varStatus="status">
										<td><div class="col-lg-9 col-md-8">${token}</div></td>
									</c:forTokens>

									<td><div class="col-lg-9 col-md-8">${passVO.score}</div></td>
									<td class='sum'><div class="col-lg-9 col-md-8">${passVO.totalSum}</div></td>
									<td class='avg'><div class="col-lg-9 col-md-8">${passVO.totalAvg}</div></td>

									<td class='chk'><div class="col-lg-9 col-md-8 "
											style="color: white; text-align: center">${passVO.appNum}<input
												class="appList" type="checkbox" value="${passVO.appNum}">
										</div></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>

					<!-- Pagination with icons -->
				</div>
			</div>
		</section>
	</form>
	<!-- /.box-body -->

	<div class="row mb-3 p-4 justify-content-center">
		<div class="col-sm-5 d-flex justify-content-center">
			<button type="button" class="btn btn-outline-primary btn-lg">목록</button>
			<button type="button" class="btn btn-outline-success btn-lg mx-4">등록</button>
		</div>
	</div>
	</main>
	<script>
		$(document)
				.ready(
						function() {

							var formObj = $("form[role='form']");
							genRowspan("cnt");
							genRowspan("username");
							genRowspan("appnum");
							genRowspan("chk");
							genRowspan("sum");
							genRowspan("avg");

							console.log(formObj);

							$(".btn-outline-primary").on("click", function() {
								self.location = "/eva/listEva";
							});

							$(".btn-outline-success").on("click", function() {
								if(confirm("평가결과를 등록하시겠습니까?")){
									formObj.attr("method", "post");
									formObj.attr("action", "/eva/evaPassRegister");							
									formObj.submit();
								}
							});

							function genRowspan(className) {
								$("." + className).each(
										function() {
											var rows = $("." + className
													+ ":contains('"
													+ $(this).text() + "')");
											if (rows.length > 1) {
												rows.eq(0).attr("rowspan",
														rows.length);
												rows.not(":eq(0)").remove();
											}
										});
							}

							formObj.submit(function(event) {
										var that = $(this);
										var str = "";

										$('.appList')
												.each(
														function(index, item) {
															if ($(this).is(":checked")) {
																var text = $(this).val();
																str += "<input type='hidden' name='appNumList'+ value='"+text+"'>";
															}

														});
										that.append(str);
										that.get(0).submit();
									});
						});
	</script>
	<jsp:include page="../include/admin_footer.jsp" />

</body>

</html>