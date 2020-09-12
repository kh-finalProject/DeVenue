<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>진행중 프로젝트</title>

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

      /*관심*/
      #projectList .fa-heart-o {
        color: pink;
        cursor: pointer;
      }

      #projectList .fa-heart {
        color: pink;
        cursor: pointer;
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

      /*프로젝트 리스트*/
   
      
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

      /*페이지네이션*/
      #pagination{
        border-top: 1px dashed white;
      }

      #pagination>div{
        margin-top: 1rem;
      }


  </style>


</head>
<body>

<jsp:include page="../common/menubar.jsp"></jsp:include>
<jsp:include page="../common/pSubMenubar.jsp"></jsp:include>


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
                   <button class="btn btn-secondary btn-block">전체 프로젝트</button>  
                </div>
            </div>

            
          </section>
          <!-- Section: Sidebar의 끝 -->

        </div>
        <!--Grid column 사이드바 column 끝-->

        <!--Grid column 프로젝트 리스트 시작-->
        <div class="col-md-6 mb-4 mt-5">

          <!-- 프로젝트 header 타이틀&검색 Section: Block Content -->
        <section>
          <form action="ongoingProjectList.do">
          <div id="subMenu_header" class="row">
            
            <div class="col-md-12 mt-3">
            <h4>진행중인 프로젝트</h4>
            <div class="checkbox">
            <c:if test="${not empty sorting}">
            <c:choose>
            <c:when test="${sorting eq 'CDATE'}">
             <div class="custom-control custom-radio">
                <input type="radio" name="sorting" class="custom-control-input" id="sorting_recent" value="CDATE" checked>
                <label class="custom-control-label" for="sorting_recent">최신 순</label>
            </div>
            </c:when>
            <c:otherwise>
             <div class="custom-control custom-radio">
                <input type="radio" name="sorting" class="custom-control-input" id="sorting_recent" value="CDATE">
                <label class="custom-control-label" for="sorting_recent">최신 순</label>
            </div>
            </c:otherwise>
            </c:choose>
            
            <c:choose>
            <c:when test="${sorting eq 'PAYMENT'}">
             <div class="custom-control custom-radio">
                <input type="radio" name="sorting" class="custom-control-input" id="sorting_price" value="PAYMENT" checked>
                <label class="custom-control-label" for="sorting_price">금액 내림차순</label>
            </div>
            </c:when>
            <c:otherwise>
             <div class="custom-control custom-radio">
                <input type="radio" name="sorting" class="custom-control-input" id="sorting_price" value="PAYMENT">
                <label class="custom-control-label" for="sorting_price">금액 내림차순</label>
            </div>
            </c:otherwise>
            </c:choose>
            
            <c:choose>
            <c:when test="${sorting eq 'RENDDATE'}">
             <div class="custom-control custom-radio">
                <input type="radio" name="sorting" class="custom-control-input" id="sorting_endday" value="RENDDATE" checked>
                <label class="custom-control-label" for="sorting_endday">예상기간 내림차순</label>
              </div>
            </c:when>
            <c:otherwise>
             <div class="custom-control custom-radio">
                <input type="radio" name="sorting" class="custom-control-input" id="sorting_endday" value="RENDDATE">
                <label class="custom-control-label" for="sorting_endday">예상기간 내림차순</label>
              </div>
            </c:otherwise>
            </c:choose>
			</c:if>
			
			<c:if test="${empty sorting}">
            <div class="custom-control custom-radio">
                <input type="radio" name="sorting" class="custom-control-input" id="sorting_recent" value="CDATE">
                <label class="custom-control-label" for="sorting_recent">최신 순</label>
            </div>
            <div class="custom-control custom-radio">
                <input type="radio" name="sorting" class="custom-control-input" id="sorting_price" value="PAYMENT">
                <label class="custom-control-label" for="sorting_price">금액 내림차순</label>
            </div>
            <div class="custom-control custom-radio">
                <input type="radio" name="sorting" class="custom-control-input" id="sorting_endday" value="RENDDATE">
                <label class="custom-control-label" for="sorting_endday">예상기간 내림차순</label>
              </div>
			</c:if>
			
            </div>
            </div>
          </div>

          <div id="subMenu_search" class="row">

            <div class="col-md-9 mt-3">
                <div class="input-group mb-3 pl-3" id="subMenu_search_div">
                    
                    <div class="input-group-prepend" id="subMenu_search_category">
                      <c:if test="${not empty search.category}">
                      <button id="searchCate" class="btn btn-outline-info dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">${search.category}</button>
                      </c:if>
                      <c:if test="${empty search.category}">
                      <button id="searchCate" class="btn btn-outline-info dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">전체</button>
                      </c:if>
                      
                      <div class="dropdown-menu">
                        <a class="dropdown-item">전체</a>
                        <a class="dropdown-item">제목</a>
                        <a class="dropdown-item">프로젝트내용</a>
                        <input type="hidden" id="hiddenCate" name="category">
                      </div>
                      
                    </div>
                    <c:if test="${empty search.keyword}">
                     <input type="text" name="keyword" class="form-control" aria-label="Text input with dropdown button">
                     </c:if>
                    <c:if test="${not empty search.keyword}">
                    <input type="text" name="keyword" class="form-control" aria-label="Text input with dropdown button" value="${search.keyword}">
                   </c:if>
                   
                    <div class="input-group-append">
                        <button class="btn btn-info" type="submit" id="searchBtn">검색</button>
                    </div>
                  </div>

            </div>
            <div class="col-md-3">

            </div>

          </div>

          </form>
          </section>
          <script>

              $("#subMenu_search_category").children().children("a").click(function(){

            	  var selected=$(this).text();
                  $(this).parent().parent().children("button").text(selected);
                  $("#hiddenCate").val(selected);
              })
              
              
              $(function(){
            	
            	  var sorting=$("input[name='sorting']");
            	  
            	  sorting.change(function(){
            		  //라디오 버튼이 클릭 되면 submit을 trigger한다.
            		  
            		  //검색값이 존재한다면,히든태그에 담아둔다.
            		  var keyword=$("#searchCate").val();
            		  $("#hiddenCate").val(keyword);
            		  
            		  
            		  $("#searchBtn").trigger("click");
            	  })
            	  
              })

          </script>
          <!-- 프로젝트 header 타이틀&검색 Section: Block Content  -->

          <!--Section: Block Content 프로젝트 리스트 시작-->
           
          <section id="projectList">

            <div class="mx-2" id="projectList_items">
            
            	<c:forEach items="${ongoing}" var="on">
            	
                <div class="row">
                    
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-body">
                              <div class="row">
                                <div class="col-md-9">
                                  <h5 class="card-title">${on.project.proName}</h5>
                                  <table>
                                    <tr>
                                      <td><i class="fas fa-won-sign"></i>예상금액<strong>
                                      <fmt:setLocale value="ko"/><fmt:formatNumber value="${on.project.proPayment}" type="currency"/>
                                      </strong>원</td>
                                      <td><i class="far fa-circle"></i>예상기간<strong>${on.project.proDuration}</strong>일</td>
                                    </tr>
                                  </table>
                                  <table>
                                    <tr>
                                      <td><i class="far fa-circle"></i>${on.mCategory }</td>
                                      <td><i class="far fa-circle"></i>${on.dCategory }</td>
                                      <td><i class="fas fa-map-marker-alt"></i>${on.project.proLocation }</td>
                                    </tr>
                                  </table>
                                </div>
                                <div class="col-md-3">
                                  <a type="button" class="btn btn-outline-secondary btn-block mt-4" href="/DeVenue/resources/contract/${on.project.proContract}" download>계약서보기</a>
                                </div>
                              </div>
                            </div>
                          </div>
                    </div>
                    
                </div>
                </c:forEach>
 

            </div>

          </section>
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