<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%-- <%@include file="../include/header.jsp"%> --%>
<jsp:include page="../include/header.jsp" />
<!-- Main content -->
<section class="content">
	<div class="row">
		<!-- left column -->
		<div class="col-md-12">
			<!-- general form elements -->
			<div class="box box-primary">
				<div class="box-header">
					<h3 class="box-title">회원 정보 수정하기</h3>
				</div>
				<!-- /.box-header -->

<form role="form" action="modifyPage" method="post">

	<input type='hidden' name='page' value="${cri.page}"> 
	<input type='hidden' name='perPageNum' value="${cri.perPageNum}">
	<input type='hidden' name='searchType' value="${cri.searchType}">
	<input type='hidden' name='keyword' value="${cri.keyword}">

					<div class="box-body">

						<div class="form-group">
							<label for="exampleInputEmail1">회원 아이디</label> 
							<input type="text" name='userId' class="form-control" value="${userVO.userId}" readonly="readonly">
						</div>
					<div class="form-group">
						<label for="exampleInputEmail1">비밀번호</label> 
						<input type="text" name='upw' class="form-control" value="${userVO.userPwd}">
					</div>						
					<div class="form-group">
						<label for="exampleInputEmail1">회원명</label> 
						<input type="text" name='userName' class="form-control" value="${userVO.userName}">
					</div>
					<div class="form-group">
						<label for="exampleInputEmail1">생년월일</label> 
						<input type="text" name='birthDay' class="form-control" value="${userVO.birthDay}">
					</div>					
					<div class="form-group">
						<label for="exampleInputEmail1">성별</label> 
						<input type="text" name='gender' class="form-control" value="${userVO.gender}">
					</div>
					<div class="form-group">
						<label for="exampleInputEmail1">이메일</label> 
						<input type="text" name='userEmail' class="form-control" value="${userVO.userEmail}">
					</div>
					<div class="form-group">
						<label for="exampleInputEmail1">핸드폰 번호</label> 
						<input type="text" name='userPhone' class="form-control" value="${userVO.userPhone}">
					</div>
					<div class="form-group">
						<label for="exampleInputEmail1">생성 날짜</label> 
						<input type="text" name='userRegDate' class="form-control" value="${userVO.userRegDate}" readonly="readonly">
					</div>
					
					</div>
					<!-- /.box-body -->
				</form>
				<div class="box-footer">
					<button type="submit" class="btn btn-primary">저장</button>
					<button type="submit" class="btn btn-warning">취소</button>
				</div>


<script>
$(document).ready(
	function() {

		var formObj = $("form[role='form']");

		console.log(formObj);

		$(".btn-warning")
				.on("click",function() {
					self.location = "/user/list?page=${cri.page}&perPageNum=${cri.perPageNum}"
							+ "&searchType=${cri.searchType}&keyword=${cri.keyword}";
				});

		$(".btn-primary").on("click",
				function() {
					formObj.submit();
				});
	});
</script>

			</div>
			<!-- /.box -->
		</div>
		<!--/.col (left) -->

	</div>
	<!-- /.row -->
</section>
<!-- /.content -->
</div>
<!-- /.content-wrapper -->

<%@include file="../include/footer.jsp"%>
