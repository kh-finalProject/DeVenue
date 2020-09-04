<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html class="no-js" lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>디베뉴 관리자 채팅관리1 - 채팅 목록</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
    <!-- <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script> -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    
    <!-- summernote CSS : 텍스트 필드 플러그인 css !!!!!!!!!!!!!!!!!!!
    ============================================ -->
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/css/summernote/summernote.css">


    <!-- 개인적인 css 시작 -->
    <style>
        /* 채팅 필터 영역 --------------------------------------------------------------------------*/
        /* 전체 콘텐트 랩 */
        .content_chatList{
            width: 100%;
            height:100%;
            padding: 25px;
            padding-top: 50px;
            display:flex;
            /* background-color: lightslategrey; */
        }

        /* 채팅 목록 타이틀 */
        .chatList_title{
            font-size: 22px;
            font-weight: 550;
            color: rgb(10,10,10);
        }

        /* 필터 영역 */
        .content_chatList_filter{
            width:100%;
            background-color: #343a40;
            border-radius: 3px;
            margin: 25px 0px 10px 0px;
            padding: 20px 0px 20px 10px;
            padding-right: 0px;
            align-items: center;
        }

        /* 필터 영역 테이블 */
        .content_chatList_filter table{
            width:100%;
            margin: auto;
        }
        /* 테이블 각 td */
        .content_chatList_filter table td{
            padding:5px;
            padding-left: 15px;
            padding-right: 0px;
        }

        /* 2번째 줄의 td 아래 간격 넓히기 */
        .content_chatList_filter table tr:nth-of-type(2n) td{
            /* text-align: center; */
            padding-bottom: 15px;
        }

        /* td 간격 조정 */
        .content_chatList_filter table td:nth-of-type(2n){
            width:50%;
        }

        /* 테이블 안 라벨 */
        .content_chatList_filter table label{
            font-size: 15px;
            font-weight: 550;
            text-align: left;
            color: white;
            max-width: 90%;
            white-space: nowrap;
            text-overflow: ellipsis;
        }

        /* 테이블 안 select */
        .content_chatList_filter table select{
            width:90%;
            /* height: ; */
            height: 35px;
            border-radius: 3px;
            border: 1px solid gray;
            text-indent: 5px;
        }
        /* 검색 select */
        .searchCategory{
            width:19% !important;
        }

         /* 테이블 안 option */
        .content_chatList_filter table option{
            height: 35px;
            text-indent: 5px;
        }

        /* 테이블 안 버튼 공통 */
        .content_chatList_filter table button{
            width:90%;
            height: 35px;
            background-color: rgb(115, 115, 133);
            border:none;
            border-radius: 3px;
            color:white;
            padding: 5px 10px 5px 10px;
        }

        /* 테이블 안 검색창 */
        .content_chatList_filter table input[type="search"]{
            width:43%;
            height: 32px;
            border-radius: 3px;
            border: 1px solid gray;
            text-indent: 5px;
            position: relative;
            top:-1px;
        }

        /* 검색버튼만 따로 */
        .content_chatList_filter table .searchBtn{
            width:21% !important;
            margin-left: 3%;
            height: 36px;
            box-sizing: border-box;
            position: relative;
            top:-1px;
        }

        /* hr 태그 */
        .content_chatList hr{
            border: none;
            border-top: 1px solid lightgray;
            width: 80%;
        }

        /* 채팅방 리스트 뿌려지는 영역 ------------------------------------------------------------------- */
        /* 전체 영역 */
        .content_chatRoom_list{
            /* background-color: maroon; */
            align-items: center;
            text-align: center;
            width: 100%;
        }

        /* 테이블 영역 */
        .content_chatRoom_list table{
            width:100%;
            background-color: white;
        }

        /* th */
        .content_chatRoom_list table th{
            padding: 13px;
            /* background-color: mediumpurple; */
            text-indent: 5px;
            background-color: #343a40;
            color:white;
        }

        /* 첫번째를 제외한 모든 tr */
        .content_chatRoom_list table tr:not(:nth-of-type(2n-1)):hover{
            background-color: rgb(227, 226, 238);
        }

        /* 모두 선택 라벨 */
        .allRoomCheck{
            margin: 0px;
            position: relative;
            top:3px;
        }

        /* 각 td */
        .content_chatRoom_list table td{
            padding: 13px;
            border:none;
        }
        /* 두세번째 td */
        .content_chatRoom_list table tr td:nth-of-type(2)
        ,.content_chatRoom_list table tr td:nth-of-type(3){
            padding-bottom: 0px;
        }

        /* 날짜부분 td */
        .content_chatRoom_list table tr:nth-of-type(2n) td:last-of-type{
            width:165px;
        }
        /* 체크박스 부분 td */
        .content_chatRoom_list table th:first-of-type{
            width:120px;
        }

        /* 회원 한명마다 밑줄 */
        .content_chatRoom_list table tr:nth-of-type(2n+1) td
        , .content_chatRoom_list table tr:nth-of-type(1n) td:nth-of-type(1)
        , .content_chatRoom_list table tr:nth-of-type(1n) td:nth-of-type(2){
            border-bottom: 1px solid lightgray !important;
        }

        /* 체크 박스 */
        .content_chatRoom_list input[type="checkBox"]{
            width: 15px;
            height: 15px;
            position: relative;
            top:2px;
        }
        /* 모두선택 체크박스 */
        #allRoomCheck{
            position: relative;
            top:-1px;
        }

        /* 회원 프로필 이미지 */
        .content_chatRoom_list .memProfileIcon{
            border-radius: 50%;
        }

        /* 회원 닉네임 영역 */
        .content_chatRoom_list label{
            /* 이거 설정해주면 줄였을때 프사는 없어짐 */
            max-width: 80%;
            overflow: hidden;
            white-space: nowrap;
            text-overflow: ellipsis;
        }

        /* 알림 */
        .content_chatRoom_list .alertRead{
            display: inline-block;
            width: 20px;
            height: 20px;
            padding: 0px 0px 0px 6px;
            background-color: red;
            border-radius: 50%;
            color:white;
            max-width: 20px;
            overflow: hidden;
            white-space: nowrap;
            text-overflow: ellipsis;
            position: relative;
            top:-7px;
        }
        /* 마지막 채팅내역 */
        .lastChatContent{
            display: inline-block;
            max-width: 90%;
            overflow: hidden;
            white-space: nowrap;
            text-overflow: ellipsis;
        }
        /* 채팅시간 */
        .content_chatRoom_list .chatTime{
            color: gray;
            font-size: 14px;
            font-weight: 500;
        }

        /* 페이지네이션 ----------------------------------*/
        /* 전체 영역 */
        .pagination{
            color:black !important;
        }
        
        /* 회원 리스트 -----------------------------------*/
        #memAreaForCrtChatRoom table tr:last-child td:first-child {
		    border-bottom-left-radius: 10px !important;
		}
		
		#memAreaForCrtChatRoom table tr:last-child td:last-child {
		    border-bottom-right-radius: 10px !important;
		}
    </style>
