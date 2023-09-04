<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="include/header.jsp" />
<head>
<style>
.box{
text-align: left;
padding: 60px 40px;
    box-shadow: 0 3px 20px -2px rgba(20, 45, 100, 0.1);
    background: #f8f9fa;
    height: 100%;
    border-top: 4px solid #f8f9fa;
    border-radius: 5px;
    width: 80%;
}
</style>
</head>
  <!-- ======= Hero Section ======= -->
  <section id="hero" class="d-flex align-items-center">

    <div class="container">
      <div class="row">
        <div class="col-lg-6 d-flex flex-column justify-content-center pt-4 pt-lg-0 order-2 order-lg-1" data-aos="fade-up" data-aos-delay="200">
          <h1>Better Solutions For Your Business</h1>
          <h2>We are Applicant Tracking System</h2>
          <div class="d-flex justify-content-center justify-content-lg-start">
            <a href="#about" class="btn-get-started scrollto">Get Started</a>
            <a href="https://www.youtube.com/watch?v=jDDaplaOz7Q" class="glightbox btn-watch-video"><i class="bi bi-play-circle"></i><span>Watch Video</span></a>
          </div>
        </div>
        
        
        
        
        
        <div class="col-lg-6 order-1 order-lg-2 hero-img" data-aos="zoom-in" data-aos-delay="200">
        <!-- Slides with indicators -->
              <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
                <div class="carousel-indicators">
                  <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                  <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
                  <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
                </div>
                <div class="carousel-inner">
                  <div class="carousel-item active">
                    <img src="/resources/user/assets/img/hero-img.png" class="img-fluid animated" alt="">
                  </div>
                  <div class="carousel-item">
                    <img src="resources/user/assets/img/laptop.png" class="img-fluid animated" alt="">
                  </div>
                  <div class="carousel-item">
                    <img src="resources/user/assets/img/evaluation.png" class="img-fluid animated" alt="">
                  </div>
                </div>

          <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
                  <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                  <span class="visually-hidden">Previous</span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
                  <span class="carousel-control-next-icon" aria-hidden="true"></span>
                  <span class="visually-hidden">Next</span>
                </button>
                </div><!-- End Slides with indicators -->
        </div>
      </div>
    </div>

  </section><!-- End Hero -->

  <main id="main">

    <!-- ======= Clients Section ======= -->
    <section id="clients" class="clients section-bg">
      <div class="container">

        <div class="row" data-aos="zoom-in">

          <div class="col-lg-2 col-md-4 col-6 d-flex align-items-center justify-content-center">
            <img src="/resources/user/assets/img/clients/client-1.png" class="img-fluid" alt="">
          </div>

          <div class="col-lg-2 col-md-4 col-6 d-flex align-items-center justify-content-center">
            <img src="/resources/user/assets/img/clients/client-2.png" class="img-fluid" alt="">
          </div>

          <div class="col-lg-2 col-md-4 col-6 d-flex align-items-center justify-content-center">
            <img src="/resources/user/assets/img/clients/client-3.png" class="img-fluid" alt="">
          </div>

          <div class="col-lg-2 col-md-4 col-6 d-flex align-items-center justify-content-center">
            <img src="/resources/user/assets/img/clients/client-4.png" class="img-fluid" alt="">
          </div>

          <div class="col-lg-2 col-md-4 col-6 d-flex align-items-center justify-content-center">
            <img src="/resources/user/assets/img/clients/client-5.png" class="img-fluid" alt="">
          </div>

          <div class="col-lg-2 col-md-4 col-6 d-flex align-items-center justify-content-center">
            <img src="/resources/user/assets/img/clients/client-6.png" class="img-fluid" alt="">
          </div>

        </div>

      </div>
    </section><!-- End Cliens Section -->

    <!-- ======= About Us Section ======= -->
    <section id="about" class="about">
      <div class="container" data-aos="fade-up">

        <div class="section-title">
          <h2>About ATS</h2>
        </div>

        <div class="row content">
          <div class="col-lg-6">
            <p>
				
            </p>
            <ul>
              <li><i class="ri-check-double-line"></i> ATS란, <strong>A</strong>pplication <strong>T</strong>racking <strong>S</strong>ystem의 약자로 사용자와 기업간 지원서 제출 및 평가 기능을 수행합니다.
              <br>ATS, Application Tracking System, performs application submission and evaluation functions between users and companies.</li>
              <li><i class="ri-check-double-line"></i> ATS는 기존의 고착화된 평가 절차보다 쉽고 신속하게 진행해 빠르고 정확한 지원 및 평가를 경험하실 수 있습니다.
              <br>ATS will make you to experience faster and more accurate support and assessment by easier and faster assessment procedures than traditional.</li>              
            </ul>
          </div>
          <div class="col-lg-6 pt-4 pt-lg-0">
            <p>
              Ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate
              velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in
              culpa qui officia deserunt mollit anim id est laborum.
            </p>
            <a href="#" class="btn-learn-more">Learn More</a>
          </div>
        </div>

      </div>
    </section><!-- End About Us Section -->
 
 
 <section id="ann" class="about">
     <div class="container" data-aos="fade-up">
     <div class="section-title">
          <h2>채용공고</h2>
          <div class="box">
          <table class="table table-hover">
								<thead>
									<tr>
										<th scope="col">번호</th>
										<th scope="col">공고명</th>
										<th scope="col">모집 분야</th>
										<th scope="col">모집 기간</th>
										<th scope="col">모집 여부</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${list}" var="annVO" varStatus="var">
										<tr>
											<c:if test="${pageMaker.cri.page == 1 }">
												<td>${var.count }</td>
											</c:if>
											<c:if test="${pageMaker.cri.page != 1 }">
												<td>${var.count + ((pageMaker.cri.page-1)*5) }</td>
											</c:if>
											<td><a
												href='/annReadMainPage${pageMaker.makeSearch(pageMaker.cri.page) }&annNum=${annVO.annNum}'>
													${annVO.annName} </a></td>
													<td>${annVO.annField}</td>
											<td><fmt:formatDate pattern="yyyy-MM-dd"
													value="${annVO.annStartDate}" />
													-
											<fmt:formatDate pattern="yyyy-MM-dd"
													value="${annVO.annEndDate}" /></td>
											<td><c:if test="${0 eq annVO.deadline}">
													<div class="col-lg-9 col-md-8">모집중</div>
												</c:if> <c:if test="${1 eq annVO.deadline}">
													<div class="col-lg-9 col-md-8">모집 마감</div>
												</c:if></td>
											
										</tr>

									</c:forEach>
								</tbody>
							</table>

			</div>
          </div>
     </div>
     
     </section>
     
     
