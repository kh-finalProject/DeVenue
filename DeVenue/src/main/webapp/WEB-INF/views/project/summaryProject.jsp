<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <style>
    li{
        list-style-type : none ;
      
    }
    body {
      font-family: 'Lato', 'Helvetica Neue', Helvetica, Arial, sans-serif;
    }

    h1,
    h2,
    h3,
    h4,
    h5,
    h6 {
      font-family: 'Lato', 'Helvetica Neue', Helvetica, Arial, sans-serif;
      font-weight: 700;
    }

    header.masthead {
      position: relative;
      background-color: #343a40;
      background: url("mainImg.jpg") no-repeat center center;
      background-size: cover;
      padding-top: 8rem;
      padding-bottom: 8rem;
      height: 50rem;
    }

    header.masthead .overlay {
      position: absolute;
      background-color: #212529;
      height: 100%;
      width: 100%;
      top: 0;
      left: 0;
      opacity: 0.3;
    }

    header.masthead h1 {
      font-size: 2rem;
    }

    @media (min-width: 768px) {
      header.masthead {
        padding-top: 12rem;
        padding-bottom: 12rem;
      }

      header.masthead h1 {
        font-size: 3rem;
      }
    }

    .showcase .showcase-text {
      padding: 3rem;
    }

    .showcase .showcase-img {
      min-height: 30rem;
      background-size: cover;
    }

    @media (min-width: 768px) {
      .showcase .showcase-text {
        padding: 7rem;
      }
    }

    footer.footer {
      padding-top: 4rem;
      padding-bottom: 4rem;
    }

    #navbarMain>ul>li>a {
      color: white;
    }

    #navbarMain>ul>li>a:hover {
      color: lightblue;
    }


    @import url('https://fonts.googleapis.com/css?family=Roboto');


    * {
      margin: 0;
      padding: 0;
    }

    i {
      margin-right: 10px;
    }

    /*------------------------*/

    /*----------step-wizard------------*/
    .d-flex {
      display: flex;
    }

    .justify-content-center {
      justify-content: center;
    }

    .align-items-center {
      align-items: center;
    }

    /*---------signup-step-------------*/

    .signup-step-container {
      padding: 150px 0px;
      padding-bottom: 60px;
    }

    .wizard .tab-pane {
      position: relative;
      padding-top: 20px;
    }


    .footer-link {
      margin-top: 30px;
    }


    .list-inline li {
      display: inline-block;
    }

    @media (max-width: 767px) {

      .wizard .nav-tabs>li a i {
        display: none;
      }

    }

    .back-to-top {
      position: fixed;
      bottom: 100px;
      right: 20px;
      display: none;
      z-index: 100;

    }

  

    /* 메인메뉴 마우스 호버 효과 */
    .hvr-underline-from-center {
      display: inline-block;
      vertical-align: middle;
      -webkit-transform: perspective(1px) translateZ(0);
      transform: perspective(1px) translateZ(0);
      box-shadow: 0 0 1px rgba(0, 0, 0, 0);
      position: relative;
      overflow: hidden;
    }

    .hvr-underline-from-center:before {
      content: "";
      position: absolute;
      z-index: -1;
      left: 51%;
      right: 51%;
      bottom: 0;
      background: #2098D1;
      height: 4px;
      -webkit-transition-property: left, right;
      transition-property: left, right;
      -webkit-transition-duration: 0.3s;
      transition-duration: 0.3s;
      -webkit-transition-timing-function: ease-out;
      transition-timing-function: ease-out;
    }

    .hvr-underline-from-center:hover:before,
    .hvr-underline-from-center:focus:before,
    .hvr-underline-from-center:active:before {
      left: 0;
      right: 0;
    }

    /* 마우스 호버 끝 */

    /* 메뉴바 폰트 */
    #navbarSub ul li a,
    #navbarMain ul li a {
      font-family: 'Jua', sans-serif;
    }
    /* 메뉴바 폰트 끝 */


    #sText{
        font-size:15px;
    }
    #mText{
        font-size:22px;
        font-weight:bold;
        
    }
    #bText{
        font-size:30px;
    }
    
    .filebox label { display: inline-block;
     padding: .5em .75em; color: white;
      font-size: inherit;
       line-height: normal; 
       vertical-align: middle;
        background-color: skyblue;
         cursor: pointer;
          border: 1px solid #ebebeb;
           border-bottom-color: #e2e2e2;
            border-radius: .25em;
             } 
    .filebox input[type="file"]
 { /* 파일 필드 숨기기 */ 
 position: absolute; 
 width: 1px; 
 height: 1px; 
 padding: 0; 
 margin: -1px; 
 overflow: hidden; 
 clip:rect(0,0,0,0); border: 0; }



