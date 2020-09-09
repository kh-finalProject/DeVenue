<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- 별점 아이콘 css-->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<title>프로젝트 상세</title>

<style>

/*body 색상*/
	
   main{
      background-color: #212426;
      color: white;
    }

    /*로그인 상태*/
    #detail_loginNotify{
        border: 1px solid #2793f2
    }

    /*badges*/
    .badge{
        font-size: 1rem;
    }

    /*예상 금액, 예상 기간 등*/
    .planned .card{
        margin-top: 2rem;
        margin-bottom: 2rem;
        background:none;
        border: 1px solid #2793F2;
    }

    .planned .card .card-title{
        margin-bottom: 0;
    }

    .negoNotify>div>div{
        text-align: center;
        background-color: skyblue;
    }

    .summary table tr td{
       padding-right: 2rem;
    }

    .summary table tr td span{
        padding-left:0.625rem;
       color:#2793F2;
    }

    /*업무 내용*/
    .projectDetail {
        /* border-top: 1px solid white; */

        border:1px solid #2793F2;
    }

    .jobDescription_detail>div{
        margin-bottom: 2rem;
    }

    .jobDescription_detail>div>p{
        margin-bottom: 0;
    }

    .techList>span{
        margin-right: 0.0625rem;
    }

    /*프로젝트 문의*/

    #partnerQuestion_list{
        margin-bottom: 2rem;
    }

    #partnerQuestion_list .card{
        background:none;
        border-bottom: 1px solid white;
    }

    #partnerQuestion_list .card .card-body{
        padding: 0;
    }

    #partnerQuestion_list .card .card-body p{
        margin-bottom: 0;
    }
  
    #partnerQuestion_compose{
        margin-bottom:2rem;
    }
    
    #partnerQuestion_compose .card{
        background: none;
        border: 1px solid white ;
    }

    .reply .card-body{
        padding-top: 0;
        padding-bottom: 0;
    }

    .reply .card-body .card-text{
        background: skyblue;
    }

    .reply .card-body .card-text ul li{
        font-size:0.75rem;
    }

    .question .card-title{
        margin-bottom: 0;
    }

    .question .card-footer{
        padding-left: 0;
    }
    
    .answer .card-footer{
        padding-left: 0;
    }

    .answer .card-title{
        margin-bottom: 0;
    }

    .answerList{
        display:none;
        margin-top: 1rem;
        margin-left: 2rem;
        margin-bottom: 2rem;
    }

    .answer{
        margin-top: 1rem;
    }

    /*프로젝트 추천 리스트*/
     /*프로젝트 list*/

    .candidate_item{
        margin-left: 1rem;
        margin-right: 1rem;
    }

     #projectList .col-md-6{
        padding-left: 0;
        padding-right: 0;
      }

      #projectList .card{
        background:none;
        border: solid white 1px;
      }

      #projectList .card:hover{
        border: solid #2793F2 1px;
      }

      #projectList .card a{
        color: white;
        text-decoration: none;
      }

      #projectList .card a:hover{
        color:#2793F2
      }
      
       .card-text textarea{
        overflow: hidden;
        background: none;
        border: none;
        resize: none;
        color: white;
        width: 100%;
        outline: none;
      }

      /*관심*/
      #projectList .fa-heart-o {
        color: pink;
        cursor: pointer;
      }

      #projectList .fa-heart {
        color: pink;
        cursor: pointer;
      }

      .candidate {
        
        border:1px solid #2793F2;
      }

      /*지원하기*/

      #applyDiv{

        position: fixed;
        top:10rem;
        width: 18rem;

      }

      #applyBtnArea{
          text-align: center;
          border: 1px solid white;
          border-radius: 0.5rem;
          
          
      }

      #applyBtnArea>button{
          font-size: 1rem;
          width: 90%;
          margin-left: 1rem;
      }

      
      #likedNum{
          height: 2rem;
      }

      #likedNum:nth-child(2n){
          margin-top: 0.5rem;
      }

      #clientProfile{
          margin-top:5rem;
      }

      #clientInfo{
          overflow-y: auto;
          height: 4rem;
      }

      #clientRate{
          border-top: 1px dashed white;
          border-bottom: 1px dashed white;
      }

      #clientRate>div{
          margin-top:1rem;
          margin-bottom:1rem;
      }
     
      .checked {
        color: orange;
      }

      #clientHistoryList>ul{
          padding-left: 0;
          list-style-type: none;
      }

      #clientHistoryList ul li{
          line-height: 2rem;
      }

      #clientHistoryList ul li strong{
          margin-left: 1rem;
      }

</style>
</head>
<body>

<jsp:include page="../../common/menubar.jsp"></jsp:include>


