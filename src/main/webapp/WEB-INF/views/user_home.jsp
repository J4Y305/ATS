<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="include/user_header.jsp" />
 <main id="main" class="main">

    <div class="pagetitle">
      <h1>Dashboard</h1>
      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="index.html">Home</a></li>
          <li class="breadcrumb-item active">Dashboard</li>
        </ol>
      </nav>
    </div><!-- End Page Title -->

    <section class="section dashboard">
      <div class="row">

        <!-- Left side columns -->
       <div class="col-8">
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
                  <h5 class="card-title">Application</h5>

                  <div class="d-flex align-items-center">
                    <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                      <i class="bi bi-file-earmark-text"></i>
                    </div>
                    <div class="ps-3">
                      <h6>6</h6>
                       <a href=""><span class="text-primary small pt-2 ps-1">View
                       <i class="bi bi-arrow-right"></i></span></a>

                    </div>
                  </div>
                </div>

              </div>
            </div><!-- End Sales Card -->

            <!-- Revenue Card -->
            <div class="col-xxl-4 col-md-6">
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
                  <h5 class="card-title">Interested Recruit</h5>

                  <div class="d-flex align-items-center">
                    <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                      <i class="bi bi-star"></i>
                    </div>
                    <div class="ps-3">
                      <h6>7</h6>
                      <a href=""><span class="text-primary small pt-2 ps-1">View
                       <i class="bi bi-arrow-right"></i></span></a>

                    </div>
                  </div>
                </div>

              </div>
            </div><!-- End Revenue Card -->

            <!-- Customers Card -->
            <div class="col-xxl-4 col-xl-12">

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
                  <h5 class="card-title">Recruits for You</h5>

                  <div class="d-flex align-items-center">
                    <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                      <i class="bi bi-newspaper"></i>
                    </div>
                    <div class="ps-3">
                      <h6>1,094</h6>
                      <a href=""><span class="text-primary small pt-2 ps-1">View
                       <i class="bi bi-arrow-right"></i></span></a>

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
                  <h5 class="card-title">Find your Business</h5>
                  
                  <style>
                  .card-container {
    display: grid;
    grid-template-columns: repeat(2, 1fr);
    gap: 20px;
    max-width: 800px;
    padding: 20px;
}
.card{
}

                  </style>
                  
                  
				<div class="card-container">
                  
                  <div class="card" style="background-color: #cfe2ff; width: 199px; height: 129px; display: flex; justify-content: center; align-items: center;">
                  	<div class="card-body text-center d-flex flex-column justify-content-center align-items-center" style="width: 199px; height: 129px;">
                  		<span class="fw-bold">IT·웹·통신<br> 연봉 1위 기업 보러가요.</span>
                  		<p style="text-decoration: underline">연봉정보 보러가기</p>
                  	</div>
                  
                  </div>
                  
                  <div class="card" style="background-color: #cfe2ff; width: 199px; height: 129px; display: flex; justify-content: center; align-items: center;">
                  	<div class="card-body text-center d-flex flex-column justify-content-center align-items-center" style="width: 199px; height: 129px;">
                  		<span class="fw-bold">구직자들의 고민과<br> 재직자들의 답변은?</span>
                  		<p style="text-decoration: underline">커뮤니티 확인하기</p> 
                  	</div>
                  
                  </div>
                  
                  <div class="card" style="background-color: #cfe2ff; width: 199px; height: 129px; display: flex; justify-content: center; align-items: center;">
                  	<div class="card-body text-center d-flex flex-column justify-content-center align-items-center" style="width: 199px; height: 129px;">
                  		<span class="fw-bold">이 기업 장점만 모아!<br> 큐레이션 보러가요.</span>
                  		<p style="text-decoration: underline">기업스토리 보러가기</p>
                  	</div>
                  
                  </div>
                  
                  <div class="card" style="background-color: #cfe2ff; width: 199px; height: 129px; align-items: center; display: flex; justify-content: center; align-items: center;">
                  	<div class="card-body text-center d-flex flex-column justify-content-center align-items-center" style="width: 199px; height: 129px;">
                  		<span class="fw-bold ">나의 이력서는 어느정도?</span>
                  		<p style="text-decoration: underline">AI이력서 평가하기</p>
                  	</div>
                  
                  </div>
                  </div>
                  
                </div>

              </div>
            </div><!-- End Top Selling -->

          </div>
        </div><!-- End Left side columns -->


        <!-- Right side columns -->
        <div class="col-lg-4">

          <!-- Recent Activity -->
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

            <div class="card-body">
              <h5 class="card-title">Pre-closing Recruit</h5>

              <div class="activity">

                <div class="activity-item d-flex">
                  <div class="activite-label">D-12</div>
                  <i class='bi bi-circle-fill activity-badge text-success align-self-start'></i>
                  <div class="activity-content">
                  <span class="fw-bold text-dark">카카오</span>
                    <p>신입 사원 모집</p>
                  </div>
                </div><!-- End activity item-->
                
                <div class="activity-item d-flex">
                  <div class="activite-label">D-5</div>
                  <i class='bi bi-circle-fill activity-badge text-danger align-self-start'></i>
                  <div class="activity-content">
                  <span class="fw-bold text-dark">네이버</span>
                    <p>부문별 신입/경력 모집</p>
                  </div>
                </div><!-- End activity item-->
                
                <div class="activity-item d-flex">
                  <div class="activite-label">D-2</div>
                  <i class='bi bi-circle-fill activity-badge text-primary align-self-start'></i>
                  <div class="activity-content">
                  <span class="fw-bold text-dark">과학기술정보통신부</span>
                    <p>디지털인재얼라이언스 채용</p>
                  </div>
                </div><!-- End activity item--> 

                <div class="activity-item d-flex">
                  <div class="text-danger activite-label">오늘마감</div>
                  <i class='bi bi-circle-fill activity-badge text-info align-self-start'></i>
                  <div class="activity-content">
                  <span class="fw-bold text-dark">LG</span>
                    <p>대전 콘텐츠 기업 온라인 채용</p>
                  </div>
                </div><!-- End activity item-->
                
                <div class="activity-item d-flex">
                  <div class="text-danger activite-label">16:28</div>
                  <i class='bi bi-circle-fill activity-badge text-warning align-self-start'></i>
                  <div class="activity-content">
                  <span class="fw-bold text-dark">COUPANG</span>
                    <p>하반기 신입/경력 공개 채용</p>
                  </div>
                </div><!-- End activity item-->
                
              </div>

            </div>
          </div><!-- End Recent Activity -->
          




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
                  <p>Sit recusandae non aspernatur laboriosam. Quia enim eligendi sed ut harum...</p>
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