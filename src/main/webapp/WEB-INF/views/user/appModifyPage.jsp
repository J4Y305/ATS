<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="../include/user_header.jsp" />
<main id="main" class="main" style="padding-top: 50px;"> <!-- End Page Title -->
<section class="section">
	<div class="row justify-content-center">
		<div class="col-lg-10">
			<div class="pagetitle">
				<h1>지원서 내용 수정</h1>
			</div>

			<!-- General Form Elements -->
			<form class="row g-3" role="form" method="post" name="frm">
				<input type="hidden" name="userId" class="form-control"
					value='${login.userId}'> <input type="hidden" name="appNum"
					class="form-control" value='${appVO.appNum}'>
				<div class="card p-4">
					<div class="card-body">
						<div class="card">
							<div class="card-body">
								<div class="icon">
									<h5 class="card-title fw-bold">
										<i class="bi bi-person mx-3"></i>지원자 기본 정보
									</h5>
								</div>
								<div class="row mb-3">
									<label class="col-sm-3 col-form-label fw-bold">이름 :</label>
									<div class="col-sm-8">
										<input type="text" name="userName" class="form-control pt-2	"
											value="${userVO.userName}" readOnly>
									</div>
								</div>
								<div class="row mb-3">
									<label class="col-sm-3 col-form-label fw-bold">전화번호 :</label>
									<div class="col-sm-8">
										<input type="text" name="userPhone" class="form-control pt-2"
											value="${userVO.userPhone}" readOnly>
									</div>
								</div>
								<div class="row mb-3">
									<label class="col-sm-3 col-form-label fw-bold">이메일:</label>
									<div class="col-sm-8">
										<input type="text" name="entPhone" class="form-control"
											value="${userVO.userEmail}" readOnly>
									</div>
								</div>
								<div class="row mb-3 ">
									<label class="col-sm-3 col-form-label fw-bold">생년월일 :</label>
									<div class="col-sm-8">
										<input type="text" name="mngName" class="form-control"
											value="${userVO.birthDay}" readOnly>
									</div>
								</div>
								<div class="row mb-3 ">
									<label class="col-sm-3 col-form-label fw-bold">성별 :</label>
									<c:if test="${1 eq userVO.gender}">
										<div class="col-sm-8">
											<input type="text" class="form-control" name="gender"
												id="gender" readOnly value="남자">
										</div>
									</c:if>
									<c:if test="${2 eq userVO.gender}">
										<div class="col-sm-8">
											<input type="text" class="form-control" name="gender"
												id="gender" readOnly value="여자">
										</div>
									</c:if>
								</div>
							</div>
						</div>


						<div class="card">
							<div class="card-body">
								<div class="icon">
									<h5 class="card-title fw-bold">
										<i class="bi bi bi-tags mx-3"></i>지원서 등록
									</h5>
								</div>
								<div class="row mb-3 ">
									<label class="col-sm-3 col-form-label fw-bold">비고란 :</label>
									<div class="col-sm-8">
										<textarea class="form-control" name="etc"
											style="height: 100px">${appVO.etc}</textarea>
									</div>
								</div>
								<div class="row mb-3">
									<label class="col-sm-3 col-form-label fw-bold">지원서 업로드
										:</label>
									<!-- <div id='mydropzone' class="dropzone"> -->
									<div class="col-sm-8">
										<div id='mydropzone'
											class="alert alert-primary alert-dismissible fade show">
											<input type="file" id="fileUpload" name="fileUpload"
												style="visibility: hidden;" />
											<div class="fileDrop">
												<input type="hidden" id="uploadCount">
												<div class="dz-message needsclick">
													<i class="h1 text-muted dripicons-cloud-upload"></i>
													<h4 class="alert-heading">Drop files here or click to
														upload.</h4>
													<p class="mb-0">첨부파일을 업로드하려면 여기에 첨부파일 파일을 끌어 넣거나 클릭해주세요</p>
												</div>
											</div>
										</div>
										<div>
											<ul class="dropzone-previews clearfix uploadedList">
												<li class="dropzone-previews mt-3">
													<div
														class="card mt-1 mb-0 shadow-none border dz-processing dz-image-preview dz-success dz-complete">
														<div class="p-2">
															<div class="row align-items-center">
																<div class="col pl-0">
																	<a href="/displayFile?fileName=${appVO.appFile}"
																		text-muted font-weight-bold" data-dz-name="">${appVO.fileName}</a>
																</div>
																<div class="col-auto">
																	<a href="${appVO.appFile}"
																		class="btn btn-danger delbtn"><i
																		class="bi bi-exclamation-octagon"></i></a>
																</div>
															</div>
														</div>
													</div>
												</li>
											</ul>
										</div>
									</div>
								</div>
							</div>
						</div>
						<input type=hidden name="appSave">
			</form>

		</div>
	</div>
	<div class="row mb-3 p-4 justify-content-center">
		<div class="col-sm-10 d-flex justify-content-center">
			<button type="submit" class="btn btn-outline-primary btn-lg"
				style="margin: 10px">최종제출</button>
			<button type="submit" class="btn btn-outline-success btn-lg"
				style="margin: 10px">임시저장</button>
			<button type="submit" class="btn btn-outline-danger btn-lg"
				style="margin: 10px">취소</button>
		</div>
	</div>
	</div>
	</div>
	</div>
	</div>
