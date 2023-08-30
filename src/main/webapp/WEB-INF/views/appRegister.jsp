<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fmt2" uri="http://java.sun.com/jstl/fmt_rt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<jsp:include page="include/header.jsp" />

<main id="main"> <!-- ======= Breadcrumbs ======= -->
<section id="breadcrumbs" class="breadcrumbs">
	<div class="container">
		<h2>채용 공고</h2>
		<!-- End Breadcrumbs -->
		<section id="pricing" class="pricing" style="padding-top: 1px;">
			<div class="container" data-aos="fade-up">
				<div class="row">
					<div class="col-lg-20" data-aos="fade-up" data-aos-delay="100">
						<div class="box" style="padding-top: 1px;">
							<div class="col-lg-7 mt-5 mt-lg-0 d-flex align-items-stretch">
								<form action="appRegister" method="post" role="form" name="frm"
									class="php-email-form">
									<input type='hidden' name='page' value="${cri.page}"> <input
										type='hidden' name='perPageNum' value="${cri.perPageNum}">
									<input type='hidden' name='searchType'
										value="${cri.searchType}"> <input type='hidden'
										name='keyword' value="${cri.keyword}"> <input
										type="hidden" name="annNum" class="form-control"
										value='${annVO.annNum}'> <input type="hidden"
										name="userId" class="form-control" value='${login.userId}'>
									<div class="row">
										<div class="form-group col-md-6">
											<label for="name">이름</label> <input type="text" name="userName"
												class="form-control" id="name" value="${userVO.userName}">
										</div>
										<div class="form-group col-md-6">
											<label for="name">전화번호</label> <input type="email"
												class="form-control" name="email" id="email"
												value="${userVO.userPhone}">
										</div>
									</div>
									<div class="form-group">
										<label for="name">이메일</label> <input type="text"
											class="form-control" name="subject" id="subject"
											value="${userVO.userEmail}">
									</div>
								
									<div class="row">
										<div class="form-group col-md-6">
											<label for="name">생년월일</label> <input type="text" name="name"
												class="form-control" id="name" value="${userVO.birthDay}">
										</div>
										<div class="form-group col-md-6">
											<label for="name">성별</label> 
											<c:if test="${1 eq userVO.gender}">
											<input type="text" class="form-control" name="gender" id="gender"
												value="남"></c:if>
												<c:if test="${2 eq userVO.gender}">
											<input type="text" class="form-control" name="gender" id="gender"
												value="여"></c:if>
										</div>
									</div>
									<div class="form-group">
										<label for="name">비고란</label>
										<textarea class="form-control" name="etc" rows="10"
											required></textarea>
									</div>
									<div class="row mb-3">
										<label class="col-sm-3 col-form-label">지원서 업로드 :</label>
										<!-- <div id='mydropzone' class="dropzone"> -->
										<div class="col-sm-8">
											<div id='mydropzone' class="alert alert-primary alert-dismissible fade show">
												<input type="file" id="fileUpload" name="fileUpload" style="visibility: hidden;" />
												<div class="fileDrop">
													<input type="hidden" id="uploadCount">
													<div class="dz-message needsclick">
														<i class="h1 text-muted dripicons-cloud-upload"></i>
														<h4 class="alert-heading">Drop files here or click to upload.</h4>
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
								</form>
							</div>
							<div class="col-lg-7 mt-5 mt-lg-0 d-flex align-items-stretch">
								<div class="text-center">
									<button type="submit" class="btn btn-primary" value="1">최종제출</button>
								</div>
								<div class="text-center">
									<button type="submit" class="btn btn-success" value="0">임시저장</button>
								</div>
								<input type=hidden name="appSave">
								<div class="text-center">
									<button type="submit" class="btn btn-danger">취소</button>
								</div>
							</div>
						</div>

					</div>
				</div>
			</div>
	</div>
</section>
<!-- End Contact Section --> </main>
<!-- End #main -->

<jsp:include page="include/footer.jsp" />

<script>
	$(document).ready(function() {

		var formObj = $("form[role='form']");

		console.log(formObj);

		$(".btn-primary").on("click", function() {
			$('input[name=appSave]').val(1);
			console.log($('input[name=appSave]').val());
			formObj.attr("method", "post");
			formObj.attr("action", "/appRegister");
			formObj.submit();
		});
		
		$(".btn-success").on("click", function() {
			$('input[name=appSave]').val(0);
			console.log($('input[name=appSave]').val());
			formObj.attr("method", "post");
			formObj.attr("action", "/appRegister");
			formObj.submit();
		});
		$(".btn-danger").on("click", function() {
						self.location = "/annReadMainPage?page=${cri.page}&perPageNum=${cri.perPageNum}"
								+ "&searchType=${cri.searchType}&keyword=${cri.keyword}${annVO.annNum}";

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
<style>
#header.header-scrolled,
#header.header-inner-pages {
  background: rgba(40, 58, 90, 0.9);
}
#header:hover{
  padding:15px;
  
}
#header{
	background: rgba(40, 58, 90, 0.9);
}

.logo:hover {
  text-shadow: 0 0 10px rgba(221, 221, 221, 0.8),
               0 0 20px rgba(221, 221, 221, 0.8);
}
.navbar a:hover{
  transform: scale(1.2, 1.2);
}
.nav-up {
    top: -73px;
}
</style>

<script>
// Hide Header on on scroll down
var didScroll;
var lastScrollTop = 0;
var delta = 5;
var navbarHeight = $('header').outerHeight();

$(window).scroll(function(event){
    didScroll = true;
});

setInterval(function() {
    if (didScroll) {
        hasScrolled();
        didScroll = false;
    }
}, 250);

function hasScrolled() {
    var st = $(this).scrollTop();
    
    // Make sure they scroll more than delta
    if(Math.abs(lastScrollTop - st) <= delta)
        return;
    
    // If they scrolled down and are past the navbar, add class .nav-up.
    // This is necessary so you never see what is "behind" the navbar.
    if (st > lastScrollTop && st > navbarHeight){
        // Scroll Down
        $('header').removeClass('nav-down').addClass('nav-up');
    } else {
        // Scroll Up
        if(st + $(window).height() < $(document).height()) {
            $('header').removeClass('nav-up').addClass('nav-down');
        }
    }
    
    lastScrollTop = st;
}
</script>