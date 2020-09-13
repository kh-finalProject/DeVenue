<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 아임포트 라이브러리 -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<style>
/* 이미지 사이즈 맞추기 */
.image-profile {
   width: auto;
   height: 5rem;
   overflow: hidden;
   display: flex;
   align-items: center;
   justify-content: center;
   margin-top: 10%;
}

.image-profile img {
   object-fit: fill;
}
</style>
</head>
<body>
   <jsp:include page="../common/menubar.jsp" />
   <jsp:include page="../common/cSubMenubar.jsp" />


   <!-- 
   *모집중인 프로젝트
   프로젝트 이름
   
 -->
   <div class="container">
      <div class="row text-white"
         style="border-bottom: 1px solid lightgray;">
         <div class="col-2"
            style="padding: 3%; font-size: 150%; font-family: 'Jua', sans-serif;">
            <c:url var="clientProfile" value="clientProfile.do">
               <c:param name="cId" value="${loginUser.memId }" />
            </c:url>

            <p href="${clientProfile }">마이페이지</p>
         </div>
      </div>

      <div class="row">
         <jsp:include page="../common/pSideMenubar.jsp" />
         <div class="col-10 text-white"
            style="font-family: 'Jua', sans-serif; margin-left: 20%;">
            <br>
            <div class="row">
            
               <div class="col-11" style="margin-left: 5%; min-height:900px;">
                  <p>
                     결제 대기 프로젝트
                  </p>
                  <table border="1px solid lightgray;"
                     style="width: 100%; text-align: center;">
                     <thead>
                        <c:if test="${!list.isEmpty() }">
                           <tr>
                              <th>프로젝트 명</th>
                              <th>카테고리 / 분류</th>
                              <th>모집 마감일</th>
                              <th>지원 파트너스 수</th>
                              <th>금액</th>
                              <th>결제</th>
                           </tr>
                        </c:if>
                        <c:if test="${list.isEmpty() }">
                           <tr>
                              <td>결제 대기 중인 프로젝트가 없습니다.</td>
                           </tr>
                        </c:if>
                     </thead>
                     <tbody>
                        <c:forEach var="p" items="${list }" begin="0" end="4" varStatus="status">
                           <tr class="trclass">
                              <td class="proName">${p.proName }</td>
                              <td class="memId">
                                 <input class="clientId" type="hidden" value="${p.memId }">
                                 <a class="badge badge-info">${p.mcType }</a> /
                                 
                                 <c:if test="${p.dcType eq '웹' }">
                                  <a class="badge badge-info">WEB</a>
                                  </c:if>
                                  <c:if test="${p.dcType ne '웹' }">
                                  <a class="badge badge-info">${p.dcType }</a>
                                  </c:if>
                               </td>
                              <td>${p.proREndDate }</td>
                              <td>10</td>
                              <td class="proPayment">${p.payment }</td>
                              <td class="proId">
                                 <input class="projectId" type="hidden" name="payment${status.index }" value="${p.proId }">
                                 <%-- <input type="button" onclick="requestPay(${p.proId });" class="btn btn-info btn-sm" value="결제"/> --%>
                                 <!-- <input type="button" onclick="projectList(this);" class="btn btn-info btn-sm" value="결제"> -->
                                 <input type="button" class="btn btn-info btn-sm paymentBtn" value="결제">
                              </td>
                           </tr>
                        </c:forEach>
                        <script>
                           
                           $(function(){
                              $(".paymentBtn").on("click", function(){
                                 console.log("작동되냐");
                                 var projectName = ($(this).parents(".trclass").children(".proName").text());
                                 var payment = ($(this).parents(".trclass").children(".proPayment").text());
                                 var proId = ($(this).parents(".trclass").children(".proId").children(".projectId").val());
                                 var cId = ($(this).parents(".trclass").children(".memId").children(".clientId").val());
                                 console.log(projectName);
                                 console.log(payment);
                                 console.log(proId);
                                 console.log(cId);
                                 
                                 var pList={
                                       proId:proId,
                                       proName:projectName,
                                       payment:payment,
                                       cId:cId
                                 };
                                 
                                 return requestPay(pList);
                              })
                              
                           });
                        
                                    var IMP = window.IMP; // 생략가능
                                    IMP.init('imp70197590'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
                                    
                                    /* function requestPay(proId){ */
                                    function requestPay(p){
                                       IMP.request_pay({
                                           pg : 'inicis', // version 1.1.0부터 지원.
                                           pay_method : 'card',
                                           merchant_uid : 'merchant_' + new Date().getTime(),
                                           name : p.proName,
                                           amount : p.payment,      // 결제 금액
                                           buyer_email : 'iamport@siot.do',
                                           buyer_name : '구매자이름',
                                           buyer_tel : '010-1234-5678',
                                           buyer_addr : '서울특별시 강남구 삼성동',
                                           buyer_postcode : '123-456',
                                           m_redirect_url : 'https://www.yourdomain.com/payments/complete'
                                       }, function(rsp) {
                                           if ( rsp.success ) {   // true이면
                                               var msg = '결제가 완료되었습니다.';
                                               msg += '고유ID : ' + rsp.imp_uid;
                                               msg += '상점 거래ID : ' + rsp.merchant_uid;
                                               msg += '결제 금액 : ' + rsp.paid_amount;
                                               msg += '카드 승인번호 : ' + rsp.apply_num;
                                               
                                               location.href="${contextPath}/paymentUpdate.do?proId="+p.proId+"&cId="+p.cId;
                                           } else {
                                               var msg = '결제에 실패하였습니다.';
                                               msg += '에러내용 : ' + rsp.error_msg;
                                           }
                                           alert(msg);
                                       });
                                    }
                                 </script>
                        
                     </tbody>
                  </table>
                  <!-- 페이지네이션 -->
                  <section class="mt-5 mb-5" id="pagination">
                     <div class="row d-flex justify-content-around align-items-center">
                        <div class="col-12 col-md-4 text-center">
                           <nav aria-label="Page navigation example">
                              <ul class="pagination justify-content-center mb-0 text-dark">
                                 <c:if test="${pi.currentPage eq 1 }">
                                    <li class="page-item"><a class="page-link"><i
                                          class="fas fa-chevron-left"></i></a></li>
                                 </c:if>
                                 <c:if test="${pi.currentPage gt 1}">
                                    <c:url var="plistBack" value="clientPayment.do">
                                       <c:param name="page" value="${pi.currentPage-1}" />
                                    </c:url>
                                    <li class="page-item"><a class="page-link"
                                       href="${plistBack}"><i class="fas fa-chevron-left"></i></a></li>
                                 </c:if>

                                 <c:forEach begin="${pi.startPage}" end="${pi.endPage}"
                                    step="1" var="pn">
                                    <c:if test="${pi.currentPage eq pn}">
                                       <li class="page-item active"><a class="page-link">${pn}</a></li>
                                    </c:if>
                                    <c:if test="${pi.currentPage ne pn}">
                                       <c:url var="plistCheck" value="clientPayment.do">
                                          <c:param name="page" value="${pn}" />
                                       </c:url>
                                       <li class="page-item"><a class="page-link"
                                          href="${plistCheck}">${pn}</a></li>
                                    </c:if>
                                 </c:forEach>

                                 <c:if test="${pi.currentPage eq pi.maxPage}">
                                    <li class="page-item"><a class="page-link"><i
                                          class="fas fa-chevron-right"></i></a></li>
                                 </c:if>
                                 <c:if test="${pi.currentPage lt pi.maxPage}">
                                    <c:url var="plistFront" value="clientPayment.do">
                                       <c:param name="page" value="${pi.currentPage+1}" />
                                    </c:url>
                                    <li class="page-item"><a class="page-link"
                                       href="${plistFront}"><i class="fas fa-chevron-right"></i></a></li>
                                 </c:if>
                              </ul>
                           </nav>
                        </div>
                     </div>

                  </section>

               </div>
            </div>
         </div>
      </div>
   </div>
   
   <script>
    $(function(){
       $('.myPage_sideNav_area').height(window.innerHeight-$('#mainMenubar').height()-$('#subMenubar').height()-$('footer').height());
   })
   </script>
   <jsp:include page="../common/footer.jsp" />
</body>
</html>