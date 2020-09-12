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
    .content_idenManage_wrap{
        width: 100%;
        height:100%;
        padding: 25px;
        padding-top: 50px;
        /* background-color: lightslategrey; */
    }   
    /* 타이틀 설정 */
    .idenManage_title{
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
<div class="content_idenManage_wrap">
   <label class="idenManage_title">신원인증 요청 내역</label>
   <!-- 챗봇 데이터 생성란 전체 -->
   <div class="content_idenManage" style="width:100%;">
	<table class="table table-striped" border="0" style="margin-left:1%;;max-width:98%;min-width:98%;">
	   <thead>
	       <tr align="center">
	           <th scope="col"></th>
	           <th scope="col" style="text-align: center">신청인명</th>
	           <th scope="col" style="text-align: center">전화번호</th>
	           <th scope="col" style="text-align: center">핸드폰번호</th>
	           <th scope="col" style="text-align: center">팩스번호</th>
	           <th scope="col" style="text-align: center">소속</th>
	           <th scope="col" style="text-align: center">인증정보</th>
	       </tr>
	   </thead>
	   <tbody>
	   	<c:if test="${idenMembers != null && !empty idenMembers }">
	   		<c:set var="boardNo" value="0"/>
	    	<c:forEach var="i" begin="0" end="${idenMembers.size()-1 }" step="1">
	         <tr align="center">
             	<fmt:formatNumber type="number" value="${boardNo+1}" var="boardNo" />
	             <th scope="row" style="text-align: center">${boardNo }</th>
	             <td style="max-width: 400px;">${idenMembers[i].memName }</td>
	             <td>
	             	<c:if test="${idenMembers[i].phone != null}">
	             	<c:set var="phoneSplit" value="${fn:split(idenMembers[i].phone,',') }"/>
	             	${phoneSplit[0] }-${phoneSplit[1] }
	             	</c:if>
	             	<c:if test="${idenMembers[i].phone == null}">
	             	입력없음
	             	</c:if>
	             </td>
	             <td>
	             	<c:if test="${idenMembers.get(i).getCellPhone() != null}">
	        	     	<c:set var="cellPhoneSplit" value="${fn:split(idenMembers.get(i).getCellPhone(),',') }"/>
		             	<c:if test="${cellPhoneSplit[0] eq 'korea' }"><c:set var="cellPhoneNation" value="국내"/></c:if>
		             	<c:if test="${cellPhoneSplit[0] eq 'overseas' }"><c:set var="cellPhoneNation" value="해외"/></c:if>
		             	(${cellPhoneNation }) ${cellPhoneSplit[1]}-${cellPhoneSplit[2]}-${cellPhoneSplit[3]}
		             	<c:set var="cellPhoneNation" value=""/>
	             	</c:if>
	             	<c:if test="${idenMembers[i].cellPhone == null}">
	    	         	입력없음
	             	</c:if>
	             </td>
	             <td>
	             	<c:if test="${idenMembers[i].faxNo != null}">
	             	${idenMembers[i].faxNo }
	             	</c:if>
	             	<c:if test="${idenMembers[i].faxNo == null}">
	             	입력없음
	             	</c:if>
	             </td>
	             <td>
	             	<c:if test="${idenMembers[i].memInGroup != null}">
	             	${idenMembers[i].memInGroup }
	             	</c:if>
	             	<c:if test="${idenMembers[i].memInGroup == null}">
	             	입력없음
	             	</c:if>
	             </td>
	             <td>
	              <!-- Button trigger modal -->
	              	<input type="hidden" value="${idenMembers[i].memId }" name="memId" />
	              	<input type="hidden" value="${idenMembers[i].memName }" name="memName" />
	              	<c:if test="${idenMembers[i].ideName != null}">
	             	<input type="hidden" value="${idenMembers[i].ideName }" name="ideName" value="${idenMembers[i].ideName }"/>
	             	</c:if>
	             	<c:if test="${idenMembers[i].ideName == null}">
	             	<input type="hidden" name="ideName" value="입력없음"/>
	             	</c:if>
	              	<c:if test="${idenMembers[i].ideAddress != null}">
	             	<input type="hidden" value="${idenMembers[i].ideAddress }" name="ideAddress" value="${idenMembers[i].ideAddress }"/>
	             	</c:if>
	             	<c:if test="${idenMembers[i].ideAddress == null}">
	             	<input type="hidden" name="ideAddress" value="입력없음"/>
	             	</c:if>
	              	<c:if test="${idenMembers[i].renameFileName != null && idenMembers[i].originalFileName != null}">
	             	<input type="hidden" value="${idenMembers[i].renameFileName }" name="renameFileName"/>
	             	<input type="hidden" value="${idenMembers[i].originalFileName }" name="originalFileName"/>
	             	</c:if>
	             	<c:if test="${idenMembers[i].renameFileName == null}">
	             	<input type="hidden" name="renameFileName" value="입력없음"/>
	             	<input type="hidden" name="originalFileName" value="입력없음"/>
	             	</c:if>
					<button type="button" class="btn btn-info moreInfo" data-toggle="modal" data-target="#exampleModal" onclick="toInfo(this);">
					  	Info
					</button>
	             </td>
	         </tr>
	        </c:forEach>
	       </c:if>
	       <c:if test="${idenMembers == null || empty idenMembers}">
	       	<tr align="center">
	            <th scope="row"></th>
	            <td style="max-width: 400px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden;"></td>
	             <td>인증 요청 내역이 존재하지 않습니다.</td>
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
 
<!-- 인증정보 확인 모달 -->
<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      	<table class="table table-striped" border="0" style="margin-left:1%;;max-width:98%;min-width:98%;">
		   <thead>
		       <tr align="center">
		           <th scope="col" style="text-align: center">인증자명</th>
		           <th scope="col" style="text-align: center">인증자 주소</th>
		           <th scope="col" style="text-align: center">인증파일</th>
		       </tr>
		   </thead>
		   <tbody>
		   		<tr align="center" id="modalBodyTr">
	    	         <td style="min-width:100px;max-width:100px !important;">
		             </td>
		             <td style="width:100%;text-align: left;padding-left: 5px;padding-right: 5px;">
		             </td>
		             <td style="min-width:90px;max-width:90px !important;">
		             </td>
	             </tr>
	           </tbody>
          </table>
      </div>
      <div class="modal-footer">
      		<input type="hidden" name="ideId" />
	        <button type="button" class="btn btn-success btnProcess" onclick="acceptIden(this);">수락</button>
			<button type="button" class="btn btn-warning btnProcess" onclick="requestIden(this);">반려</button>
      </div>
    </div>
  </div>
</div>
 
 <script>
 	// 모달로 선택정보 패스
 	function toInfo(targetBtn){
 		var memId = $(targetBtn).siblings('input[name=memId]').val();
 		var memName = $(targetBtn).siblings('input[name=memName]').val();
 		var ideName = $(targetBtn).siblings('input[name=ideName]').val();
 		var ideAddress = $(targetBtn).siblings('input[name=ideAddress]').val();
 		var renameFileName = $(targetBtn).siblings('input[name=renameFileName]').val();
 		var originalFileName = $(targetBtn).siblings('input[name=originalFileName]').val();
 		
 		$('input[name=ideId]').val(memId);
 		$('.modal-title').html('<b>'+memName+'</b>'+' 인증 정보');
 		$('#modalBodyTr').find('td:nth-of-type(1)').html(ideName);
 		$('#modalBodyTr').find('td:nth-of-type(2)').html(ideAddress);
 		$('#modalBodyTr').find('td:nth-of-type(3)').html('<a href="${pageContext.servletContext.contextPath}/resources/idenFile/'+renameFileName+'" download="'+originalFileName+'">확인</a>');
 	}
 	
 	// 신원 인증 수락
 	function acceptIden(targetBtn){
 		var ideId = $(targetBtn).siblings('input[name=ideId]').val();
 		location.href="acceptIden.do?ideId="+ideId;
 	}
 	
 	// 신원 인증 재요청
 	function requestIden(targetBtn){
 		var ideId = $(targetBtn).siblings('input[name=ideId]').val();
 		location.href="requestIden.do?ideId="+ideId;
 	}
 </script>
 
</body>
 <script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
<!-- <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script> -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
</html>