<!--project detail 시작-->

  <main>
    <div class="container-fluid">
	 <!-- 로그인 확인 row 시작 -->
      <div class="row mt-5">

        <div class="col-md-2"></div>
        <div class="col-md-6" id="detail_loginNotify">
            <label class="mt-2"><i class="far fa-check-circle"></i> 로그인하였습니다.</label>
        </div>
        <div class="col-md-4"></div>
      </div>
      <!-- 로그인 확인 row 끝 -->
      

      <!--Grid row 시작-->
      <div class="row mt-5">

        <div class="col-md-2 mb-4" style="text-align: center;">
         
        </div>
        
        <!--Grid column 프로젝트 디테일 시작-->
        <div class="col-md-6 mb-4" style="width: 100%;">

        <!--모집상태, 등록일자-->
        <div class="row">

            <div class="col-md-6">
                <c:choose>
                       	<c:when test="${detail.project.proRecruit eq 'Y'}">
                       		<span class="badge badge-secondary">모집중</span>
                       	</c:when>
                       	<c:when test="${detail.project.proRecruit eq 'N'}">
                       		<span class="badge badge-success">모집마감</span>
                       	</c:when>
                </c:choose>
                
                <jsp:useBean id="today" class="java.util.Date"/>
                       
                <jsp:useBean id="aweekAgo" class="java.util.Date"/>
                <jsp:setProperty property="time" name="aweekAgo" value="${today.time-(1000*60*60*24*7)}"/>
                <fmt:formatDate value="${today}" pattern="yyyyMMdd" var="now"/>
                <fmt:formatDate value="${aweekAgo}" pattern="yyyyMMdd" var="ago"/>
                <fmt:formatDate value="${detail.project.proCreateDate}" pattern="yyyyMMdd" var="cdate"/>
                       
                <c:if test="${cdate eq now}">
                    <span class="badge badge-info">TODAY</span>
                </c:if>
                <c:if test="${cdate lt now}">
                   <c:if test="${cdate gt ago}">
                    <span class="badge badge-info">NEW</span>
                   </c:if>
                </c:if>  
            </div>
            
            <div class="col-md-6">
                <div class="float-right">
                <label class="text-muted">등록일자:</label>
                <label class="text-muted">${detail.project.proCreateDate}</label>
                </div>
            </div>
        </div>
         <!--모집상태, 등록일자 끝-->
         
         <!--프로젝트명 시작-->
         <div class="row mt-3">
             <div class="col-md-12">
                <h4>${detail.project.proName}</h4>
             </div>
         </div>
         <!--프로젝트명 끝-->

         <!--카테고리 시작-->
         <div class="row mt-3">
             <div class="col-md-12">
                 <table>
                     <tr>
                         <td><span class="badge badge-info">${detail.pList.workType}</span></td>
                         <td style="border-right: 1px dashed white;"><label class="ml-2 mr-2 mt-2">${detail.pList.mCategory}</label></td>
                         <td><label class="ml-2 mt-2">${detail.pList.dCategory}</label></td>
                     </tr>
                 </table>
             </div>
         </div>
         <!--카테고리 끝-->

         <!--예상금액/예상기간/지원자수-->
         <div class="row mt-3 planned" style="border-top:1px solid white">

            <div class="col-md-4">
                <div class="card">
                    <div class="card-body">
                      <p class="card-title float-left"><i class="fas fa-won-sign mr-2"></i>예상금액</p>
                      <p class="card-text float-right">
                      <strong><fmt:setLocale value="ko"/><fmt:formatNumber value="${detail.project.proPayment}" type="currency"/></strong>원
                      </p>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card">
                    <div class="card-body">
                     <p class="card-title float-left"> <i class="far fa-clock mr-2"></i>예상기간</p>
                     <p class="card-text float-right"><strong>${detail.project.proDuration}</strong>일</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card">
                    <div class="card-body">
                      <p class="card-title float-left"><i class="far fa-user mr-2"></i>지원자 수</p>
                      <p class="card-text float-right"><strong>${detail.pList.applyNum}</strong>명</p>
                    </div>
                </div>
            </div>

         </div>

         <div class="row negoNotify">
             <div class="col-md-12">
                <div>
                <label class="mt-2">
                    <i class="fas fa-exclamation-circle"></i> 
                    	금액과 기간 조율이 가능한 프로젝트입니다.
                </label>
                </div>
             </div>
         </div>
         <!--예상금액/예상기간/지원자수 끝-->

         <!--모집 세부 내용-->
         <div class="row mt-3 summary">
             <div class="col-md-12">
                 <table>
                     <tr>
                         <td>모집마감일</td>
                         <td>${detail.project.proREndDate}
                             <span>*마감<strong>
                             <fmt:parseNumber value="${(detail.project.proREndDate.time-today.time)/(1000*60*60*24)+1}" integerOnly="true"/>
                             </strong>일 전</span>
                         </td>
                     </tr>
                     <tr>
                        <td>예상시작일</td>
                        <td>${detail.project.proStartDate}</td>
                    </tr>
                    <tr>
                        <td>진행분류</td>
                        <c:choose>
                        	<c:when test="${detail.project.proMaintain eq 'Y'}">
                        		<td>운영 중인 서비스의 리뉴얼 또는 유지보수를 하려 합니다.</td>
                        	</c:when>
                        	<c:when test="${detail.project.proMaintain eq 'N'}">
                        		<td>새로운 서비스를 신규 개발 하려 합니다.</td>
                        	</c:when>
                        </c:choose>
                        
                    </tr>
                    <tr>
                        <td>기획상태</td>
                        <td><fmt:formatNumber type="percent" value="${detail.project.proPlanDetail/5}" maxIntegerDigits="3"/>
                        
                        <c:choose>
                        	<c:when test="${detail.project.proPlanDetail lt 2}">
                        		<span>*요구사항 정의서,제안 요청서</span>
                        	</c:when>
                        	<c:when test="${detail.project.proPlanDetail lt 4}">
                        		<span>*요구사항 정의서,제안 요청서,메뉴 구조도</span>
                        	</c:when>
                        	<c:otherwise>
                        		<span>*요구사항 정의서,제안 요청서,메뉴 구조도,화면 설계서</span>
                        	</c:otherwise>
                        </c:choose>
                            
                        </td>
                    </tr>
                    <tr>
                        <td>매니징경험</td>
                        <c:choose>
                        	<c:when test="${detail.project.proManage eq 1}">
                        		<td>프로젝트 매니징 경험 있음</td>
                        	</c:when>
                        	<c:when test="${detail.project.proManage eq 2}">
                        		<td>프로젝트 매니징 경험 없음</td>
                        	</c:when>
                        	<c:otherwise>
                        		<td></td>
                        	</c:otherwise>
                        </c:choose>
                        
                    </tr>
                    <tr>
                        <td>인력상황</td>
                        <c:choose>
                        	<c:when test="${detail.project.proHelp eq 1}">
                        		<td>IT 프로젝트 경험 있는 인력 있음
                           			 <span>*협력 가능 인력(개발자)</span>
                       			 </td>
                        	</c:when>
                        	<c:when test="${detail.project.proHelp eq 2}">
                        		<td>IT 프로젝트 경험 있는 인력 없음
                           			 <span>*추후 투입 가능</span>
                       			 </td>
                        	</c:when>
                        	<c:otherwise>
                        		<td>IT 프로젝트 경험 있는 인력 없음
                           			 <span>*추후 투입 가능</span>
                       			</td>
                        	</c:otherwise>
                        </c:choose>
                        
                    </tr>
                 </table>
             </div>

         </div>
         <!--모집 세부 내용 끝-->

         <!--업무 내용 시작-->
         <div class="row mt-5 projectDetail jobDescription">
             <div class="mt-2 col-md-12">
                 <h5>업무 내용</h5>

                 <!--업무 내용 디테일 시작-->
                <div class="mt-4 jobDescription_detail">
                <!--프로젝트 개요-->
                <div>
                    <label class="text-muted">프로젝트 개요:</label>
                    <p>${detail.project.proSummary}</p>
                </div>

                <!--프로젝트 우선순위-->
                <div>
                    <label class="text-muted">프로젝트 우선순위:</label>
                    <c:choose>
                    <c:when test="${detail.project.proPriority eq 1}">
                    	 <p>프로젝트의 빠른 진행이 가장 중요합니다.</p>
                    </c:when>
                    <c:when test="${detail.project.proPriority eq 2}">
                    	 <p>프로젝트의 완성도가 가장 중요합니다.</p>
                    </c:when>
                    <c:when test="${detail.project.proPriority eq 3}">
                    	 <p>프로젝트의 금액 절감이 가장 중요합니다.</p>
                    </c:when>
                    <c:when test="${detail.project.proPriority eq 4}">
                    	 <p>프로젝트의 기간 준수가 가장 중요합니다.</p>
                    </c:when>
                    <c:otherwise>
                    	 <p>협의 가능</p>
                    </c:otherwise>
                    </c:choose>
                   
                </div>

                <!--현재 준비 상황-->
                <div>
                    <label class="text-muted">현재 준비 상황:</label>
                    <div class="project_plan_progress" style="width: 20rem;">
                        <div class="progress mt-1">
                          <c:choose>
                        <c:when test="${detail.project.proPlanDetail eq 1}">
                        	 <div class="progress-bar bg-info" role="progressbar" style="width: 20%" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">
                            	20%
                          	</div>
                        </c:when>
                        <c:when test="${detail.project.proPlanDetail eq 2}">
                        	 <div class="progress-bar bg-info" role="progressbar" style="width: 40%" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100">
                            	40%
                          	</div>
                        </c:when>
                        <c:when test="${detail.project.proPlanDetail eq 3}">
                        	 <div class="progress-bar bg-info" role="progressbar" style="width: 60%" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100">
                            	60%
                          	</div>
                        </c:when>
                        <c:when test="${detail.project.proPlanDetail eq 4}">
                        	 <div class="progress-bar bg-info" role="progressbar" style="width: 80%" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100">
                            	80%
                          	</div>
                        </c:when>
                        <c:when test="${detail.project.proPlanDetail eq 5}">
                        	 <div class="progress-bar bg-info" role="progressbar" style="width: 98%" aria-valuenow="98" aria-valuemin="0" aria-valuemax="100">
                            	98%
                          	</div>
                        </c:when>
                        </c:choose>
                        </div>
                        <c:choose>
                        	<c:when test="${detail.project.proPlanDetail eq 1}">
                        		<p>아이디어만 있습니다.</p>
                        	</c:when>
                        	<c:when test="${detail.project.proPlanDetail eq 2}">
                        		<p>필요한 내용들만 간단히 정리해 두었습니다.</p>
                        	</c:when>
                        	<c:when test="${detail.project.proPlanDetail eq 3}">
                        		<p>필요한 내용들만 간단히 정리해 두었습니다.</p>
                        	</c:when>
                        	<c:when test="${detail.project.proPlanDetail eq 4}">
                        		<p>상세한 기획 문서가 존재합니다.</p>
                        	</c:when>
                        	<c:when test="${detail.project.proPlanDetail eq 5}">
                        		<p>상세한 기획 문서가 존재합니다.</p>
                        	</c:when>
                        </c:choose>
                        
                    </div>
                </div>

                <!--필요요소-->
                <div>
                    <label class="text-muted">필요 요소:</label>
                    <p>${detail.project.proNeeds}</p>
                </div>

                <!--개발환경/언어/방식-->
                <div>
                    <label class="text-muted">개발환경/언어/방식:</label>
                    <p>${detail.project.proResource}</p>
                    
                </div>

                <!--주요기능List/주요화면List/메뉴구성/요구사항등-->
                <div>
                    <label class="text-muted">주요 기능List/주요 화면List/메뉴 구성/요구 사항 등:</label>
                     <p>${detail.project.proNeedsDetail}</p>
                </div>

                <!--관련기술-->
                <div>
                    <h6 style="color: #2793F2;">관련 기술</h6>
                    <div class="techList">
                    	<c:forEach items="${detail.pList.techName}" var="tech">
                    		<span class="badge badge-pill badge-secondary">${tech.tName}</span>
                    	</c:forEach>
                    </div>
                </div>


                </div>
                <!--업무내용 detail 끝-->

             </div>

         </div>

         <!--업무 내용 끝-->


         <!--모집 요건 시작-->
         <div class="row mt-5 projectDetail requirement">
            <div class="mt-2 col-md-12">
                <h5>모집 요건</h5>

                <!--모집요건-->
                <div class="mt-3">
                <p><i class="fas fa-check mr-2" style="color: #2793F2;"></i><strong>
                <c:choose>
                	<c:when test="${detail.project.proTypeCode eq 'MT1'}">
                		개인
                	</c:when>
                	<c:when test="${detail.project.proTypeCode eq 'MT2'}">
                		법인
                	</c:when>
                	<c:when test="${detail.project.proTypeCode eq 'MT3'}">
                		팀
                	</c:when>
                	<c:when test="${detail.project.proTypeCode eq 'MT4'}">
                		개인사업자
                	</c:when>
                	<c:when test="${detail.project.proTypeCode eq 'MT5'}">
                		법인사업자
                	</c:when>
                	<c:when test="${detail.project.proTypeCode eq 'MT6'}">
                		기업
                	</c:when>
                	<c:otherwise>
                		상관없음
                	</c:otherwise>
                </c:choose>
                </strong></p>
                <p><i class="fas fa-plus mr-2"></i><label>
                	<c:choose>
                		<c:when test="${detail.project.proFuturePlan eq 1}">
                			향후 유지보수, 고도화를 위한 아웃소싱 계획이 있습니다.
                		</c:when>
                		<c:when test="${detail.project.proFuturePlan eq 2}">
                			향후 유지보수, 고도화를 위한 아웃소싱 계획이 없습니다.
                		</c:when>
                		<c:otherwise>
                			협의 가능
                		</c:otherwise>
                	</c:choose>
                </label></p>
                </div>

            </div>
        </div>
         <!--모집 요건 끝-->

         <!--지원 전 질문 시작-->
         <div class="row mt-5 projectDetail clientQuestion">
            <div class="mt-2 col-md-12">
                <h5>지원 전 질문</h5>
                <p>지원서 작성 시 클라이언트의 질문에 답변해주세요.</p>

                <!--질문 목록-->
                <div class="mt-3 qestionList">
                	<c:forEach items="${detail.question}" var="q">
                	<i class="fas fa-question float-left mr-2 mt-1" style="color: #2793F2;"></i><p>${q.proAQContent}</p>
                	</c:forEach>
                    
                    
                </div>

            </div>
        </div>
        <!--지원 전 질문 끝-->


        <!--프로젝트 문의시작-->
        <div class="row mt-5 projectDetail partnerQuestion">
            <div class="mt-2 col-md-12">
                <h5>프로젝트 문의<span class="badge badge-info ml-2" id="replyNum">${detail.rpList.size()}</span></h5>
				
				
                <div id="partnerQuestion_list">
				<c:forEach items="${detail.rpList}" var="r">
				
                   		<div class="replyItem">
                        <div class="card question mt-4">
                            <div class="card-body">
                              <div class="card-title">
                                <i class="fas fa-user-circle"></i>
                                <label class="toWhom">${r.writer.memNick}</label>
                                <input type="hidden" class="writer" value="${r.writer.memId}">
                                <div class="float-right">
                                	<input type="hidden" class="myRId" value="${r.rId}">
                                    <input type="hidden" class="myRPId" value="${r.parentRId}">
                                    <a class="replyModify mr-2">수정</a>
                                    <a class="replyCancel"><i class="fas fa-times"></i></a>
                                </div>
                            </div>
                              
                              <c:if test="${r.rSecret eq 'N'}">
                              <p class="card-text">${r.rContent}</p>
                              </c:if> 
                              <c:if test="${r.rSecret eq 'Y'}">
                             
                               <c:choose>
                                <c:when test="${r.writer.memId eq loginUser.memId}">
                                <p class="card-text">${r.rContent}</p>
                                </c:when>
                                <c:when test="${detail.project.memId eq loginUser.memId}">
                               <p class="card-text">${r.rContent}</p>
                                </c:when>
                                <c:otherwise>
                                 <p class="card-text">비밀글입니다.</p>
                                </c:otherwise>
                                </c:choose>
                              
                              
                              </c:if>  
                              
                              <c:choose>
                              	<c:when test="${not empty r.rModifyDate}">
                              		<p class="text-muted">${r.rModifyDate}</p>
                              	</c:when>
                              	<c:otherwise>
                              		<p class="text-muted">${r.rCreateDate}</p>
                              	</c:otherwise>
                              </c:choose>
                              
                            </div>
                            <div class="card-footer">
                            	<c:if test="${r.rAnswerStatus eq 'Y'}">
                            	
                                <a class="showAnswer">답글보기</a>
                                </c:if>
                                <c:if test="${r.rAnswerStatus eq 'N'}">
                                <c:if test="${loginUser.memId eq detail.project.memId}">
                                <a class="writeAnswer">답변하기</a>
                                </c:if>
                                </c:if>
                            </div>
                        </div>
                      <c:forEach items="${detail.rcList}" var="rc">
						
                        <c:if test="${r.rId eq rc.parentRId}">
                       	
                        <div class="answerList">
                            <div class="card answer">
                            <div class="card-body">
                                <div class="card-title">
                                    <i class="fas fa-user-circle"></i>
                                    <label class="toWhom">${rc.writer.memNick}</label>
                                    <input type="hidden" class="writer" value="${r.writer.memId}">
                                    <div class="float-right">
                                    	<input type="hidden" class="myRId" value="${rc.rId}">
                                    	<input type="hidden" class="myRPId" value="${rc.parentRId}">
                                        <a class="replyModify mr-2">수정</a>
                                        <a class="replyCancel"><i class="fas fa-times"></i></a>
                                    </div>
                                </div>
                                
                                <c:if test="${rc.rSecret eq 'N'}">
                                <p class="card-text">${rc.rContent}</p>
                                </c:if> 
                                <c:if test="${rc.rSecret eq 'Y'}">
                                
                                <c:choose>
                                <c:when test="${r.writer.memId eq loginUser.memId}">
                                <p class="card-text">${rc.rContent}</p>
                                </c:when>
                                <c:when test="${detail.project.memId eq loginUser.memId}">
                                <p class="card-text">${rc.rContent}</p>
                                </c:when>
                                <c:otherwise>
                                 <p class="card-text">비밀글입니다.</p>
                                </c:otherwise>
                                </c:choose>
                                
                                </c:if>  
                                
                                <c:choose>
                              	<c:when test="${not empty rc.rModifyDate}">
                              		<p class="text-muted">${rc.rModifyDate}</p>
                              	</c:when>
                              	<c:otherwise>
                              		<p class="text-muted">${rc.rCreateDate}</p>
                              	</c:otherwise>
                              </c:choose>
                                
                              </div>
                            </div>
                        </div>
                        </c:if>
                        </c:forEach>  
                        </div>
                        
                </c:forEach>  
                </div>

                

                <div id="partnerQuestion_compose">

                    <div class="card reply">
                        <div class="card-header">
                            <i class="fas fa-user-circle"></i>닉네임
                            <input type="hidden" name="rWriter" value="4">
                        </div>
                        <div class="card-body">

                            <div class="form-group">
                                <textarea class="form-control" id="reply_textarea" name="rContent" rows="3" maxlength="2000" placeholder="프로젝트 문의를 2000자 이내로 작성해주세요."></textarea>
                            	<p class="float-right" id="reply_textCount"><strong>0</strong>/2000자</p>
                            </div>
                          
                            <div class="card-text mt-4">
                               <ul>
                                   <li>
                                       	이메일, 전화번호 등을 게시하여 직거래를 유도할 경우 서비스 이용에 제재를 받을 수 있습니다.
                                   </li>
                     
                               </ul>
                            </div>
                         
                        </div>
                        <div class="card-footer text-muted">
                            <div class="form-check float-left">
                                <input class="form-check-input" type="checkbox" name="rSecret" value="Y" id="reply_private">
                                <label class="form-check-label text-white" for="reply_private">
                                  	비밀글
                                </label>
                              </div>
							
							<div id="submitReply">
                          	<button class="btn btn-info float-right" id="rSubmit">작성하기</button>
                          	</div>
                        </div>
                      </div>
                </div>
            </div>


        </div>
        <script>
            //답글 클릭 시 답글 보기
           
            
            $(document).on("click",".showAnswer",function(){
            	
            	var answer=$(this).parent().parent().parent().find(".answerList");

                if(answer.css("display")=="none"){
                    answer.css("display","block");
                }else{
                    answer.css("display","none");
                }
            	
            })
            
            //댓글 입력 글자 수 세기
            
            $("#reply_textarea").keyup(function () {
                var length = $(this).val().length;
                $("#reply_textCount").children("strong").text(length);
             })
                
        </script>
        <script>
        	//댓글 리스트 가져오기
        	function getProjectReply(){
        		
        		var pId="${detail.pId}";
        		var memId="${loginUser.memId}";
        		
        		$.ajax({
        			
        			
        			url:"getProjectReply.do",
        			data:{pId:pId},
        			dataType:"json",
        			type:"post",
        			success:function(data){
        				
        				$questionList=$("#partnerQuestion_list");
        				$questionList.html("");
        				var $reply;
        				var $card;
        				var $body;
        				var $title;
        				var $userImg;
        				var $userName;
        				var $userId;
        				var $edit;
        				var $hidden;
        				var $hiddenp;
        				var $modify;
        				var $delete;
        				var $text;
        				var $date;
        				var $foot;
        				var $isAnswer;
        				
        				var $answerList;
        				var $acard;
        				var $abody;
        				var $atitle;
        				var $auserImg;
        				var $auserName;
        				var $auserId;
        				var $aedit;
        				var $ahidden;
        				var $ahiddenp;
        				var $amodify;
        				var $adelete;
        				var $atext;
        				var $adate;
        				var $afoot;
        				
        				$parent=data[0];//부모 댓글
        				$child=data[1];//자식 댓글
        				
        				$("#replyNum").text($parent.length);
        				
        				if($parent.length>0){
        					
        					for(var i in $parent){
        						
        						console.log(i);
        						//질문 댓글 영역
        						$reply=$("<div>").addClass("replyItem");
        						$card=$("<div>").addClass("card").addClass("question mt-4");
        						$body=$("<div>").addClass("card-body");
        						$title=$("<div>").addClass("card-title");
        						$userImg=$("<i>").addClass("fas fa-user-circle");
        						$userName=$("<label>").addClass("toWhom").text($parent[i].writer.memNick);
        						$userId=$("<input type='hidden'>").addClass("writer").val($parent[i].writer.memId);
        						$edit=$("<div>").addClass("float-right");
        						$hidden=$("<input type='hidden'>").addClass("myRId").val($parent[i].rId);
        						$hiddenp=$("<input type='hidden'>").addClass("myRPId").val($parent[i].parentRId);
        						$modify=$("<a>").addClass("replyModify mr-2").text("수정");
        						$delete=$("<a>").addClass("replyCancel").html("<i class='fas fa-times'/>");
        						
        						$edit.append($hidden);
        						$edit.append($hiddenp);
        						$edit.append($modify);
        						$edit.append($delete);
        						$title.append($userImg);
        						$title.append($userName);
        						$title.append($userId);
        						$title.append($edit);
        						$body.append($title);
        						
        						
        						$text=$("<p>").addClass("card-text");
        						
        						if($parent[i].rSecret=="N"){
        							$text.text($parent[i].rContent);
        						}else{
        							//작성자와 클라이언트만 볼 수 있다.
        							
        							if(memId!=""){
        							
        							if($parent[i].writer.memId==memId||"${detail.project.memId}"==memId){
        								
        								$text.text($parent[i].rContent);
        							}else{
        								
        								$text.text("비밀글입니다.");
        								
        							}
        							
        							}else{
        								
        								$text.text("비밀글입니다.");
        							}
        							
        							
        						}
        						
        						$body.append($text);
        						
        						$date=$("<p>").addClass("text-muted");
        						
        						if($parent[i].rModifyDate>=$parent[i].rCreateDate){
        							$date.text($parent[i].rModifyDate)
        						}else{
        							$date.text($parent[i].rCreateDate)
        						}
        						
        						$body.append($date);
        						
        						$foot=$("<div>").addClass("card-footer");
        						$isAnswer=$("<a>")
        						
        						if($parent[i].rAnswerStatus=='Y'){
        							$isAnswer.addClass("showAnswer").text("답글보기");
        						}else{
        							$isAnswer.addClass("writeAnswer").text("답글쓰기");
        						}
        						
        						if($parent[i].rAnswerStatus=='Y'){
        							$foot.append($isAnswer);
        						}else{
        							
        							if("${detail.project.memId}"==memId){
        							$foot.append($isAnswer);
        							}
        						}
        						
        						
        						$body.append($foot);
        						
        						$card.append($body);
        						$card.append($foot);
        						$reply.append($card);
        						
        						
        						
        						if($child.length>0){
        						for(var j in $child){
        							//답 댓글 영역
        							
        							if($parent[i].rId==$child[j].parentRId){
        								
        								
        								$answerList=$("<div>").addClass("answerList");
        								$acard=$("<div>").addClass("card answer");
        								$abody=$("<div>").addClass("card-body");
        								$atitle=$("<div>").addClass("card-title");
        								$auserImg=$("<i>").addClass("fas fa-user-circle");
        								$auserName=$("<label>").addClass("toWhom").text($child[j].writer.memNick);
        								$auserId=$("<input type='hidden'>").addClass("writer").val($child[j].writer.memId);
        								$aedit=$("<div>").addClass("float-right");
        								$ahidden=$("<input type='hidden'>").addClass("myRId").val($child[j].rId);
        								$ahiddenp=$("<input type='hidden'>").addClass("myRPId").val($child[j].parentRId);
        								$amodify=$("<a>").addClass("replyModify mr-2").text("수정");
        								$adelete=$("<a>").addClass("replyCancel").html("<i class='fas fa-times'/>")
        								
        								$aedit.append($ahidden);
        								$aedit.append($ahiddenp);
        								$aedit.append($amodify);
        								$aedit.append($adelete);
        								
        								$atitle.append($auserImg);
        								$atitle.append($auserName);
        								$atitle.append($auserId);
        								$atitle.append($aedit);
        								$abody.append($atitle);
        								
        								$atext=$("<p>").addClass("card-text");
        								if($child[j].rSecret=='N'){
        									$atext.text($child[j].rContent);
        								}else{
        									
        									//작성자와 클라이언트만 볼 수 있다.
        									
        									if(memId!=""){
        	        							
        	        							if($parent[i].writer.memId==memId||${detail.project.memId}==memId){
        	        								
        	        								$text.text($parent[i].rContent);
        	        							}else{
        	        								
        	        								$text.text("비밀글입니다.");
        	        								
        	        							}
        	        							
        	        							}else{
        	        								
        	        								$text.text("비밀글입니다.");
        	        							}
        								}
        								
        								$abody.append($atext);
        								
        								$adate=$("<p>").addClass("text-muted");
        								
        								if($child[j].rModifyDate>=$child[j].rCreateDate){
        									$adate.text($child[j].rModifyDate);
        								}else{
        									$adate.text($child[j].rCreateDate);
        								}
        								
        								$abody.append($adate);
        								
        								$acard.append($abody);
        								$answerList.append($acard);
        								$reply.append($answerList);
        							}//부모댓글에 자식댓글 매칭하는 if문 끝
        							
        							
        						}//자식 댓글 for문 끝
        						
        						}//자식 댓글 if문 끝
        						
        						$questionList.append($reply);
        						
        					}//부모댓글 for문 끝
        					
        				}//부모댓글 if문 끝
        				
        				
        				
        				
        			},
        			error:function(request, status, errorData){
                        alert("error code: " + request.status + "\n"
                              +"message: " + request.responseText
                              +"error: " + errorData);
                     }  
        		})
        		
        		
        	}
        	
        
        
        
        	//댓글 작성
        	
        	$(function(){
        		
        		
        		
        		$("#rSubmit").on("click",function(){
        			
        			var rContent=$("#reply_textarea").val();
        			var pId="${detail.pId}";
        			var memId="${loginUser.memId}";
        			
        			
        			if(memId==""){
        				alert("로그인한 회원만 문의 댓글을 남길 수 있습니다.");
        				return;
        			}
        			
        			var rSecret="";
        			if($("#reply_private").prop("checked")){
        				rSecret='Y';
        			}else{
        				rSecret='N';
        			}
        			
        			$.ajax({
        				url:"addProjectReply.do",
        				data:{pId:pId,rContent:rContent,memId:memId,rSecret:rSecret},
        				type:"post",
        				success:function(data){
        					
        					if(data=="success"){
        						
        					$("#reply_textarea").val("");
        					$("#reply_textCount").children("strong").text("0");
        					getProjectReply();
        					
        					}
        				},
        				error:function(request, status, errorData){
                            alert("error code: " + request.status + "\n"
                                  +"message: " + request.responseText
                                  +"error: " + errorData);
                         }  
        			})
        		})
        	})
        	
        	
        	//답변 작성
        	
        	$(document).on("click","#rAnswer",function(){
        		
        		var rContent=$("#reply_textarea").val();
    			var pId=${detail.pId};
    			var parent=$(this).parent().find(".myRId").val();
    			var memId=3;
        		
    			var rSecret="";
    			if($("#reply_private").prop("checked")){
    				rSecret='Y';
    			}else{
    				rSecret='N';
    			}
    			
    			
    			$.ajax({
    				url:"answerProjectReply.do",
    				data:{pId:pId,rContent:rContent,memId:memId,rSecret:rSecret,parentRId:parent},
    				type:"post",
    				success:function(data){
    					
    					if(data=="success"){
    						
    					$("#reply_textarea").val("");
    					$("#reply_textCount").children("strong").text("0");
    					getProjectReply();
    					
    					}
    				},
    				error:function(request, status, errorData){
                        alert("error code: " + request.status + "\n"
                              +"message: " + request.responseText
                              +"error: " + errorData);
                     }  
    			})
    			
        		
        	})
        
        	
        	//댓글 수정
        		$(document).on("click","#rModify",function(){
        			var rid=$(this).parent().find(".myRId").val();
        			var rpid=$(this).parent().find(".myRPId").val();
        			var modifyContent=$("#reply_textarea").val();
        			var pId=${detail.pId};
        			var memId=4;
        			var isSecret="";
        			
        			if($("#reply_private").prop("checked")){
        				isSecret='Y';
        			}else{
        				isSecret='N';
        			}
        			
        			$.ajax({
        				url:"updateProjectReply.do",
        				data:{pId:pId,rContent:modifyContent,memId:memId,rId:rid,parentRId:rpid,rSecret:isSecret},
        				type:"post",
        				success:function(data){
        					if(data=="success"){
        						$("#reply_textarea").val();
        						$("#reply_textCount").children("strong").text("0");
        						getProjectReply();
        					}
        				},
        				error:function(request, status, errorData){
                            alert("error code: " + request.status + "\n"
                                  +"message: " + request.responseText
                                  +"error: " + errorData);
                         }  
        			})
        			
        		})
        		
        		
        	//댓글 삭제하기
        	$(document).on("click",".replyCancel",function(){
        		
        		var rId=$(this).parent().find(".myRId").val();
        		var rpId=$(this).parent().find(".myRPId").val();
        		
        		var agree;
        		if(rId==rpId){
        			agree=confirm("문의를 삭제하시겠습니까?");
        		}else{
        			agree=confirm("답변을 삭제하시겠습니까?");
        		}
        		
        		console.log(agree);
        		
        		if(agree==true){
        			$.ajax({
        				url:"deleteProjectReply.do",
        				data:{rId:rId,parentRId:rpId},
        				type:"post",
        				success:function(data){
        					if(data=="success"){
        						getProjectReply();
        					}
        				},
        				error:function(request, status, errorData){
                            alert("error code: " + request.status + "\n"
                                  +"message: " + request.responseText
                                  +"error: " + errorData);
                         }  
        			})
        		}
        		
        		
        	})
        	
        	
        
        </script>
        <script>
        	//댓글 수정하기 준비
        	//로그인 유저가 작성자와 같은지 확인
        	
        	$(document).on("click",".replyModify",function(){
        		
        		var rId=$(this).parent().find(".myRId").val();
        		var rpId=$(this).parent().find(".myRPId").val();
        		
        		var content=$(this).parents(".card-body").find(".card-text").text();
        		$("#reply_textarea").val(content);
        		
        		var $btnArea=$("#submitReply");
        		$btnArea.html("");
        		
        		var $btn=$("<button>").addClass("btn btn-info float-right").attr("id","rModify").text("수정하기");
        		var $hiddenRId=$("<input type='hidden'>").addClass("myRId").val(rId);
        		var $hiddenRpId=$("<input type='hidden'>").addClass("myRPId").val(rpId);
        		
        		
        		$btnArea.append($btn);
        		$btnArea.append($hiddenRId);
        		$btnArea.append($hiddenRpId);
        	
        	})
        	
        	
        	//답글 작성하기 준비
        	
        	$(document).on("click",".writeAnswer",function(){
        		var target=$(this).parent().parent().children(".card-body").find(".myRId").val();
        		
        		
        		var toWhom=$(this).parent().parent().children(".card-body").find(".toWhom").text();
        		
        		$("#reply_textarea").attr("placeholder","#"+toWhom+"에게 답변합니다.");
        		
        		var $btnArea=$("#submitReply");
        		$btnArea.html("");
        		
        		var $btn=$("<button>").addClass("btn btn-info float-right").attr("id","rAnswer").text("답변하기");
        		var $hiddenTarget=$("<input type='hidden'>").addClass("myRId").val(target);
        		
        		$btnArea.append($btn);
        		$btnArea.append($hiddenTarget);
        		
        		
        	})
        	
        </script>
        <!--프로젝트 문의 끝-->

        <!--모집 중인 다른 프로젝트 시작-->
                    <script>
                    //프로젝트 리스트 관련 함수들
                    
                    //검증된 클라이언트 툴팁
                    $(function () {
                        $('[data-toggle="tooltip"]').tooltip()
                    })
                    
                    </script>

                    <script>
                        //관심 추가 버튼 색깔 변경                        
                        $(function(){
                        $("#heart").click(function(){
                            if($("#heart").hasClass("liked")){
                            $("#heart").html('<i class="fa fa-heart-o" aria-hidden="true"></i>');
                            $("#heart").removeClass("liked");
                            }else{
                            $("#heart").html('<i class="fa fa-heart" aria-hidden="true"></i>');
                            $("#heart").addClass("liked");
                            }
                        });
                        });
                    </script>

        <!--모집 중인 다른 프로젝트 list row 시작-->
        <div class="row mt-5 candidate">
            <!--모집중인 프로젝트 list column 시작-->
            <div class="col-md-12 mt-2">
                <h5>모집 중인 다른 프로젝트</h5>

                <!--Section: Block Content 추천 프로젝트 리스트 시작-->
                <div class="mt-5" id="projectList">

                    <!-- Grid row 후보 프로젝트 시작  -->
                    <c:forEach items="${candidate}" var="candi" varStatus="status">
                    
                    <c:if test="${status.index lt 3}">
                    <c:url var="pdetail" value="searchProjectDetail.do">
            		<c:param name="id" value="${candi.id}"/>
	            	<c:param name="mCategory" value="${candi.mCategory}"/>
	            	<c:param name="dCategory" value="${candi.dCategory}"/>
            		</c:url>
                    <div class="candidate_item">
                   
                    <div class="row mb-2 mx-auto" style="width: 100%;">
                        <div class="col-md-12 px-0">
                        <div class="card flex-md-row mb-4 box-shadow h-md-250">
                            <div class="card-body d-flex flex-column align-items-start">

                            <!--배지-->
                            <strong class="d-inline-block mb-2 text-primary">
                                <c:choose>
		                       	<c:when test="${candi.project.proRecruit eq 'Y'}">
		                       		<span class="badge badge-secondary">모집중</span>
		                       	</c:when>
		                       	<c:when test="${candi.project.proRecruit eq 'N'}">
		                       		<span class="badge badge-success">모집마감</span>
		                       	</c:when>
		                       </c:choose>
		                    
		                       <fmt:formatDate value="${candi.project.proCreateDate}" pattern="yyyyMMdd" var="candiCDate"/>
		                       
		                       <c:if test="${candiCDate eq now}">
		                       		<span class="badge badge-info">TODAY</span>
		                       </c:if>
		                       <c:if test="${candiCDate lt now}">
		                       		<c:if test="${candiCDate gt ago}">
		                       		<span class="badge badge-info">NEW</span>
		                       		</c:if>
		                       </c:if>  
		                       
                            </strong>

                            <!--프로젝트명과 관심추가 버튼-->
                            <div style="width:100%;">
                            <h3 class="mb-0 float-left">
                                <a href="${pdetail}">${candi.project.proName}</a>
                                 <c:if test="${candi.identify eq 'COMPLETE'}">
		                        <a class="btn" data-toggle="tooltip" data-placement="right" title="이 프로젝트의 클라이언트는 신원인증을 완료했습니다."><i class="far fa-check-circle"></i></a>
		                     	</c:if>
                            </h3>
                                <div class="float-right mr-3">
                                <span id ="heart"><i class="fa fa-heart-o" aria-hidden="true" ></i></span>
                                <label for="heart">관심</label>
                                </div>
                            </div>
                            
                            
                            
                            <!--기획상태-->
                            <div class="project_plan_progress" style="width: 20rem;">
                                <p class="text-muted progress_label" style="float: left; margin-right: 1rem; margin-bottom: 0;font-size: 0.875rem;">기획상태</p>
                                <div class="progress mt-1">
                                <c:choose>
		                        <c:when test="${candi.project.proPlanDetail eq 1}">
		                        	 <div class="progress-bar bg-info" role="progressbar" style="width: 20%" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">
		                            	20%
		                          	</div>
		                        </c:when>
		                        <c:when test="${candi.project.proPlanDetail eq 2}">
		                        	 <div class="progress-bar bg-info" role="progressbar" style="width: 40%" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100">
		                            	40%
		                          	</div>
		                        </c:when>
		                        <c:when test="${candi.project.proPlanDetail eq 3}">
		                        	 <div class="progress-bar bg-info" role="progressbar" style="width: 60%" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100">
		                            	60%
		                          	</div>
		                        </c:when>
		                        <c:when test="${candi.project.proPlanDetail eq 4}">
		                        	 <div class="progress-bar bg-info" role="progressbar" style="width: 80%" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100">
		                            	80%
		                          	</div>
		                        </c:when>
		                        <c:when test="${candi.project.proPlanDetail eq 5}">
		                        	 <div class="progress-bar bg-info" role="progressbar" style="width: 98%" aria-valuenow="98" aria-valuemin="0" aria-valuemax="100">
		                            	98%
		                          	</div>
		                        </c:when>
		                        </c:choose>
                                </div>
                            </div>

                            <!--요약내용-->
                            <div class="row mt-3 mb-3" style="width: 100%;">
                                <div class="col-md-9">
                                <table style="width:80%;height: 100%;">
                                    <tr>
                                    <td style="border-right:dashed 1px white"><label class="mr-3">예상 금액</label><label><fmt:setLocale value="ko"/><fmt:formatNumber value="${candi.project.proPayment}" type="currency"/></label><label>원</label></td>
                                    <td><label class="ml-3">${candi.mCategory}</label></td>
                                    </tr>
                                    <tr>
                                    <td style="border-right:dashed 1px white"><label class="mr-3">예상 기간</label><label>10</label><label>일</label></td>
                                    <td><label class="ml-3">${candi.dCategory}</label></td>
                                    </tr>
                                </table>
                                </div>
                                <div class="col-md-3">
                                
                                    <div class="mt-3" style="text-align: right;">
                                        <i class="fas fa-history mr-3"></i><label>마감</label><label><fmt:parseNumber value="${(candi.project.proREndDate.time-today.time)/(1000*60*60*24)+1}" integerOnly="true"/></label><label>일 전</label>
                                    </div>
                                    
                                    <div style="text-align: right;">
                                        <i class="fas fa-user mr-3"></i><label>총</label><label>${candi.applyNum}</label><label>명 지원</label>
                                    </div>
                                
                                </div>

                            </div>

                            <!--세부내용-->
                            <div class="row mb-3" style="width: 100%; height: 100%;">
                                <div class="col-md-9">
                                <div class="card-text mb-4" style="font-size:0.875rem;">
                                    <label>프로젝트 개요</label>
                                    <textarea readonly maxlength="100">${candi.project.proSummary}</textarea>
                                </div>
                                <table style="width:100%; height: 20px;">
                                    <tr>
                                    <td style="border-right: 1px dashed white;width:20%;">
                                        <span class="badge badge-info">${candi.workType}</span>
                                    </td>
                                    <td style="border-right: 1px dashed white;width: 40%;padding-left: 1rem;">
                                        <c:forEach items="${candi.techName}" var="tn">
		                                <a href="#" class="badge badge-secondary">${tn.tName}</a>
		                                </c:forEach>  
                                    </td>
                                    <td style="width: 10%;padding-left:1rem;padding-top:0.375rem;font-size: 0.875rem;">
                                        <i class="fas fa-map-marker-alt mr-2"></i><label>${candi.project.proLocation}</label>
                                    </td>
                                    <td style="width: 30%;font-size: 0.875rem;">
                                        <label class="mt-2 mr-2 ml-4 text-muted">등록일자:</label><label class="text-muted">${candi.project.proCreateDate}</label>
                                    </td>
                                    </tr>
                                </table>

                                </div>
                                <div class="col-md-3" style="height: 100%;border-top: 1px dashed white;">

                                <div class="mt-5" style="text-align: right;">
                                    <i class="far fa-comment-dots mr-1"></i><label>${candi.replyNum}</label>
                                    <i class="far fa-heart mr-1"></i><label>${candi.likeNum}</label>
                                </div>
                                
                                
                                </div>
                            </div>
                            


                            </div>
                        
                        </div>
                        </div>
                    </div>



                   
                </div>
                	</c:if>
                 </c:forEach>
                <!-- Grid row 후보 프로젝트 끝 -->
                </div>
               <!--Section: Block Content 추천 프로젝트 리스트 끝-->



            </div>
            <!--모집중인 프로젝트 list column 시작-->

        </div>
       
        <!--모집중인 다른 프로젝트 리스트 row 끝-->


        <div class="mt-5" style="width: 100%; height: 10rem;">
           
        </div>





         
        </div>
        <!-- 프로젝트 디테일 column 끝-->

        <!--Grid column 사이드바(지원/관심 버튼+프로필) 시작-->
        <div class="col-md-2 mb-4" style="width: 100%;">
            <div id="applyDiv">
            <div class="ml-3" id="applyBtnArea">
                
         		<c:if test="${loginUser.userType eq 'UT4'}">
                <button type="button" class="btn btn-info btn-lg btn-block mt-3" id="applyProjectBtn">프로젝트 지원하기</button>
                <button type="button" id="likeThisProject" class="btn btn-outline-light btn-lg btn-block mt-3 mb-3">관심 프로젝트 등록</button>
                </c:if>
                <c:if test="${loginUser.userType eq 'UT3'}">
                <button type="button" class="btn btn-info btn-lg btn-block mt-3" id="createProjectBtn" onclick="location.href='addProject.do'">프로젝트 생성하기</button>
                </c:if>
                
                <div style="width: 100%; border-top: 1px solid white;"></div>
                <div style="text-align: center;" id="likedNum">
                    <i class="far fa-heart"></i> <strong>${detail.pList.likeNum}</strong>
                </div>

            </div>

            <div class="ml-3" id="clientProfile">
                <div class="row">
                    <div class="col-md-12">
                        <i class="far fa-user-circle fa-2x mr-2"></i><label>${detail.client.memNick}</label><span class="badge badge-info ml-2">클라이언트</span>
                    </div>
                    <div class="col-md-12" id="clientInfo">
		                        ${detail.profile.introduction}
                    </div>

                    <div class="col-md-12 mt-3" id="clientRate">
                        <div>
                        <c:choose>
                        	<c:when test="${detail.pList.evaluation le 1}">
                        	<span class="fa fa-star checked"></span>
	                        <span class="fa fa-star"></span>
	                        <span class="fa fa-star"></span>
	                        <span class="fa fa-star"></span>
	                        <span class="fa fa-star"></span>
                        	</c:when>
                        	<c:when test="${detail.pList.evaluation le 2}">
                        	<span class="fa fa-star checked"></span>
	                        <span class="fa fa-star checked"></span>
	                        <span class="fa fa-star"></span>
	                        <span class="fa fa-star"></span>
	                        <span class="fa fa-star"></span>
                        	</c:when>
                        	<c:when test="${detail.pList.evaluation le 3}">
                        	<span class="fa fa-star checked"></span>
	                        <span class="fa fa-star checked"></span>
	                        <span class="fa fa-star checked"></span>
	                        <span class="fa fa-star"></span>
	                        <span class="fa fa-star"></span>
                        	</c:when>
                        	<c:when test="${detail.pList.evaluation le 4}">
                        	<span class="fa fa-star checked"></span>
	                        <span class="fa fa-star checked"></span>
	                        <span class="fa fa-star checked"></span>
	                        <span class="fa fa-star checked"></span>
	                        <span class="fa fa-star"></span>
                        	</c:when>
                        	<c:when test="${detail.pList.evaluation le 5}">
                        	<span class="fa fa-star checked"></span>
	                        <span class="fa fa-star checked"></span>
	                        <span class="fa fa-star checked"></span>
	                        <span class="fa fa-star checked"></span>
	                        <span class="fa fa-star checked"></span>
                        	</c:when>
                        </c:choose>
                        
                        <label>${detail.pList.evaluation}</label><label>/5점(${detail.evalCount})</label>
                        </div>
                    </div>

                    <div class="col-md-12 mt-3" id="clientHistoryList">
                        <ul>
                            <li>프로젝트 등록<strong>${detail.allProject}</strong>건</li>
                            <li>계약한 프로젝트<strong>${detail.processProject+detail.completeProject}</strong>건
                                <ul>
                                    <li class="ml-5">진행중인 프로젝트<strong>${detail.processProject}</strong>건</li>
                                    <li class="ml-5">완료한 프로젝트<strong>${detail.completeProject}</strong>건</li>
                                </ul>
                            </li>
                            <li>프로젝트 계약률<strong><fmt:formatNumber value="${(detail.processProject+detail.completeProject)/detail.allProject}" type="percent"/></strong></li>
                            <li>누적완료금액<strong><fmt:setLocale value="ko"/><fmt:formatNumber value="${detail.total}" type="currency"/></strong>원</li>
                        </ul>

                    </div>
                </div>

            </div>
            </div>
            
        </div>
        <script>
        
        	function addLikeProject(thisProject,whoLike){
        		
        		var pId=thisProject;
        		var memId=whoLike;
        		
        		$.ajax({
        			
        			url:"addLikeProject.do",
        			data:{pId:pId,memId:memId},
        			success:function(data){
        				var likeNum=0;
        				if(data=="success"){
    						alert("관심 등록 되었습니다.");
    						likeNum=$("#likeNum").find("strong").text();
    						$("#likeNum").find("strong").text(likeNum+1);
        				}
        			},
        			error:function(request, status, errorData){
                        alert("error code: " + request.status + "\n"
                                +"message: " + request.responseText
                                +"error: " + errorData);
                       }  
        			
        		})
        		
        	}
        
        
        
        	$(document).on("click","#likeThisProject",function(){
        		
        		var thisProject="${detail.pId}";
        		var whoLike="${loginUser.memId}";
        		
        		if(whoLike==""){
        			
        			alert("로그인이 필요합니다.");
        		}else{
        		
        		//이미 관심등록을 했는지 확인하자.
        		$.ajax({
        			url:"checkLikeNum.do",
        			data:{pId:thisProject,memId:whoLike},
        			dataType:"json",
        			success:function(data){
        				
        				var likeNum=data.likeNum;
        				
        				if(likeNum>0){
        					alert("이미 등록한 프로젝트입니다.")
        				}else{
        					addLikeProject(thisProject,whoLike);
        				}
        			},
        			error:function(request, status, errorData){
                        alert("error code: " + request.status + "\n"
                              +"message: " + request.responseText
                              +"error: " + errorData);
                     }  
        		})
        		
        		}
        		
        	})
        	
        
        </script>
        <script>
            
            
            $(document).on("click","#applyProjectBtn",function(){
            	//(기본).로그인은 했는지? 0.이미 지원한 프로젝트인지? 1.신고가 3번 이상인지? 2. 임시저장된 지원서가 있는지? 3.날인이 되어있는지?
            	//통과하면, 프로젝트 아이디와, 작성자의 id를 넘기자
            	
            	var pId="${detail.pId}";
        		var memId="${loginUser.memId}";
        		var page="${page}";
        		
        		if(memId==""){
        			
        			location.href="loginpage.do";
        			
        		}else{
        			
        			
        			var applyCount;
        			var decCount;
        			var tempCount;
        			var sigCount;
        			var matchCount;
        			var tempId;
        			var agree=false;
        			
        			//정보를 한 번에 가져오자
        			$.ajax({
        			
        				url:"checkThisApply.do",
        				data:{memId:memId,pId:pId},
        				dataType:"json",
        				success:function(data){
        					
        					applyCount=data.applyCount;
        					decCount=data.decCount;
        					tempCount=data.tempCount;
        					sigCount=data.sigCount;
        					matchCount=data.matchCount;
        					
        					console.log("applyCount"+applyCount);
        					console.log("decCount"+decCount);
        					console.log("tempCount"+tempCount);
        					console.log("sigCount"+sigCount);
        					console.log("matchCount"+matchCount);
        					
        					if(applyCount!=0){
        						confirm("이미 지원한 프로젝트 입니다.");
        						return;
        					}
        					
        					if(decCount>2){
        						alert("누적 신고 횟수가 3회를 초과하여 지원할 수 없습니다.");
        						return;
        					}
        					
        					if(tempCount!=0){
        						tempId=data.tempId;
        						agree=confirm("임시저장된 지원서가 있습니다. 계속 작성하시겠습니까?");
        						
        						if(agree){
        							location.href="loadTempApplication.do?pId="+pId+"&aId="+tempId;
        							return;
        							
        						}else{
        							return;
        						}
        						
        					}
        					
        					if(sigCount==0){
        						alert("날인 등록을 한 사용자만 지원할 수 있습니다.");
        						return;
        					}
        					
        					if(matchCount!=0){
        						
        						confirm("클라이언트가 지원서를 승인하였습니다.");
        						return;
        						
        					}
        					
        					//위의 모든 조건을 통과해야 지원할 수 있다.
        					location.href="applyThisProject.do?pId="+pId+"&page="+page;
        					
        				},
        				error:function(request, status, errorData){
                            alert("error code: " + request.status + "\n"
                                  +"message: " + request.responseText
                                  +"error: " + errorData);
                         }  
        				
        				
        			})
        			
        			
        			
        			
        			
        		}
        		
        		
            })
        </script>
        <!--Grid column 사이드바 column 끝-->


        <div class="col-md-2 mb-4" style="text-align: center;">
          
        </div>

      </div>
      <!--row 끝 왼/중/오-->


    </div>
    <!--컨테이너 끝-->

    
  </main>
  <!--Main layout 끝-->
  
  <jsp:include page="../../common/footer.jsp"></jsp:include>
  
  
  

</body>
</html>