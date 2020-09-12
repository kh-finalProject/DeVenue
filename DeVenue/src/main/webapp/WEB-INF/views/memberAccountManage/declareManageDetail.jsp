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
   <label class="declareManage_title">신고 내역 관리 - 제재 내역</label>
   <!-- 신고된 회원 뷰 전체 -->
   <div class="content_declareManage" style="width:100%;">
	<table class="table table-striped" border="0" style="margin-left:1%;;max-width:98%;min-width:98%;">
	   <thead>
	       <tr align="center">
	           <th scope="col"></th>
	           <th scope="col" style="text-align: left">신고자 이름</th>
	           <th scope="col" style="text-align: left">신고자 연락처</th>
	           <th scope="col" style="text-align: left">신고내역</th>
	           <th scope="col" style="text-align: right">
	           		<button type="button" class="btn btn-success" onclick="releaseSanctions();">제재 해제</button>
	           </th>
	       </tr>
	   </thead>
	   <tbody>
	   	<c:if test="${declares != null && !empty declares }">
	   		<c:set var="boardNo" value="0"/>
	    	<c:forEach var="i" begin="0" end="${declares.size()-1 }" step="1">
	         <tr align="left">
             	<fmt:formatNumber type="number" value="${boardNo+1}" var="boardNo" />
	             <th scope="row" style="text-align: center">${boardNo }</th>
	             <td style="max-width: 400px;">${declares[i].fromName }</td>
	             <td>
	             	<c:if test="${declares[i].fromPhone != null}">
	        	     	<c:set var="cellPhoneSplit" value="${fn:split(declares[i].fromPhone,',') }"/>
		             	<c:if test="${cellPhoneSplit[0] eq 'korea' }"><c:set var="cellPhoneNation" value="국내"/></c:if>
		             	<c:if test="${cellPhoneSplit[0] eq 'overseas' }"><c:set var="cellPhoneNation" value="해외"/></c:if>
		             	(${cellPhoneNation }) ${cellPhoneSplit[1]}-${cellPhoneSplit[2]}-${cellPhoneSplit[3]}
		             	<c:set var="cellPhoneNation" value=""/>
	             	</c:if>
	             	<c:if test="${declares[i].fromPhone == null}">
	    	         	입력없음
	             	</c:if>
	             </td>
	             <td colspan="2">
	             	<c:if test="${declares[i].decContent != null}">
	             		${declares[i].decContent }
	             	</c:if>
	             	<c:if test="${declares[i].decContent == null}">
	    	         	입력없음
	             	</c:if>
	             </td>
	         </tr>
	        </c:forEach>
	       </c:if>
	       <c:if test="${declares == null || empty declares}">
	       	<tr align="center">
	            <th scope="row"></th>
	            <td style="max-width: 400px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden;"></td>
	             <td>신고 내역이 존재하지 않습니다.</td>
	             <td></td>
	             <td></td>
	         </tr>
	        </c:if>
	    </tbody>
	</table>
			
   </div>
</div>
 
 <script>
 	// 제재상태 해제
 	function releaseSanctions(){
 		var memId = '${memId}';
 		location.href="releaseSanctions.do?memId="+memId;
 	}
 </script>
 
</body>
 <script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
<!-- <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script> -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
</html>