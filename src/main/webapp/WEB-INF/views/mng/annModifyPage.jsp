<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="../include/mng_header.jsp" />
<main id="main" class="main">
<section class="section">
	<div class="row justify-content-center">
		<div class="col-lg-9">
			<div class="pagetitle fw-bold p-4">
				<h1>공고 수정</h1>
			</div>
			<div class="card">
				<div class="card-body w-90 p-3">
					<!-- General Form Elements -->
					<form class="row g-3" role="form" method="post" name="frm"
						onsubmit="onSubmitForm()" action="annModifyPage">
						<input type='hidden' name='page' value="${cri.page}"> <input
							type='hidden' name='perPageNum' value="${cri.perPageNum}">
						<input type='hidden' name='searchType' value="${cri.searchType}">
						<input type='hidden' name='keyword' value="${cri.keyword}">
						<input type="hidden" name="mngId" class="form-control"
							value='${login.mngId}'> <input type="hidden"
							name="annNum" class="form-control" value='${annVO.annNum}'>
						<div class="row mb-3">
							<div class="row mb-3 p-4 justify-content-center">
								<label class="col-sm-2 col-form-label fw-bold">공고명 :</label>
								<div class="col-sm-10">
									<input type="text" name="annName" class="form-control"
										value="${annVO.annName}">
								</div>
							</div>
							<div class="row mb-3 p-4 justify-content-center">
								<label class="col-sm-2 col-form-label fw-bold">모집분야 :</label>
								<div class="col-sm-10">
									<input type="text" name="annField" class="form-control"
										value="${annVO.annField}">
								</div>
							</div>
							<div class="row mb-3 p-4 justify-content-center">
								<label class="col-sm-2 col-form-label fw-bold">공고 시작일 :</label>
								<div class="col-sm-10">
									<input type="date" id="startDate" class="form-control"
										value=<fmt:formatDate pattern="yyyy-MM-dd"
													value="${annVO.annStartDate}"/>>
									<input type="hidden" class="form-control" name="annStartDate" id="originSd" value="${annVO.annStartDate}">
								</div>
							</div>
							<div class="row mb-3 p-4 justify-content-center">
								<label class="col-sm-2 col-form-label fw-bold">공고 마감일:</label>
								<div class="col-sm-10">
									<input type="date" id="endDate" class="form-control"
										value=<fmt:formatDate pattern="yyyy-MM-dd"
													value="${annVO.annEndDate}"/>>
									<input type="hidden" class="form-control" name="annEndDate" id="originEd" value="${annVO.annEndDate}">
								</div>
							</div>
							<div class="row mb-3 p-4 justify-content-center">
								<label class="col-sm-2 col-form-label fw-bold">공고 내용:</label>
								<div class="col-sm-10">
									<textarea class="form-control" style="height: 100px"
										name="detail">${annVO.detail}</textarea>
								</div>
							</div>
							<div class="row mb-3 p-4 justify-content-center">
								<label class="col-sm-2 col-form-label fw-bold">공고 관련 이미지
									:</label>
								<div class="col-sm-10">
									<div id='mydropzoneImage'
										class="alert alert-primary alert-dismissible fade show">


										<input type="file" id="imageFileUpload" name="imageFileUpload"
											style="visibility: hidden;" />

										<div class="fileDrop">
											<input type="hidden" id="imageUploadCount">
											<div class="dz-message needsclick">
												<i class="h1 text-muted dripicons-cloud-upload"></i>
												<h4 class="alert-heading">Drop files here or click to
													upload.</h4>
												<p class="mb-0">첨부파일을 업로드하려면 여기에 첨부파일 파일을 끌어 넣거나 클릭해주세요</p>
											</div>
										</div>
									</div>
									<div>
										<ul class="dropzone-previews clearfix imageUploadedList">
											<c:forEach items="${annImageVO}" var="iVo" varStatus="status">
												<li class="dropzone-previews mt-3">
													<div
														class="card mt-1 mb-0 shadow-none border dz-processing dz-image-preview dz-success dz-complete">
														<div class="p-2">
															<div class="row align-items-center">
																<div class="col pl-0">
																	<a href="/displayFile?fileName=${iVo.fileLocation}"
																		text-muted font-weight-bold" data-dz-name="">${iVo.annImageName}</a>
																</div>
																<div class="col-auto">
																	<a href="${iVo.fileLocation}"
																		class="btn btn-danger delbtn"><i
																		class="bi bi-exclamation-octagon"></i></a>
																</div>
															</div>
														</div>
													</div>
												</li>
											</c:forEach>
										</ul>
									</div>
								</div>
							</div>
							<div class="row mb-3 p-4 justify-content-center">
								<label class="col-sm-2 col-form-label fw-bold">공고 관련 파일
									:</label>
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
											<c:forEach items="${annFileVO}" var="fVo" varStatus="status">
												<li class="dropzone-previews mt-3">
													<div
														class="card mt-1 mb-0 shadow-none border dz-processing dz-image-preview dz-success dz-complete">
														<div class="p-2">
															<div class="row align-items-center">
																<div class="col pl-0">
																	<a href="/displayFile?fileName=${fVo.fileLocation}"
																		text-muted font-weight-bold" data-dz-name="">${fVo.annFileName}</a>
																</div>
																<div class="col-auto">
																	<a href="${fVo.fileLocation}"
																		class="btn btn-danger delbtn"><i
																		class="bi bi-exclamation-octagon"></i></a>
																</div>
															</div>
														</div>
													</div>
												</li>
											</c:forEach>
										</ul>
									</div>
								</div>
							</div>

							<div class="row mb-3 p-4">
								<label class="col-sm-2 col-form-label fw-bold">공고 활성 여부</label>
								<c:if test="${0 eq annVO.annAct}">
									<div class="form-check form-switch col-sm-10 pt-2">
										<label class="form-check-label" for="flexSwitchCheckDefault">활성</label>
										<input class="form-check-input" type="checkbox"
											id="flexSwitchCheckDefault">
									</div>
								</c:if>
								<c:if test="${1 eq annVO.annAct}">
									<div class="form-check form-switch col-sm-10 pt-2">
										<label class="form-check-label" for="flexSwitchCheckDefault">활성</label>
										<input class="form-check-input" type="checkbox"
											id="flexSwitchCheckDefault" checked>
									</div>
								</c:if>
								<input type="hidden" name="annAct" class="form-control"
									value="${annVO.annAct}">
							</div>
							<div class="row mb-3 p-4 justify-content-center">
								<div class="col-sm-5 d-flex justify-content-center">
									<button type="button" class="btn btn-outline-danger btn-lg">취소</button>
									<button type="button"
										class="btn btn-outline-primary btn-lg mx-4">저장</button>
								</div>
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
	//활성 여부 
	$('#flexSwitchCheckDefault').click(function() {
		var checked = $('#flexSwitchCheckDefault').is(':checked');
		if (checked == true) {
			$('input[name=annAct]').val(1);
			console.log($('input[name=annAct]').val());
		} else {
			$('input[name=annAct]').val(0);
			console.log($('input[name=annAct]').val());
		}
	})
	// 시작일 날짜형으로 변환
	$('#startDate').click(function() {
		console.log($('#startDate').val());
		var sd = new Date($('#startDate').val());
		console.log(sd);
		$('input[name=annStartDate]').val(sd);
	})
	// 마감일 날짜형으로 변환
	$('#endDate').click(function() {
		var ed = new Date($('#endDate').val());
		console.log(ed);
		$('input[name=annEndDate]').val(ed);
	})
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

										$(".imageUploadedList .delbtn")
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
									if (val) {

										var that = $(this);

										var str = "";

										$(".uploadedList .delbtn")
												.each(
														function(index) {
															str += "<input type='hidden' name='annFile'"
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

	$('#mydropzoneImage').click(function(event) {

		document.frm.imageFileUpload.click();

	});

	var template = Handlebars.compile($("#template").html());

	//dragenter dragover, drop 기본 동작 막기(기본적인 이벤트 처리 제한 preventDefault) 끌어다 놓으면 새로운 창이 열리는 동작
	$(".fileDrop").on("dragenter dragover", function(event) {
		event.preventDefault();
	});

	$(".fileDrop").on("drop", function(event) {
		event.preventDefault();

		var uploaded = $("#imageUploadCount").val();

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

				$(".imageUploadedList").append(html);

				uploaded++;
				$("#imageUploadCount").attr("value", uploaded);

				$(".imageUploadCount").append(str);
			}
		});
	});

	//클릭으로 파일 업로드할 때 호출되는 함수
	$("#imageFileUpload").on("change", function(event) {
		event.preventDefault();

		var uploaded = $("#imageUploadCount").val();

		if (uploaded >= 3) {
			alert('첨부파일은 3개 까지 업로드할 수 있습니다.');
			return;
		}

		// 파일업로드 인풋에서 파일을 받음
		var file = document.getElementById("imageFileUpload").files[0];

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

				$(".imageUploadedList").append(html);

				uploaded++;
				$("#imageUploadCount").attr("value", uploaded);

				$(".imageUploadedList").append(str);
			}
		});
	});

	//첨부파일 삭제 처리
	$(".imageUploadedList").on("click", ".delbtn", function(event) {
		event.preventDefault();

		var that = $(this);
		var uploaded = $("#imageUploadCount").val();

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
					$("#imageUploadCount").attr("value", uploaded);

				}
			}

		});

	});
	//파일링크 처리(길이를 줄여줌)
	function getOriginalName(annImageName) {

		if (checkImageType(annImageName)) {
			return;
		}

		var idx = annImageName.indexOf("_") + 1;
		return annImageName.substr(idx);

	}
	//이미지파일 원본 파일 찾기
	function getImageLink(annImageName) {

		if (!checkImageType(annImageName)) {
			return;
		}
		//noticeFileName.substring(0,12)/년/월/일 경로 추출  
		//noticeFileName.substring(14) 파일 이름앞의 's_'제거
		var front = annImageName.substr(0, 12);
		var end = annImageName.substr(14);

		return front + end;

	}