</head>

<body>
	<!-- 관리자 메뉴바 포함 -->
	<jsp:include page="../common/adminNavbar.jsp" />
	
    <!-- 여기서부터 콘텐츠 시작하면 됨 -->
    <div class="content_chatList">
        <div style="width:70%;">
	    <label class="chatList_title">Chat List Manage</label>
        <!-- 채팅 목록 필터 및 버튼란 -->
        <div class="content_chatList_filter">
            <form action="#" method="">
                <table>
                    <tr>
                        <td>
                            <label>읽은/읽지않은 필터</label>
                        </td>
                        <td>
                            <label>검색</label><br>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <select name="readSelect">
                                <option value="" selected disabled> -- </option>
                                <option value="all">전체</option>
                                <option value="notRead">읽지 않은 목록</option>
                                <option value="read">읽은 목록</option>
                            </select>
                        </td>
                        <td>
                            <select name="searchCatecory" class="searchCategory" id="searchCategory">
                                <option value="" selected disabled>--</option>
                                <option value="name">회원명</option>
                                <option value="email">이메일</option>
                                <option value="phone">전화번호</option>
                            </select>
                            <input type="search" placeholder="검색어" id="searchText" onkeydown="return enter()">
                            <button class="searchBtn" type="button" onclick="searchChatRoomAndMem();">검색</button>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label>담당 관리자 선택</label>
                        </td>
                        <td>
                            <label>마케팅 수신동의 여부</label><br><!--비회원 할지말지 모르겠음-->
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <select name="adminSelect">
                            	<option value="" selected disabled> -- </option>
                                <option value="all">전체</option>
                                <c:forEach var="i" begin="0" end="${admins.size()-1}" step="1">
	                                <option value="${admins[i].mId }">${admins[i].typeName }&nbsp;${admins[i].mName }</option>
                                </c:forEach>
                            </select>
                        </td>
                        <td>
                            <select name="isAdSelect">
                            	<option value="" selected disabled> -- </option>
                                <option value="all">전체</option>
                                <option value="agree">동의</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <button type="button" onclick="refreshChatList()" id="refreshBtn">리스트 갱신</button>
                        </td>
                        <td>
                            <button type="button" onclick="deleteChatRoom()">채팅방 나가기</button>
                        </td>
                    </tr>
                </table>
            </form>
        </div>
        <!-- 구분선 -->
        <hr>
        <!-- 채팅 리스트 뿌려지는 공간 -->
        <div class="content_chatRoom_list">
        	<div id="chatListArea">
            <table>
                <tr align="center">
                    <th style="text-align:center">
                        <input type="checkbox" id="allRoomCheck" >
                        <label for="allRoomCheck" class="allRoomCheck">모두 선택</label>
                    </th>
                    <th colspan="4" style="text-align: center;">
                        회원별 채팅방
                    </th>
                    <th style="text-align:right;">
                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#marketing_message_modal" onclick="return sendSelectRoomIdsToModal();">선택 전송</button>
                    </th>
                </tr>
                <c:if test="${chatList != null && !chatList.isEmpty() }">
                <c:forEach var="i" begin="0" end="${chatList.size()-1}" step="1">
	                <!-- 하나의 채팅방 -->
	                <tr class="chatRoom">
	                    <td rowspan="2" align="center">
	                        <!-- 회원별 채팅방 체크 (각 채팅방의 회원들의 회원번호를 값으로 준다)-->
	                        <input type="checkbox" class="memCheck" value="${chatList[i].memId }">
	                        <input type="hidden" class="roomCheck" value="${chatList[i].roomId }">
	                        <input type="hidden" class="adminCheck" value="${chatList[i].toId }">
	                    </td>
	                    <td rowspan="2"align="center">
	                        <!-- 회원 프사 -->
	                        <c:if test="${chatList[i].proImgName == null}">
	                        	<img class="memProfileIcon" src="${pageContext.servletContext.contextPath }/resources/proImg/user5.png" width="60px" height="60px">
	                        </c:if>
	                        <c:if test="${chatList[i].proImgName != null}">
	                        	<img class="memProfileIcon" src="${pageContext.servletContext.contextPath }/resources/proImg/${chatList[i].proImgName }" width="60px" height="60px">
	                        </c:if>
	                    </td>
	                    <td colspan="3" align="left">
	                        <!-- 회원 이름or닉네임 +- 회원/비회원 여부 + 안읽은 메시지 표시(수까지)-->
	                        <label>${chatList[i].roomName}</label>
	                        <c:if test="${chatList[i].unreadCount != 0}">
	                        	<span class="alertRead">${chatList[i].unreadCount }</span>
	                        </c:if>
	                    </td>
	                    <td align="center">
	                        <!-- 마지막 채팅 날짜 및 시간(ex) 2020-08-01 14:00) -->
	                        <label class="chatTime">${fn:substring(chatList[i].finalDate, 0, 16)}</label>
	                    </td>
	                </tr>
	                <tr class="relTr chatRoom">
	                    <!-- 마지막 채팅 -->
	                    <td colspan="3" align="left">
	                        <span class="lastChatContent">${chatList[i].chatContent }</span>
	                    </td>
	                    <!-- 그냥 줄 맞추기 위해 남겨놓은 td에 팝업창으로 넘길 폼안에 데이터 담기위한 히든태그 설치 -->
	                    <td>
						    <input type="hidden" name="chatRoomMId" class="chatRoomMId" value="${chatList[i].memId }" />
						    <input type="hidden" name="chatRoomRoomId" class="chatRoomRoomId" value="${chatList[i].roomId }" />
	                    </td>
	                </tr>
                </c:forEach>
               	</c:if>
               	<c:if test="${chatList == null || chatList.isEmpty() }">
	                <tr class="hiddenForNone" align="center">
	                	<td colspan="7">
	                		조회된 채팅방이 없습니다.
	                	</td>
	                </tr>
	             </c:if>
            </table>
         </div>
		    <!-- 페이지네이션 -->
		    <nav aria-label="Page navigation example" style="margin:auto; text-align: center;">
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
        <!-- 검색 조건에 해당하지만 채팅방이 없는 회원들을 조회하여 채팅방을 생성할 수 있도록 한다. -->
	     <div id="memAreaForCrtChatRoom" style="width:30%;margin-left:1%;">
	     	<label class="chatList_title" style="margin-bottom: 30px;">Create New Chat</label>
	     	<div id="memWrap" style="width:100%;">
			    <table class="table table-dark table-sm table-hover" style="width: 100%; text-align: center" id="memTable">
				  <thead class="thead-dark">
				    <tr>
				      <th scope="col" colspan="2">
						<label style="padding-bottom:0px;padding-left: 3px;" for="allMemCheck">모든회원</label>
						&nbsp;<input type="checkbox" id="allMemCheck">
				      </th>
				      <th style="text-align: right;">
				      	<button type="button" class="btn btn-primary" style="height:30px;padding-top: 3px" onclick="createNewChat();">New</button>
				      </th>
				    </tr>
				  </thead>
				  <!-- 동적으로 생성한 코드를 넣을 영역 -->
				  <tbody class="tbody-dark" id="memTbody">
				    <tr>
				    	<td colspan="3">조회 결과가 없습니다.</td>
				    </tr>
				  </tbody>
				</table>
			</div>
	     </div>
    </div>
    
    <!-- 단체 메시지를 위한  채팅 모달 창-->
    <div class="modal fade" id="marketing_message_modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header" style="display: flex !important;">
            <h5 class="modal-title" id="" style="">메시지 전송</h5>
            <button type="button" style="padding-top:0px;" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
            </div>
            <div class="modal-body">
                <form action="insertManyMessage.do" method="post" id="groupMessageForm">
                    <!-- 채팅  메시지  -->
                    <div class="chatIntro_message">
                    	<!-- 서머노트의 값을 담을 히든태그 -->
	                    <input type="hidden" id="summerValue" name="mContent">
                        <div class="summernote">
                        </div>
                    </div>
                    <!-- 선택된 회원들의 회원번호를 담을 히든태그  -->
                    <input type="hidden" id="selectRoomIds" name="roomIds">
                </form>
            </div>
            <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
            <button type="button" class="btn btn-primary" onclick="sendGroupMessage();">전송</button>
            </div>
        </div>
        </div>
    </div>
    <!-- 채팅창으로 들어갈 데이타 폼 -->
	<form name="frmData" id="frmData" method="get">
		 <input type="hidden" name="chatRoomMId" id="chatRoomMId"/>
		 <input type="hidden" name="chatRoomRoomId" id="chatRoomRoomId"/>
		 <input type="hidden" name="meId" id="meId"/>
	</form>

    <!-- summernote JS : 텍스트 필드 플러그인 js !!!!!!!!!!!!!!!!!!!1
    ============================================ -->
    <script src="${pageContext.servletContext.contextPath}/resources/js/summernote/summernote.min.js"></script>
    <script src="${pageContext.servletContext.contextPath}/resources/js/summernote/summernote-active.js"></script>


    <!-- 개인 스크립트 ------------------------------------------------------------------------->
    <script>
       
        //-------------------------------------------------------------------------------------
        // 선택한 방번호들을 모아 전송 모달창의 히든태그에 담음
        function sendSelectRoomIdsToModal(){
        	var roomIds = collectRoomIds();
        	$('#selectRoomIds').val(roomIds);
        }
     	// summernote의 내용을 제출하기위해서 값을 옮김
        function sendSummerMessageToHidden(){
            var hidden =  $('#summerValue');
            var sHTML = hidden.next().summernote('code');
            hidden.val(sHTML)
            alert(hidden.val());
        };
        // 해당 회원들에게 단체메시지 전송(모달창에서)
        function sendGroupMessage(){
        	// summernote 입력내용을 제출하기 위해 히든태그에 값을 옮김
        	sendSummerMessageToHidden();
        	
        	// 조건에 안맞으면 튕김
			if($('#selectRoomIds').val()=="" || $('#summerValue').val().trim()==""){
				alert('선택된 회원이 없거나 메시지를 입력하지 않았습니다.');
				return;
			}
        	
        	// 맞으면 제출
        	$('#groupMessageForm').submit();
        }
        //--------------------------------------------------------------------------------------------
        
        // 리스트 갱신
        function refreshChatList() {
	       	$('#chatListArea').load(document.URL + ' #chatListArea table', function(){
	       		chatListFunctions();
	       	});
	       	$('#memWrap').load(document.URL + ' #memWrap table', function(){
	       	});
	       
	       	// 필터는 로드하면 검색이 안먹어서 그냥 손수 원위치 시켜주자
	       	$('[name=readSelect]').find('option:first').prop('selected', 'selected');
	       	$('[name=adminSelect]').find('option:first').prop('selected', 'selected');
	       	$('[name=isAdSelect]').find('option:first').prop('selected', 'selected');
	       	$('[name=searchCatecory]').find('option:first').prop('selected', 'selected');
	       	$('#searchText').val('');
       	}
        //--------------------------------------------------------------------------------------------
        
     	// 체크된 채팅방 방번호 뽑고, 중복제거 한 후 반환
        function collectRoomIds(){
        	// 값을 추출해서 모음
        	var roomIds = '';
        	var count = 0;
        	$('.chatRoom').find('input[type=checkbox]').each(function(index, item){
        		if($(item).prop('checked')==true){
	        		if(index != 0){
	        			roomIds = roomIds+","+$(item).next('.roomCheck').val();
	        		}else{
	        			roomIds = $(item).next('.roomCheck').val();
	        		}
	        		count += 1;
        		}
        	})
        	if(roomIds[roomIds.length]==','){
        		roomIds = roomIds.substring(0, roomIds.length);
        		alert(roomIds)
        	}
        	if(roomIds[0]==','){
        		roomIds = roomIds.substring(1, roomIds.length);
        		alert(roomIds);alert('asdf');
        	}
        	// 중복제거
        	var idArr = roomIds.split(',');
        	for(var i = 0; i < idArr.length; i++){
        		for(var j = i+1; j < idArr.length; j++){
        			if(idArr[i]==idArr[j]){
						idArr.shift();
						break;
        			}
        		}
        	}
        	roomIds = idArr.toString();
        	
        	return roomIds; 
        }
     
        // 선택한 채팅방 나가기
        function deleteChatRoom(){
        	// 체크한 채팅방이 없으면 함수를 종료
        	// 있다면 roomId를 모아서 담음
        	var roomIds = collectRoomIds();
        	if(roomIds == ''){
        		alert('삭제할 채팅방을 선택해주세요');
        		return;
        	}
        	// 모은 roomId를 통해 ajax로 채팅방 삭제
			$.ajax({
				url:"deleteChatRooms.do",
				data:{roomIds:roomIds},
				type:"get",
				success:function(data){
					alert(data);
		        	// 삭제 완료하면 리스트 갱신 버튼을 눌러 갱신
		        	$('#refreshBtn').click();
				},
				error:function(error){
					alert(error)
				}
			});
        }
        
        //--------------------------------------------------------------------------------------------
        
        // 다시 로드할 챗리스트 관련 함수들 모음집
        function chatListFunctions(){
            // 모두선택 체크박스
            $('#allRoomCheck').click(function(){
                var isChecked = $('#allRoomCheck').prop('checked');
                    $('.memCheck').each(function(index,item){
                    	if($(item).css('display')!='none'){
	                        $(item).prop('checked', isChecked);
                    	}
                    })
            })
        	
            // 체크박스 해당 td 눌러도 체크되게
            $('.content_chatRoom_list td:first-of-type').click(function(event){
            	// 체크 박스 자체에 하단의 이벤트가 적용 안되게
            	if($(event.target).attr('type')=='checkbox'){
            		return;
            	}
                var isChecked = $(this).children('input[type=checkbox]').prop('checked');
                if(isChecked){
                	$(this).children('input[type=checkbox]').prop('checked', false);
                }else{
                	$(this).children('input[type=checkbox]').prop('checked', true);
                }
            });

            // 한 tr을 호버하면 다음 tr(같은 영역의)도 호버라고 생각하게
            $('.content_chatRoom_list tr').hover(function(){
            	$(this).css('background', 'rgb(227, 226, 238)');
                $(this).next('.relTr').css('background', 'rgb(227, 226, 238)');
            }).mouseleave(function(){
                $(this).css('background', 'white');
                $(this).next('.relTr').css('background', 'white');
            })
             $('.content_chatRoom_list .relTr').hover(function(){
                $(this).css('background', 'rgb(227, 226, 238)');
                $(this).prev('.chatRoom').css('background', 'rgb(227, 226, 238)');
            }).mouseleave(function(){
                $(this).css('background', 'white');
                $(this).prev('.chatRoom').css('background', 'white');
            })

            // 검색 카테고리 미선택시 검색란 비활성화
            $('#searchText').prop('disabled', 'disabled').css('background', 'lightgray');
            $('.content_chatList_filter').change(function(){
                if($('.searchCategory').val() == null){
                    $('#searchText').prop('disabled', 'disabled').css('background', 'lightgray');
                }else{
                    $('#searchText').prop('disabled', false).css('background', 'white');
                }
            })

            // 각 tr(채팅방) 클릭하면 새 채팅방 뜨게
            $('.chatRoom *').not('td:first-of-type').not('input').click(function(){
            	var userId = $(this).parents('.chatRoom').next('.relTr').find('.chatRoomMId').val();
            	var roomId = $(this).parents('.chatRoom').next('.relTr').find('.chatRoomRoomId').val();
				$('#chatRoomMId').val(userId);
				$('#chatRoomRoomId').val(roomId);
				$('#meId').val('${loginUser.memId}')
				var pop_title = "PopupWin";
                
                var frmData = document.frmData ;
                frmData.target = pop_title ;
                frmData.action = "adminChatRoom.do" ;
                 
                window.open('adminChatRoom.do', pop_title, "width=1000,height=490");
                frmData.submit() ;
            })
        }
        
        $(function(){
        	chatListFunctions();
        	memListFunctions();
        });
        
        // 회원 영역 관련 함수들 ----------------------------------------------------
        function memListFunctions(){
        	// 회원 테이블 감싼 영역을 회원 테이블 가로길이와 같게 함
        	$('#memWrap').css('width', $('#memWrap').find('table').width());
        }
        
        // 필터 부분 관련 함수들 --------------------------------------------------
        $(function(){
        	// 읽은/읽지 않은 필터
        	$('[name=readSelect]').change(function(){
				var value = $(this).val();
				if(value=="all"){
					$('.chatRoom').show();
				}else if(value=="notRead"){
					$('.chatRoom').not('.relTr').each(function(index, item){
						if($(item).find('.alertRead').length > 0){
							$(item).show();
							$(item).next('.relTr').show();
						}else{
							$(item).hide();
							$(item).next('.relTr').hide();
						}
					});
				}else if(value=="read"){
					$('.chatRoom').not('.relTr').each(function(index, item){
						if($(item).find('.alertRead').length > 0){
							$(item).hide();
							$(item).next('.relTr').hide();
						}else{
							$(item).show();
							$(item).next('.relTr').show();
						}
					});
				}
				
				showWhenNoChatRoom();
        	});
        	
        	// 담당 관리자 선택
        	$('[name=adminSelect]').change(function(){
				var value = $(this).val();// 선택한 관리자의 회원번호가 담길 것
				$('.adminSelect')
				if(value=="all"){
					$('.chatRoom').show();
				}else {
					$('.chatRoom').not('.relTr').each(function(index, item){
						var adminId = $(item).find('.adminCheck').val();
						if(value==adminId){
							$(item).show();
							$(item).next('.relTr').show();
						}else{
							$(item).hide();
							$(item).next('.relTr').hide();
						}
					});
				}
				
				showWhenNoChatRoom();
        	});
        	
        	// 마케팅 수신 동의 여부(그냥 회원도 같이 검색됨)
        	// 채팅방은 수신 동의 한 회원이 있는 채팅방 목록을 전부 뽑아와서 그걸로 비교하여 display 결정하자
        	// 회원은 그냥 검색해와서 담아온것을 ajax로 동적 추가만 해주면 된다
        	$('[name=isAdSelect]').change(function(){
				var value = $(this).val();// 선택한 select태그의 값이 담김(all/agree)
				
				$.ajax({
					url:"selectIsReadRoomAndMem.do",
					type:"get",
					data:{value:value},
					dataType:"json",
					contentType: 'application/json; charset=utf-8',
					success:function(data){
						// 채팅방 디스플레이 결정
						if(value!="all"){
							$('.chatRoom').not('.relTr').each(function(index, item){
								var eachRoomId = $(item).find('.roomCheck').val();
								$(item).hide();
								$(item).next('.relTr').hide();
								
								for(var i = 0; i < data['isAdRoomIds'].length; i++){
									var roomId = data['isAdRoomIds'][i];
									// db로 부터 받아온 룸번호에 맞지 않으면 숨기고 아니면 보여줌
									if(roomId==eachRoomId){
										$(item).show();
										$(item).next('.relTr').show();
									}
								}
							});
							
						}else{
							$('.chatRoom').show();
						}
						// 회원 동적으로 띄우기
						$tableBody = $('#memTbody');
						$tableBody.html('');
						
						for(var i = 0; i < data['cui'].length; i++){
							$tr = $('<tr>');
							$td1 = $('<td>').text(data['cui'][i].mName);
							$td2 = $('<td>').text(data['cui'][i].mEmail);
							if(data['cui'][i].phone != null){
								$td3 = $('<td>').text(data['cui'][i].phone);
							}else{
								$td3 = $('<td>').text(data['cui'][i].cellPhone);
							}
							
							$input = $('<input type="hidden" class="mIdHidden">');
							$input.val(data['cui'][i].mId);
							$input2 = $('<input type="hidden" class="mNickHidden">');
							$input2.val(data['cui'][i].mNick);
														
							$tr.append($td1);
							$tr.append($td2);
							$tr.append($td3);
							$tr.append($input);
							$tr.append($input2);
							$tr.addClass('forNewChat');
							$tableBody.append($tr);
						}
						
						if($tableBody.html()==''){
							var noTr = '<tr><td colspan="3">조회 결과가 없습니다.</td></tr>';
							$tableBody.append(noTr);
						}
						
						showWhenNoChatRoom();
					},
					error:function(error){
						alert(error)
					}
				})
        	});
        	
        });
       	// 키워드에 따른 검색(그냥 회원도 같이 검색됨)
       	// 검색은 카테고리를 정하지 않으면 검색창을 아예 비활성화 시키고 submit도 안되게 한다.
       	// 채팅방은 검색 결과가 있는 채팅방 번호들만 가져와서 그걸로 비교하여 display를 조절하고, 
       	// 회원은  ajax로 할지 그냥 한번 갔다올지 고민 중
       	function searchChatRoomAndMem(){
       		if($('#searchCategory').val() == null){
       			alert('검색할 카테고리를 선택해주세요.')
       			return;
       		}
       		if($('#searchText').val().trim() == ''){
       			alert('검색어를 입력해주세요.')
       			return;
       		}
       		
       		// ajax로 입력한 검색어에 맞는 채팅방 번호를 불러오고, 회원정보도 마찬가지로 불러온다
       		var category = $('#searchCategory').val();
       		var text = $('#searchText').val();
       		
       		$.ajax({
       			url:"searchChatRoomAndMem.do",
				type:"get",
				data:{category:category, text:text},
				dataType:"json",
				contentType: 'application/json; charset=utf-8',
				success:function(data){
					console.log(data);
					// 채팅방 디스플레이 결정
					$('.chatRoom').not('.relTr').each(function(index, item){
						var eachRoomId = $(item).find('.roomCheck').val();
						$(item).hide();
						$(item).next('.relTr').hide();
						
						for(var i = 0; i < data['searchRoomIds'].length; i++){
							var roomId = data['searchRoomIds'][i];
							// db로 부터 받아온 룸번호에 맞지 않으면 숨기고 아니면 보여줌
							if(roomId==eachRoomId){
								$(item).show();
								$(item).next('.relTr').show();
							}
						}
					});
						
					
					// 회원 동적으로 띄우기
					$tableBody = $('#memTbody');
					$tableBody.html('');
					
					for(var i = 0; i < data['cui'].length; i++){
						$tr = $('<tr>');
						$td1 = $('<td>').text(data['cui'][i].mName);
						$td2 = $('<td>').text(data['cui'][i].mEmail);
						if(data['cui'][i].phone != null){
							$td3 = $('<td>').text(data['cui'][i].phone);
						}else{
							$td3 = $('<td>').text(data['cui'][i].cellPhone);
						}
						
						$input = $('<input type="hidden" class="mIdHidden">');
						$input.val(data['cui'][i].mId);
						$input2 = $('<input type="hidden" class="mNickHidden">');
						$input2.val(data['cui'][i].mNick);
													
						$tr.append($td1);
						$tr.append($td2);
						$tr.append($td3);
						$tr.append($input);
						$tr.append($input2);
						$tr.addClass('forNewChat');
						$tableBody.append($tr);
					}
					
					if($tableBody.html()==''){
						var noTr = '<tr><td colspan="3">조회된 회원이 없습니다.</td></tr>';
						$tableBody.append(noTr);
					}
					
					showWhenNoChatRoom();
		        	
				},
				error:function(error){
					alert(error)
				}
       		});
       	}
       	
       	function showWhenNoChatRoom(){
       		// 모든 채팅방이 보이지 않으면 띄워즐 tr
        	var countNone = 0;
        	var countBlock = 0;
        	$('.chatRoom').each(function(index, item){
        		countBlock += 1;
        		if($(item).css('display')=='none'){
        			countNone += 1;
        		}
	        	if(index == $('.chatRoom').length-1 && countBlock == countNone){
		       		var noChatList = '<tr class="hiddenForNone" align="center"><td colspan="7">조회된 채팅방이 없습니다.</td></tr>'
		       		var tableBody = $('#chatListArea').find('table');
		       		$(tableBody).append(noChatList);4
	        	}else{
		       		$('.hiddenForNone').remove();
	        	}
        	})
       	}
       	
       	//---------------------------------------------------------------
       	 // 조회된 회원의 회원번호 뽑는다
        function collectMemberIds(){
        	// 값을 추출해서 모음
        	var memIds = '';
        	$('.forNewChat').find('.mIdHidden').each(function(index, item){
        		if(index != 0){
	        		memIds = memIds+","+$(item).val();
        		}else{
	        		memIds = $(item).val();
        		}
        	})
        	if(memIds[memIds.length]==','){
        		memIds = memIds.substring(0, memIds.length);
        	}
        	if(memIds[0]==','){
        		memIds = memIds.substring(1, memIds.length);
        	}
        	
        	return memIds; 
        }
        function collectMemberNicks(){
        	// 값을 추출해서 모음
        	var mNicks = '';
        	$('.forNewChat').find('.mNickHidden').each(function(index, item){
        		if(index != 0){
        			mNicks = mNicks+","+$(item).val();
        		}else{
        			mNicks = $(item).val();
        		}
        	})
        	if(mNicks[mNicks.length]==','){
        		mNicks = mNicks.substring(0, mNicks.length);
        	}
        	if(mNicks[0]==','){
        		mNicks = mNicks.substring(1, mNicks.length);
        	}
        	
        	return mNicks; 
        }
        
       	//  New 버튼틀 클릭시, 조건에 맞는 채팅방이 없던ㄴ 모든 사람들의 채팅방 생성
       	// (생성 후 리스트 갱신을 통해 확인하고, 선택전송을 통해 단체메시지)
     	function createNewChat(){
       		var mIds = collectMemberIds();
			alert(mIds);
			var mNicks = collectMemberNicks();
			alert(mNicks);
			
	   		$.ajax({
	   			url:"createNewChat.do",
				type:"get",
				data:{mIds:mIds, mNicks:mNicks},
				success:function(data){
					console.log(data);

		       		alert('채팅방이 생성되었습니다.');
				
					// 채팅방 개설하면 리스트 갱신처리
					$('#refreshBtn').click();						
				},
				error:function(data){
					alert(data)
				},
				complete:function(){
					alert('이거 실행완료')
				}
	      	});
       	}
       	
     // 텍스트 박스에서 엔터를 누르면
    	function enter() {
    		// 엔터를 누르면서 쉬프트를 누르지 않았을 때
    		if (event.keyCode === 13) {
    			// 검색버튼을 누른다
    			searchChatRoomAndMem();
    			// form에 의해 자동 submit을 막는다.
    			return false;
    			
    		}
    		return true;
    	}
    </script>
</body>

</html>