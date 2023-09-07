<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="../include/user_header.jsp" />
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<body>

  
  <main id="main" class="main">

    <div class="pagetitle">
      <h1>Profile</h1>
      
    </div><!-- End Page Title -->

    <section class="section profile">
      <div class="row">
        <div class="col-xl-4">
        	

          <div class="card">
            <div class="card-body profile-card pt-4 d-flex flex-column align-items-center">

              <img src="/resources/admin/assets/img/profile.jpg" alt="Profile" class="rounded-circle">
              <h2>${userVO.userName}</h2>
              <h3>Programmer</h3>
              <!-- <div class="social-links mt-2">
                <a href="#" class="twitter"><i class="bi bi-twitter"></i></a>
                <a href="#" class="facebook"><i class="bi bi-facebook"></i></a>
                <a href="#" class="instagram"><i class="bi bi-instagram"></i></a>
                <a href="#" class="linkedin"><i class="bi bi-linkedin"></i></a>
              </div> -->
            </div>
          </div>

        </div>

        <div class="col-xl-8">

          <div class="card">
            <div class="card-body pt-3">
              <!-- Bordered Tabs -->
              <ul class="nav nav-tabs nav-tabs-bordered">

                <li class="nav-item">
                  <button class="nav-link active" data-bs-toggle="tab" data-bs-target="#profile-overview">Overview</button>
                </li>

                <li class="nav-item">
                  <button class="nav-link" data-bs-toggle="tab" data-bs-target="#profile-edit">Edit Profile</button>
                </li>

                <!-- <li class="nav-item">
                  <button class="nav-link" data-bs-toggle="tab" data-bs-target="#profile-change-password">Change Password</button>
                </li> -->

              </ul>
              <div class="tab-content pt-2">

                <div class="tab-pane fade show active profile-overview" id="profile-overview">
                  <!-- <h5 class="card-title">자기소개</h5>
                  <p class="small fst-italic">항상 나아지기 위해 노력하기를 멈추지 않고 어떠한 상황에도 성실히 맡은 일에 최선을 다하는 개발자입니다 :)</p> -->

                  <h5 class="card-title">Profile Details</h5>

                  <div class="row">
                    <div class="col-lg-3 col-md-4 label ">ID</div>
                    <div class="col-lg-9 col-md-8">${userVO.userId}</div>
                  </div>

                  <div class="row">
                    <div class="col-lg-3 col-md-4 label">이름</div>
                    <div class="col-lg-9 col-md-8">${userVO.userName}</div>
                  </div>

                  <div class="row">
                    <div class="col-lg-3 col-md-4 label">이메일</div>
                    <div class="col-lg-9 col-md-8">${userVO.userEmail}</div>
                  </div>

                  <div class="row">
                    <div class="col-lg-3 col-md-4 label">전화번호</div>
                    <div class="col-lg-9 col-md-8">${userVO.userPhone}</div>
                  </div>

                  <div class="row">
                    <div class="col-lg-3 col-md-4 label">성별</div>
                    <div class="col-lg-9 col-md-8"><c:if test="${1 eq userVO.gender}">남자</c:if>
											<c:if test="${2 eq userVO.gender}">여자</c:if></div>
                  </div>

                  <div class="row">
                    <div class="col-lg-3 col-md-4 label">생성날짜</div>
                    <div class="col-lg-9 col-md-8"><fmt:formatDate pattern="yyyy-MM-dd"
											value="${userVO.userRegDate}"/></div>
                  </div>

                </div>

                <div class="tab-pane fade profile-edit pt-3" id="profile-edit">

                   <!-- Profile Edit Form -->
                   
                  <form class="row g-3 needs-validation" id="changeProfileForm" method="POST" novalidate>
	              <!--     <div class="row mb-3">
                      <label for="profileImage" class="col-md-4 col-lg-3 col-form-label">Profile Image</label>
                      <div class="col-md-8 col-lg-9">
                        <img src="assets/img/profile-img.jpg" alt="Profile">
                        <div class="pt-2">
                          <a href="#" class="btn btn-outline primary" title="Upload new profile image"><i class="bi bi-upload"></i></a>
                          <a href="#" class="btn btn-danger btn-sm" title="Remove my profile image"><i class="bi bi-trash"></i></a>
                        </div>
                      </div>
                    </div>
 -->
                   
                    
                    <div class="row mb-3" style="padding-top:20px">
                      <label for="fullName" class="col-md-4 col-lg-3 col-form-label">이름</label>
                      <div class="col-md-8 col-lg-9">
                        <input name="userName" type="text" class="form-control" id="userName" value="${userVO.userName}">
                      </div>
                    </div>

                    <div class="row mb-3">
                      <label for="company" class="col-md-4 col-lg-3 col-form-label">이메일</label>
                      <div class="col-md-8 col-lg-9">
                        <input name="userEmail" type="email" class="form-control" id="userEmail" value="${userVO.userEmail}">
                      </div>
                    </div>
                    
