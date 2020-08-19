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
display:none;
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

  </style>
  
</head>
<body>
<jsp:include page = "../common/menubar.jsp"/>
<jsp:include page ="../common/pSubMenubar.jsp"/>

<div class ="middle" style ="background-color:black;  font-family: 'Jua', sans-serif;" >
 

  <div class ="container" >
    <br>

    <div class="row" style ="margin-top: 60px; margin-bottom:60px;">
      <div class="col-2 text-white" style="border-right: 2px solid lightgray; margin-right:40px; margin-left:100p}
.chip-choice-client input[type="checkbox"] {display: none;}
x; font-family: 'Jua', sans-serif;">
          <br>
          <div style="padding-bottom: 5.5%;">
             
                <li id ="bText" style ="color:lightslategray"> 프로젝트 등록</li>
   <div class ="middle"  style ="background-color:black;  font-family: 'Jua', sans-serif;" >
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
   <form action ="proinsert.do" id= "regform" method = "post" enctype ="multipart/form-data">

ngth= 50></td>
           </tr> 
          
            <tr>
            <td colspan="2" style ="padding-top:30px;"><li id ="mText">프로젝트 종류<i style ="color:red;">*</i></li></td>
            </tr>
            <tr>

             <td colspan="2">
            <label ><input type ="radio" name="type2" value ="N"> 신규 프로젝트를 진행하려 합니다.</label>
             <label  ><input type ="radio" name="type2" value ="Y"> 운영적인 서비스의 리뉴얼 또는 유지보수를 하려 합니다.</label>
            </            <td colspan="2" ><input type ="text" size =50 maxlength= 50 name="proName"></td>
padding-top:30px;" ><li id ="mText">프로젝트 진행 방식<i style ="color:red;">*</i><br>
          <i id ="sText" style ="color:gray;" >프로젝트에 적합한 작업자를 모집하기 위해 프로젝트 진행 방식을 선택해 주세요.</li></td>
          </tr>
               <tr>
     <td colspan="2"><label><input            <label ><input type ="radio"  name ="proMaintain" " value ="N"> 신규 프로젝트를 진행하려 합니다.</label>
             <label  ><input type ="radio"name ="proMaintain" value ="Y"> 운영적인 서비스의 리뉴얼 또는 유지보수를 하려 합니다.</label>
)</label></td>
          </tr>
          <tr>
                 
          
     <td colspan="2"><label> <input type ="radio" name ="type1" value ="WT3"> 상관없음</label></td>
          </tr>
           <tr>
              <td colspan="2" style =" padding-bottom:30px;"><li id ="sText"><img src= "!.png" width=10px; >선택하신 프로젝트 진행 방식에 따라 입력해야 하는 항목들이 변경됩니다.</li></td>
             <td colspan="2"><label><input type ="radio" name="proMCId" value ="WT1"> 프로젝트 단위로 계약(외주)</label></td>
i></li></td>
           </tr>
           <td colspan="2"><label> <input type ="radio" name ="proMCId" value ="WT2"> 인력을 기간 단위로 구인(상주)</label></td>
n1">
              <option value="           <td colspan="2"><label> <input type ="radio" name ="proMCId" value ="WT3"> 상관없음</label></td>
광주광역시</option>
                <tr>
            <td colspan="2" style ="padding-top:30px;"><li id ="mText">프로젝트 분야<i style ="color:red;">*</i></li></td>
            </tr>
               <tr>
            <td colspan="2">
 				 <label><input type ="radio" name ="proMCId" value ="1">개발</label> <br>
   				 <label><input type ="radio" name="proMCId" value ="2">디자인</label><br>
    			<label><input type ="radio" name ="proMCId" value ="3">개발+디자인</label></td>
        
            </td>
            </tr>
            <tr>
            <td colspan="2" style ="padding-top:30px;"><li id ="mText">프로젝트 세부분야<i style ="color:red;">*</i></li></td>
            </tr>
             <tr>
            <td colspan="2">
 			 <label class="chip-choice-client" style="display: inline-block;"><input class="theme-client wishket-chip" name="proDCId" type="checkbox" value="web"><span>웹</span></label>&nbsp;           
             <label class="chip-choice-client" style="display: inline-block;"><input class="theme-client wishket-chip" name="proDCId" type="checkbox" value="application"><span>애플리케이션</span></label> &nbsp; 
              <label class="chip-choice-client" style="display: inline-block;"><input class="theme-client wishket-chip" name="proDCId" type="checkbox" value="publishing"><span>퍼블리싱</span></label> &nbsp;
               <label class="chip-choice-client" style="display: inline-block;"><input class="theme-client wishket-chip" name="proDCId" type="checkbox" value="etc"><span>기타</span></label> 
        
            </td>
               <option value="#">아직</option>
                <option value="#">뺶똰</option>
                <option value="#">못만들었음</option>
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
    <label><input type ="radio" name ="condition" value ="1">아이디어만 있습니다.</label> <br>
    <label><input type ="radio" name="condition" value ="2">필요한 내용들만 간단히 정리해 두었습니다.</label><br>
    <label><input type ="radio" name ="condition" value ="3">상세한 기획문서가 존재합니다.</label></td>
  </tr>
  
    <tr>
  <td colspan="2"  style ="padding-top:50px;"><li id="mText">상세 기획 상태</li></td>
  </tr>
  
  <tr>
   <td colspan="2">
    <label><input type ="checkbox" name ="detail0" value= "1">요구사항 정의서</label> <br>
    <label><input type ="checkbox" name="detail1" value ="2">제안 요청서</label><br>
    <label><input type ="checkbox" name ="detail2" value ="3">메뉴 구조도(IA)</label><br>
    <label><input type ="checkbox" name ="detail3" value ="4">화면 설계서(스토리보드, 와이어프레임)</label><br>
    <label><input type ="checkbox" name ="detail4" value ="5">프로토타입(프로제그 결과물의 샘플버전)</label></td>
  </tr>
  
  