#explainbox{
    width:100;
    height:200;
    border: 1px solid #2098d1;
  
}
#projectbox{
    width:100;
    height:200;
  border: 1px solid #2098d1;
}
#profilebox{
    width:70px;
    height: 50px; 
    border-radius: 70%;
    overflow: hidden;
   
}
.profile {
    width: 10px;
    height: 10px;
    object-fit: cover;
}
.tab {
/* display:none; */
}
td{
padding-left:50px;
}
.chip-choice-client>span {
    border-radius: 1rem;
    padding: 4px 16px;
    background: #eee;
    font-size: 14px;
    line-height: 24px;
    color: #616161;
    display: inline-block;
    cursor: pointer;
    }
    .chip-choice-client {
    position: relative;
    display: inline-block;
    user-select: none;
    margin: 4px 2px 8px 2px;
}
.chip-choice-client>input:checked+span {
    background: #e3edfa;
    color: #2e6baa;

}
.chip-choice-client input[type="checkbox"] {display: none;}
  </style>
  
</head>
<body>
<jsp:include page = "../common/menubar.jsp"/>
<jsp:include page ="../common/pSubMenubar.jsp"/>

<div class ="middle" style ="background-color:black;  font-family: 'Jua', sans-serif;" >
 

  <div class ="container" >
    <br>

    <div class="row" style ="margin-top: 60px; margin-bottom:60px;">
      <div class="col-2 text-white" style="border-right: 2px solid lightgray; margin-right:40px; margin-left:100px; font-family: 'Jua', sans-serif;">
          <br>
          <div style="padding-bottom: 5.5%;">
             
                <li id ="bText" style ="color:lightslategray"> 프로젝트 등록</li>
            
              <br>
              <br>
              <br>
              
              <div>
                  <li id ="mText" style ="color:lightslategray">프로젝트 정보 등록</li>
                   <br>
                  <ul style ="margin-left:10px;" id ="sText"> 
                  <li >1.기본 정보</li>
                  <br>
                  <li >2.준비 상태</li>
                  <br>
                  <li >3.프로젝트 상세</li>
                  <br>
                  <li >4.예산 및 일정</li>
                  <br>
                  <li >5.모집 요건</li>
                  <br>
                  <li >6.추가 정보</li>
                  <br>
                  <li >7.검토 및 수정</li>
                 </ul>

                  <br>
                
              </div>
              <br>
              <div>
             <li id ="mtext" , style= "color:lightslategray"> 프로젝트 등록 완료</li>
                  <br>
                

              </div>
          </div>
      </div>


 <div class= "col-6" style ="color:white; height:auto;">
        
          <table style ="border-bottom: 2px solid white; width:540px; margin-bottom:20px;">
            <tr>
              <td><li  id ="bText" style ="margin-bottom: 15px;">프로젝트 정보 등록</li>
              </td>
              </tr>
          
          </table>
          
<form action ="proinsert.do" method = "post" enctype ="multipart/form-data">

