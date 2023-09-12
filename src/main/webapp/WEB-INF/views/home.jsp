<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="include/header.jsp" />
<head>
<style>
.img-fluid {
	width: -webikt-fill-available;
}
</style>
</head>
<!-- ======= Hero Section ======= -->
<section id="hero" class="d-flex align-items-center">

	<div class="container">
		<div class="row">
			<div
				class="col-lg-6 d-flex flex-column justify-content-center pt-4 pt-lg-0 order-2 order-lg-1"
				data-aos="fade-up" data-aos-delay="200">
				<h1>Better Solutions For Your Business</h1>
				<h2>We are Applicant Tracking System</h2>
				<div class="d-flex justify-content-center justify-content-lg-start">
					<a href="#about" class="btn-get-started scrollto">Get Started</a> <a
						href="https://www.youtube.com/watch?v=jDDaplaOz7Q"
						class="glightbox btn-watch-video"><i class="bi bi-play-circle"></i><span>Watch
							Video</span></a>
				</div>
			</div>





			<div class="col-lg-6 order-1 order-lg-2 hero-img" data-aos="zoom-in"
				data-aos-delay="200">
				<!-- Slides with indicators -->
				<div id="carouselExampleIndicators" class="carousel slide"
					data-bs-ride="carousel">
					<div class="carousel-indicators">
						<button type="button" data-bs-target="#carouselExampleIndicators"
							data-bs-slide-to="0" class="active" aria-current="true"
							aria-label="Slide 1"></button>
						<button type="button" data-bs-target="#carouselExampleIndicators"
							data-bs-slide-to="1" aria-label="Slide 2"></button>
						<button type="button" data-bs-target="#carouselExampleIndicators"
							data-bs-slide-to="2" aria-label="Slide 3"></button>
					</div>
					<div class="carousel-inner">
						<div class="carousel-item active">
							<img src="/resources/user/assets/img/hero-img.png"
								class="img-fluid animated" alt="">
						</div>
						<div class="carousel-item">
							<img src="resources/user/assets/img/laptop.png"
								class="img-fluid animated" alt="">
						</div>
						<div class="carousel-item">
							<img src="resources/user/assets/img/evaluation.png"
								class="img-fluid animated" alt="">
						</div>
					</div>

					<button class="carousel-control-prev" type="button"
						data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
						<span class="carousel-control-prev-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Previous</span>
					</button>
					<button class="carousel-control-next" type="button"
						data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
						<span class="carousel-control-next-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Next</span>
					</button>
				</div>
				<!-- End Slides with indicators -->
			</div>
		</div>
	</div>

</section>
<!-- End Hero -->

<main id="main"> <!-- ======= Clients Section ======= -->
<section id="clients" class="clients section-bg">
	<div class="container">

		<div class="row" data-aos="zoom-in">

			<div
				class="col-lg-2 col-md-4 col-6 d-flex align-items-center justify-content-center">
				<img src="/resources/user/assets/img/clients/client-1.png"
					class="img-fluid" alt="">
			</div>

			<div
				class="col-lg-2 col-md-4 col-6 d-flex align-items-center justify-content-center">
				<img src="/resources/user/assets/img/clients/client-2.png"
					class="img-fluid" alt="">
			</div>

			<div
				class="col-lg-2 col-md-4 col-6 d-flex align-items-center justify-content-center">
				<img src="/resources/user/assets/img/clients/client-3.png"
					class="img-fluid" alt="">
			</div>

			<div
				class="col-lg-2 col-md-4 col-6 d-flex align-items-center justify-content-center">
				<img src="/resources/user/assets/img/clients/client-4.png"
					class="img-fluid" alt="">
			</div>

			<div
				class="col-lg-2 col-md-4 col-6 d-flex align-items-center justify-content-center">
				<img src="/resources/user/assets/img/clients/client-5.png"
					class="img-fluid" alt="">
			</div>

			<div
				class="col-lg-2 col-md-4 col-6 d-flex align-items-center justify-content-center">
				<img src="/resources/user/assets/img/clients/client-6.png"
					class="img-fluid" alt="">
			</div>

		</div>

	</div>
