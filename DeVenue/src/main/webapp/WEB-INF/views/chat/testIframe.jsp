<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
/* 확대되기 전 채팅 아이콘 css ---------------------------------------------------*/
  #chatDiv{
  	display:none;
  }
  .chat_on {
    position: fixed;
    right: 40px;
    bottom: 35px;
    z-index: 100;
    width: 65px;
    height: 65px;
    background: #7F7FD5;
    background: -webkit-linear-gradient(to right, #91EAE4, #86A8E7, #7F7FD5);
    background: linear-gradient(to right, #91EAE4, #86A8E7, #7F7FD5);
    color: #fff;
    border-radius: 50%;
    text-align: center;
    padding: 9px;
    box-shadow: 0 2px 4px 0 rgba(0, 0, 0, 0.16), 0 2px 10px 0 rgba(0, 0, 0, 0.12) !important;
    cursor: pointer;
    display: block;
     -webkit-animation: appear .15s cubic-bezier(.25, .25, .5, 1.1);
    animation: appear .15s cubic-bezier(.25, .25, .5, 1.1);
    -webkit-animation-fill-mode: forwards;
    animation-fill-mode: forwards;
    opacity: 0;
    -webkit-transition: right .1s cubic-bezier(.25, .25, .5, 1), bottom .1s cubic-bezier(.25, .25, .5, 1), min-width .2s cubic-bezier(.25, .25, .5, 1), max-width .2s cubic-bezier(.25, .25, .5, 1), min-height .2s cubic-bezier(.25, .25, .5, 1), max-height .2s cubic-bezier(.25, .25, .5, 1), border-radius 50ms cubic-bezier(.25, .25, .5, 1) .15s, background-color 50ms cubic-bezier(.25, .25, .5, 1) .15s, color 50ms cubic-bezier(.25, .25, .5, 1) .15s;
    transition: right .1s cubic-bezier(.25, .25, .5, 1), bottom .1s cubic-bezier(.25, .25, .5, 1), min-width .2s cubic-bezier(.25, .25, .5, 1), max-width .2s cubic-bezier(.25, .25, .5, 1), min-height .2s cubic-bezier(.25, .25, .5, 1), max-height .2s cubic-bezier(.25, .25, .5, 1), border-radius 50ms cubic-bezier(.25, .25, .5, 1) .15s, background-color 50ms cubic-bezier(.25, .25, .5, 1) .15s, color 50ms cubic-bezier(.25, .25, .5, 1) .15s
  }
  @-webkit-keyframes appear {
    0% {
      opacity: 0;
      -webkit-transform: scale(0);
      transform: scale(0)
    }

    to {
      opacity: 1;
      -webkit-transform: scale(1);
      transform: scale(1)
    }
  }

  @keyframes appear {
    0% {
      opacity: 0;
      -webkit-transform: scale(0);
      transform: scale(0)
    }

    to {
      opacity: 1;
      -webkit-transform: scale(1);
      transform: scale(1)
    }
  }
  
  .chat_on_icon {
    color: #fff;
    font-size: 25px;
    text-align: center;
  }

  .chat_on_box {
    color: #2c2c46;
    position: fixed;
    right: 48px;
    bottom: 45px;
    z-index: 99;
    height: 45px;
    width: 150px;
    background-color: white;
    border-radius: 15px;
    box-shadow: 2px 2px 3px 2px gray;
    
    -webkit-transition:width 2s, opacity 2s, -webkit-transform 2s;
    transition:width 2s, opacity 2s, transform 2s;
    transition-duration:1s;
    transition-timing-function: ease;
    opacity:0;
    width:0px;
  }

  .chat_on_box p {
    font-size: 17px;
    margin-top: 10px;
    font-weight: 800;
    color: rgb(77, 75, 75);
    text-indent: 13px;
  }

  @media screen and (max-width: 768px) {}
  /* ----------------------------------------------------------------------- */
</style>
</head>
<body >
	
	<!-- 채팅 아이콘 영역----------------------------------------------------------------------------------- -->
	<div id="chatDiv">
	<div class="chat_on">
		<span class="chat_on_icon">
		</span> 
		<img src="resources/image/talkIcon.png" width="55" height="50" style="margin-left: -5px; margin-top: -5px; max-width:200% !important;" />
		<div class="allAlertRead" id="allAlertRead" style="font-weight: 600; font-size: 14px; background-color: red; color: white; position: relative; position: absolute; top: 0px; right: -1px; border-radius: 50%; padding: 7px; padding-bottom: 1px; padding-top: 1px;">${allUnReadCount}</div>
	</div>
	<div class="chat_on_box">
		<p>채팅 상담</p>
	</div>
	</div>
	
	<!-- 채팅 iframe 영역 --------------------------------------------------------------------------------->
	<div style="width:300px; height:500px">
		<iframe id="chatIframe" name="chatIframe" src="${contextPath}/firstLoadChat.do" class="chatIframe" frameborder="0" scrolling="no" ></iframe>
	</div>
	
	<!-- 채팅 관련 부모측 스크립트 ------------------------------------------------------------------------------->
	<script>
	  $(document).ready(function () {
		// 로딩시간 중에 채팅에 진입하는 것을 막기 위해 타임아웃을 걸어서 채팅아이콘을 띄움
		var chatIconTimeOut = setTimeout(function(){
			$("#chatDiv").show(300);
		},1500);
		
		// 첫 로드시 안읽은 메시지 처리
		<c:if test="${!empty loginUser}">
			reloadAllReadCount();
		</c:if>
		<c:if test="${empty loginUser}">
			$('#allAlertRead').css('display', 'none');
		</c:if>
	  });
	  
	// 채팅 아이콘 상태일 때 채팅창 열기
	// 채팅 아이콘을 로그인 하지 않음 상태에서 클릭하면 로그인 해야한다고 알림
	$("#chatDiv").click(function () {
		<c:if test="${ empty loginUser}">
			alert('채팅 상담은 로그인 이후에 가능합니다.');
			return;
		</c:if>
		
		clearInterval(iframeInterval);
			
		$("#chatIframe").show();
		$("#chatDiv").hide();
	});
	
	  // 자식 프레임으로 부터 메시지 수신 받는 eventListener 등록
	  window.addEventListener( 'message', receiveMsgFromChild );

	  // 자식으로부터 메시지 수신(채팅창 닫기)
	  function receiveMsgFromChild( e ) {
	      console.log( '자식으로부터 받은 메시지 ', e.data );
	      if(e.data=='close'){
	    	  $("#chatIframe").hide(300);
		      $("#chatDiv").show();
		      
		      // 읽은 메시지 뷰 영역 업뎃
		      reloadAllReadCount();
		      
		      // 아이프레임 새로고침
		      reloadIframe();
		      
		      iframeInterval = setInterval(function(){
					reloadIframe();
					
					<c:if test="${!empty loginUser}">
						reloadAllReadCount();
					</c:if>
			  }, 10000)
	      }
	  }
	  
	  // 채팅 상담 아이콘 채팅상담 텍스트 영역 이벤트(css적 요소)
	  $(function(){
		  showChatTextIcon();
	  })
	  function showChatTextIcon(){
		  $('#chatDiv').mouseover(function(){
			  $('.chat_on_box').css('opacity', '1').css('width', '150px');
		  }).mouseleave(function(){
			  $('.chat_on_box').css('opacity', '0').css('width', '0px');
		  });
	  }
	  
	  // 채팅 아이콘 안읽은 메시지 에이작스
	  // 안읽은 메시지 수가 0일 때 안읽은 메시지 뷰 영역을 보이게 하지 않는다. 또한 로그인을 하지 않았을 경우에 안보이는 건 당연하다.
	  function reloadAllReadCount(){
		  $.ajax({
			  url:"reloadAllReadCount.do",
			  type:"get",
			  success:function(data){
				  if(data=="0"){
					  $('.allAlertRead').text('');
					  $('.allAlertRead').css('display', 'none');
				  }else{
					  if($('.allAlertRead').css('display') == 'none'){
						  $('.allAlertRead').css('display', 'block');
						  $('.allAlertRead').text(data);
				  	  }else{
						  $('.allAlertRead').text(data);
					  }
				  }
			  },
			  error:function(request,status,error){
				  alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
			  }
		  })
	  }
	  
	  // 아이프레임 새로고침 
	  function reloadIframe(){
		  document.getElementById("chatIframe").src = document.getElementById("chatIframe").src;
	  }
	  
	  // 평시상태(아이콘 상태)면 주기적으로 자식프레임 새로고침 및 안읽은 메시지 리카운트
	  var iframeInterval = setInterval(function(){
			reloadIframe();
		
			<c:if test="${!empty loginUser}">
				reloadAllReadCount();
			</c:if>
	  }, 15000)
	</script>
	<!-- -------------------------------------------------------------------------------------------- -->

</body>
</html>