<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
display:none;
}
td{
padding-left:50px;
}
.choice{
style="display: inline-block;"
}
.choice>span {
    border-radius: 1rem;
    padding: 4px 16px;
    background: #eee;
    font-size: 14px;
    line-height: 24px;
    color: #616161;
    display: inline-block;
    cursor: pointer;
    }
    .choice {
    position: relative;
    display: inline-block;
    user-select: none;
    margin: 4px 2px 8px 2px;
}
.choice>input:checked+span {
    background: #e3edfa;
    color: #2e6baa;

}
.choice input[type="radio"] {display: none;}

.choice input[type="checkbox"] {display: none;}
  </style>
  
</head>
<body>
<jsp:include page = "../common/menubar.jsp"/>
<jsp:include page ="../common/cSubMenubar.jsp"/>

<div class ="middle"  style ="background-color:black;  font-family: 'Jua', sans-serif;" >
 

  <div class ="container" >
    <br>

    <div class="row" style ="margin-top: 60px; margin-bottom:60px;">
      <div class="col-2 text-white" style="border-right: 2px solid lightgray; margin-right:40px; margin-left:100px; font-family: 'Jua', sans-serif;">
          <br>
          <div style="padding-bottom: 5.5%;">
             
                <li id ="bText" style ="color:lightslategray"> 프로젝트 수정</li>
            
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
          
<form action ="proUpdate.do" id= "regform" method = "post" enctype ="multipart/form-data">



<div class="tab"> 
<table style ="color: white; border:2px solid white; " width="540px;">

