<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
        display: none;
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

<jsp:include page="../common/menubar.jsp"></jsp:include>


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
                <span class="badge badge-secondary">모집중</span>
                <span class="badge badge-success">모집마감</span>
                <span class="badge badge-info">NEW</span>
            </div>
            <div class="col-md-6">
                <div class="float-right">
                <label class="text-muted">등록일자:</label>
                <label class="text-muted">2020-08-06</label>
                </div>
            </div>
        </div>
         <!--모집상태, 등록일자 끝-->
         
         <!--프로젝트명 시작-->
         <div class="row mt-3">
             <div class="col-md-12">
                <h4>웹 내 신규 컨텐츠 및 동영상 서비스 추가 디자인 및 개발</h4>
             </div>
         </div>
         <!--프로젝트명 끝-->

         <!--카테고리 시작-->
         <div class="row mt-3">
             <div class="col-md-12">
                 <table>
                     <tr>
                         <td><span class="badge badge-info">외주(도급)</span></td>
                         <td style="border-right: 1px dashed white;"><label class="ml-2 mr-2 mt-2">개발+디자인</label></td>
                         <td><label class="ml-2 mt-2">애플리케이션</label></td>
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
                      <p class="card-text float-right"><strong>7,000,000</strong>원</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card">
                    <div class="card-body">
                     <p class="card-title float-left"> <i class="far fa-clock mr-2"></i>예상기간</p>
                     <p class="card-text float-right"><strong>30</strong>일</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card">
                    <div class="card-body">
                      <p class="card-title float-left"><i class="far fa-user mr-2"></i>지원자 수</p>
                      <p class="card-text float-right"><strong>0</strong>명</p>
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
                         <td>2020-08-21
                             <span>*마감<strong>13</strong>일 전</span>
                         </td>
                     </tr>
                     <tr>
                        <td>예상시작일</td>
                        <td>2020-08-24</td>
                    </tr>
                    <tr>
                        <td>진행분류</td>
                        <td>운영 중인 서비스의 리뉴얼 또는 유지보수를 하려 합니다.</td>
                    </tr>
                    <tr>
                        <td>기획상태</td>
                        <td>50%
                            <span>*화면설계서(스토리보드,와이어프레임)</span>
                        </td>
                    </tr>
                    <tr>
                        <td>매니징경험</td>
                        <td>프로젝트 매니징 경험 있음</td>
                    </tr>
                    <tr>
                        <td>인력상황</td>
                        <td>IT 프로젝트 경험 있는 인력 있음
                            <span>*협력 가능 인력(기획자)</span>
                        </td>
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
                    <p>기 운영 중인 홈페이지 내 신규 컨텐츠와 회원 전용 동영상 서비스 추가</p>
                </div>

                <!--프로젝트 우선순위-->
                <div>
                    <label class="text-muted">프로젝트 우선순위:</label>
                    <p>빠르게 지원자가 발생하는 것이 가장 중요</p>
                </div>

                <!--현재 준비 상황-->
                <div>
                    <label class="text-muted">현재 준비 상황:</label>
                    <div class="project_plan_progress" style="width: 20rem;">
                        <div class="progress mt-1">
                          <div class="progress-bar bg-info" role="progressbar" style="width: 50%" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100">
                            50%
                          </div>
                        </div>
                        <p>프로젝트 전반이 기획되었습니다.</p>
                    </div>
                </div>

                <!--필요요소-->
                <div>
                    <label class="text-muted">필요 요소:</label>
                    <p>신규 컨텐츠 3페이지 추가 디자인 및 개발</p>
                    <p>신규 컨텐츠 3페이지 추가 디자인 및 개발</p>
                    <p>신규 컨텐츠 3페이지 추가 디자인 및 개발</p>
                </div>

                <!--개발환경/언어/방식-->
                <div>
                    <label class="text-muted">개발환경/언어/방식:</label>
                    <p>OS:Ubuntu18.04</p>
                    <p>WebServer:Apache 2.4</p>
                    <p>WebServer:PHP7.4</p>
                    <p>DBMS:MariaDB</p>
                    <p>Web Framework:Laravel</p>
                </div>

                <!--주요기능List/주요화면List/메뉴구성/요구사항등-->
                <div>
                    <label class="text-muted">주요 기능List/주요 화면List/메뉴 구성/요구 사항 등:</label>
                    <p>신규 컨텐츠 3페이지 추가</p>
                    <p>동영상 서비스 제공 페이지</p>
                    <p>반응형으로 제작</p>
                    <p>작업물을 GitHub에 업로드해야 함</p>
                </div>

                <!--관련기술-->
                <div>
                    <h6 style="color: #2793F2;">관련 기술</h6>
                    <div class="techList">
                        <span class="badge badge-pill badge-secondary">PHP</span>
                        <span class="badge badge-pill badge-secondary">SERVER</span>
                        <span class="badge badge-pill badge-secondary">MariaDB</span>
                        <span class="badge badge-pill badge-secondary">backoffice</span>
                        <span class="badge badge-pill badge-secondary">responsiveweb</span>
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
                <p><i class="fas fa-check mr-2" style="color: #2793F2;"></i><strong>법인사업자</strong></p>
                <p><i class="fas fa-plus mr-2"></i><label>향후 유지보수, 고도화를 위한 아웃소싱 계획이 있습니다.</label></p>
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
                    <i class="fas fa-question float-left mr-2 mt-1" style="color: #2793F2;"></i><p>프로젝트 협업 툴?</p>
                    <i class="fas fa-question float-left mr-2 mt-1" style="color: #2793F2;"></i><p>서버 개발 경험 유무?</p>
                </div>

            </div>
        </div>
        <!--지원 전 질문 끝-->


        <!--프로젝트 문의시작-->
        <div class="row mt-5 projectDetail partnerQuestion">
            <div class="mt-2 col-md-12">
                <h5>프로젝트 문의<span class="badge badge-info">5</span></h5>

                <div id="partnerQuestion_list">

                   
                        <div class="card question">
                            <div class="card-body">
                              <div class="card-title">
                                <i class="fas fa-user-circle"></i>
                                <label>닉네임</label>
                                <div class="float-right">
                                    <a class="replyModify mr-2">수정</a>
                                    <a class="replyCancel"><i class="fas fa-times"></i></a>
                                </div>
                            </div>
                                
                              <p class="card-text">댓글내용댓글내용댓글내용</p>
                              <p class="text-muted">2020-08-07</p>
                            </div>
                            <div class="card-footer">
                                <a>답글<strong>1</strong>개</a>
                            </div>
                        </div>
                        <div class="answerList">
                            <div class="card answer">
                            <div class="card-body">
                                <div class="card-title">
                                    <i class="fas fa-user-circle"></i>
                                    <label>닉네임</label>
                                    <div class="float-right">
                                        <a class="replyModify mr-2">수정</a>
                                        <a class="replyCancel"><i class="fas fa-times"></i></a>
                                    </div>
                                </div>
                                <p class="card-text">댓글내용댓글내용댓글내용</p>
                                <p class="text-muted">2020-08-07</p>
                              </div>
                              <div class="card-footer">
                                <a>답글쓰기</a>
                            </div>
                            </div>

                            <div class="card answer">
                                <div class="card-body">
                                    <div class="card-title">
                                        <i class="fas fa-user-circle"></i>
                                        <label>닉네임</label>
                                        <div class="float-right">
                                            <a class="replyModify mr-2">수정</a>
                                            <a class="replyCancel"><i class="fas fa-times"></i></a>
                                        </div>
                                    </div>
                                    <p class="card-text">댓글내용댓글내용댓글내용</p>
                                    <p class="text-muted">2020-08-07</p>
                                  </div>
                                  <div class="card-footer">
                                    <a>답글쓰기</a>
                                </div>
                                </div>
                        </div>

                </div>

                <div id="partnerQuestion_compose">

                    <div class="card reply">
                        <div class="card-header">
                            <i class="fas fa-user-circle"></i>닉네임
                        </div>
                        <div class="card-body">

                            <div class="form-group">
                                <textarea class="form-control" id="exampleFormControlTextarea1" rows="3" maxlength="2000" placeholder="프로젝트 문의를 2000자 이내로 작성해주세요."></textarea>
                            </div>
                          
                            <div class="card-text">
                               <ul>
                                   <li>
                                       	이메일, 전화번호 등을 게시하여 직거래를 유도할 경우 서비스 이용에 제재를 받을 수 있습니다.
                                   </li>
                               </ul>
                            </div>
                         
                        </div>
                        <div class="card-footer text-muted">
                            <div class="form-check float-left">
                                <input class="form-check-input" type="checkbox" value="" id="reply_private">
                                <label class="form-check-label text-white" for="reply_private">
                                  	비밀글
                                </label>
                              </div>

                          <button class="btn btn-info float-right">작성하기</button>
                        </div>
                      </div>
                </div>
            </div>


        </div>
        <script>
            //답글 클릭
            $(".card-footer>a").click(function(){
                
                var answer=$(this).parent().parent().parent().children().eq(1);

                if(answer.css("display")=="none"){
                    answer.css("display","block");
                }else{
                    answer.css("display","none");
                }
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
                    <div class="candidate_item">
                   
                    <div class="row mb-2 mx-auto" style="width: 100%;">
                        <div class="col-md-12 px-0">
                        <div class="card flex-md-row mb-4 box-shadow h-md-250">
                            <div class="card-body d-flex flex-column align-items-start">

                            <!--배지-->
                            <strong class="d-inline-block mb-2 text-primary">
                                <span class="badge badge-secondary">모집중</span>
                                <span class="badge badge-success">모집마감</span>
                                <span class="badge badge-info">NEW</span>
                            </strong>

                            <!--프로젝트명과 관심추가 버튼-->
                            <div style="width:100%;">
                            <h3 class="mb-0 float-left">
                                <a href="#">프로젝트명</a><a class="btn" data-toggle="tooltip" data-placement="right" title="이 프로젝트의 클라이언트는 신원인증을 완료했습니다."><i class="far fa-check-circle"></i></a>
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
                                <div class="progress-bar bg-info" role="progressbar" style="width: 50%" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100">
                                    50%
                                </div>
                                </div>
                            </div>

                            <!--요약내용-->
                            <div class="row mt-3 mb-3" style="width: 100%;">
                                <div class="col-md-9">
                                <table style="width:80%;height: 100%;">
                                    <tr>
                                    <td style="border-right:dashed 1px white"><label class="mr-3">예상 금액</label><label>10,000</label><label>원</label></td>
                                    <td><label class="ml-3">개발+디자인</label></td>
                                    </tr>
                                    <tr>
                                    <td style="border-right:dashed 1px white"><label class="mr-3">예상 기간</label><label>10</label><label>일</label></td>
                                    <td><label class="ml-3">애플리케이션</label></td>
                                    </tr>
                                </table>
                                </div>
                                <div class="col-md-3">
                                
                                    <div class="mt-3" style="text-align: right;">
                                        <i class="fas fa-history mr-3"></i><label>마감</label><label>7</label><label>일 전</label>
                                    </div>
                                    
                                    <div style="text-align: right;">
                                        <i class="fas fa-user mr-3"></i><label>총</label><label>8</label><label>명 지원</label>
                                    </div>
                                
                                </div>

                            </div>

                            <!--세부내용-->
                            <div class="row mb-3" style="width: 100%; height: 100%;">
                                <div class="col-md-9">
                                <div class="card-text mb-4" style="font-size:0.875rem;">
                                    <label>프로젝트 개요</label>
                                    <p>프로젝트 개요에 대한 내용이 적힐 부분, 전체가 출력되는 것은 아니고 글자 수를 100자 이하로 제한해야 한다.</p>
                                </div>
                                <table style="width:100%; height: 20px;">
                                    <tr>
                                    <td style="border-right: 1px dashed white;width:20%;">
                                        <span class="badge badge-info">외주(도급)</span>
                                    </td>
                                    <td style="border-right: 1px dashed white;width: 40%;padding-left: 1rem;">
                                        <a href="#" class="badge badge-secondary">JAVA</a>
                                        <a href="#" class="badge badge-secondary">ORACLE</a>
                                        <a href="#" class="badge badge-secondary">HTML5</a>
                                    </td>
                                    <td style="width: 10%;padding-left:1rem;padding-top:0.375rem;font-size: 0.875rem;">
                                        <i class="fas fa-map-marker-alt mr-2"></i><label>서울</label>
                                    </td>
                                    <td style="width: 30%;font-size: 0.875rem;">
                                        <label class="mt-2 mr-2 ml-4 text-muted">등록일자:</label><label class="text-muted">2020-08-06</label>
                                    </td>
                                    </tr>
                                </table>

                                </div>
                                <div class="col-md-3" style="height: 100%;border-top: 1px dashed white;">

                                <div class="mt-5" style="text-align: right;">
                                    <i class="far fa-comment-dots mr-1"></i><label>7</label>
                                    <i class="far fa-heart mr-1"></i><label>8</label>
                                </div>
                                
                                
                                </div>
                            </div>
                            


                            </div>
                        
                        </div>
                        </div>
                    </div>



                   
                </div>
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
                
                <button type="button" class="btn btn-info btn-lg btn-block mt-3" id="applyProjectBtn">프로젝트 지원하기</button>
                <button type="button" class="btn btn-outline-light btn-lg btn-block mt-3 mb-3">관심 프로젝트 등록</button>
                <div style="width: 100%; border-top: 1px solid white;"></div>
                <div style="text-align: center;" id="likedNum">
                    <i class="far fa-heart"></i> <strong>5</strong>
                </div>

            </div>

            <div class="ml-3" id="clientProfile">
                <div class="row">
                    <div class="col-md-12">
                        <i class="far fa-user-circle fa-2x mr-2"></i><label>닉네임</label><span class="badge badge-info ml-2">클라이언트</span>
                    </div>
                    <div class="col-md-12" id="clientInfo">
		                        공학 기술을 IT 기술과 접목하여 공학솔루션 개발 및 전문가 시스템 구축, 컨설팅에 이르기까지 산업 현장에서 필요로 하는
		                        전문화된 시스템 개발, 공급하는 안전 종합 IT 서비스 회사입니다.
                    </div>

                    <div class="col-md-12 mt-3" id="clientRate">
                        <div>
                        <span class="fa fa-star checked"></span>
                        <span class="fa fa-star checked"></span>
                        <span class="fa fa-star checked"></span>
                        <span class="fa fa-star"></span>
                        <span class="fa fa-star"></span>
                        <label>0.0</label><label>(0)</label>
                        </div>
                    </div>

                    <div class="col-md-12 mt-3" id="clientHistoryList">
                        <ul>
                            <li>프로젝트 등록<strong>1</strong>건</li>
                            <li>계약한 프로젝트<strong>2</strong>건
                                <ul>
                                    <li>진행중인 프로젝트<strong>1</strong>건</li>
                                    <li>완료한 프로젝트<strong>0</strong>건</li>
                                </ul>
                            </li>
                            <li>프로젝트 계약률<strong>0</strong>%</li>
                            <li>누적완료금액<strong>0</strong>만원</li>
                        </ul>

                    </div>
                </div>

            </div>
            </div>
            
        </div>
        <script>
            //지원하기 조건 제한 : 임시저장 여부/날인 여부/신고 여부
            $("#applyProjectBtn").click(function(){
                alert("1.신고 3번 이상? 2.임시 저장? 3.날인 여부?")
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
  
  <jsp:include page="../common/footer.jsp"></jsp:include>
  
  
  

</body>
</html>