<div class="tab"> 
<table style ="color: white; border:2px solid white; " width="540px;">

           <tr>
            <td colspan="2" style ="border:2px solid white; padding-top:10px; padding-bottom:10px;"><li id ="bText">기본 정보</li></td>
            </tr>
            
            <tr>
            <td colspan="2" style ="padding-top:50px;"><li id ="mText"> 프로젝트 제목<i style ="color:red;">*</i></li></td>
            </tr>
            <tr>
            <td colspan="2" >${project.proName }</td>
           </tr> 
          
            <tr>
            <td colspan="2" style ="padding-top:30px;"><li id ="mText">프로젝트 종류<i style ="color:red;">*</i></li></td>
            </tr>
             <tr>

             <td colspan="2">
           ${project.proMaintain}
           
            </td>
   	         </tr>
           
          
             <tr> 
          <td colspan="2" style ="padding-top:30px;" ><li id ="mText">프로젝트 진행 방식<i style ="color:red;">*</i><br>
          <i id ="sText" style ="color:gray;" >프로젝트에 적합한 작업자를 모집하기 위해 프로젝트 진행 방식을 선택해 주세요.</li></td>
          </tr>
          <tr>
         <td colspan="2">${project.proWTId}</td>
         </tr>
         <tr>
            <td colspan="2" style ="padding-top:30px;"><li id ="mText">프로젝트 분야<i style ="color:red;">*</i></li></td>
            </tr>
             <tr>
            <td colspan="2">
 			${project.proMCId}
            </td>          
            </tr>
            <tr>
            <td colspan="2" style ="padding-top:30px;"><li id ="mText">프로젝트 세부분야<i style ="color:red;">*</i></li></td>
            </tr>
             <tr>
            <td colspan="2">
 			${project.proDCId}
        
            </td>
            </tr>
          <tr>
           <td colspan="2" ><li id = "mText">클라이언트 위치 <i style ="color:red">*</i></li></td>
           </tr>
           <tr>
            <td colspan="2" style ="padding-bottom:50px;">${project.proLocation} </td>
          </tr>
          </table>
</div>

<div class="tab">
<table style ="color: white; border:2px solid white; width:540px;">
    <tr >
              <td colspan="2" style ="border:2px solid white; padding-top:10px; padding-bottom:10px;"><li id ="bText">준비 상태</li></td>
</tr>

  <tr>
  <td colspan="2"  style ="padding-top:50px;"><li id="mText">기획상태<a style="color : red">*</a> </li></td>
  </tr>
  <tr>

   <td colspan="2"> <li id ="sText" style ="color:grey">업무 산정과 예산 및 일정 상담을 위해 현재 기획 상태를 선택해 주세요.</li>
    ${project.proPlan}
  </tr>
  
    <tr>
  <td colspan="2"  style ="padding-top:50px;"><li id="mText">상세 기획 상태</li></td>
  </tr>
  
  <tr>
   <td colspan="2">
     ${project.proPlanDetail}
  </tr>
  
  
<tr>
<td colspan="2"  style ="padding-top:30px;"><li id ="mText">프로젝트 관련 자료</li></td>
</tr>
<td colspan="2"><li id ="sText" style ="color :grey">아이디어 또는 필요한 내용을 정리한 문서를 추가해 주세요.<br>
    프로젝트 예산 및 일정 산정에 활용되며, 문서 및 이미지 파일만 추가 가능합니다.
    </li></td>
 
    <tr>
    <td colspan="2"  style ="padding-bottom:50px;">${project.proPlanPaper}</td>
     </tr> 
    
    
     </table>
     </div>
     
  <div class ="tab">
      <table style ="color: white; border:2px solid white; width:540px;">
 <tr>
  <td colspan="2" style ="border:2px solid white; padding-top:10px; padding-bottom:10px;"><li id="mText">프로젝트 상세</li></td>
</tr>
<tr>
 <td colspan="2"  style ="padding-top:50px;"><li id="mText">프로젝트 개요 </li>
 
</li>

<li>
        <textarea  rows =7 cols=55 maxlength =100  name="proSummary" value ="${project.proSummary}"></textarea>
</li>
<li id ="mText"  style ="padding-top:30px;">관련 기술</li>

<li  style ="padding-bottom:50px;">
    ${project.proNeeds}

<li id ="mText"  style ="padding-top:30px;">프로젝트 요구사항</li>

<li  style ="padding-bottom:50px;">
   <textarea  rows =7 cols=55 maxlength =300  name="proNeedsDetail" value="${project.proNeedsDetail}"></textarea> 