<input type = "hidden" name ="memId" value ="${loginUser.memId}" />
           <tr>
            <td colspan="2" style ="border:2px solid white; padding-top:10px; padding-bottom:10px;"><li id ="bText">기본 정보</li></td>
            </tr>
            <input type ="hidden" name = "proId" value ="${p.proId }"/>
            <tr>
            <td colspan="2" style ="padding-top:50px;"><li id ="mText"> 프로젝트 제목<i style ="color:red;">*</i></li></td>
            </tr>
            <tr>
            <td colspan="2" ><input type ="text" size =50 maxlength= 50 name="proName" value ="${p.proName} readonly"></td>
           </tr> 
          
            <tr>
            <td colspan="2" style ="padding-top:30px;"><li id ="mText">프로젝트 종류<i style ="color:red;">*</i></li></td>
            </tr>
             <tr>

             <td colspan="2">
               <label class="choice" ><input type ="radio"   name="proMaintain" value= "N" 
                             <c:if test ="${p.proMaintain eq 'N' }" disabled>checked</c:if>
               ><span>신규 프로젝트를 진행하려 합니다.</span></label>
               
               <label class="choice" ><input type ="radio"   name="proMaintain" value= "Y" 
                             <c:if test ="${p.proMaintain eq 'Y' }" disabled>checked</c:if>
               ><span>서비스의 리뉴얼 또는 유지보수를 하려 합니다.</span></label>
            
            </td>
   	         </tr>
           
          
             <tr> 
          <td colspan="2" style ="padding-top:30px;" ><li id ="mText">프로젝트 진행 방식<i style ="color:red;">*</i><br>
          <i id ="sText" style ="color:gray;" >프로젝트에 적합한 작업자를 모집하기 위해 프로젝트 진행 방식을 선택해 주세요.</li></td>
          </tr>
          <tr>
         <td colspan="2"> <label class="choice" ><input type ="radio" name="proWTId" value ="WT1" 
         <c:if test ="${p.proWTId eq 'WT1' }">checked</c:if>
         disabled> <span>외주</span></label></td>
         </tr>
         <tr>
          <td colspan="2"> <label class="choice" > <input type ="radio" name ="proWTId" value ="WT2"
          <c:if test ="${p.proWTId eq 'WT2' }">checked</c:if>
          > <span>상주</span></label></td>
          </tr>
          <tr>
           <td colspan="2"> <label class="choice" > <input type ="radio" name ="proWTId" value ="WT3"
           <c:if test ="${p.proWTId eq 'WT3' }">checked</c:if>
           > <span> 상관없음</span></label></td>
          </tr>
             <tr>
            <td colspan="2" style ="padding-top:30px;"><li id ="mText">프로젝트 분야<i style ="color:red;">*</i></li></td>
            </tr>
               <tr>
            <td colspan="2">
            
 				  <label class="choice" ><input type ="radio"name ="proMCId" value ="MC1"
 				  <c:if test ="${p.proMCId eq 'MC1' }">checked</c:if>>
 				  <span>개발</span></label> <br>
   				  <label class="choice" ><input type ="radio" name="proMCId" value ="MC2"
   				  <c:if test ="${p.proMCId eq 'MC2' }">checked</c:if>>
   				  <span>디자인</span></label><br>
    			 <label class="choice" ><input type ="radio" name ="proMCId" value ="MC3"
    			 <c:if test ="${p.proMCId eq 'MC3' }">checked</c:if>>
    			 <span>개발+디자인</span></label></td>
        
            </td>
            </tr>
            <tr>
            <td colspan="2" style ="padding-top:30px;"><li id ="mText">프로젝트 세부분야<i style ="color:red;">*</i></li></td>
            </tr>
             <tr>
            <td colspan="2">
 			  <label class="choice" ><input name="proDCId" type="radio" value="DC1"
 			  <c:if test ="${p.proDCId eq 'DC1' }">checked</c:if>>
 			  <span>웹</span></label>&nbsp;           
             <label class="choice" ><input  name="proDCId" type="radio" value="DC2"
             <c:if test ="${p.proDCId eq 'DC2' }">checked</c:if>>
             <span>애플리케이션</span></label> &nbsp; 
             <label class="choice" ><input  name="proDCId" type="radio" value="DC3"
              <c:if test ="${p.proDCId eq 'DC3' }">checked</c:if>>
              <span>퍼블리싱</span></label> &nbsp;
                <label class="choice" ><input name="proDCId" type="radio" value="DC4"
                 <c:if test ="${p.proDCId eq 'DC4' }">checked</c:if>>
                 <span>기타</span></label> 
        
            </td>
            </tr>
          <tr>
           <td colspan="2" ><li id = "mText">클라이언트 위치 <i style ="color:red">*</i></li></td>
           </tr>
           <tr>
            <td colspan="2" style ="padding-bottom:50px;"><li>
            <input type ="text " name ="proLocation" value="${p.proLocation}"/>
             
              </select>
        
          </li></td>
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
     <label class="choice" ><input type ="radio" name ="proPlan" value ="1"
      <c:if test ="${p.proPlan eq 1 }">checked</c:if>>
      <span>아이디어만 있습니다.</span></label> <br>
    <label class="choice" ><input type ="radio" name="proPlan" value ="2" 
      <c:if test ="${p.proPlan eq 2 }">checked</c:if>>
      <span>필요한 내용들만 간단히 정리해 두었습니다.</span></label><br>
     <label class="choice" ><input type ="radio" name ="proPlan" value ="3"
       <c:if test ="${p.proPlan eq 3 }">checked</c:if>>
       <span>상세한 기획문서가 존재합니다.</span></label></td>
  </tr>
  
    <tr>
  <td colspan="2"  style ="padding-top:50px;"><li id="mText">상세 기획 상태</li></td>
  </tr>
  
  <tr>
   <td colspan="2">
      <label class="choice" ><input type ="radio"   name="proPlanDetail" value= "1">
       <c:if test ="${p.proPlanDetail eq 1 }"></c:if>
      <span>요구사항 정의서</span></label>
      <label class="choice" ><input type ="radio" name="proPlanDetail" value ="2"
        <c:if test ="${p.proPlanDetail eq 2 }">checked</c:if>>
        <span>제안 요청서</span></label>
      <label class="choice" ><input type ="radio"  name="proPlanDetail" value ="3"  
       <c:if test ="${p.proPlanDetail eq 3 }">checked</c:if>>
       <span>메뉴 구조도</span></label><br>
      <label class="choice" ><input type ="radio"  name="proPlanDetail" value ="4"
        <c:if test ="${p.proPlanDetail eq 4 }">checked</c:if>>
        <span>화면 설계서</span></label>
     <label class="choice" ><input type ="radio"  name="proPlanDetail" value ="5" 
       <c:if test ="${p.proPlanDetail eq 5 }">checked</c:if>>
       <span>프로토타입</span></label></td>
  </tr>
  
  


