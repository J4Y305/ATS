<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="../include/mng_header.jsp" />
<main id="main" class="main" style="padding-top: 50px;"> <!-- End Page Title -->
<section class="section">
	<div class="row justify-content-center">
		<div class="col-lg-10">
			<div class="pagetitle">
				<h1>평가 등록</h1>
			</div>
			<div class="card p-4">
				<div class="card-body">
					<div class="card">
						<div class="card-body">
							<div class="icon">
								<h5 class="card-title fw-bold">
									<i class="bi bi bi-tags mx-3"></i>평가 기본 정보
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

								<div class="row mb-3 p-4 justify-content-center">
									<label class="col-sm-2 col-form-label fw-bold">평가명 :</label>
									<div class="col-sm-10">
										<input type="text" name="evaName" class="form-control"
											placeholder="평가명">
									</div>
								</div>
								<div class="row mb-3 p-4 justify-content-center">
									<label class="col-sm-2 col-form-label fw-bold">평가 시작일 :</label>
									<div class="col-sm-10">
										<input type="date" id="startDate" class="form-control">
										<input type="hidden" class="form-control" name="evaStartDate">
									</div>
								</div>
								<div class="row mb-3 p-4 justify-content-center">
									<label class="col-sm-2 col-form-label fw-bold">평가 마감일:</label>
									<div class="col-sm-10">
										<input type="date" id="endDate" class="form-control">
										<input type="hidden" class="form-control" name="evaEndDate">
									</div>
								</div>
								<div class="row mb-3 p-4 justify-content-center">
									<label class="col-sm-2 col-form-label fw-bold">해당 공고:</label>
									<div class="col-sm-10">
										<select class="form-select"
											aria-label="Default select example" name="annNum">
											<c:forEach items="${annList}" var="annVO" varStatus="var">
												<option value="${annVO.annNum}">${annVO.annName}</option>
											</c:forEach>
										</select>
									</div>
								</div>
								<fieldset class="row mb-3 p-4 justify-content-center">
									<legend class="col-sm-2 col-form-label fw-bold">평가 차수:</legend>
									<div class="col-sm-10 pt-2">
										<div class="form-check">
											<input class="form-check-input" type="radio" name="degree"
												id="gridRadios1" value="0" checked> <label
												class="form-check-label" for="gridRadios1"> 1차 </label>
										</div>
										<div class="form-check">
											<input class="form-check-input" type="radio" name="degree"
												id="gridRadios2" value="1"> <label
												class="form-check-label" for="gridRadios2"> 2차 </label>
										</div>
									</div>
								</fieldset>
						</div>
					</div>
					<div class="card">
						<div class="card-body">
							<div class="icon">
								<h5 class="card-title fw-bold">
									<i class="bi bi-card-list mx-3"></i>평가 항목
								</h5>
							</div>
							<div id="box">
								<div class="form-group row inputWrapper pt-3">
									<div class="col">
										<div class="input-group">
											<span class="input-group-text"></span>
											<textarea id="evaItem" class="form-control evaItem"
												aria-label="With textarea"></textarea>
										</div>
									</div>
									<div class="col-sm-1 pt-2 mr-2">
										<input type="text" id="evaScore"
											class="form-control evaScore " style="width: 59px;">
									</div>
									<div class="col-sm-1 pt-2 ml-2" style="width:10%">
										<input type="button" value="+" class="btn btn-outline-primary"
											onclick="add_textbox()">
									</div>
								</div>
							</div>
							<!--  
							<div id="box">
								<div class="inputWrapper">
									<input id="evaItem" class="col-sm-5 evaItem" type="text"><input
										id="evaScore" class="col-sm-2 evaScore" type="text"><input
										type="button" value="+" class="btn btn-outline-primary"
										onclick="add_textbox()">
								</div>
							</div>
							-->
							<div class="form-group row">
								<div class="col">
									<div class="input-group">
										<span class="input-group-text">항목 수</span> <input type="text"
											id="itemUploadCount" value="1" class="form-control"
											style="width: 80px;">
									</div>
								</div>
								<div class="col">
									<div class="input-group">
										<span class="input-group-text">총점:</span> <input type="text"
											id="evaScoreSum" class="form-control" style="width: 80px;">
									</div>
								</div>
							</div>
							<!--  
							<div class="row mb-3 p-4 justify-content-center">
								<label class="col-sm-2 col-form-label fw-bold">항목 수:</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="itemUploadCount"
										value="1">
								</div>
							</div>
							<div class="row mb-3 p-4 justify-content-center">
								<label class="col-sm-2 col-form-label fw-bold">총점:</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="evaScoreSum">
								</div>
							</div>
