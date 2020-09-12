<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	/* 신원인증 요청 관리 영역 --------------------------------------------------------------------------*/
    /* 전체 컨텐트 랩 */
    .content_declareManage_wrap{
        width: 100%;
        height:100%;
        padding: 25px;
        padding-top: 50px;
        /* background-color: lightslategrey; */
    }   
    /* 타이틀 설정 */
    .declareManage_title{
        font-size: 22px;
        font-weight: 550;
        color: rgb(10,10,10);
        margin-bottom: 25px;
        margin-left: 1%;
    }
	
	.btnProcess{
		font-size:15px !important;
		font-weight:550 !important;
		width:65px;
		height:35px;
		padding-top: 6px !important;
	}
	.btn-warning{
		padding-left:10px !important;
		position: relative;
		top:-2px;
	}
	.btn-info{
		font-size:15px !important;
		height:35px;
	}
</style>
</head>
<body>
<!-- 관리자 메뉴바 포함 -->
<jsp:include page="../common/adminNavbar.jsp" />
 <!-- 여기서부터 콘텐츠 시작하면 됨 -->
<div class="content_declareManage_wrap">
   <label class="declareManage_title">신고 내역 관리</label>
   <!-- 신고된 회원 뷰 전체 -->
   <div class="content_declareManage" style="width:100%;">
	<table class="table table-striped" border="0" style="margin-left:1%;;max-width:98%;min-width:98%;">
	   <caption style="caption-side: top;text-align:center;">제재자 정보</caption>
	   <thead>
	       <tr align="center">
	           <th scope="col"></th>
	           <th scope="col" style="text-align: center">회원명</th>
	           <th scope="col" style="text-align: center">회원 구분</th>
	           <th scope="col" style="text-align: center">회원 타입</th>
	           <th scope="col" style="text-align: center">소속</th>
	           <th scope="col" style="text-align: center">전화번호</th>
	           <th scope="col" style="text-align: center">핸드폰번호</th>
	           <th scope="col" style="text-align: center">최근 제재일</th>
	           <th scope="col" style="text-align: center">신고내역</th>
	       </tr>
	   </thead>
	   <tbody>
	   	<c:if test="${declareMems != null && !empty declareMems }">
	   		<c:set var="boardNo" value="0"/>
	    	<c:forEach var="i" begin="0" end="${declareMems.size()-1 }" step="1">
	         <tr align="center">
             	<fmt:formatNumber type="number" value="${boardNo+1}" var="boardNo" />
	             <th scope="row" style="text-align: center">${boardNo }</th>
	             <td style="max-width: 400px;">${declareMems[i].memName }</td>
	             <td>
	             	<c:if test="${declareMems[i].userType == 'UT3'}">
	             	클라이언트
	             	</c:if>
	             	<c:if test="${declareMems[i].userType == 'UT4'}">
	             	파트너스
	             	</c:if>
	             </td>
	             <td>
	             	<c:if test="${declareMems[i].memType != null}">
	             	${declareMems[i].memType }
	             	</c:if>
	             	<c:if test="${declareMems[i].phone == null}">
	             	입력없음
	             	</c:if>
	             </td>
	             <td>
	             	<c:if test="${declareMems[i].memTypeName != null}">
	             	${declareMems[i].memTypeName }
	             	</c:if>
	             	<c:if test="${declareMems[i].memTypeName == null}">
	             	입력없음
	             	</c:if>
	             </td>
	             <td>
	             	<c:if test="${declareMems[i].phone != null}">
	             	<c:set var="phoneSplit" value="${fn:split(declareMems[i].phone,',') }"/>
	             	${phoneSplit[0] }-${phoneSplit[1] }
	             	</c:if>
	             	<c:if test="${declareMems[i].phone == null}">
	             	입력없음
	             	</c:if>
	             </td>
	             <td>
	             	<c:if test="${declareMems.get(i).getCellPhone() != null}">
	        	     	<c:set var="cellPhoneSplit" value="${fn:split(declareMems.get(i).getCellPhone(),',') }"/>
		             	<c:if test="${cellPhoneSplit[0] eq 'korea' }"><c:set var="cellPhoneNation" value="국내"/></c:if>
		             	<c:if test="${cellPhoneSplit[0] eq 'overseas' }"><c:set var="cellPhoneNation" value="해외"/></c:if>
		             	(${cellPhoneNation }) ${cellPhoneSplit[1]}-${cellPhoneSplit[2]}-${cellPhoneSplit[3]}
		             	<c:set var="cellPhoneNation" value=""/>
	             	</c:if>
	             	<c:if test="${declareMems[i].cellPhone == null}">
	    	         	입력없음
	             	</c:if>
	             </td>
	             <td>
	             	${declareMems[i].memModifyDate }
	             </td>
	             <td>
	             	<input type="hidden" name="memId" value="${declareMems[i].memId }"/>
					<button type="button" class="btn btn-info goDeclareInfo" onclick="gotoDeclareDetail(this);">자세히</button>
	             </td>
	         </tr>
	        </c:forEach>
	       </c:if>
	       <c:if test="${declareMems == null || empty declareMems}">
	       	<tr align="center">
	            <th scope="row"></th>
	            <td style="max-width: 400px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden;"></td>
	             <td>제재된 회원 내역이 존재하지 않습니다.</td>
	             <td></td>
	             <td></td>
	         </tr>
	        </c:if>
	    </tbody>
	</table>
		<div style="text-align:center;margin-left:1%;;max-width:98%;min-width:98%;">
		<nav aria-label="Page navigation example" style="margin:auto;display: inline-block;">
		  <ul class="pagination">
		    <li class="page-item">
		      <a class="page-link" href="#" aria-label="Previous">
		        <span aria-hidden="true">&laquo;</span>
		      </a>
		    </li>
		    <li class="page-item"><a class="page-link" href="#">1</a></li>
		    <li class="page-item"><a class="page-link" href="#">2</a></li>
		    <li class="page-item"><a class="page-link" href="#">3</a></li>
		    <li class="page-item">
		      <a class="page-link" href="#" aria-label="Next">
		        <span aria-hidden="true">&raquo;</span>
		      </a>
		    </li>
		  </ul>
		</nav>
	   </div>
   </div>
</div>
 
 <script>
 	// 모달로 선택회원 패스하여 디테일로
 	function gotoDeclareDetail(targetBtn){
 		var memId = $(targetBtn).siblings('input[name=memId]').val();
 		location.href="gotoDeclareDetail.do?memId="+memId;
 	}
 </script>
 
</body>
 <script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
<!-- <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script> -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
</html>