<tr>
<td colspan="2"  style ="padding-top:30px;"><li id ="mText">프로젝트 관련 자료</li></td>
</tr>
<td colspan="2"><li id ="sText" style ="color :grey">아이디어 또는 필요한 내용을 정리한 문서를 추가해 주세요.<br>
    프로젝트 예산 및 일정 산정에 활용되며, 문서 및 이미지 파일만 추가 가능합니다.
    </li></td>
 
    <tr>
    <td colspan="2"  style ="padding-bottom:50px;"><div class="filebox">
        <label for="ex_file"  >+ 프로젝트 관련 자료 추가</label>
        <input type="file" id="ex_file" name="proPlanPaper1"> 
      </div></td>
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
 <li id = "sText" style ="color:grey">
  
    업무 내용을 상세하게 작성해주실수록, 더 적합한 파트너를 만날 수 있습니다.
    <br>
    파트너가 알아야 할 유의사항(필수 사항, 전문 경험 등)도 함께 작성해 주세요.
    <br>


</li>

<li>
        <textarea  rows =7 cols=55 maxlength =100  name="proSummary" >${p.proSummary }</textarea>
</li>
<li id ="mText"  style ="padding-top:30px;">관련 기술</li>
<li id ="sText" style ="color:grey">
    더 적합한 파트너가 프로젝트를 찾고 지원할 수 있도록  프로젝트와 관련된 기술을 <br> 입력해주세요 
</li>
<li  style ="padding-bottom:50px;">
    <input type= "text" name= "proNeeds" value ="${p.proNeeds }">

<li id ="mText"  style ="padding-top:30px;">프로젝트 요구사항</li>
<li id ="sText" style ="color:grey">
   파트너스가 참고할수 있도록 요구사항을 명세해주세요
</li>
<li  style ="padding-bottom:50px;">
   <textarea  rows =7 cols=55 maxlength =300  name="proNeedsDetail"> ${p.proNeedsDetail }</textarea> 


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
<li><input type="text" name="proPayment" value = "${p.proPayment }"	></li>
    <li>예상 결제 금액  : 0원(부가가치세 10% 포함)    </li>
<br>
<li id ="mText">예상 시작일<a style ="color:red">*</a></li>
<li id ="sText" style ="color:grey;"> 파트너가 프로젝트에 착수하는 날짜입니다. <br>
    해당 날짜에 프로젝트 시작이 가능한 파트너들이 지원하게 됩니다.
    </li>
<li><input type ="date" name ="proStartDate"666 value ="${p.proStartDate }"></li>


