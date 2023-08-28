<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="../include/rater_header.jsp" />
<style>
  .centered-card {
    display: flex;
    justify-content: center;
    align-items: center;
    height: 85vh; /* 이 부분은 필요한 높이로 조절해주세요 */
  }
</style>
<body>
	<main id="main" class="main">
	<div class="pagetitle">
		<h1>공고 평가</h1>
	</div>
	<!-- End Page Title -->

	<section class="section">
		<div class="row">
			<div class="col-lg-6">

				<div class="card">
					<div class="card-body">
						<h5 class="card-title">지원자</h5>
						<div class="row">
							<div class="col-lg-3 col-md-4 label ">이름:</div>
							<div class="col-lg-9 col-md-8">${userVO.userName}</div>
						</div>

						<div class="row">
							<div class="col-lg-3 col-md-4 label">접수번호:</div>
							<div class="col-lg-9 col-md-8">${appVO.appNum}</div>
						</div>

						<div class="row">
							<div class="col-lg-3 col-md-4 label">평가 차수</div>
							<div class="col-lg-9 col-md-8">${evaVO.degree}차</div>
						</div>

						<div class="row">
							<div class="col-lg-3 col-md-4 label">생년월일:</div>
							<div class="col-lg-9 col-md-8">${userVO.birthDay}</div>
						</div>

						<div class="row">
							<div class="col-lg-3 col-md-4 label">성별:</div>
							<div class="col-lg-9 col-md-8">
								<c:if test="${0 eq userVO.gender}">
									<div class="col-lg-9 col-md-8">남자</div>
								</c:if>
								<c:if test="${1 eq userVO.gender}">
									<div class="col-lg-9 col-md-8">여자</div>
								</c:if>
							</div>
						</div>

						<div class="row">
							<div class="col-lg-3 col-md-4 label">지원서 생성일:</div>
							<div class="col-lg-9 col-md-8">
								<fmt:formatDate pattern="yyyy-MM-dd" value="${appVO.appRegDate}" />
							</div>
						</div>

					</div>
				</div>
			</div>
		</div>

		<div class="card">
			<div class="card-body">
				<h5 class="card-title">비고</h5>
				${appVO.etc}
			</div>
		</div>

		<div class="card">
			<div class="card-body">
				<h5 class="card-title">지원서</h5>
				<iframe width="100%" height="600" src="./compressed.tracemonkey-pldi-09.pdf"></iframe>
			</div>
		</div>

	<div class="centered-card">
		<div class="card" style="width: 70%">
			<div class="card-body">
				<h5 class="card-title">평가 항목</h5>
				<form id="evaScoreForm" method="POST">
					<input type='hidden' name='page' value="${cri.page}"> 
					<input type='hidden' name='perPageNum' value="${cri.perPageNum}">
					<input type='hidden' name='searchType' value="${cri.searchType}">
					<input type='hidden' name='keyword' value="${cri.keyword}">
					<input type="hidden" name="evaNum" value="${evaVO.evaNum}">
					<input type="hidden" name="annNum" value="${annVO.annNum}">

					<table class="table table-hover">
						<thead>
							<tr>
								<th scope="col">번호</th>
								<th scope="col">평가항목</th>
								<th scope="col">점수</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${list}" var="evaItemVO" varStatus="var">
							
							<input type="hidden" name="evaItemNum" value="${evaItemVO.evaItemNum}"> 
								<tr>
									<th scope="row">${var.count}</th>
									<td>${evaItemVO.evaPlot}</td>
									<td>
									<input type="text" id="evaDetailScore${var.index}" name="evaDetailScore" class="form-control eva-score-input" style="width: 10%" data-index="${var.index}"></td>
								</tr>
							</c:forEach>

							<td></td>
							<th>종합점수</th>
							<td><input type="text" id="evaScoreSum"  name="scoreSum" class="form-control"
								style="width: 15%" readonly="readonly" value="0"></td>

						</tbody>
					</table>
					<div class="card">
						<div class="card-body">
							<h5 class="card-title">종합 의견</h5>
							<textarea id="scoreComment" name="scoreComment" class="form-control" rows="6"></textarea>
						</div>
					</div>
					<div style="display: flex; justify-content: center;">
					<button type="submit" class="btn btn-primary" id="submitBtn">평가 완료</button>
					</div>
				</form>
			</div>
		</div>
	</div>


		<!-- /.box-body -->

		<div class="box-footer"></div>

	</section>


	</main>
	<!-- End #main -->
	<script>
    const evaDetailScoreInputs = document.querySelectorAll('.eva-score-input');
    const evaScoreSumInput = document.getElementById('evaScoreSum');

    evaDetailScoreInputs.forEach(input => {
        input.addEventListener('input', updateTotalScore);
    });

    function updateTotalScore() {
        let totalScore = 0;
        evaDetailScoreInputs.forEach(input => {
            const score = parseFloat(input.value) || 0; // Convert to float, or 0 if not a valid number
            totalScore += score;
        });
        evaScoreSumInput.value = totalScore;
    }

    function onSubmitForm() {
        // You can add additional validation or logic here before submitting the form
    }
</script>
	<script>
		$(document).ready(function() {

			var formObj = $("form[role='form']");

			console.log(formObj);
			
			 $(".btn-primary").on("click", function() {
				formObj.attr("method", "get");
				formObj.attr("action", "/eva/evaPage");
				formObj.submit();
			}); 

		});
	</script>
	<script>
    function onSubmitForm() {
        // 기본 폼 제출 동작을 막습니다.
        event.preventDefault();

        // 평가 점수와 기타 데이터를 수집합니다.
        const formData = {
            evaNum: document.querySelector('input[name="evaNum"]').value,
            annNum: document.querySelector('input[name="annNum"]').value,
            scores: [],
            scoreSum: document.getElementById('evaScoreSum').value,
            comment: document.getElementById('scoreComment').value
            
        };

        // 각 입력 필드에서 점수를 수집합니다.
        evaDetailScoreInputs.forEach(input => {
            formData.scores.push({
                evaItemNum: input.getAttribute('data-index'),
                score: input.value
            });
        });
        
        evaDetailScoreInputs.forEach(input => {
            formData.scores.push({
                evaItemNum: input.getAttribute('data-index'),
                score: input.value
            });
        });

        // AJAX를 사용하여 데이터를 서버로 전송합니다.
        $.ajax({
            url: '/eva/evaRegister', // 실제 서버 엔드포인트로 대체해주세요
            type: 'POST',
            data: JSON.stringify(formData),
            contentType: 'application/json',
            success: function(response) {
                // 성공 시 처리 (예: 성공 메시지 표시)
                console.log('평가 점수가 성공적으로 제출되었습니다');
            },
            error: function(error) {
                // 오류 시 처리 (예: 오류 메시지 표시)
                console.error('평가 점수 제출 중 오류 발생', error);
            }
        });
    }
</script>
	


	<jsp:include page="../include/admin_footer.jsp" />

</body>

</html>