<section id="company" class="about">
      <div class="container" data-aos="fade-up">

        <div class="section-title">
          <h2>Company</h2>
        </div>

<div class="row content">
          <div class="col-lg-3"> 
            <div class="row g-0">
              <div class="col-md-4">
              <a href="https://www.navercorp.com/">
                <img src="resources/admin/assets/img/naver.jpg" class="img-fluid rounded-start" alt="/NAVER">
                </a>
              </div>
              <div class="col-md-8">
                <div class="card-body">
                  <a href="https://www.navercorp.com/"><h5 class="card-title">NAVER</h5></a>
                  <p class="card-text">NAVER Corp.</p>
                  <p class="card-text">경기도 성남시 분당구 정자일로 95 (정자동, 1784)</p>
                </div>
              </div>
            </div>
          </div>
          
          <div class="col-lg-3">
            <div class="row g-0">
              <div class="col-md-4">
              <a href="https://www.kakaocorp.com/">
                <img src="resources/admin/assets/img/kakao.png" class="img-fluid rounded-start" alt="/KAKAO">
                </a>
              </div>
              <div class="col-md-8">
                <div class="card-body">
                  <a href="https://www.kakaocorp.com/"><h5 class="card-title">KAKAO</h5></a>
                  <p class="card-text">kakao Corp.</p>
                  <p class="card-text">	제주특별자치도 제주시 첨단로 242 (영평동)</p>
                </div>
              </div>
          </div>
      </div>
      
      <div class="col-lg-3">
            <div class="row g-0">
              <div class="col-md-4">
              <a href="https://www.linecorp.com/">
                <img src="resources/admin/assets/img/line.png" class="img-fluid rounded-start" alt="/LINE">
                </a>
              </div>
              <div class="col-md-8">
                <div class="card-body">
                  <a href="https://www.linecorp.com/"><h5 class="card-title">LINE</h5></a>
                  <p class="card-text">Line Corp.</p>
                  <p class="card-text">	경기도 성남시 분당구 분당내곡로 117그레이츠판교 6층 라인비즈플러스</p>
                </div>
              </div>
          </div>
      </div>
      
      <div class="col-lg-3">
            <div class="row g-0">
              <div class="col-md-4">
              <a href="https://about.google/">
                <img src="resources/admin/assets/img/google.png" class="img-fluid rounded-start" alt="/GOOGLE">
                </a>
              </div>
              <div class="col-md-8">
                <div class="card-body">
                  <a href="https://about.google/"><h5 class="card-title">GOOGLE</h5></a>
                  <p class="card-text">Google Corp.</p>
                  <p class="card-text">	1600 Amphitheatre Parkway in Mountain View, California</p>
                </div>
              </div>
              
          </div>
          
          <a href="#" class="btn-learn-more" style= "float: right">Learn More</a>
         
      </div>
      </div>
      
              
      
      
    </section><!-- End COMPANY Section -->
    
    <section id="company" class="about">
      <div class="container" data-aos="fade-up">

        <div class="section-title">
          <h2>Company</h2>
          <img src="resources/admin/assets/img/company_list.png" class="img-fluid rounded-start" alt="/company_list">
        </div>
        </div>
     </section>
     
    
     
     <section id="contact" class="about">
      <div class="container" data-aos="fade-up">
      <div class="section-title">
          <h2>Contact Us</h2>

          <div class="row">
			<div class="col-lg-3">
              <div class="info-box card">
                <h3>F.A.Q</h3>
                <a href="/faq"><i class="bi bi-question-circle" style="font-size: 100px"></i></a>
            </div>
            </div>
            
			<div class="col-lg-3">
              <div class="info-box card">
                
                <h3>Address</h3>
                <i class="bi bi-geo-alt"></i>
                <div style="color: #6c757d">
                <p>대전광역시 대덕구 한남로 70(대덕구 오정동)</p>
                <p>70 Hannam-ro, Daedeok-gu, Daejeon, Republic of Korea (34430)</p>
              </div>
              </div>
            </div>
            
            <div class="col-lg-3">
              <div class="info-box card">
                
                <h3>Call Us</h3>
                <i class="bi bi-telephone"></i>
                <div style="color: #6c757d">
                <p>042-629-7114</p>
                </div>
              </div>
            </div>
            
            <div class="col-lg-3">
              <div class="info-box card">
                
                <h3>Email</h3>
                <i class="bi bi-envelope"></i>
                <div style="color: #6c757d">
                <p>ATS@ats.com</p>
                </div>
            </div>
            </div>
            
        </div>
        </div>
</div>
</section>
    
  
  </main><!-- End #main -->

<jsp:include page="include/footer.jsp" />