<%--                     <div class="row mb-3">
                      <label for="company" class="col-md-4 col-lg-3 col-form-label">비밀번호</label>
                      <div class="col-md-8 col-lg-9">
                        <input name="userPwd" type="password" class="form-control" id="userPwd" value="${userVO.userPwd}">
                      </div>
                    </div> --%>
                    
					<div class="row mb-3">
                      <label for="currentPassword" class="col-md-4 col-lg-3 col-form-label">현재 비밀번호</label>
                      <div class="col-md-8 col-lg-9">
                        <input name="currentPassword" type="password" class="form-control" id="currentPassword">
                      </div>
                    </div>

                    <div class="row mb-3">
                      <label for="newPassword" class="col-md-4 col-lg-3 col-form-label">새 비밀번호</label>
                      <div class="col-md-8 col-lg-9">
                        <input name="newPassword" type="password" class="form-control" id="newPassword">
                      </div>
                    </div>

                    <div class="row mb-3">
                      <label for="renewPassword" class="col-md-4 col-lg-3 col-form-label">새 비밀번호 재입력</label>
                      <div class="col-md-8 col-lg-9">
                        <input name="userPwd" type="password" class="form-control" id="userPwd">
                      </div>
                    </div>

                    <div class="row mb-3">
                      <label for="Job" class="col-md-4 col-lg-3 col-form-label">전화번호</label>
                      <div class="col-md-8 col-lg-9">
                        <input name="userPhone" type="text" class="form-control" id="userPhone" value="${userVO.userPhone}">
                      </div>
                    </div>
                    
                    <div class="row mb-3">
                      <label for="fullName" class="col-md-4 col-lg-3 col-form-label">생년월일</label>
                      <div class="col-md-8 col-lg-9">
                        <input name="birthDay" type="text" class="form-control" id="birthDay" value="${userVO.birthDay}">
                      </div>
                    </div>
                    
                    <div class="row mb-3">
                      <label for="Job" class="col-md-4 col-lg-3 col-form-label">성별</label>
                      <div class="col-md-8 col-lg-9">
                      <c:if test="${1 eq userVO.gender}">
                      <input class="form-check-input" type="radio" name="gender" id="gridRadios1" value="1" checked>
                      <label class="form-check-label" for="gridRadios1">
                     	남자
                      </label>
                      <input class="form-check-input" type="radio" name="gender" id="gridRadios2" value="2">
                      <label class="form-check-label" for="gridRadios2">
                     	여자
                      </label></c:if>
                      <c:if test="${2 eq userVO.gender}">
                      <input class="form-check-input" type="radio" name="gender" id="gridRadios1" value="1">
                      <label class="form-check-label" for="gridRadios1">
                     	남자
                      </label>
                      <input class="form-check-input" type="radio" name="gender" id="gridRadios2" value="2" checked>
                      <label class="form-check-label" for="gridRadios2">
                     	여자
                      </label></c:if>
                        
                      </div>
                    </div>
                    
                    <div class="text-center">
                      <button type="button" class="btn btn-outline-primary btn-lg" id="changeProfile">변경사항 저장</button>
                    </div>
                  </form><!-- End Profile Edit Form -->

                </div>

                

                <!-- <div class="tab-pane fade pt-3" id="profile-change-password">
                  Change Password Form
                  <form id="passwordChangeForm" method="POST">

                    <div class="row mb-3">
                      <label for="currentPassword" class="col-md-4 col-lg-3 col-form-label">현재 비밀번호</label>
                      <div class="col-md-8 col-lg-9">
                        <input name="currentPassword" type="password" class="form-control" id="currentPassword">
                      </div>
                    </div>

                    <div class="row mb-3">
                      <label for="newPassword" class="col-md-4 col-lg-3 col-form-label">새 비밀번호</label>
                      <div class="col-md-8 col-lg-9">
                        <input name="newPassword" type="password" class="form-control" id="newPassword">
                      </div>
                    </div>

                    <div class="row mb-3">
                      <label for="renewPassword" class="col-md-4 col-lg-3 col-form-label">새 비밀번호 재입력</label>
                      <div class="col-md-8 col-lg-9">
                        <input name="userPwd" type="password" class="form-control" id="renewPassword">
                      </div>
                    </div>

                    <div class="text-center">
                      <button type="button" class="btn btn-outline-primary btn-lg" id="changePwdBtn">Change Password</button>
                    </div>
                  </form>End Change Password Form

                </div> -->

              </div><!-- End Bordered Tabs -->

            </div>
          </div>

        </div>
      </div>
    </section>

  </main><!-- End #main -->

<jsp:include page="../include/admin_footer.jsp" />

</body>

<script>

document.getElementById("changeProfile").addEventListener("click", function () {
	var currentPassword = document.getElementById("currentPassword").value;
    var newPassword = document.getElementById("newPassword").value;
    var userPwd = document.getElementById("userPwd").value;
    console.log(currentPassword);
    console.log(newPassword);
    console.log(userPwd);
    
    if (currentPassword != ${userVO.userPwd}) {
   	 alert("현재 비밀번호가 일치하지 않습니다.");    
        return; 
    }
    if (newPassword != userPwd) {
        alert("새 비밀번호가 재입력한 비밀번호와 일치하지 않습니다.");
        return; 
    } 
    
 const radioButtons = document.querySelectorAll('input[name="gender"]');
 radioButtons.forEach(radioButton => {
     radioButton.addEventListener("change", function() {

         const selectedValue = this.value;
         document.querySelector('input[name="userVO.gender"]').value = selectedValue;
     });
 });
 document.getElementById("changeProfileForm").submit();
});

 
 </script>




</html>