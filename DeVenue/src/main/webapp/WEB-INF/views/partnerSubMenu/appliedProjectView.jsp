<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>서브메뉴-지원한 프로젝트</title>

<style>
   

    /*body 색상*/
    main {
      background-color: #212529;
      color: white;
    }
   

      /*프로젝트 list*/

     #projectList{
         margin-top: 1rem;
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
        background-color: gray;
      }

      #projectList .card a{
        color: white;
        text-decoration: none;
      }

      #projectList .card a:hover{
        color:#2793F2
      }

      

      /*프로필*/

      #sidebar_partner_profile{
          padding: 1rem;
          border:solid 1px #2793F2;
          border-radius: 0.25rem;
      }

      #sidebar_partner_profile .row{
          margin-top: 1rem;
      }

      #sidebar_partner_profile .row:first-child{
          border-bottom: 1px dashed white;
      }

      #sidebar_partner_profile .col-md-3>i{
          margin-left: 0.5rem;
      }

      #sidebar_partner_profile div p{
        font-size: 0.75rem;
        margin-bottom: 0;
      }

      /*서브메뉴*/
      #sidebar_subMenu{
          margin-top: 2rem;
          border:solid 1px #2793F2;
          border-radius: 0.25rem;
      }

      #sidebar_subMenu>div{
         margin-bottom: 1rem;
         margin-top: 1rem;
         margin-left: 0.1rem;
         margin-right: 0.1rem;
      }

      #sidebar_subMenu div>button:first-child{
        margin-bottom: 1rem;
      }

      /*헤더 타이틀*/

      #subMenu_header{
          margin: 0;
      }

      .checkbox>div{
          display: inline-block;
      }

      /*검색*/

      #subMenu_search_div>div>button:last-child{
          width: 6rem;
      }

      #subMenu_search_category>button{
          text-align: right;
          width: 10rem;
      }

      #subMenu_search_category>div>button{
          text-align: center;
          width: 8rem;
      }

      /*프로젝트 리스트 아이템*/
   
      
      #projectList_items>div{
        margin-bottom: 2rem;
      }
    

      #projectList_items table td{
       
        padding-right: 1rem;
        
      }

      #projectList_items table i{
        font-size: 0.625rem;
        position: relative;
        bottom: 0.1rem;
        margin-right: 0.5rem;
        
      }

      #projectList_items table strong{
        margin-left: 1rem;
        
      }

      /* 삭제*/
      .applyCancel{
          position: relative;
          bottom:0.5rem;
          margin-bottom: 1rem;

      }

      .applyCancel>i{
          font-size:0.75rem;
      }

      .applyCancel>i:hover{
         color: #2793F2;
      }

      /*페이지네이션*/
      #pagination{
        border-top: 1px dashed white;
      }

      #pagination>div{
        margin-top: 1rem;
      }
      
       /*자원서*/
      .modal-title, .modal-body{
        color:black
      }

      .modal-body div ul{
        padding-left: 0;
        list-style-type: none;
      }


  </style>


</head>
<body>

<jsp:include page="../common/menubar.jsp"></jsp:include>