</section>
<!-- End Cliens Section --> <!-- ======= About Us Section ======= -->
<section id="about" class="about">
	<div class="container" data-aos="fade-up">

		<div class="section-title">
			<h2>About Greeting ATS</h2>
		</div>

		<div class="row content">
			<div class="col-lg-6">
				<ul>
					<li><i class="ri-check-double-line"></i> ATS란, <strong>A</strong>pplication
						<strong>T</strong>racking <strong>S</strong>ystem의 약자로 사용자와 기업간
						지원서 제출 및 평가 기능을 수행합니다. <br>ATS, Application Tracking System,
						performs application submission and evaluation functions between
						users and companies.</li>

				</ul>
			</div>
			<div class="col-lg-6 pt-4 pt-lg-0">
				<ul>
					<li><i class="ri-check-double-line"></i> ATS는 기존의 고착화된 평가 절차보다
						쉽고 신속하게 진행해 빠르고 정확한 지원 및 평가를 경험하실 수 있습니다. <br>ATS will make
						you to experience faster and more accurate support and assessment
						by easier and faster assessment procedures than traditional.</li>

				</ul>

			</div>
		</div>

	</div>
</section>
<!-- End About Us Section -->


<section id="ann" class="services section-bg">
	<div class="container" data-aos="fade-up">
		<div class="section-title">
			<h2>채용공고</h2>
		</div>


		<div class="row align-items-center justify-content-center">

			<c:forEach items="${list}" var="annVO" varStatus="var">
				<c:if test="${var.index < 4}">
					<div class="col-xl-3 col-md-6 d-flex align-items-stretch"
						data-aos="zoom-in" data-aos-delay="100">
						<div class="icon-box"
							style="width: -webkit-fill-available; height: -webkit-fill-available;">
							<div class="icon"
								style="width: -webkit-fill-available; height: -webkit-fill-available;">
								<i class="bx bxl-dribbble"></i>
							</div>
							<h4>
								<a
									href='/annReadMainPage${pageMaker.makeSearch(pageMaker.cri.page) }&annNum=${annVO.annNum}'>
									${annVO.annName}</a>
							</h4>

							<p>${annVO.annField}</p>
							<c:if test="${0 eq annVO.deadline}">
								<p class="text-success">모집중</p>
							</c:if>
							<c:if test="${1 eq annVO.deadline}">
								<p class="text-danger">모집 마감</p>
							</c:if>
							<div class="d-flex justify-content-end">

								<div class="ps-3">
									<a
										href='/annReadMainPage${pageMaker.makeSearch(pageMaker.cri.page) }&annNum=${annVO.annNum}'><i
										class="bi bi-file-earmark-text"></i><span
										class="text-primary small pt-2 ps-1">공고 보러가기 <i
											class="bi bi-arrow-right"></i></span></a>
								</div>
							</div>

						</div>

					</div>

				</c:if>
			</c:forEach>
		</div>

	</div>
	</div>

</section>