</section>
</main>
<jsp:include page="../include/admin_footer.jsp" />
<script>
	$(document).ready(function() {

		var formObj = $("form[role='form']");

		console.log(formObj);

		$(".btn-outline-primary").on("click", function() {
			$('input[name=appSave]').val(1);
			formObj.attr("method", "post");
			formObj.attr("action", "/user/appModifyPage");
			formObj.submit();
		});

		$(".btn-outline-success").on("click", function() {
			$('input[name=appSave]').val(0);
			formObj.attr("method", "post");
			formObj.attr("action", "/user/appModifyPage");
			formObj.submit();
		});
		$(".btn-outline-danger").on("click", function() {
			self.location = "/user/appStoreList";

		});

	});
	function checkImageType(fileName) {

		var pattern = /jpg|gif|png|jpeg/i;

		return appFile.match(pattern);

	}
</script>
<!-- SD PROJECT JS -->

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script type="text/javascript" src="/resources/upload.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<script id="template" type="text/x-handlebars-template">
<li class="dropzone-previews mt-3">
<div class="card mt-1 mb-0 shadow-none border dz-processing dz-image-preview dz-success dz-complete">
<div class="p-2">
<div class="row align-items-center">
 <div class="col pl-0">
   <a href="/displayFile?fileName={{fullName}}" text-muted font-weight-bold" data-dz-name="">{{fileName}}</a>
 </div>
 <div class="col-auto">
   <a href="{{fullName}}" class="btn btn-danger delbtn"><i class="bi bi-exclamation-octagon"></i></a>
 </div>