<!--Main layout-->

  <main>

      <div class="row mt-3">

        <div class="col-md-2 mb-4" style="text-align: center;">
         
        </div>
        <!--Grid column 시작-->
        <div class="col-md-2 mb-4 mt-5">

          <!-- Section: 프로필 시작 -->

          <section id="sidebar_partner_profile">

            <div class="row">
                <div class="col-md-12">
                   <h6 class="float-left">파트너스</h6><a class="float-right mt-1" href="#" style="font-size: 0.625rem;">기본 정보 수정하기></a> 
                </div>
            </div>

            <div class="row">
                <div class="col-md-3">
                    <i class="fas fa-user-circle fa-2x"></i>
                </div>
                <div class="col-md-9">
                    <p>${loginUser.memNick}</p>
                    <p>${loginUser.memEmail}</p>
                </div>
            </div>

            
          </section>

          <section id="sidebar_subMenu">

            <div class="row">
                <div class="col-md-12">
                    <button class="btn btn-secondary btn-block" id="showApplyList">지원완료 프로젝트</button> 
                    <button class="btn btn-info btn-block" id="showTempApplyList">임시저장 프로젝트</button> 
                </div>
            </div>

            
          </section>
          <script>
          $(function(){
        	  
        	  $("#showApplyList").click(function(){
        		  location.href="selectApplyProject.do";
        	  });
        	  
        	  
        	  $("#showTempApplyList").click(function(){
        		  location.href="selectTempApplicationList.do";
        	  });
          })
          	
          </script>
          <!-- Section: Sidebar의 끝 -->

        </div>
        <!--Grid column 사이드바 column 끝-->

        <!--Grid column 프로젝트 리스트 시작-->
        <div class="col-md-6 mb-4 mt-5">

          <!-- 프로젝트 header 타이틀&검색 Section: Block Content -->
          <section>
          <div id="subMenu_header" class="row">
            
            <div class="col-md-12 mt-3">
            <h4>지원 완료 프로젝트</h4>
            <div class="checkbox">
            <div class="custom-control custom-radio">
                <input type="radio" name="sorting" class="custom-control-input" id="sorting_recent">
                <label class="custom-control-label" for="sorting_recent">최신 순</label>
            </div>
            <div class="custom-control custom-radio">
                <input type="radio" name="sorting" class="custom-control-input" id="sorting_price">
                <label class="custom-control-label" for="sorting_price">금액 오름차순</label>
            </div>
            <div class="custom-control custom-radio">
                <input type="radio" name="sorting" class="custom-control-input" id="sorting_endday">
                <label class="custom-control-label" for="sorting_endday">마감일 임박 순</label>
              </div>

            </div>
            </div>
          </div>

          <div id="subMenu_search" class="row">

            <div class="col-md-9 mt-3">
                <div class="input-group mb-3 pl-3" id="subMenu_search_div">
                    <div class="input-group-prepend" id="subMenu_search_category">
                      <button class="btn btn-outline-info dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">전체</button>
                      <div class="dropdown-menu">
                        <a class="dropdown-item">전체</a>
                        <a class="dropdown-item">제목</a>
                        <a class="dropdown-item">관련기술</a>
                        <a class="dropdown-item">프로젝트내용</a>
                      </div>
                    </div>
                    <input type="text" class="form-control" aria-label="Text input with dropdown button">
                    <div class="input-group-append">
                        <button class="btn btn-info" type="button" id="button-addon2">검색</button>
                    </div>
                  </div>

            </div>
            <div class="col-md-3">

            </div>

          </div>

          </section>
          <script>

              $("#subMenu_search_category").children().children("a").click(function(){

                  var selected=$(this).text();
                  $(this).parent().parent().children("button").text(selected);
              })

          </script>
          <!-- 프로젝트 header 타이틀&검색 Section: Block Content  -->

          <!--Section: Block Content 프로젝트 리스트 시작-->
           
          <section id="projectList">

            <div class="mx-2" id="projectList_items">
            
            <c:forEach items="${apply}" var="apply">
            
            	<c:url var="pdetail" value="searchProjectDetail.do">
            	<c:param name="id" value="${apply.pList.id}"/>
            	<c:param name="page" value="${pi.currentPage}"/>
            	<c:param name="mCategory" value="${apply.pList.mCategory}"/>
            	<c:param name="dCategory" value="${apply.pList.dCategory}"/>
            	</c:url>
            
            
                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-body">
                              <div class="row">
                                <div class="col-md-9">
                                  <div class="d-inline-block mb-2">
                                       <c:choose>
				                       	<c:when test="${apply.pList.project.proRecruit eq 'Y'}">
				                       		<span class="badge badge-secondary">모집중</span>
				                       	</c:when>
				                       	<c:when test="${apply.pList.project.proRecruit eq 'N'}">
				                       		<span class="badge badge-success">모집마감</span>
				                       	</c:when>
				                       </c:choose>
				                       
				                        <jsp:useBean id="today" class="java.util.Date"/>
				                       <jsp:useBean id="aweekAgo" class="java.util.Date"/>
				                       <jsp:setProperty property="time" name="aweekAgo" value="${today.time-(1000*60*60*24*7)}"/>
				                       <fmt:formatDate value="${today}" pattern="yyyyMMdd" var="now"/>
				                       <fmt:formatDate value="${aweekAgo}" pattern="yyyyMMdd" var="ago"/>
				                       <fmt:formatDate value="${apply.pList.project.proCreateDate}" pattern="yyyyMMdd" var="cdate"/>
				                       
				                       <c:if test="${cdate eq now}">
				                       		<span class="badge badge-info">TODAY</span>
				                       </c:if>
				                       <c:if test="${cdate lt now}">
				                       		<c:if test="${cdate gt ago}">
				                       		<span class="badge badge-info">NEW</span>
				                       		</c:if>
				                       </c:if>  
				                       
                                  </div>
                                  <h5 class="card-title"><a href="${pdetail}">${apply.pList.project.proName}</a></h5>
                                  <table>
                                    <tr>
                                      <td><i class="fas fa-won-sign"></i>예상금액<strong>
                                      <fmt:setLocale value="ko"/><fmt:formatNumber value="${apply.pList.project.proPayment}" type="currency"/>
                                      </strong>원</td>
                                      <td><i class="far fa-circle"></i>예상기간<strong>${apply.pList.project.proDuration}</strong>일</td>
                                    </tr>
                                  </table>
                                  <table>
                                    <tr>
                                      <td><i class="far fa-circle"></i>${apply.pList.mCategory}</td>
                                      <td><i class="far fa-circle"></i>${apply.pList.dCategory}</td>
                                      <td><i class="fas fa-map-marker-alt"></i>${apply.pList.project.proLocation}</td>
                                    </tr>
                                    <tr>
                                    	<td colspan="3"><i class="far fa-circle"></i>지원날짜:${apply.applyDate}</td>
                                    </tr>
                                  </table>
                                </div>
                                <div class="col-md-3">
                                  <c:set var="aId" value="${apply.aId}" />
                                  <div class="applyCancel" onclick="cancelation(${aId});"><i class="fas fa-times float-right">삭제</i></div>
                                  <button type="button" class="btn btn-info btn-block" onclick="location.href='${pdetail}'">상세보기</button>
                                  <button type="button" class="btn btn-outline-info btn-block" onclick="popApplyModal(${aId})">지원서보기</button>
                                  <button type="button" class="btn btn-danger btn-block" onclick="cancelation(${aId});">지원취소</button>
                                </div>
                              </div>
                            </div>
                          </div>
                    </div>
                    
                </div>
                
			</c:forEach>
            </div>
          </section>
           <!--Section: Block Content 프로젝트 리스트 끝-->
           
           <script>
           //지원서 보기 클릭 시 모달에 내용을 채워넣어야 한다.
          
           
           function popApplyModal(aId){
        	   
        	   var aId=aId;
        	   
        	   var aPayment;
        	   var aDuration;
        	   var aContent;
        	   
        	   
        	   var originalResume;
        	   var reNameResume;
        	   var answer;
        	   var portfolio;
        	   
        	   var $qnaDiv=$("#applyQnA");
        	   
        	   var $question=$("<div>").addClass("applyQuestion");
        	   var $icon=$("<i>").addClass("fas fa-question float-left mt-1").css("color","#2793F2");
        	   var $p=$("<p>");
        	   
        	   var $answer=$("<div>").addClass("applyAnswer");
        	   var $textarea=$("<textarea>").attr("maxlength","10").attr("rows","3").addClass("form-control apply_answer_textarea").css("width","100%").attr("readonly",true).attr("name","aaContent")
        	   var $br=$("<br both='clear'>")
        	   
        	   
        	   var $pofoDiv=$("#pofoDiv");
        	   var $portList=$("#portList");
        	   var $ul=$("<ul>");
        	   var $li=$("<li>");
        	   
        	   var $resumeList=$("#resumeList");
        	   var $rul=$("<ul>");
        	   var $rli=$("<li>");
        	   var $rp=$("<p>");
        	   var $ra=$("<a>")
        	  	 
        	   
        	   <c:forEach items="${apply}" var="a">
        	   
        	  if(${a.aId}==aId){
        		  
        		  aPayment=${a.aPayment};
        		  aDuration=${a.aDuration};
        		  aContent="${a.aContent}";
        		  originalResume="${a.originalResume}";
        		  reNameResume="${a.reNameResume}";
        		  answer="${a.answer}";//배열
        		  portfolio="${a.portfolio}";//배열
        		  
        		  $("#nego_price_input").val(aPayment);
        		  $("#duration").val(aDuration);
        		  $("#apply_textarea").val(aContent);
        		  
        		  $qnaDiv.html("");
        		  
        		 <c:if test="${not empty a.answer}">
        		 	
        		 //answer가 있다면,
        		 <c:forEach items="${a.answer}" var="an">
        		 
        		 $p.text("${an.aqContent}");
        		 $question.append($icon);
        		 $question.append($p);
        		 
        		 $textarea.val("${an.aaContent}");
        		 $answer.append($textarea);
        		 $qnaDiv.append($question);
        		 $qnaDiv.append($answer);
        		 $qnaDiv.append($br);
        		 
        		 
        		 </c:forEach>
        		 
        		 
        		 
        		 </c:if>
        		 
        		 //answer가 없다면
        		 <c:if test="${empty a.answer}">
        		 $p.text("등록된 질문과 답변이 없습니다.");
         		 $qnaDiv.append($p);
         		  
        		 </c:if>
        		 
        		 $portList.html("");
        		 
        		 
        		 <c:if test="${not empty a.portfolio}">
        		 
        		 //포트폴리오가 있다면,
        		 //리스트 출력 + 추후에 포트폴리오 디테일로 연결되도록 추가
        		 <c:forEach items="${a.portfolio}" var="po">
        		 
        		 $span1=$("<span>").text("${po.portfolio.portName}");
        		 $span2=$("<span>").text("참여도:${po.portfolio.portJoin}");
        		 $span3=$("<span>").text("기간:${po.portfolio.startDate}~${[po.portfolio.endDate]}")
        		 
        		 $li.append($span1);
        		 $li.append($span2);
        		 $li.append($span3);
        		 $ul.append($li);
        		 
        		 </c:forEach>
        		 
        		 $portList.append($ul);
        		 $("#portfolio_describe_textarea").val("${a.portfolio[0].apContent}");
        		 
        		 
        		 </c:if>
        		 
				<c:if test="${empty a.portfolio}">
        		 
        		 //포트폴리오가 없다면,
        		 $pofoDiv.html("");
        		 $row=$("<div>").addClass("row");
      			 $col=$("<div>").addClass("col-md-12");
      			 $label=$("<label>").text("제출한 포트폴리오가 없습니다.");
        		 
      			 $col.append($label);
      			 $row.append($col);
      			 $pofoDiv.append($row);
        		 
        		 </c:if>
        		 
        		 $resumeList.html("");
        		 
        		 //이력서가 있다면,
        		 <c:if test="${not empty a.originalResume}">
        		 
        		 $ra.attr("href","DeVenue/resources/resume/${a.reNameResume}").attr("download","${a.originalResume}").text("${a.originalResume}");
        		 $rli.append($ra);
        		 $rul.append($rli);
        		 $resumeList.append($rul);
        		 
        		 </c:if>
        		 
        		 //이력서가 없다면
        		 <c:if test="${empty a.originalResume}">
        		 
        		 $rp.text("제출한 이력서가 없습니다.");
        		 $resumeList.append($rp);
        		 
        		 
        		 </c:if>
        		  
        		  
        	  }
        	  
        	  
        	 
        	   </c:forEach>
        	  
        	   $('#applyModal').modal('show');
        	   
           };
           
           
           </script>
           
            <!--지원서 모달 시작-->
          <!-- Modal -->
          <div class="modal fade" id="applyModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
              <div class="modal-content">
                <div class="modal-header">
                  <h5 class="modal-title" id="exampleModalLabel">내가 작성한 지원서</h5>
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                  </button>
                </div>
                <div class="modal-body">
                  
                  <!--지원 양식 시작-->
                  <div class="row applicationForm">
                   
                        <div class="mt-4 col-md-12">
                            <h5>지원 금액</h5>
                            

                            <!--지원 금액 시작-->
                            <div class="nego price">
                                <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text" id="basic-addon1"><i
                                                class="fas fa-won-sign"></i></span>
                                    </div>
                                    <input id="nego_price_input" type="text" class="form-control"
                                         aria-label="Username" readonly 
                                        aria-describedby="basic-addon1">
                                   
                                </div>
                                <p style="color: grey;"><i class="fas fa-exclamation-triangle mr-2"></i>DEVENUE
                                    	이용요금은 5% 입니다.</p>
                            </div>
                            <!--지원 금액 끝-->

                        </div>

                        <!--지원 기간 시작-->
                        <div class="mt-5 col-md-12">
                            <h5>지원 기간</h5>
                           
                            <div id="calendarDisplay">
                                <input id="duration" type="text" class="form-control" readonly>
                            </div>
                          
                        </div>
                        <!--지원 기간 끝-->

                        <!--지원 내용 시작-->
                        <div class="mt-5 col-md-12" style="width: 100%;">
                            <h5>지원 내용</h5>
                            <p style="color: grey;"><i class="fas fa-exclamation-triangle mr-2"></i>
                                	이메일, 전화번호 등을 게시해 직거래를 유도하는 경우 서비스 이용에 제재를 받을 수 있습니다.</p>
                            <div>
                                <textarea id="apply_textarea" rows="10" class="form-control"
                                    style="width: 100%;" readonly></textarea>
                            </div>
                        </div>
                        <!--지원 내용 끝-->

                        <!--지원 전 질문 시작-->
                        <div class="mt-5 col-md-12" style="width:100%;">
                            <h5>지원 전 질문</h5>
                            
                            	<div id="applyQnA">
                                
				                </div>

                        </div>
                        
                        <!--지원 전 질문 끝-->

                        <!--포트폴리오 시작-->
                        <div class="mt-5 mb-5 col-md-12" style="width:100%;">
                            <h5>포트폴리오</h5>
                            
                            
                            <div class="row" id="portfolio_upload_detail">
                            	
                                <div class="col-md-12" id="pofoDiv">
                               
                                    <div class="row">
                                        <div class="col-md-12" id="portList">
                                            
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <h6>관련 포트폴리오 설명</h6>
                                            <div>
                                                <textarea id="portfolio_describe_textarea" class="form-control"
                                                    rows="10" maxlength="2000" readonly></textarea>
                                                
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                
                            </div>
                            
                        </div>
                        
                        <!--포트폴리오 끝-->

                        <!--이력서-->
                        <div class="mt-5 mb-5 col-md-12" style="width:100%;">
                            <h5>이력서(경력기술서)</h5>
							
                            <div class="row">
                                <div class="col-md-12" id="resumeList">
                                 
                                </div>
                            </div>
                            
                            </div>
         				</div>
                <!--지원 양식 끝-->

                </div>
                <div class="modal-footer">
                  <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
                </div>
              </div>
            </div>
          </div>
          <!--지원서 모달 끝-->
         
          <script>
          	//지원 취소 관련
          	
          	function cancelation(aId){
          		
				var aId=aId;
				var page=${pi.currentPage};
          		
      			var agree=false;
      			agree=confirm("지원을 취소하시겠습니까?");
      			
      			if(agree){
      				console.log(aId);
      				location.href="cancelThisApply.do?aId="+aId+"&page="+page;
      				
      			}
          	}
          	
             
          </script>
          <!--Section: Block Content project list 끝-->

          <!-- Section: Block Content 하단 페이지네이션 시작 -->
          <section class="mt-5 mb-5" id="pagination">

            <div class="row d-flex justify-content-around align-items-center">

              <!--페이지네이션-->
              <div class="col-12 col-md-4 text-center">
                <nav aria-label="Page navigation example">
                  <ul class="pagination justify-content-center mb-0 text-dark">
                    <c:if test="${pi.currentPage eq 1 }">
                    <li class="page-item"><a class="page-link"><i class="fas fa-chevron-left"></i></a></li>
                    </c:if>
                    <c:if test="${pi.currentPage gt 1}">
                    <c:url var="plistBack" value="likeProjectList.do">
                    	<c:param name="page" value="${pi.currentPage-1}"/>
                    </c:url>
                    <li class="page-item"><a class="page-link" href="${plistBack}"><i class="fas fa-chevron-left"></i></a></li>
                    </c:if>
                    
                    <c:forEach begin="${pi.startPage}" end="${pi.endPage}" step="1" var="pn">
                    <c:if test="${pi.currentPage eq pn}">
                    <li class="page-item active"><a class="page-link">${pn}</a></li>
                    </c:if>
                    <c:if test="${pi.currentPage ne pn}">
                    <c:url var="plistCheck" value="likeProjectList.do">
                    <c:param name="page" value="${pn}"/>
                    </c:url>
                    <li class="page-item"><a class="page-link" href="${plistCheck}">${pn}</a></li>
                    </c:if>
                    </c:forEach>
                   
                    <c:if test="${pi.currentPage eq pi.maxPage}">
                    <li class="page-item"><a class="page-link"><i class="fas fa-chevron-right"></i></a></li>
                  	</c:if>
                  	<c:if test="${pi.currentPage lt pi.maxPage}">
                  	<c:url var="plistFront" value="likeProjectList.do">
                    	<c:param name="page" value="${pi.currentPage+1}"/>
                    </c:url>
                    <li class="page-item"><a class="page-link" href="${plistFront}"><i class="fas fa-chevron-right"></i></a></li>
                  	</c:if>
                  </ul>
                </nav>
              </div>
            </div>

          </section>
          <!-- Section: Block Content 페이지 네이션 끝 -->

        </div>
        <!-- 프로젝트 리스트 column 끝-->


        <div class="col-md-2 mb-4" style="text-align: center;">
          
        </div>

      </div>
      <!--row 끝 왼/중/오-->


   
    <!--컨테이너 끝-->

   
  </main>
  <!--Main layout-->


<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>