<section id="company" class="portfolio">
	<div class="container" data-aos="fade-up">

		<div class="section-title">
			<h2>Company</h2>
		</div>
		<div class="row portfolio-container" data-aos="fade-up"
			data-aos-delay="200">

			<div class="col-lg-4 col-md-6 portfolio-item filter-app">
				<div class="portfolio-img">
					<img src="resources/user/assets/img/portfolio/naver.png"
						class="img-fluid" alt="">
				</div>
				<div class="portfolio-info">
					<h4>NAVER</h4>
					<p>naver</p>
					<a href="assets/img/portfolio/portfolio-1.jpg"
						data-gallery="portfolioGallery"
						class="portfolio-lightbox preview-link" title="App 1"><i
						class="bx bx-plus"></i></a> <a href="portfolio-details.html"
						class="details-link" title="More Details"><i
						class="bx bx-link"></i></a>
				</div>
			</div>

			<div class="col-lg-4 col-md-6 portfolio-item filter-web">
				<div class="portfolio-img">
					<img src="resources/user/assets/img/portfolio/kakao.png"
						class="img-fluid" alt="">
				</div>
				<div class="portfolio-info">
					<h4>KAKAO</h4>
					<p>kakao</p>
					<a href="assets/img/portfolio/portfolio-2.jpg"
						data-gallery="portfolioGallery"
						class="portfolio-lightbox preview-link" title="Web 3"><i
						class="bx bx-plus"></i></a> <a href="portfolio-details.html"
						class="details-link" title="More Details"><i
						class="bx bx-link"></i></a>
				</div>
			</div>

			<div class="col-lg-4 col-md-6 portfolio-item filter-app">
				<div class="portfolio-img">
					<img src="resources/user/assets/img/portfolio/line.png"
						class="img-fluid" alt="">
				</div>
				<div class="portfolio-info">
					<h4>LINE</h4>
					<p>line</p>
					<a href="assets/img/portfolio/portfolio-3.jpg"
						data-gallery="portfolioGallery"
						class="portfolio-lightbox preview-link" title="App 2"><i
						class="bx bx-plus"></i></a> <a href="portfolio-details.html"
						class="details-link" title="More Details"><i
						class="bx bx-link"></i></a>
				</div>
			</div>

			<div class="col-lg-4 col-md-6 portfolio-item filter-card">
				<div class="portfolio-img">
					<img src="resources/user/assets/img/portfolio/google.png"
						class="img-fluid" alt="">
				</div>
				<div class="portfolio-info">
					<h4>GOOGLE</h4>
					<p>google</p>
					<a href="assets/img/portfolio/portfolio-4.jpg"
						data-gallery="portfolioGallery"
						class="portfolio-lightbox preview-link" title="Card 2"><i
						class="bx bx-plus"></i></a> <a href="portfolio-details.html"
						class="details-link" title="More Details"><i
						class="bx bx-link"></i></a>
				</div>
			</div>

			<div class="col-lg-4 col-md-6 portfolio-item filter-web ">
				<div class="portfolio-img">
					<img src="resources/user/assets/img/portfolio/plani.png"
						class="img-fluid" alt="">
				</div>
				<div class="portfolio-info">
					<h4>PLANI</h4>
					<p>plani</p>
					<a href="assets/img/portfolio/portfolio-5.jpg"
						data-gallery="portfolioGallery"
						class="portfolio-lightbox preview-link" title="Web 2"><i
						class="bx bx-plus"></i></a> <a href="portfolio-details.html"
						class="details-link" title="More Details"><i
						class="bx bx-link"></i></a>
				</div>
			</div>

			<div class="col-lg-4 col-md-6 portfolio-item filter-app">
				<div class="portfolio-img">
					<img src="resources/user/assets/img/portfolio/coupang.png"
						class="img-fluid" alt="">
				</div>
				<div class="portfolio-info">
					<h4>COUPANG</h4>
					<p>coupang</p>
					<a href="assets/img/portfolio/portfolio-6.jpg"
						data-gallery="portfolioGallery"
						class="portfolio-lightbox preview-link" title="App 3"><i
						class="bx bx-plus"></i></a> <a href="portfolio-details.html"
						class="details-link" title="More Details"><i
						class="bx bx-link"></i></a>
				</div>
			</div>

			<div class="col-lg-4 col-md-6 portfolio-item filter-card">
				<div class="portfolio-img">
					<img src="resources/user/assets/img/portfolio/amazon.png"
						class="img-fluid" alt="">
				</div>
				<div class="portfolio-info">
					<h4>AMAZON</h4>
					<p>amazon</p>
					<a href="assets/img/portfolio/portfolio-7.jpg"
						data-gallery="portfolioGallery"
						class="portfolio-lightbox preview-link" title="Card 1"><i
						class="bx bx-plus"></i></a> <a href="portfolio-details.html"
						class="details-link" title="More Details"><i
						class="bx bx-link"></i></a>
				</div>
			</div>

			<div class="col-lg-4 col-md-6 portfolio-item filter-card">
				<div class="portfolio-img">
					<img src="resources/user/assets/img/portfolio/microsoft.png"
						class="img-fluid" alt="">
				</div>
				<div class="portfolio-info">
					<h4>MICROSOFT</h4>
					<p>microsoft</p>
					<a href="assets/img/portfolio/portfolio-8.jpg"
						data-gallery="portfolioGallery"
						class="portfolio-lightbox preview-link" title="Card 3"><i
						class="bx bx-plus"></i></a> <a href="portfolio-details.html"
						class="details-link" title="More Details"><i
						class="bx bx-link"></i></a>
				</div>
			</div>

			<div class="col-lg-4 col-md-6 portfolio-item filter-web">
				<div class="portfolio-img">
					<img src="resources/user/assets/img/portfolio/dolby.png"
						class="img-fluid" alt="">
				</div>
				<div class="portfolio-info">
					<h4>DOLBY</h4>
					<p>dolby</p>
					<a href="assets/img/portfolio/portfolio-9.jpg"
						data-gallery="portfolioGallery"
						class="portfolio-lightbox preview-link" title="Web 3"><i
						class="bx bx-plus"></i></a> <a href="portfolio-details.html"
						class="details-link" title="More Details"><i
						class="bx bx-link"></i></a>
				</div>
			</div>

		</div>
