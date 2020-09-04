<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
  <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
  <script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
  <!-- 이모티콘 관련 -->
    <link href="https://www.jqueryscript.net/css/jquerysctipttop.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="resources/css/emojis.css">
	<script type="text/javascript"
	src="https://pagead2.googlesyndication.com/pagead/show_ads.js">
	</script>
	<script src="https://twemoji.maxcdn.com/v/latest/twemoji.min.js" crossorigin="anonymous"></script>
	<script src="resources/js/DisMojiPicker.js"></script>
<style>
body{
background-color:black !important;
}

/* 채팅 iframe css */
.chatIframe {
	background-color: transparent;
    position: fixed;
    right: 40px;
    bottom: 35px;
	width:300px;
	height:500px;
	border-radius: 10px;
	border:none;
    box-shadow: 0 2px 4px 0 rgba(0, 0, 0, 0.16), 0 2px 10px 0 rgba(0, 0, 0, 0.12) !important;
    min-height: 500px;
    display: none;
    -webkit-animation: appear .15s cubic-bezier(.25, .25, .5, 1.1);
    animation: appear .15s cubic-bezier(.25, .25, .5, 1.1);
    -webkit-animation-fill-mode: forwards;
    animation-fill-mode: forwards;
    opacity: 0;
    z-index:9999999;
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
  
/* 확대되기 전 채팅 아이콘 css --------------------------*/
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

</style>
</head>
<body >
	<jsp:include page="../common/adminNavbar.jsp" />

	<!-- 채팅 아이콘 영역 -->
	<div id="chatDiv">
	<div class="chat_on">
		<span class="chat_on_icon">
		</span> 
		<img src="resources/image/talkIcon.png" width="55" height="50" style="margin-left: -5px; margin-top: -5px; max-width:200% !important;" />
		<c:if test="${allUnReadCount != 0&&allUnReadCount != null}">
			<div class="allAlertRead" style="font-weight: 600; font-size: 14px; background-color: red; color: white; position: relative; position: absolute; top: 0px; right: -1px; border-radius: 50%; padding: 7px; padding-bottom: 1px; padding-top: 1px;">${allUnReadCount}</div>
		</c:if>
	</div>
	<div class="chat_on_box">
		<p>채팅 상담</p>
	</div>
	</div>
	
	<!-- 채팅 영역(iframe) -->
	<div style="width:300px; height:500px">
		<iframe id="chatIframe" name="chatIframe" src="${contextPath}/firstLoadChat.do" class="chatIframe" frameborder="0" scrolling="no" ></iframe>
	</div>
	
	<!-- 채팅 관련 부모측 스크립트  -->
	<script>
	  $(document).ready(function () {
		// 로딩시간 중에 채팅에 진입하는 것을 막기 위해 타임아웃을 걸어서 채팅아이콘을 띄움
		var chatIconTimeOut = setTimeout(function(){
			$("#chatDiv").show(300);
		},1500);
		
	  	// 채팅 아이콘 상태일 때 채팅창 열기
	    $("#chatDiv").click(function () {
		      $("#chatIframe").show();
		      $("#chatDiv").hide();
		      
		      clearInterval(iframeInterval);
	    });
	  });
	  
	  // 자식 프레임으로 부터 메시지 수신 받는 eventListener 등록
	  window.addEventListener( 'message', receiveMsgFromChild );

	  // 자식으로부터 메시지 수신(채팅창 닫기)
	  function receiveMsgFromChild( e ) {
	      console.log( '자식으로부터 받은 메시지 ', e.data );
	      if(e.data=='close'){
	    	  $("#chatIframe").hide(300);
		      $("#chatDiv").show();
		      // 읽은 메시지 업뎃
		      reloadAllReadCount();
		      
		      // 아이프레임 새로고침
		      reloadIframe();
		      alert('리로드 됐을까?');
		      iframeInterval = setInterval(function(){
					reloadIframe();
			  }, 10000)
		      alert('인터벌이 다시 시작될까?');
	      }
	  }
	  
	  // 채팅 상담 아이콘 채팅상담 텍스트 영역 이벤트
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
	  function reloadAllReadCount(){
		  $.ajax({
			  url:"reloadAllReadCount.do",
			  type:"get",
			  success:function(data){
				  if(data=="0"){
					  $('.allAlertRead').text('');
					  $('.allAlertRead').css('display', 'none');
				  }else{
					  if($('.allAlertRead') == null){
						$('.chat_on').append('<div class="allAlertRead" style="font-weight: 600; font-size: 14px; background-color: red; color: white; position: relative; position: absolute; top: 0px; right: -1px; border-radius: 50%; padding: 7px; padding-bottom: 1px; padding-top: 1px;">'+data+'</div>')	  
					  }else if($('.allAlertRead').css('display') == 'none'){
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
	  var iframeInterval = setInterval(function(){
			reloadIframe();
	  }, 10000)
	</script>
	<!-- ------------------------------------------------------------------ -->
</body>
</html>