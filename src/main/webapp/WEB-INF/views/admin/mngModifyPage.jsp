<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="../include/admin_header.jsp" />
<main id="main" class="main"> <!-- End Page Title -->
<section class="section">
	<div class="row justify-content-center">
		<div class="col-lg-9">
			<div class="pagetitle fw-bold p-4">
				<h1>기업 및 담당자 등록</h1>
			</div>
			<div class="card">
				<div class="card-body w-90 p-3">

					<!-- General Form Elements -->
					<form class="row g-3" role="form" action="mngModifyPage"
						method="post" name="frm" onsubmit="onSubmitForm()">
						<input type='hidden' name='entNum' value="${entVO.entNum}">
						<input type='hidden' name='page' value="${cri.page}"> <input
							type='hidden' name='perPageNum' value="${cri.perPageNum}">
						<input type='hidden' name='searchType' value="${cri.searchType}">
						<input type='hidden' name='keyword' value="${cri.keyword}">
						<div class="row mb-3 p-4 justify-content-center">
							<label class="col-sm-2 col-form-label fw-bold">기업명 :</label>
							<div class="col-sm-10">
								<input type="text" name="entName" class="form-control"
									value="${entVO.entName}">
							</div>
						</div>
						<div class="row mb-3 p-4 justify-content-center">
							<label class="col-sm-2 col-form-label fw-bold">업종 :</label>
							<div class="col-sm-10">
								<input type="text" name="category" class="form-control"
									value="${entVO.category}">
							</div>
						</div>
						<div class="row mb-3 p-4 justify-content-center">
							<label class="col-sm-2 col-form-label fw-bold">주소 :</label>
							<div class="col-sm-5">
								<input type="text" id="sample6_postcode" name="zipCode"
									class="form-control" value="${entVO.zipCode}">
							</div>
							<div class="col-sm-5">
								<button type="button" onclick="sample6_execDaumPostcode()"
									class="btn btn-outline-primary">주소 찾기</button>
							</div>
						</div>
						<div class="row mb-3">
							<label class="col-sm-2 col-form-label fw-bold"> </label>
							<div class="col-sm-10">
								<input type="text" id="sample6_address" name="address"
									value="${entVO.address}" class="form-control">
							</div>
						</div>
						<div class="row mb-3">
							<label class="col-sm-2 col-form-label fw-bold"> </label>
							<div class="col-sm-10">
								<input type="text" id="sample6_detailAddress" name="address"
									class="form-control">
							</div>
						</div>
						<div class="row mb-3 p-4 justify-content-center">
							<label class="col-sm-2 col-form-label fw-bold">대표 전화번호:</label>
							<div class="col-sm-10">
								<input type="text" name="entPhone" class="form-control"
									value="${entVO.entPhone}">
							</div>
						</div>
						<div class="row mb-3 p-4 justify-content-center">
							<label class="col-sm-2 col-form-label fw-bold">사업자 등록증 :</label>
							<!-- <div id='mydropzone' class="dropzone"> -->
							<div class="col-sm-10">
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
						<div class="row mb-3 p-4 justify-content-center">
							<label class="col-sm-2 col-form-label fw-bold">담당자명 :</label>
							<div class="col-sm-10">
								<input type="text" name="mngName" class="form-control"
									value="${mngVO.mngName}">
							</div>
						</div>
						<div class="row mb-3 p-4 justify-content-center">
							<label class="col-sm-2 col-form-label fw-bold">부서 :</label>
							<div class="col-sm-10">
								<input type="text" name="mngDept" class="form-control"
									value="${mngVO.mngDept}">
							</div>
						</div>
						<div class="row mb-3 p-4 justify-content-center">
							<label class="col-sm-2 col-form-label fw-bold">직급 :</label>
							<div class="col-sm-10">
								<input type="text" name="mngRank" class="form-control"
									value="${mngVO.mngRank}">
							</div>
						</div>
						<div class="row mb-3 p-4 justify-content-center">
							<label class="col-sm-2 col-form-label fw-bold">전화번호 :</label>
							<div class="col-sm-10">
								<input type="text" name="mngPhone" class="form-control"
									value="${mngVO.mngPhone}">
							</div>
						</div>
						<div class="row mb-3 p-4 justify-content-center">
							<label class="col-sm-2 col-form-label fw-bold">아이디 :</label>
							<div class="col-sm-10">
								<input type="text" name="mngId" class="form-control"
									placeholder="아이디" value="${mngVO.mngId}" readonly="readonly">
							</div>
						</div>
						<div class="row mb-3 p-4 justify-content-center">
							<label class="col-sm-2 col-form-label fw-bold">비밀번호 :</label>
							<div class="col-sm-10">
								<input type="password" name="mngPwd" class="form-control"
									value="${mngVO.mngPwd}">
							</div>
						</div>
						<div class="row mb-3 p-4 justify-content-center">
							<label class="col-sm-2 col-form-label fw-bold">비밀번호 확인 :</label>
							<div class="col-sm-10">
								<input type="password" class="form-control"
									placeholder="비밀번호 확인">
							</div>
						</div>
						<div class="row mb-3 p-4 justify-content-center">
							<label class="col-sm-2 col-form-label fw-bold">계정 활성 여부</label>
							<div class="col-sm-10">
								<c:if test="${0 eq mngVO.mngAct}">
									<div class="form-check form-switch">
										<label class="form-check-label" for="flexSwitchCheckDefault">활성</label>
										<input class="form-check-input" type="checkbox"
											id="flexSwitchCheckDefault">
									</div>
								</c:if>
								<c:if test="${1 eq mngVO.mngAct}">
									<div class="form-check form-switch">
										<label class="form-check-label" for="flexSwitchCheckDefault">활성</label>
										<input class="form-check-input" type="checkbox"
											id="flexSwitchCheckDefault" checked>
									</div>
								</c:if>
							</div>
							<input type="hidden" name="mngAct" class="form-control">
						</div>
						<input type="hidden" name="adminId" class="form-control"
							value='${login.adminId}'>

						<div class="row mb-3 p-4 justify-content-center">
							<div class="col-sm-5 d-flex justify-content-center">
								<button type="button" class="btn btn-outline-danger">취소</button>
								<button type="submit" class="btn btn-outline-primary mx-4">저장</button>
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
	$(document)
			.ready(
					function() {

						var formObj = $("form[role='form']");

						console.log(formObj);

						$(".btn-outline-danger")
								.on(
										"click",
										function() {
											self.location = "/admin/mngList?page=${cri.page}&perPageNum=${cri.perPageNum}"
													+ "&searchType=${cri.searchType}&keyword=${cri.keyword}";

										});

						$(".btn-outline-success").on("click", function() {
							formObj.submit();
						});
					});
</script>


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
	$('#flexSwitchCheckDefault').click(function() {
		var checked = $('#flexSwitchCheckDefault').is(':checked');
		if (checked == true) {
			$('input[name=mngAct]').val(1);
			console.log($('input[name=mngAct]').val());
		} else {
			$('input[name=mngAct]').val(0);
			console.log($('input[name=mngAct]').val());
		}
	})
	function onSubmitForm() {
		var detail = document.getElementById("sample6_detailAddress").value;
		var load = document.getElementById("sample6_address").value;
		document.getElementById("plusAddress").value = load + " " + detail;
		console.log(document.getElementById("plusAddress").value);

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
															str += "<input type='hidden' name='registration'"
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
	function getOriginalName(registration) {

		if (checkImageType(registration)) {
			return;
		}

		var idx = registration.indexOf("_") + 1;
		return registration.substr(idx);

	}
	//이미지파일 원본 파일 찾기
	function getImageLink(registration) {

		if (!checkImageType(registration)) {
			return;
		}
		//noticeFileName.substring(0,12)/년/월/일 경로 추출  
		//noticeFileName.substring(14) 파일 이름앞의 's_'제거
		var front = registration.substr(0, 12);
		var end = registration.substr(14);

		return front + end;

	}
</script>