</div>
</div>
</div>
</li>
</script>
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
	$(document)
			.ready(
					function() {
						var formObj = $("form[role='form']");

						formObj
								.submit(function(event) {
									event.preventDefault();
									//유효성 검사

									var val = validate();

									if (val) {

										var that = $(this);

										var str = "";

										$(".uploadedList .delbtn")
												.each(
														function(index) {
															str += "<input type='hidden' name='appFile'"
																	+ " value='"
																	+ $(this)
																			.attr(
																					"href")
																	+ "'> ";
														});

										that.append(str);
										console.log(str);

										that.get(0).submit();

									}//if문 종료

								});

					});

	$('#mydropzone').click(function(event) {

		document.frm.fileUpload.click();

	});

	var template = Handlebars.compile($("#template").html());

	//dragenter dragover, drop 기본 동작 막기(기본적인 이벤트 처리 제한 preventDefault) 끌어다 놓으면 새로운 창이 열리는 동작
	$(".fileDrop").on("dragenter dragover", function(event) {
		event.preventDefault();
	});

	$(".fileDrop").on("drop", function(event) {
		event.preventDefault();

		var uploaded = $("#uploadCount").val();

		//event.dataTransfer=이벤트와 같이 전달된 데이터   
		//dataTransfer.files= 그안 에 포함된 전달된 파일 데이터를 찾아 가져오는 부분
		//jQuery를 이용하는 경우 envent가 순수한 DOM 이벤트가 아니기때문에 
		var files = event.originalEvent.dataTransfer.files;

		var file = files[0];

		//formData를 이용한 서버 호출 (기존 <form>태그로 만든 데이터 전송방식과 동일)
		var formData = new FormData();

		//file 이름으로 파일 객체 추가
		formData.append("file", file);

		//$.post()를 사용하지 않고 $.ajax() 사용하는 대신 processData,contentType: false로 지정
		$.ajax({
			url : '/uploadAjax',
			data : formData,
			dataType : 'text',
			processData : false, //데이터를 자동 변환 할 것인지(true:일반적인 query string / false:자동 변환 없이)
			contentType : false, //기본값(true) application/urlcod 타입으로 전송 / 파일의 경우(false) multipart/form_data 방식으로 전송
			type : 'POST',
			success : function(data) {

				var fileInfo = getFileInfo(data);
				var html = template(fileInfo);

				var str = "";

				$(".uploadedList").append(html);

				uploaded++;
				$("#uploadCount").attr("value", uploaded);

				$(".uploadedList").append(str);
			}
		});
	});

	//클릭으로 파일 업로드할 때 호출되는 함수
	$("#fileUpload").on("change", function(event) {
		console.log("click!");
		event.preventDefault();

		var uploaded = $("#uploadCount").val();

		if (uploaded >= 1) {
			alert('첨부파일은 1개 까지 업로드할 수 있습니다.');
			return;
		}

		// 파일업로드 인풋에서 파일을 받음
		var file = document.getElementById("fileUpload").files[0];

		// 새로운 폼데이터를 생성
		var formData = new FormData();

		// 폼데이터에 파일을 붙임
		formData.append("file", file);

		// AJAX로 uploadAjax 메소드를 호출해서 파일을 업로드함
		$.ajax({
			url : '/uploadAjax',
			data : formData,
			dataType : 'text',
			processData : false,
			contentType : false,
			type : 'POST',
			success : function(data) {

				var fileInfo = getFileInfo(data);
				var html = template(fileInfo);

				var str = "";

				$(".uploadedList").append(html);

				uploaded++;
				$("#uploadCount").attr("value", uploaded);

				$(".uploadedList").append(str);
			}
		});
	});

	//첨부파일 삭제 처리
	$(".uploadedList").on("click", ".delbtn", function(event) {
		event.preventDefault();

		var that = $(this);
		var uploaded = $("#uploadCount").val();

		$.ajax({
			url : "/deleteFile",
			type : "post",
			data : {
				fileName : $(this).attr("href")
			},
			dataType : "text",
			success : function(result) {

				if (result == 'deleted') {

					that.closest("li").remove();
					uploaded--;
					$("#uploadCount").attr("value", uploaded);

				}
			}

		});

	});
	//파일링크 처리(길이를 줄여줌)
	//function getOriginalName(appFile) {

	//if (checkImageType(appFile)) {
	//return;
	//}

	//var idx = appFile.indexOf("_") + 1;
	//return appFile.substr(idx);

	//}
	//이미지파일 원본 파일 찾기
	//function getImageLink(appFile) {

	//if (!checkImageType(appFile)) {
	//return;
	//}
	//noticeFileName.substring(0,12)/년/월/일 경로 추출  
	//noticeFileName.substring(14) 파일 이름앞의 's_'제거
	//var front = appFile.substr(0, 12);
	//var end = appFile.substr(14);

	//return front + end;

	//}
</script>