</section>
<!-- End COMPANY Section --> <!-- <section id="team" class="team section-bg">
      <div class="container" data-aos="fade-up">

        <div class="section-title">
          <h2>Team</h2>
          <h5>.GIP</h5>
          <p>Get Into IT Pool</p>
        </div>

        <div class="row">

          <div class="col-lg-6" data-aos="zoom-in" data-aos-delay="100">
            <div class="member d-flex align-items-start">
              <div class="pic"><img src="resources/user/assets/img/team/WooJae.jpg" class="img-fluid" alt=""></div>
              <div class="member-info">
                <h4>정우제</h4>
                <span>팀장</span>
                <p>시스템 설계 및 DB 설계</p>
                <p>백엔드</p>
                <p>전체 프로젝트 관리</p>
              </div>
            </div>
          </div>

          <div class="col-lg-6 mt-4 mt-lg-0" data-aos="zoom-in" data-aos-delay="200">
            <div class="member d-flex align-items-start">
              <div class="pic"><img src="resources/user/assets/img/team/JaeHyun.jpg" class="img-fluid" alt=""></div>
              <div class="member-info">
                <h4>권재현</h4>
                <span>팀원</span>
                <p>백엔드</p>
                <p>프론트엔드</p>
                <p>전체 프로젝트 관리</p>
                
                
              </div>
            </div>
          </div>

          <div class="col-lg-6 mt-4" data-aos="zoom-in" data-aos-delay="300">
            <div class="member d-flex align-items-start">
              <div class="pic"><img src="resources/user/assets/img/team/JunSung.jpg" class="img-fluid" alt=""></div>
              <div class="member-info">
                <h4>최준성</h4>
                <span>팀원</span>
                <p>백엔드</p>
                <p>프론트엔드</p>
                
              </div>
            </div>
          </div>
          
          
        </div>

      </div>
    </section>
    End Team Section -->

