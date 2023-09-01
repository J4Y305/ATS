<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="../include/mng_header.jsp" />
<main id="main" class="main" style="padding-top: 50px;">


<!-- End Page Title -->
<section class="section">
<div class="row justify-content-center">
	<div class="col-lg-10">
	<div class="pagetitle">
		<h1>평가자 등록</h1>
	</div>
		<div class="card p-4">
				<div class="card-body">
					<div class="card">
						<div class="card-body">
							<div class="icon">
								<h5 class="card-title fw-bold">
									<i class="bi bi-person mx-3"></i>평가자 기본 정보
								</h5>
							</div>
					<!-- General Form Elements -->
					<form class="row g-3" role="form" method="post" name="frm">
						<input type='hidden' name='page' value="${cri.page}"> <input
							type='hidden' name='perPageNum' value="${cri.perPageNum}">
						<input type='hidden' name='searchType' value="${cri.searchType}">
						<input type='hidden' name='keyword' value="${cri.keyword}">
						<input type="hidden" name="mngId" class="form-control"
							value='${login.mngId}'>
						<div class="row mb-3" >
							<label class="col-sm-3 col-form-label">아이디 :</label>
							<div class="col-sm-5" style="display:-webkit-inline-box">
								<input type="text" name="raterId" class="form-control"
									placeholder="아이디">&nbsp;
									<button type="button" onclick="" class="btn btn-outline-primary">중복검사</button>
							</div>
							<div class="col-sm-5">
								
							</div>
						</div>
						<div class="row mb-3 ">
							<label class="col-sm-3 col-form-label">비밀번호 :</label>
							<div class="col-sm-5">
								<input type="password" name="raterPwd" class="form-control"
									placeholder="비밀번호">
							</div>
						</div>
						<div class="row mb-3 ">
							<label class="col-sm-3 col-form-label">비밀번호 확인 :</label>
							<div class="col-sm-5">
								<input type="password" class="form-control"
									placeholder="비밀번호 확인">
							</div>
						</div>
						<div class="row mb-3 ">
							<label class="col-sm-3 col-form-label">이름 :</label>
							<div class="col-sm-5">
								<input type="text" name="raterName" class="form-control"
									placeholder="이름">
							</div>
						</div>
						<div class="row mb-3 ">
							<label class="col-sm-3 col-form-label">소속 :</label>
							<div class="col-sm-5">
								<input type="text" name="raterDept" class="form-control"
									placeholder="소속">
							</div>
						</div>
						<div class="row mb-3 ">
							<label class="col-sm-3 col-form-label">직급 :</label>
							<div class="col-sm-5">
								<input type="text" name="raterRank" class="form-control"
									placeholder="직급">
							</div>
						</div>
						<div class="row mb-3 ">
							<label class="col-sm-3 col-form-label">전화번호 :</label>
							<div class="col-sm-5">
								<input type="text" name="raterPhone" class="form-control"
									placeholder="전화번호">
							</div>
						</div>
						<div class="row mb-3 ">
							<label class="col-sm-3 col-form-label">이메일 :</label>
							<div class="col-sm-5">
								<input type="text" name="raterEmail" class="form-control"
									placeholder="이메일">
							</div>
						</div>
						<div class="row mb-3">
							<label class="col-sm-3 col-form-label">등록하기</label>
							<div class="col-sm-5">
								<button type="button" onclick="" class="btn btn-outline-danger">취소</button>
								<button type="submit" onclick="" class="btn btn-outline-primary">등록</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</section>
</main>
<jsp:include page="../include/admin_footer.jsp" />

<script>
	// 신청 등록 유효성 검사 
	function validate() {

		var title = $("#title").val();
		var content = $("#content").val();

		if (title == "") {
			alert("제목을 입력해주세요 .");
			document.getElementById("title").focus();
			return false;
		}

		if (content == "") {
			alert("내용을 입력해주세요 .");
			document.getElementById("content").focus();
			return false;
		}

		return true;

	}
</script>

<script>
	$("input:text[numberOnly]").on("focus", function() {
		var x = $(this).val();
		x = removeCommas(x);
		$(this).val(x);
	}).on("focusout", function() {
		var x = $(this).val();
		if (x && x.length > 0) {
			if (!$.isNumeric(x)) {
				x = x.replace(/[^0-9]/g, "");
			}
			x = addCommas(x);
			$(this).val(x);
		}
	}).on("keyup", function() {
		$(this).val($(this).val().replace(/[^0-9]/g, ""));
	});
</script>

<script>
	$(document).ready(function() {
		var formObj = $("form[role='form']");

		console.log(formObj);

		$("#btn_submit").on("click", function() {

			formObj.submit();
		});

		$(".btn-outline-danger").on("click", function() {
			self.location = "/mng/raterList";
		});
	});
</script>