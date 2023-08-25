<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="../include/admin_header.jsp" />
<main id="main" class="main">

<div class="pagetitle">
	<h1>기업 담당자 정보</h1>
	<section class="section">
		<div class="row">
			<div class="col-lg-10">
				<form role="form" action="mngModifyPage" method="POST">
					<input type='hidden' name='entNum' value="${entVO.entNum}">
					<input type='hidden' name='mngId' value="${mngVO.mngId}"> <input
						type='hidden' name='page' value="${cri.page}"> <input
						type='hidden' name='perPageNum' value="${cri.perPageNum}">
					<input type='hidden' name='searchType' value="${cri.searchType}">
					<input type='hidden' name='keyword' value="${cri.keyword}">

				</form>
				<div class="card">
					<div class="card-body">
						<h5 class="card-title">기업 기본 정보</h5>
						<div class="row">
							<div class="col-lg-3 col-md-4 label ">기업명:</div>
							<div class="col-lg-9 col-md-8">${entVO.entName}</div>
						</div>

						<div class="row">
							<div class="col-lg-3 col-md-4 label">업종:</div>
							<div class="col-lg-9 col-md-8">${entVO.category}</div>
						</div>

						<div class="row">
							<div class="col-lg-3 col-md-4 label">주소</div>
							<div class="col-lg-9 col-md-8">${entVO.address}</div>
						</div>

						<div class="row">
							<div class="col-lg-3 col-md-4 label">대표 전화번호:</div>
							<div class="col-lg-9 col-md-8">${entVO.entPhone}</div>
						</div>

						<div class="row">
							<div class="col-lg-3 col-md-4 label">사업자 등록증:</div>
							<div class="col-lg-9 col-md-8">${entVO.registration}</div>
						</div>

						<h5 class="card-title">기업 담당자 정보</h5>

						<div class="row">
							<div class="col-lg-3 col-md-4 label ">담당자명:</div>
							<div class="col-lg-9 col-md-8">${mngVO.mngName}</div>
						</div>

						<div class="row">
							<div class="col-lg-3 col-md-4 label">부서:</div>
							<div class="col-lg-9 col-md-8">${mngVO.mngDept}</div>
						</div>

						<div class="row">
							<div class="col-lg-3 col-md-4 label">대리:</div>
							<div class="col-lg-9 col-md-8">${mngVO.mngRank}</div>
						</div>

						<div class="row">
							<div class="col-lg-3 col-md-4 label">전화번호:</div>
							<div class="col-lg-9 col-md-8">${mngVO.mngPhone}</div>
						</div>

						<div class="row">
							<div class="col-lg-3 col-md-4 label">아이디:</div>
							<div class="col-lg-9 col-md-8">${mngVO.mngId}</div>
						</div>
						<div class="row">
							<div class="col-lg-3 col-md-4 label">비밀번호</div>
							<div class="col-lg-9 col-md-8">${mngVO.mngPwd}</div>
						</div>

						<h5 class="card-title">계정 활성화 여부</h5>
						<div class="row">
							<div class="col-lg-3 col-md-4 label">활성여부</div>
							<c:if test="${0 eq mngVO.mngAct}">
								<div class="col-lg-9 col-md-8">비활성</div>
							</c:if>
							<c:if test="${1 eq mngVO.mngAct}">
								<div class="col-lg-9 col-md-8">활성</div>
							</c:if>
						</div>
						<button type="submit" onclick="" class="btn btn-danger">삭제</button>
						<button type="submit" onclick="" class="btn btn-warning">수정</button>
						<button type="submit" onclick="" class="btn btn-primary">목록</button>
					</div>
				</div>
			</div>
		</div>
	</section>
</div>
</main>
<jsp:include page="../include/admin_footer.jsp" />
<script>
	$(document).ready(function() {

		var formObj = $("form[role='form']");

		console.log(formObj);

		$(".btn-warning").on("click", function() {
			formObj.attr("action", "/admin/mngModifyPage");
			formObj.attr("method", "get");
			formObj.submit();
		});

		$(".btn-danger").on("click", function() {
			formObj.attr("action", "/admin/mngRemovePage");
			formObj.submit();
		});

		$(".btn-primary").on("click", function() {
			formObj.attr("method", "get");
			formObj.attr("action", "/admin/mngList");
			formObj.submit();
		});

	});
</script>