-->
							<div class="row mb-3 p-4 justify-content-center">
								<label for="inputPassword"
									class="col-sm-2 col-form-label fw-bold">종합의견</label>
								<div class="col-sm-10">
									<textarea class="form-control" style="height: 100px"></textarea>
								</div>
							</div>
						</div>
					</div>
					<div class="card">
						<div class="card-body">
							<div class="icon">
								<h5 class="card-title fw-bold">
									<i class="bi bi-pencil-square mx-3"></i>평가자 설정
								</h5>
							</div>

							<table class="table table-hover">
								<thead>
									<tr>
										<th scope="col">번호</th>
										<th scope="col">아이디</th>
										<th scope="col">권한 설정</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${raterList}" var="raterVO" varStatus="var">
										<tr>
											<c:if test="${pageMaker.cri.page == 1 }">
												<td>${var.count }</td>
											</c:if>
											<c:if test="${pageMaker.cri.page != 1 }">
												<td>${var.count + ((pageMaker.cri.page-1)*10) }</td>
											</c:if>
											<td>${raterVO.raterId}</a></td>
											<td><div class="form-check">
													<input class="form-check-input raterList" type="checkbox"
														id="gridCheck1" value="${raterVO.raterId}">
												</div></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>

							<!-- Pagination with icons -->
							<nav aria-label="Page navigation example">
								<ul class="pagination">
									<c:if test="${pageMaker.prev}">
										<li class="page-item"><a class="page-link"
											href="list${pageMaker.makeSearch(pageMaker.startPage - 1) }"
											aria-label="Previous"><span aria-hidden="true">&raquo;</span>
										</a></li>
									</c:if>
									<c:forEach begin="${pageMaker.startPage }"
										end="${pageMaker.endPage }" var="idx">
										<li class="page-item"
											<c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
											<a class="page-link" href="list${pageMaker.makeSearch(idx)}">${idx}</a>
										</li>
									</c:forEach>
									<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
										<li class="page-item"><a class="page-link"
											aria-label="Next"
											href="list${pageMaker.makeSearch(pageMaker.endPage +1) }"><span
												aria-hidden="true">&raquo;</span></a></li>
									</c:if>

								</ul>
							</nav>
							<!-- End Pagination with icons -->
							<div class="row mb-3">
								<label class="col-sm-2 col-form-label">등록하기</label>
								<div class="col-sm-10">
									<button type="button" class="btn btn-outline-danger">취소</button>
									<button type="submit" id="btn_submit"
										class="btn btn-outline-success">등록</button>
								</div>
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