<tr>
<td colspan="2"  style ="padding-top:30px;"><li id ="mText">프로젝트 관련 자료</li></td>
</tr>
<td colspan="2"><li id ="sText" style ="color :grey">아이디어 또는 필요한 내용을 정리한 문서를 추가해 주세요.<br>
    프로젝트 예산 및 일정 산정에 활용되며, 문서 및 이미지 파일만 추가 가능합니다.
    </li></td>
 
    <tr>
    <td colspan="2"  style ="padding-bottom:50px;"><div class="filebox">
        <label for="ex_file">+ 프로젝트 관련 자료 추가</label>
        <input type="file" id="ex_file"> 
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
 <td colspan="2"  style ="padding-top:50px;"><li id="mText">상세 업무 내용</li>
 <li id = "sText" style ="color:grey">
  
    업무 내용을 상세하게 작성해주실수록, 더 적합한 파트너를 만날 수 있습니다.
    <br>
    파트너가 알아야 할 유의사항(필수 사항, 전문 경험 등)도 함께 작성해 주세요.
    <br>


</li>

<li>
        <textarea  rows =7 cols=55></textarea>    <label><input type ="radio" name ="proPlan" value ="1">아이디어만 있습니다.</label> <br>
    <label><input type ="radio" name="proPlan" value ="2">필요한 내용들만 간단히 정리해 두었습니다.</label><br>
    <label><input type ="radio" name ="proPlan" value ="3">상세한 기획문서가 존재합니다.</label></td>
	

<div class="tab">
<table style ="color: white; border:2px solid white; " width="540px;">
<tr>
 <td colspan="2" style ="border:2px so     <label class="chip-choice-client" style="display: inline-block;"><input type ="checkbox"  class="theme-client wishket-chip" name="proPlanDetail" value= "1"><span>요구사항 정의서</span></label>
     <label class="chip-choice-client" style="display: inline-block;"><input type ="checkbox" class="theme-client wishket-chip" name="proPlanDetail" value ="2"><span>제안 요청서</span></label>
     <label class="chip-choice-client" style="display: inline-block;"><input type ="checkbox" class="theme-client wishket-chip" name="proPlanDetail" value ="3"><span>메뉴 구조도</span></label><br>
     <label class="chip-choice-client" style="display: inline-block;"><input type ="checkbox" class="theme-client wishket-chip" name="proPlanDetail" value ="4"><span>화면 설계서</span></label>
     <label class="chip-choice-client" style="display: inline-block;"><input type ="checkbox" class="theme-client wishket-chip" name="proPlanDetail" value ="5"><span>프로토타입</span></label></td>
/a></li>
<li><select>
	<option>경력무관</option>
	<option>1~2년차</option>
	<option>3~4년차</option>
	<option>5~9년차</option>
	<option>10년차 이상</option>
</select>&nbsp;
<input type="text" value ="명">&nbsp;
<input type ="text" value ="￦"></li>
    <li>예상 결제 금액  : 0(부가가치세 10% 포함)    </li>
    <li>
        <label><input type ="checkbox">프로젝트 예산의 조율이 가능합니다.        <label for="ex_file"  >+ 프로젝트 관련 자료 추가</label>
        <input type="file" id="ex_file" name="proPlanPaper1"> 