</script>

<script>
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
	function getOriginalName(annFileName) {

		if (checkImageType(annFileName)) {
			return;
		}

		var idx = annFileName.indexOf("_") + 1;
		return annFileName.substr(idx);

	}
	//이미지파일 원본 파일 찾기
	function getImageLink(annFileName) {

		if (!checkImageType(annFileName)) {
			return;
		}
		//noticeFileName.substring(0,12)/년/월/일 경로 추출  
		//noticeFileName.substring(14) 파일 이름앞의 's_'제거
		var front = annFileName.substr(0, 12);
		var end = annFileName.substr(14);

		return front + end;

	}
</script>


<script>
	$(document)
			.ready(
					function() {
						document.getElementById('startDate').click();
						document.getElementById('endDate').click();
						
						var formObj = $("form[role='form']");

						console.log(formObj);

						$(".btn-outline-danger").on("click", function() {
							if(confirm("수정을 취소하시겠습니까?")){
								self.location = "/mng/annList?page=${cri.page}&perPageNum=${cri.perPageNum}"
									+ "&searchType=${cri.searchType}&keyword=${cri.keyword}";	
							}
										});

						$(".btn-outline-primary").on("click", function() {
							if(confirm("수정하시겠습니까?")){
								formObj.submit();
							}
						});
					});
</script>