</td>
</tr>
</table>
</div>	

<div class="tab">
<table style ="color: white; border:2px solid white; " width="540px;">
<tr>
 <td colspan="2" style ="border:2px solid white; padding-top:10px; padding-bottom:10px;"><li id ="bText" >예산 및 일정</li></td>
  </tr>
<tr>

<td colspan="2"  style ="padding-top:50px;"> 

<li id ="mText">지출 가능 예산 <a style = "color:red">*</a></li>
<li><input type="text" name="proPayment" value ="$"></li>
    <li>예상 결제 금액  : 0(부가가치세 10% 포함)    </li>
<br>
<li id ="mText">예상 시작일<a style ="color:red">*</a></li>
<li id ="sText" style ="color:grey;"> 파트너가 프로젝트에 착수하는 날짜입니다. <br>
    해당 날짜에 프로젝트 시작이 가능한 파트너들이 지원하게 됩니다.
    </li>
<li><input type ="date" name ="proStartDate"></li>


<li id ="mText">예상 진행 기간<a style="color:red">*</a></li>
<li id ="sText" style ="color:grey">프로젝트 진행 기간을 입력해 주세요.</li>
${project.proDuration} 일
<hr>

<br><br>
</td>
</tr>



</table>
</div>

<div class="tab">
<table style ="color: white; border:2px solid white; " >
<tr>
 <td colspan="2" style ="border:2px solid white; padding-top:10px; padding-bottom:10px;" width="540px;">
<li id ="bText">모집 요건</li>
</td>
</tr>
<tr>
<td colspan="2">
  <li id="mText" style ="padding-top:50px;" >지원자 모집 마감일<a style=color:red>*</a></li>
<li id="sText" style ="color:grey">지원자를 모집하는 기간은 최대 14일까지 가능합니다.<br>
  지원자 모집 기간 중에도 파트너 선정과 계약 진행이 가능합니다.</li>
  <li><input type= "date" name ="proPlanPaper" value ="proPlanPaper"></li>

  <li id="mText" style ="padding-top:30px;">지원자 필수 요건</li>
 
   <li> ${project.proTypeCode}</li>

    </td>
    </tr>
    </table>
</div>


<div class ="tab">
<table style ="color: white; border:2px solid white; " >
<tr>   
     <td colspan="2" style ="border:2px solid white; padding-top:10px; padding-bottom:10px;"><li id ="bText">추가 정보</li></td>
      </tr>
        <tr>
<td colspan="2" style ="padding-top:50px;"><li id = "mText">프로젝트 인력 상황<a style ="color:red">*</a></li>
    <li>${project.proHelp}</li>
<br>
      <li id = "mText">프로젝트 매니징 경험<a style ="color:red">*</a></li>
      <li>${project.proTypeCode}</li>
<br>

      <li id ="mText">프로젝트 우선순위</li>
      <li id ="sText" style ="color:grey">프로젝트 진행에 가장 중요한 요소 1가지를 선택해주세요.<br>
      </li>
    ${project.proPriority}
      <li style ="padding-bottom:50px;"><label><input type="radio" name= "Propriority">프로젝트 기간 준수가 가장 중요하며, 가능하다면 기간이 단축되어야 합니다.</label></li>
 </form>
 
 
   <form><
   <li id ="mText" style ="padding-top:30px;">파트너 지원 전 질문</li>
  <li id ="sText" style ="color:grey">파트너가 프로젝트에 지원할 때 답변해야 할 질문을 작성해 주세요. <br> 최대 3개까지 입력 가능합니다.<br>
    클라이언트님이 파트너를 선정할 때 지원서와 함께 답변 내용을 검토할 수 있습니다.</li>
    <li><td><input type="text" name="PRO_AQ_ID" style="width:350px; height:20px;" readonly></td></li>

</td>
    </tr>
  
   
</table>
  </div>
  

	 


</form>
          
    </div>
    </div>
    </div>
    
   <div>
   </div>
 
 



<jsp:include page = "../common/footer.jsp"/>
</body>
</html>