const add_textbox = () => {
	var uploaded = $("#itemUploadCount").val();
    const box = document.getElementById("box");
    const newP = document.createElement('p');
    newP.innerHTML = "<div class='form-group row inputWrapper pt-3'><div class='col'><div class='input-group'><span class='input-group-text'></span><textarea id='evaItem' class='form-control evaItem aria-label='With textarea'></textarea></div></div><div class='col-sm-1 pt-2 mr-2'><input type='text' id='evaScore' class='form-control evaScore' style='width: 59px;''></div><div class='col-sm-1 pt-2 ml-2'><input type='button' id='itemBtn' class='btn btn-outline-danger removeBtn' value='-' onclick='remove(this)'></div></div>";                                     
    box.appendChild(newP);


    uploaded++;
	$("#itemUploadCount").attr("value", uploaded);
	console.log(uploaded);
	
}
const remove = (obj) => {
	var uploaded = $("#itemUploadCount").val();
    document.getElementById('box').removeChild(obj.parentNode);
    uploaded--;
	$("#itemUploadCount").attr("value", uploaded);
	console.log(uploaded);
    updateResult();
}

const scoreContainer = document.getElementById("box");
const resultElement = document.getElementById("evaScoreSum");

scoreContainer.addEventListener("input", function() {
    const evaScores = scoreContainer.querySelectorAll(".evaScore");
    let total = 0;

    evaScores.forEach(function(input) {
        const inputValue = parseFloat(input.value);
        if (!isNaN(inputValue)) {
            total += inputValue;
        }
    });

    $("#evaScoreSum").attr("value", total);
});


scoreContainer.addEventListener("input", updateResult);
scoreContainer.addEventListener("click", function(event) {
    if (event.target.classList.contains("removeBtn")) {
        const inputWrapper = event.target.closest(".inputWrapper");
        const inputValue = parseFloat(inputWrapper.querySelector(".evaScore").value);

        if (!isNaN(inputValue)) {
            const total = parseFloat(resultElement.textContent.split(":")[1].trim());
            total -= inputValue;
            $("#evaScoreSum").attr("value", total);
            inputWrapper.remove();
        }
    }
});

function updateResult() {
    const evaScores = scoreContainer.querySelectorAll(".evaScore");
    let total = 0;

    evaScores.forEach(function(input) {
        const inputValue = parseFloat(input.value);
        if (!isNaN(inputValue)) {
            total += inputValue;
        }
    });

    $("#evaScoreSum").attr("value", total);
}
	// 시작일 날짜형으로 변환
	$('#startDate').change(function() {
		var sd = new Date($('#startDate').val());
		console.log(sd);
		$('input[name=evaStartDate]').val(sd);
	})
	// 마감일 날짜형으로 변환
	$('#endDate').change(function() {
		var ed = new Date($('#endDate').val());
		console.log(ed);
		$('input[name=evaEndDate]').val(ed);
	})
	
</script>

<script>
	$(document).ready(function() {
		$(".btn-outline-danger").on("click", function() {
			self.location = "/mng/evaList";
		});
	});
</script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script type="text/javascript" src="/resources/upload.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>

<script>
	$(document).ready(function() {
					var formObj = $("form[role='form']");
					
					formObj.submit(function(event) {
					event.preventDefault();
									//유효성 검사
									
									var that = $(this);
									var str = "";
									
									$('.evaItem').each(function(index, item){
							            var text = $(item).val();
							            str += "<input type='hidden' name='evaItem'"+ " value='"+text+ "'> ";
							            
							      });
									
									that.append(str);
									
									var str = "";
									$('.evaScore').each(function(index, item){
							            var text = $(item).val();
							            str += "<input type='hidden' name='evaScore'"+ " value='"+text+ "'> ";
							            
							      });
									
									that.append(str);
									
									//  평가자 추가 
									
									var str = "";
									
									$('.raterList').each(function(index, item){
										if ($(this).is(":checked")) {
											var text = $(this).val();
								            str += "<input type='hidden' name='raterList'"+ " value='"+text+ "'> ";
								            alert("rater" + text);
								        } 

							      });
									
									that.append(str);
									
									that.get(0).submit();
										
					});

						$(".btn-outline-danger")
								.on(
										"click",
										function() {
											self.location = "evaList&page=${cri.page}&perPageNum=${cri.perPageNum}"
													+ "&searchType=${cri.searchType}&keyword=${cri.keyword}";
										});

	});
</script>
