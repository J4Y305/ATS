<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="include/mng_header.jsp" />
 <main id="main" class="main">

    <div class="pagetitle">
      <h1>기업담당자</h1>
      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="/mng">Home</a></li>
          <li class="breadcrumb-item active">Manager</li>
        </ol>
      </nav>
    </div><!-- End Page Title -->

    <section class="section dashboard">
      <div class="row">

        <!-- Left side columns -->
       <div class="col-12">
          <div class="row">

            <!-- Sales Card -->
            <div class="col-xxl-4 col-md-6">
              <div class="card info-card sales-card">

                <div class="filter">
                  <a class="icon" href="#" data-bs-toggle="dropdown"><i class="bi bi-three-dots"></i></a>
                  <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
                    <li class="dropdown-header text-start">
                      <h6>Filter</h6>
                    </li>

                    <li><a class="dropdown-item" href="#">Today</a></li>
                    <li><a class="dropdown-item" href="#">This Month</a></li>
                    <li><a class="dropdown-item" href="#">This Year</a></li>
                  </ul>
                </div>

                <div class="card-body">
                  <h5 class="card-title">Posted Recruit</h5>

                  <div class="d-flex align-items-center">
                  <a href="/mng/annList">
                    <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                      <i class="bi bi-menu-button-wide"></i>
                    </div>
                    </a>
                    <div class="ps-3">
                      <h6>${postedAnnCount}<span> 개</span></h6>
                      

                    </div>
                  </div>
                </div>

              </div>
            </div><!-- End Sales Card -->

            <!-- Revenue Card -->
            <div class="col-xxl-4 col-md-6">
              <div class="card info-card customers-card">

                <div class="filter">
                  <a class="icon" href="#" data-bs-toggle="dropdown"><i class="bi bi-three-dots"></i></a>
                  <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
                    <li class="dropdown-header text-start">
                      <h6>Filter</h6>
                    </li>

                    <li><a class="dropdown-item" href="#">Today</a></li>
                    <li><a class="dropdown-item" href="#">This Month</a></li>
                    <li><a class="dropdown-item" href="#">This Year</a></li>
                  </ul>
                </div>

                <div class="card-body">
                  <h5 class="card-title">Closed Recruit</h5>

                  <div class="d-flex align-items-center">
                  <a href="/mng/annEndList">
                    <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                      <i class="bi bi-calendar-x"></i>
                    </div>
                    </a>
                    <div class="ps-3">
                      <h6>${closedAnnCount}<span> 개</span></h6>
                      

                    </div>
                  </div>
                </div>

              </div>
            </div><!-- End Revenue Card -->

            <!-- Customers Card -->
            <div class="col-xxl-4 col-xl-12">

              <div class="card info-card revenue-card">

                <div class="filter">
                  <a class="icon" href="#" data-bs-toggle="dropdown"><i class="bi bi-three-dots"></i></a>
                  <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
                    <li class="dropdown-header text-start">
                      <h6>Filter</h6>
                    </li>

                    <li><a class="dropdown-item" href="#">Today</a></li>
                    <li><a class="dropdown-item" href="#">This Month</a></li>
                    <li><a class="dropdown-item" href="#">This Year</a></li>
                  </ul>
                </div>

                <div class="card-body">
                  <h5 class="card-title">Rating</h5>

                  <div class="d-flex align-items-center">
                  <a href="/mng/evaList">
                    <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                      <i class="bi bi-clipboard-check"></i>
                    </div>
                    </a>
                    <div class="ps-3">
                      <h6>${evaCount}<span> 개</span></h6>

                    </div>
                  </div>

                </div>
              </div>

            </div><!-- End Customers Card -->

            <!-- Top Selling -->
            <div class="col-12">
              <div class="card top-selling overflow-auto">

                <div class="filter">
                  <a class="icon" href="#" data-bs-toggle="dropdown"><i class="bi bi-three-dots"></i></a>
                  <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
                    <li class="dropdown-header text-start">
                      <h6>Filter</h6>
                    </li>

                    <li><a class="dropdown-item" href="#">Today</a></li>
                    <li><a class="dropdown-item" href="#">This Month</a></li>
                    <li><a class="dropdown-item" href="#">This Year</a></li>
                  </ul>
                </div>

                <div class="card-body pb-0">
                <a href="mng/annIngList">
                  <h5 class="card-title">Ongoing Recruit</h5>
                </a>

				<div style="position: relative;">
                  <table class="table table-borderless">
                    <thead>
                      <tr>
                        <th scope="col">번호</th>
						<th scope="col">공고명</th>
						<th scope="col">접수 시작일</th>
						<th scope="col">접수 마감일</th>
						<th scope="col">마감 D-day</th>
						<th scope="col">작성자</th>
                      </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${list}" var="annVO" varStatus="var">
                    	<c:if test="${var.index < 6}">
							<tr>
								<c:if test="${pageMaker.cri.page == 1 }">
									<td>${var.count }</td>
								</c:if>
								<c:if test="${pageMaker.cri.page != 1 }">
									<td>${var.count + ((pageMaker.cri.page-1)*10) }</td>
								</c:if>
								<td><a
									href='/mng/annAppList${pageMaker.makeSearch(pageMaker.cri.page)}&annNum=${annVO.annNum}'>
										${annVO.annName} </a></td>
								<td><fmt:formatDate pattern="yyyy-MM-dd"
										value="${annVO.annStartDate}" /></td>
								<td><fmt:formatDate pattern="yyyy-MM-dd"
										value="${annVO.annEndDate}" /></td>
								<td class="dDayCell">${annVO.dDay}-day</td>
								<td>${annVO.mngId}</td>
							</tr>
							<div class="annEd">
								<input type=hidden value="${annVO.annEndDate}"
									name="annEndDate" class="annEndInput">
							</div>
						</c:if>
					</c:forEach>
                    </tbody>
                  </table>
                </div>

              </div>
            </div><!-- End Top Selling -->

          </div>
        </div><!-- End Left side columns -->


          <!-- News & Updates Traffic -->
          <div class="card">
            <div class="filter">
              <a class="icon" href="#" data-bs-toggle="dropdown"><i class="bi bi-three-dots"></i></a>
              <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
                <li class="dropdown-header text-start">
                  <h6>Filter</h6>
                </li>

                <li><a class="dropdown-item" href="#">Today</a></li>
                <li><a class="dropdown-item" href="#">This Month</a></li>
                <li><a class="dropdown-item" href="#">This Year</a></li>
              </ul>
            </div>

            <div class="card-body pb-0">
              <h5 class="card-title">News &amp; Updates <span>| Today</span></h5>

              <div class="news">
                <div class="post-item clearfix">
                  <img src="/resources/admin/assets/img/news-1.jpg" alt="">
                  <h4><a href="#">서비스 정기점검 안내 (9/2)</a></h4>
                  <p>Greeting ATS 서비스의 정기점검을 안내드립니다.</p>
                </div>

                <div class="post-item clearfix">
                  <img src="/resources/admin/assets/img/news-2.jpg" alt="">
                  <h4><a href="#">Quidem autem et impedit</a></h4>
                  <p>Illo nemo neque maiores vitae officiis cum eum turos elan dries werona nande...</p>
                </div>

                <div class="post-item clearfix">
                  <img src="/resources/admin/assets/img/news-3.jpg" alt="">
                  <h4><a href="#">Id quia et et ut maxime similique occaecati ut</a></h4>
                  <p>Fugiat voluptas vero eaque accusantium eos. Consequuntur sed ipsam et totam...</p>
                </div>

                <div class="post-item clearfix">
                  <img src="/resources/admin/assets/img/news-4.jpg" alt="">
                  <h4><a href="#">Laborum corporis quo dara net para</a></h4>
                  <p>Qui enim quia optio. Eligendi aut asperiores enim repellendusvel rerum cuder...</p>
                </div>

                <div class="post-item clearfix">
                  <img src="/resources/admin/assets/img/news-5.jpg" alt="">
                  <h4><a href="#">Et dolores corrupti quae illo quod dolor</a></h4>
                  <p>Odit ut eveniet modi reiciendis. Atque cupiditate libero beatae dignissimos eius...</p>
                </div>

              </div><!-- End sidebar recent posts-->

            </div>
          </div><!-- End News & Updates -->

        </div><!-- End Right side columns -->

      </div>
    </section>

  </main><!-- End #main -->

<jsp:include page="include/admin_footer.jsp" />

<script>
$(document).ready(function() {

	var formObj = $("form[role='form']");

	console.log(formObj);

	$(".btn-outline-primary").on("click", function() {
		formObj.attr("method", "get");
		formObj.attr("action", "/mng/annIngList");
		formObj.submit();
	});

});
</script>