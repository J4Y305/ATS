<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="../include/rater_header.jsp" />
<main id="main" class="main" style="padding-top: 50px;">


<!-- End Page Title -->

<section class="section">
   <div class="row justify-content-center">
      <div class="col-lg-10">
      	<div class="pagetitle">
   			<h1>평가 목록</h1>
		</div>

         <div class="card">
            <div class="card-body" style="height: 750px;">
               <h5 class="card-title"></h5>
               <div class="card">
                  <div class="card-body" style="height: 550px;">
                     
					<!-- Table with hoverable rows -->
                     <table class="table table-hover">
                        <thead>
                           <tr>
                              <th scope="col">번호</th>
                              <th scope="col">평가명</th>
                              <th scope="col">평가 차수</th>
                              <th scope="col">평가 시작일</th>
                              <th scope="col">평가 마감일</th>
                              <th scope="col">평가 생성일</th>
                           </tr>
                        </thead>
                        <tbody>
                           <c:forEach items="${list}" var="evaVO" varStatus="var">
                           <input type="hidden" name="keyword" value="${login.raterId}"> 

                              <tr>
                                 <c:if test="${pageMaker.cri.page == 1 }">
                                    <td>${var.count }</td>
                                 </c:if>
                                 <c:if test="${pageMaker.cri.page != 1 }">
                                    <td>${var.count + ((pageMaker.cri.page-1)*10) }</td>
                                 </c:if>
                                 <td><a
                                    href='/eva/evaPage${pageMaker.makeSearch(pageMaker.cri.page) }&evaNum=${evaVO.evaNum}&annNum=${evaVO.annNum}&raterId=${login.raterId}'>
                                       ${evaVO.evaName} </a></td>
                                 <td><c:if test="${0 eq evaVO.degree}">1차</c:if>
                                 <c:if test="${1 eq evaVO.degree}">2차</c:if></td>
											
                                 <td><fmt:formatDate pattern="yyyy-MM-dd" value="${evaVO.evaStartDate}" /></td>
                                 <td><fmt:formatDate pattern="yyyy-MM-dd" value="${evaVO.evaEndDate}" /></td>
                                 <td><fmt:formatDate pattern="yyyy-MM-dd" value="${evaVO.evaRegDate}" /></td>
                              </tr>
                              
                           </c:forEach>
                        </tbody>
                     </table>
                   </div>
                     
                     
                   <div class="d-flex justify-content-center">
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
                     </div>
                     </div>
                     <!-- End Pagination with icons -->
                  </div>
               </div>
            </div>
         </div>
         
</section>

</main>
<!-- End #main -->

<jsp:include page="../include/admin_footer.jsp" />
<script>
   $(document).ready(
         function() {

            $('#searchBtn').on(
                  "click",
                  function(event) {

                     self.location = "list"
                           + '${pageMaker.makeQuery(1)}'
                           + "&searchType="
                           + $("select option:selected").val()
                           + "&keyword=" + $('#keywordInput').val();

                  });

            $('#newBtn').on("click", function(evt) {

               self.location = "mngRegister";

            });

         });
</script>