"sText" style ="color:grey;"> 파트너가 프로젝트에 착수하는 날짜입니다. <br>
    해당 날짜에 프로젝트 시작이 가능한 파트너들이 지원하게 됩니다.
    </li>
<li><input type ="date" ></li>
<li>
    <label><input type ="checkbox">프로젝트 착수 일자의 협의가 가능합니다.</label>
</li>

<li id ="mText">예상 진행 기간<a style="color:red">*</a></li>
<li id ="sText" style ="color:grey">프로젝트 진행 기간을 입력해 주세요.</li> <td colspan="2"  style ="padding-top:50px;"><        <label for="ex_file"  >+ 프로젝트 관련 자료 추가</label>
        <input type="file" id="ex_file" name="proPlanPaper1"> 
 style ="color: white; border:2px solid white; " >
<tr>
 <td colspan="2" style ="border:        <textarea  rows =7 cols=55 maxlength =100  name="proSummary"></textarea>
m:10px;" width="540px;">
<li id ="bText">모집 요건</li>
</td>
</tr>
<tr>
<td colspan="2">
  <li id="mText" style ="padding-top:50px;" >지원자 모집 마감일<a style=color:red>*</a> <td colspan="2"  style ="padding-top:50px;"><li id="mText">프로젝트 개요 </li>
<input type= "text" name= "proNeeds">

<li id ="mText"  style ="padding-top:30px;">프로젝트 요구사항</li>
<li id ="sText" style ="color:grey">
   파트너스가 참고할수 있도록 요구사항을 명세해주세요
</li>
<li        <textarea  rows =7 cols=55 maxlength =100  name="proSummary"></textarea>
me="proNeedsDetail"></textarea> 
 진행이 가능합니다.</li>
  <li><input type= "date"></li>

  <li id="mText" style ="padding-top:30px;">지원자 필수 요건</li>
  <li id ="sText" style ="color:grey">아래 조건에 맞는 파트너를  지원자로 받습니다.</li>
    <li><label><input ty    <input type= "text" name= "proNeeds">

<li id ="mText"  style ="padding-top:30px;">프로젝트 요구사항</li>
<li id ="sText" style ="color:grey">
   파트너스가 참고할수 있도록 요구사항을 명세해주세요
</li>
<li  style ="padding-bottom:50px;">
   <textarea  rows =7 cols=55 maxlength =300  name="proNeedsDetail"></textarea> 
i><label><input type="checkbox" name ="nessesary" >자사 협력업체 등록 가능</label></li>
    <li><label><input type="checkbox" name ="nessesary" >보증보험 발급 가능<<li><input type="text" name="proPayment" ></li>
me="addButton" type="button" style="cursor:hand" onClick="insRow()" value="추가"></li>
     <table id="addTable"">
            <tr>
              <td><input type="text" name="addText" style="width:350px; height:20px;"></td>
              <td align="left"></td>
            </tr>
          </table>
    </td>
    </tr>
    </table>
</div>
<script>
var oTbl;
var count=0;
//Row 추가
function insRow() {
oTbl = document.getElementById("addTable");
va<li><input type="text" name="proPayment" ></li>
<li><input type ="date" name ="proStartDate"></li>

{oTbl.clickedRowIndex=this.rowIndex}; //clickedRowIndex - 클릭한 Row의 위치를 확인;
var oCell = oRow.insertCell();
//삽입될 Form Tag
if(count<2){
var frmTag = "<input type=text n<li style ="padding-bottom:50px;"><input type="text" name = "proDuration"></li>
='removeRow()' style='cursor:hand'>";

oCell.innerHTML = frmTag;
count ++;
}else{
	alert("3개이상 추가하실 수 없습니다.");
}

}

function removeRow() {
	  oTbl.deleteRow(oTbl.clickedRowIndex);
	  count --;
	}


	 
</script>

<div class ="tab">
<table style ="color: white; border:2px solid white; " >
<tr>   
     <td colspan="2" style ="border:2px solid white; padding-top:10px; padding-bottom:10px;"><li id ="bText">추가 정보</li></td>
      </tr>
        <tr>