<li id ="mText">예상 진행 기간<a style="color:red">*</a></li>
<li id ="sText" style ="color:grey">프로젝트 진행 기간을 입력해 주세요.</li>
<li style ="padding-bottom:50px;"><input type="text" name = "proDuration" value ="${p.proDuration }"></li>
<hr>
<li id ="mText">개발 환경<a style ="color:red">*</a></li>
<li id ="sText" style ="color:grey">프로젝트를 진행할 개발환경을 입력해 주세요.</li>
<li style ="padding-bottom:50px;"><textarea name = "proResource">${p.proResource }</textarea></li>
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
  <li><input type= "date" name ="proREndDate" value ="${p.proREndDate }"></li>

  <li id="mText" style ="padding-top:30px;">지원자 필수 요건</li>
  <li id ="sText" style ="color:grey">아래 조건에 맞는 파트너를  지원자로 받습니다.</li>
    <label class="choice" ><input type ="radio" name="proTypeCode" value= "MT1"
      <c:if test ="${p.proTypeCode eq 'MT1' }">checked</c:if>>
      <span>개인</span> </label>
   	<label class="choice" ><input type ="radio"  name="proTypeCode" value= "MT2"
   	<c:if test ="${p.proTypeCode eq 'MT2' }">checked</c:if>>
   	<span>법인</span> </label>
    <label class="choice" ><input type ="radio"  name="proTypeCode" value= "MT3"
    <c:if test ="${p.proTypeCode eq 'MT3' }">checked</c:if>>
    <span>팀</span></label>
    <label class="choice" ><input type ="radio"  name="proTypeCode" value= "MT4"
    <c:if test ="${p.proTypeCode eq 'MT4' }">checked</c:if>>
    <span>개인사업자</span></label>
    <label class="choice" ><input type ="radio"  name="proTypeCode" value= "MT5"
    <c:if test ="${p.proTypeCode eq 'MT5' }">checked</c:if>>
    <span>법인사업자</span></label>
    <label class="choice" ><input type ="radio"  name="proTypeCode" value= "MT6"
    <c:if test ="${p.proTypeCode eq 'MT6' }">checked</c:if>>
    <span>기업</span></label>
    
<li id="sText" style ="color:grey">프로젝트에 참여시킬 인원 수를 입력해주세요.
</li>
  <li><input type= "number" name ="proRecruitNum" value =${proRecruitNum }></li>

    

  
    </td>
    </tr>
    
    </table>
</div>
<script>





</script>



<div class ="tab">
<table style ="color: white; border:2px solid white; " >
<tr>   
     <td colspan="2" style ="border:2px solid white; padding-top:10px; padding-bottom:10px;"><li id ="bText">추가 정보</li></td>
      </tr>
        <tr>
<td colspan="2" style ="padding-top:50px;"><li id = "mText">프로젝트 인력 상황<a style ="color:red">*</a></li>
      <li><label><input type="radio" name="proHelp" value =1
      <c:if test ="${p.proHelp eq 1 }">checked</c:if>>
      IT프로젝트 경험이 있는 인력이 있습니다.</label></li>
      <li><label><input type="radio" name ="proHelp" value =2
      <c:if test ="${p.proHelp eq 2 }">checked</c:if>>
      IT프로젝트 경험이 있는 인력이 없습니다.</label></li>
<br>
      <li id = "mText">프로젝트 매니징 경험<a style ="color:red">*</a></li>
      <li><label><input type="radio" name="proManage" value =1 
      <c:if test ="${p.proManage eq 1 }">checked</c:if>>
      프로젝트 매니징 경험이 있습니다.</label></li>
      <li><label><input type="radio" name= "proManage" value =2 
      <c:if test ="${p.proManage eq 2 }">checked</c:if>>
      프로젝트 매니징 경험이 없습니다.</label></li>
<br>

      <li id ="mText">프로젝트 우선순위</li>
      <li id ="sText" style ="color:grey">프로젝트 진행에 가장 중요한 요소 1가지를 선택해주세요.<br>
      </li>
      <li><label><input type="radio" name= "proPriority" value =1 
      <c:if test ="${p.proPriority eq 1 }">checked</c:if>>
      빠르게 진행자가 발생하는 것이 가장 중요합니다.</label></li>
      <li><label><input type="radio" name= "proPriority" value =2 
      <c:if test ="${p.proPriority eq 2 }">checked</c:if>>
      완성도 높은 산출물을 받아보는 것이 가장 중요합니다.</label></li>
      <li><label><input type="radio" name= "proPriority" value =3 
      <c:if test ="${p.proPriority eq 3 }">checked</c:if>>
      최대한 낮은 금액으로 제안받는 것이 가장 중요합니다.</label></li>
      <li style ="padding-bottom:50px;"><label><input type="radio" name= "proPriority" value =4 
      <c:if test ="${p.proPriority eq 4 }">checked</c:if>>
      프로젝트 기간 준수가 가장 중요하며, 가능하다면 기간이 단축되어야 합니다.</label></li>
   
   <li id ="mText" style ="padding-top:30px;">파트너 지원 전 질문</li>
  <li id ="sText" style ="color:grey">파트너가 프로젝트에 지원할 때 답변해야 할 질문을 작성해 주세요. <br> 최대 3개까지 입력 가능합니다.<br>
    클라이언트님이 파트너를 선정할 때 지원서와 함께 답변 내용을 검토할 수 있습니다.</li>
   
    <li>

     <c:forEach var ="q"  items="${q}">
     <table >
            <tr>
              <td><input type="text" name="proAQContent" value ="${q.proAQContent }"></td>
               
              
              
		
            </tr>
          </table>
              </c:forEach>
