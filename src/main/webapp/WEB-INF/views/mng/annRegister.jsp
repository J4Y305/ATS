<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="../include/mng_header.jsp" />
<main id="main" class="main">

<div class="pagetitle">
	<h1>공고 등록</h1>

</div>
<!-- End Page Title -->
<section class="section">
	<div class="row">
		<div class="col-lg-10">

			<div class="card">
				<div class="card-body">
					<h5 class="card-title">공고 정보</h5>

					<!-- General Form Elements -->
					<form class="row g-3" role="form" method="post" name="frm"
						onsubmit="onSubmitForm()">
						<input type='hidden' name='page' value="${cri.page}"> <input
							type='hidden' name='perPageNum' value="${cri.perPageNum}">
						<input type='hidden' name='searchType' value="${cri.searchType}">
						<input type='hidden' name='keyword' value="${cri.keyword}">
						<input type="hidden" name="adminId" class="form-control"
							value='${login.mngId}'>
						<div class="row mb-3 ">
							<label class="col-sm-3 col-form-label">공고명 :</label>
							<div class="col-sm-5">
								<input type="text" name="annName" class="form-control"
									placeholder="공고명">
							</div>
						</div>
						<div class="row mb-3">
							<label class="col-sm-3 col-form-label">모집분야 :</label>
							<div class="col-sm-5">
								<input type="text" name="annField" class="form-control"
									placeholder="모집분야">
							</div>
						</div>
						<div class="row mb-3">
							<label class="col-sm-3 col-form-label">공고 시작일 :</label>
							<div class="col-sm-3">
								<input type="text" id="sample6_postcode" name="annStartDate"
									class="form-control" placeholder="우편번호">
							</div>
						</div>
						<div class="row mb-3">
							<label class="col-sm-3 col-form-label">공고 마감일:</label>
							<div class="col-sm-4">
								<input type="text" name="annEndDate" class="form-control"
									placeholder="대표 전화번호">
							</div>
						</div>
						<div class="row mb-3">
							<label class="col-sm-3 col-form-label">공고 내용:</label>
							<div class="col-sm-4">
								<input type="text" name="detail" class="form-control"
									placeholder="대표 전화번호">
							</div>
						</div>
						<div class="row mb-3">
							<label class="col-sm-3 col-form-label">공고 관련 이미지 :</label>

							<!-- <div id='mydropzone' class="dropzone"> -->
							<div class="col-sm-6">
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
									</ul>
								</div>
							</div>
						</div>
						
						<div class="row mb-3">
							<label class="col-sm-3 col-form-label">공고 관련 파일 :</label>

							<!-- <div id='mydropzone' class="dropzone"> -->
							<div class="col-sm-6">
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
									</ul>
								</div>
							</div>
						</div>
						
						<div class="row mb-3 ">
						<label class="col-sm-2 col-form-label">계정 활성 여부</label>
						<div class="col-sm-10">
							<div class="form-check form-switch">
								<label class="form-check-label" for="flexSwitchCheckDefault">활성</label>
								<input class="form-check-input" type="checkbox" name="mngAct"
									id="flexSwitchCheckDefault">
							</div>
							</div>
						</div>

						<div class="row mb-3">
							<label class="col-sm-2 col-form-label">등록하기</label>
							<div class="col-sm-10">
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
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	function sample6_execDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 각 주소의 노출 규칙에 따라 주소를 조합한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var addr = ''; // 주소 변수
						var extraAddr = ''; // 참고항목 변수

						//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
						if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
							addr = data.roadAddress;
						} else { // 사용자가 지번 주소를 선택했을 경우(J)
							addr = data.jibunAddress;
						}

						// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
						if (data.userSelectedType === 'R') {
							// 법정동명이 있을 경우 추가한다. (법정리는 제외)
							// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
							if (data.bname !== ''
									&& /[동|로|가]$/g.test(data.bname)) {
								extraAddr += data.bname;
							}
							// 건물명이 있고, 공동주택일 경우 추가한다.
							if (data.buildingName !== ''
									&& data.apartment === 'Y') {
								extraAddr += (extraAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('sample6_postcode').value = data.zonecode;
						document.getElementById("sample6_address").value = addr;
						// 커서를 상세주소 필드로 이동한다.
						document.getElementById("sample6_detailAddress")
								.focus();
					}
				}).open();
	}

	function onSubmitForm() {
		if ($("input:radio[name='annAct']").is(":checked") == true) {
			// 체크되었을때 실행
			document.getElementById("flexSwitchCheckDefault").value = 1;
			console
					.log(document.getElementById("flexSwitchCheckDefault").value);
		}

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
 <div class="col-auto">
    <img data-dz-thumbnail="" class="avatar-sm rounded bg-light" src="{{imgsrc}}">
 </div>
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
															str += "<input type='hidden' name='annImage'"
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

						$(".btn-cancel")
								.on(
										"click",
										function() {
											self.location = "annList&page=${cri.page}&perPageNum=${cri.perPageNum}"
													+ "&searchType=${cri.searchType}&listType=${cri.listType}&keyword=${cri.keyword}";
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
		event.preventDefault();

		var uploaded = $("#uploadCount").val();

		if (uploaded >= 3) {
			alert('첨부파일은 3개 까지 업로드할 수 있습니다.');
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
	function getOriginalName(noticeFileName) {

		if (checkImageType(noticeFileName)) {
			return;
		}

		var idx = noticeFileName.indexOf("_") + 1;
		return noticeFileName.substr(idx);

	}
	//이미지파일 원본 파일 찾기
	function getImageLink(noticeFileName) {

		if (!checkImageType(noticeFileName)) {
			return;
		}
		//noticeFileName.substring(0,12)/년/월/일 경로 추출  
		//noticeFileName.substring(14) 파일 이름앞의 's_'제거
		var front = noticeFileName.substr(0, 12);
		var end = noticeFileName.substr(14);

		return front + end;

	}
</script>




<script>
	$(document).ready(function() {
		var formObj = $("form[role='form']");

		console.log(formObj);

		$("#btn_submit").on("click", function() {

			formObj.submit();
		});
		
		$(".btn-outline-danger")
		.on(
				"click",
				function() {
					self.location = "/admin/mngList";
				});
	});
</script>