<section id="faq" class="faq">
	<div class="container" data-aos="fade-up">

		<div class="section-title">
			<h2>FAQ</h2>
			<p>Frequently Asked Questions</p>
		</div>

		<div class="faq-list">
			<ul>
				<li data-aos="fade-up" data-aos-delay="100"><i
					class="bx bx-help-circle icon-help"></i> <a
					data-bs-toggle="collapse" class="collapse"
					data-bs-target="#faq-list-1">Greeting ATS를 통해 어떤 기능들이 있나요? <i
						class="bx bx-chevron-down icon-show"></i><i
						class="bx bx-chevron-up icon-close"></i></a>
					<div id="faq-list-1" class="collapse show"
						data-bs-parent=".faq-list">
						<p>채용 공고 관리, 지원서 관리, 지원자 평가 관리, 결과 관리 등 채용에 관련된 다양한 기능들이 있습니다.
						</p>
					</div></li>

				<li data-aos="fade-up" data-aos-delay="200"><i
					class="bx bx-help-circle icon-help"></i> <a
					data-bs-toggle="collapse" data-bs-target="#faq-list-2"
					class="collapsed">누가 이 서비스를 이용할 수 있나요? <i
						class="bx bx-chevron-down icon-show"></i><i
						class="bx bx-chevron-up icon-close"></i></a>
					<div id="faq-list-2" class="collapse" data-bs-parent=".faq-list">
						<p>채용에 관련된 이용자들(기업, 지원자 등) 모두가 이용하실 수 있습니다.</p>
					</div></li>

				<!-- <li data-aos="fade-up" data-aos-delay="300"><i
					class="bx bx-help-circle icon-help"></i> <a
					data-bs-toggle="collapse" data-bs-target="#faq-list-3"
					class="collapsed">기업에 지원하고 싶은데 비용은 얼마나 드나요? <i
						class="bx bx-chevron-down icon-show"></i><i
						class="bx bx-chevron-up icon-close"></i></a>
					<div id="faq-list-3" class="collapse" data-bs-parent=".faq-list">
						<p>무료입니다! 자세한 사항은 문의 부탁바랍니다.</p>
					</div></li> -->

				<li data-aos="fade-up" data-aos-delay="400"><i
					class="bx bx-help-circle icon-help"></i> <a
					data-bs-toggle="collapse" data-bs-target="#faq-list-4"
					class="collapsed">서비스 이용은 어떻게 하나요? <i
						class="bx bx-chevron-down icon-show"></i><i
						class="bx bx-chevron-up icon-close"></i></a>
					<div id="faq-list-4" class="collapse" data-bs-parent=".faq-list">
						<p>상단 메뉴바의 회원가입 메뉴를 통해 회원가입 후 로그인하시면 서비스를 이용하실 수 있습니다.</p>
					</div></li>

				<li data-aos="fade-up" data-aos-delay="500"><i
					class="bx bx-help-circle icon-help"></i> <a
					data-bs-toggle="collapse" data-bs-target="#faq-list-5"
					class="collapsed">모바일에서도 이용할 수 있나요? <i
						class="bx bx-chevron-down icon-show"></i><i
						class="bx bx-chevron-up icon-close"></i></a>
					<div id="faq-list-5" class="collapse" data-bs-parent=".faq-list">
						<p>네 물론입니다! 반응형 웹으로 구현했기 때문에 모바일에서도 이용하실 수 있습니다.</p>
					</div></li>

			</ul>
		</div>

	</div>
</section>
<!-- End Frequently Asked Questions Section -->

<section id="contact" class="contact section-bg">
	<div class="container" data-aos="fade-up">

		<div class="section-title">
			<h2>Contact Us</h2>
		</div>

		<div class="col-lg justify-content-center ">
			<div class="info ">
				<div class="address">
					<i class="bi bi-geo-alt"></i>
					<h4>Location:</h4>
					<p>
						포에스비 <br>대전광역시 서구 월평동 244번지 1003호
					</p>
				</div>

				<div class="email">
					<i class="bi bi-envelope"></i>
					<h4>Email:</h4>
					<p>greetingats@ats.com</p>
				</div>

				<div class="phone">
					<i class="bi bi-phone"></i>
					<h4>Call:</h4>
					<p>042-XXX-XXXX</p>
				</div>


				<iframe
					src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3212.9725083004996!2d127.37636527557058!3d36.361444792309754!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x35654bd9dee5bead%3A0xd16cfe55a6f238ca!2z7Y-s7JeQ7Iqk67mEKOyjvCk!5e0!3m2!1sko!2skr!4v1694501781279!5m2!1sko!2skr"
					style="border: 0; width: 100%; height: 290px;" loading="lazy"
					referrerpolicy="no-referrer-when-downgrade"></iframe>

			</div>

		</div>

	</div>
	</div>
</section>


</main>
<!-- End #main -->

<jsp:include page="include/footer.jsp" />