</li>
</td>
    </tr>
  
   
</table>
  </div>
  
 
<div style="overflow:auto;">
  <div style="float:right;">
  	<button type="button" >임시 저장</button>
    <button type="button" id="prevBtn" onclick="nextPrev(-1)">이전</button>
    <button type="button" id="nextBtn" onclick="nextPrev(1)">다음</button>
  </div>
</div>

<!-- Circles which indicates the steps of the form: -->
<div style="text-align:center;margin-top:40px;">
  <span class="step"></span>
  <span class="step"></span>
  <span class="step"></span>
  <span class="step"></span>
    <span class="step"></span>
</div>


          
    </div>
    </div>
    </div>
    
   <div>
   </div>
 <script>
 

var currentTab = 0; // Current tab is set 	to be the first tab (0)
showTab(currentTab); // Display the current tab

function showTab(n) {
  // This function will display the specified tab of the form ...
  var x = document.getElementsByClassName("tab");
  x[n].style.display = "block";
  // ... and fix the Previous/Next buttons:
  if (n == 0) {
    document.getElementById("prevBtn").style.display = "none";
  } else {
    document.getElementById("prevBtn").style.display = "inline";
  }
  if (n == (x.length - 1)) {
    document.getElementById("nextBtn").innerHTML = "Submit";
   $("#nextBtn").removeAttr("onclick");
   $("#nextBtn").attr("onclick","submit();");
    

    
  } else {
    document.getElementById("nextBtn").innerHTML = "Next";
  }

  fixStepIndicator(n)
}

function nextPrev(n) {
	
  // This function will figure out which tab to display
  var x = document.getElementsByClassName("tab");
  // Exit the function if any field in the current tab is invalid:
  if (n == 1 && !validateForm()) return false;
  // Hide the current tab:
  x[currentTab].style.display = "none";
  // Increase or decrease the current tab by 1:
  currentTab = currentTab + n;
  console.log(currentTab);
  console.log(x.length);
  
  // if you have reached the end of the form... :
  if (currentTab >= x.length) {
    //...the form gets submitted:
    document.getElementById("regForm").submit();

    return false;
  }
  // Otherwise, display the correct tab:
  showTab(currentTab);
}
function validateForm() {
	  // This function deals with validation of the form fields
	  var x, y, i, valid = true;
	  x = document.getElementsByClassName("tab");
	  y = x[currentTab].getElementsByTagName("input");
	  // A loop that checks every input field in the current tab:
	  for (i = 0; i < y.length; i++) {
	    // If a field is empty...
	    if (y[i].value == "") {
	      // add an "invalid" class to the field:
	      y[i].className += " invalid";
	      // and set the current valid status to false:
	      valid = true;
	    }
	  }
	  // If the valid status is true, mark the step as finished and valid:
	  if (valid) {
	    document.getElementsByClassName("step")[currentTab].className += " finish";
	  }
	  return valid; // return the valid status
	}

	function fixStepIndicator(n) {
	  // This function removes the "active" class of all steps...
	  var i, x = document.getElementsByClassName("step");
	  for (i = 0; i < x.length; i++) {
	    x[i].className = x[i].className.replace(" active", "");
	  }
	  //... and adds the "active" class to the current step:
	  x[n].className += " active";
	}
</script>
</form>
<jsp:include page = "../common/footer.jsp"/>
</body>
</html>