<td colspan="2" style ="padding-top:50px;  <li><input type= "date" name ="proREndDate"></li>
tyle ="color:red">*</a></li>
      <li><label><input type="radio" name="exp">IT프로젝트 경험이 있는 인력이 있습니다.</label></li>
      <li><label><input type="radio"     <li><label class="chip-choice-client" style="display: inline-block;"><input type ="checkbox"  class="theme-client wishket-chip" name="proPlanDetail" value= "1">개인 </label></li>
   <li><label class="chip-choice-client" style="display: inline-block;"><input type ="checkbox"  class="theme-client wishket-chip" name="proPlanDetail" value= "2">법인 </label></li>
    <li><label class="chip-choice-client" style="display: inline-block;"><input type ="checkbox"  class="theme-client wishket-chip" name="proPlanDetail" value= "3">법인 사업자</label></li>
    <li><label class="chip-choice-client" style="display: inline-block;"><input type ="checkbox"  class="theme-client wishket-chip" name="proPlanDetail" value= "4">업력 1년이상</label></li>
    <li><label class="chip-choice-client" style="display: inline-block;"><input type ="checkbox"  class="theme-client wishket-chip" name="proPlanDetail" value= "5">자사 협력업체 등록 가능</label></li>
    <li><label class="chip-choice-client" style="display: inline-block;"><input type ="checkbox"  class="theme-client wishket-chip" name="proPlanDetail" value= "6">보증보험 발급 가능</label></li>
트 매니징 경험<a style ="color:red">*</a></li>
      <li><label><input type="radio">프로젝트 매니징 경험이 있습니다.</label></li>
      <li><label><input type="radio">프로젝트 매니징 경험이 없습니다.</label></li>
<br>

      <li id ="mText">프로젝트 우선순위</li>
      <li id ="sText" style ="color:grey">프로젝트 진행에 가장 중요한 요소 1가지를 선택해주세요.<br>
      </li>
      <li><label><input type="radio" name= "priority">빠르게 진행자가 발생하는 것이 가장 중요합니다.</label></li>
      <li><label><input type="radio" name= "priority">완성도 높은 산출물을 받아보는 것이 가장 중요합니다.</label></li>
      <li><label><input type="radio" name= "priority">최대한 낮은 금액으로 제안받는 것이 가장 중요합니다.</label></li>
      <li style ="padding-bottom:50px;"><label><input type="radio" name= "priority">프로젝트 기간 준수가 가장 중요하며, 가능하다면 기간이 단축되어야 합니다.</label></li>
</td>
    </tr>
</table>
  </div>
<div style="overflow:auto;">
  <div style="float:right;">
  	<button type="button">임시 저장</button>
    <button type="button" id="prevBtn" onclick="nextPrev(-1)">이전</button>
    <button type="button" id="nextBtn" onclick="nextPrev(1)">다음</butto  
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
      <li><label><input type="radio" name="proHelp" value ="1">IT프로젝트 경험이 있는 인력이 있습니다.</label></li>
      <li><label><input type="radio" name ="proHelp" value ="2">IT프로젝트 경험이 있는 인력이 없습니다.</label></li>
<br>
      <li id = "mText">프로젝트 매니징 경험<a style ="color:red">*</a></li>
      <li><label><input type="radio" name="proManage" value ="1">프로젝트 매니징 경험이 있습니다.</label></li>
      <li><label><input type="radio" name= "proManage" value ="2">프로젝트 매니징 경험이 없습니다.</label></li>
<br>

      <li id ="mText">프로젝트 우선순위</li>
      <li id ="sText" style ="color:grey">프로젝트 진행에 가장 중요한 요소 1가지를 선택해주세요.<br>
      </li>
      <li><label><input type="radio" name= "proPriority" value ="1">빠르게 진행자가 발생하는 것이 가장 중요합니다.</label></li>
      <li><label><input type="radio" name= "proPriority" value ="2">완성도 높은 산출물을 받아보는 것이 가장 중요합니다.</label></li>
      <li><label><input type="radio" name= "proPriority" value ="3">최대한 낮은 금액으로 제안받는 것이 가장 중요합니다.</label></li>
      <li style ="padding-bottom:50px;"><label><input type="radio" name= "Propriority" value ="4">프로젝트 기간 준수가 가장 중요하며, 가능하다면 기간이 단축되어야 합니다.</label></li>
   <
   <li id ="mText" style ="padding-top:30px;">파트너 지원 전 질문</li>
nt.getElementsByClassName("tab");
  x[n].style.display = "block";
  // ... and fix the Previous/Next buttons:
  if (n == 0) {
    document.getElementById("prevBtn").style.display = "none";
  } else {
    document.getElementById("prevBtn").style.display = "inline";
  }
  if (n == (x.length - 1)) {
    document.getElementById("nextBtn").innerHTML = "Submit";
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
	      // add an "invalid" class to the field     <table id="addTable">
:
	      y[i].className +=               <td><input type="text" name="PRO_AQ_ID" style="width:350px; height:20px;"></td>
              
" invalid";
	      // and set the current valid status to false:
	      valid = false;
	    }
	  }
	  // I
</td>
f the val  
   
</table>
  </div>
  
  <script>
id status is true, mark the step as finished and valid:
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

<jsp:include page = "../common/footer.jsp"/>
</body>
</html>