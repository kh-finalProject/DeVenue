<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!doctype html>
<html class="no-js" lang="ko">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>디베뉴 관리자 채팅창</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
        integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"
        integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
        integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
        crossorigin="anonymous"></script>
    
      <!-- 이모티콘 관련 -->
    <link href="https://www.jqueryscript.net/css/jquerysctipttop.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="resources/css/emojis.css">
	<script type="text/javascript"
	src="https://pagead2.googlesyndication.com/pagead/show_ads.js">
	</script>
	<script src="https://twemoji.maxcdn.com/v/latest/twemoji.min.js" crossorigin="anonymous"></script>
	<script src="resources/js/DisMojiPicker.js"></script>
    <!-- 개인적인 css 시작 -->
    <style>
        /* 
        [색상표]
        #165ff2 파랑
        #227cf2 희끗파랑
        #2793f2 하늘색
        #193B59 곤색
        #212426 거의 검정
        우리 로고 배경색은 rgb(10,10,10)
        */

        /* 스크롤바 스타일 지정(근데 웹킷브라우저에서만 먹음..완벽x) */
        /* 메시지 영역에 대해서 지정 */
        .Messages::-webkit-scrollbar {
            width: 14px;
        }

        /* 막대 */
        .Messages::-webkit-scrollbar-thumb {
            background-color: #86A8E7;
            border-radius: 10px;
            background-clip: padding-box;
            border: 2px solid transparent;
        }

        /* 나머지 공간 */
        .Messages::-webkit-scrollbar-track {
            background: transparent;
        }

        /* ----------------------------------------------------------------- */

        /* 전체 */
        body,
        html {
            margin: 0px;
            padding: 0px;
            height: 500px;
            /* background-color: teal; */
            overflow: hidden;
        }

        .AllWrap {
            width: 100%;
            display: flex;
            height: 500px;
			position:fixed;
			top:0px;
            background-color: teal;
        }

        body * {
            outline: none !important;
        }


        /* 회원 정보 영역 ------------------------------------------------- */
        /* 회원 정보 영역 전체 */
        .memberInform_area {
            background-color: white;
            display: inline-block;
            width: 50%;
            margin: 0px;
        }

        /* 회원 정보 영역 헤더 */
        .memberInform_header {
            background-color: rgb(56, 56, 65);
            padding: 20px;
            padding-top: 19px;
            height: 60px;
            text-align: center;
        }

        .memberInform_header * {
            margin: 0px;
            color: white;
            font-size: 20px;
        }

        /* 회원 정보 영역 내용 */
        .memberInform_Content {
            background-color: rgb(56, 56, 65);
            height: 440px;

        }

        /* 인포 버튼 */
        .btn-info {
            height: 28px;
            padding: 10px;
            padding-top: 2px;
            position: relative;
            top: -2px;
            font-size: 14px;
        }

        /* 테이블 전체 */
        .table-dark {
            width: 100%;
        }

        /* 테이블 하위 공통 */
        .table-dark * {
            max-width: 200px !important;
            white-space: nowrap !important;
            text-overflow: ellipsis !important;
            overflow: hidden;
        }

        /* 각 td */
        .table-dark tbody td:nth-of-type(1) {
            font-size: 13px !important;
            color: rgb(208, 230, 230);
        }

        .table-dark tbody td:nth-of-type(2) {
            font-size: 13px !important;
            color: rgb(167, 199, 199);
        }

        /* 타이틀*/
        .titleContent {
            max-width: 95% !important;
            white-space: nowrap !important;
            text-overflow: ellipsis !important;
            overflow: hidden;
        }

        /* 프로젝트 내역 더보기하는 tr들 설정 */
        .projectInfo td {
            padding-top: 10px;
            padding-bottom: 0px;
            /* background-color: teal; */
        }

        .projectInfo td:nth-of-type(1) {
            /* background-color: teal; */
            color: teal !important;
            font-weight: 550;
            padding: 12px;
        }

        /* 채팅 영역 전체 레이아웃 관련--------------------------------------*/
        /* 채팅창 전체 색상을 그라데이션으로 줘봄(헤더만 했더니 너무 밝은 분위기가 나서) */
        #Smallchat {
            width: 50%;
            height: 100% !important;
        }

        #Smallchat .Messenger_messenger {
            background: #7F7FD5;
            background: -webkit-linear-gradient(to right, #91EAE4, #86A8E7, #7F7FD5);
            background: linear-gradient(to right, #91EAE4, #86A8E7, #7F7FD5);
        }

        /* 채팅창 메시지 뷰 공간 */
        #Smallchat .Messages,
        #Smallchat .Messages_list {
            -webkit-box-flex: 1;
            -webkit-flex-grow: 1;
            -ms-flex-positive: 1;
            flex-grow: 1;

        }

        .Messages_list {
            position: absolute;
            top: 0px;
            left: 0px;
            /* background-color: red; */
            /* opacity: 0.5; */
            width: 100%;
            height: 100%;
            margin: 0px;
            padding: 0px;
        }

        /* 메신저(채팅방) 창------------------------------------------------------- */
        #Smallchat .Messenger_messenger {
            position: relative;
            height: 100%;
            width: 100%;
            min-width: 300px;

            -webkit-box-orient: vertical;
            -webkit-box-direction: normal;
            -webkit-flex-direction: column;
            -ms-flex-direction: column;
            flex-direction: column
        }

        /* 메신저창 내부 헤더 -------------------------- */
        #Smallchat .Messenger_header {
            align-items: center;
            height: 60px;
        }

        /* 헤더 배경위해서 한번 더 싸준 것 */
        .Messenger_header_wrap {
            width: 100%;
            height: 100%;
            background-color: black;
            opacity: 0.4;
        }

        /* 메세지 뷰창 색을 위해 한번 더 쌈 */
        .Messenger_content_wrap {
            position: relative;
            box-sizing: border-box;
            height: 100%;
            /* width: 100%; */
            /* height: transparent; */
            background-color: black;
            opacity: 0.3;
            margin: 0px;

        }

        /* 채팅창 헤더 타이틀 문구*/
        #Smallchat .Messenger_header h4 {
            position: absolute;
            left: 35px;
            top: 0px;
            opacity: 0;
            font-size: 16px;
            -webkit-animation: slidein .15s .3s;
            animation: slidein .15s .3s;
            -webkit-animation-fill-mode: forwards;
            animation-fill-mode: forwards;
            padding-top: 13px;
            padding-bottom: 5px;
            /* opacity: 1 !important; */
        }

        /* 채팅창 헤더 서브문구 */
        #Smallchat .Messenger_header h6 {
            position: absolute;
            left: 35px;
            top: 35px;
            opacity: 0;
            -webkit-animation: slidein .15s .3s;
            animation: slidein .15s .3s;
            -webkit-animation-fill-mode: forwards;
            animation-fill-mode: forwards;
            text-indent: 5px;
        }

        /* 헤더에 해와 달 이미지 */
        .am_pm {
            margin-bottom: 7px;
        }

        /* 헤더 타이틀1 */
        #Smallchat .Messenger_prompt {
            margin: 0;
            font-size: 16px;
            line-height: 18px;
            font-weight: 400;
            overflow: hidden;
            white-space: nowrap;
            text-overflow: ellipsis
        }

        /* 헤더 타이틀2 */
        #Smallchat .Messenger_prompt2 {
            margin: 0;
            font-size: 12px;
            line-height: 18px;
            font-weight: 400;
            overflow: hidden;
            white-space: nowrap;
            text-overflow: ellipsis
        }

        @-webkit-keyframes slidein {
            0% {
                opacity: 0;
                -webkit-transform: translateX(10px);
                transform: translateX(10px)
            }

            to {
                opacity: 1;
                -webkit-transform: translateX(0);
                transform: translateX(0)
            }
        }

        @keyframes slidein {
            0% {
                opacity: 0;
                -webkit-transform: translateX(10px);
                transform: translateX(10px)
            }

            to {
                opacity: 1;
                -webkit-transform: translateX(0);
                transform: translateX(0)
            }
        }

        /* ------------------------------------------ */

        /* 메신저 창 내부 메시지 뷰 공간, 메시지 입력 공간 */
        #Smallchat .Messenger_content {
            height: 440px;
            -webkit-box-flex: 1;
            -webkit-flex-grow: 1;
            -ms-flex-positive: 1;
            flex-grow: 1;
            display: -webkit-box;
            display: -webkit-flex;
            display: -ms-flexbox;
            display: flex;
            -webkit-box-orient: vertical;
            -webkit-box-direction: normal;
            -webkit-flex-direction: column;
            -ms-flex-direction: column;
            flex-direction: column;
            margin: 0px;
            padding: 0px;
            /* background-color: #fff; */
            color: black;

        }

        /* 메시지 창 내부 메시지 뷰 공간 */
        #Smallchat .Messages {
            -webkit-flex-shrink: 1;
            -ms-flex-negative: 1;
            flex-shrink: 1;
            display: -webkit-box;
            display: -webkit-flex;
            display: -ms-flexbox;
            display: inline-block;
            -webkit-box-orient: vertical;
            -webkit-box-direction: normal;
            -webkit-flex-direction: column;
            -ms-flex-direction: column;
            flex-direction: column;
            overflow-x: hidden;
            overflow-y: auto;

            /* -webkit-overflow-scrolling: touch; */
            position: relative;
        }


        /* 메시지 창 내부 메시지 입력 공간 전체 */
        #Smallchat .Input {
            position: relative;
            width: 100%;
            -webkit-box-flex: 0;
            -webkit-flex-grow: 0;
            -ms-flex-positive: 0;
            flex-grow: 0;
            -webkit-flex-shrink: 0;
            -ms-flex-negative: 0;
            flex-shrink: 0;
            padding-top: 13px;
            padding-bottom: 10px;
            color: #96aab4;
            /* background-color: #fff; */
            /* border-top: 1px solid gray; */

            height: 70px;
        }

        /* 메시지 입력하는 textarea */
        #Smallchat .Input-blank .Input_field {
            max-height: 60px;
        }

        .Input-content-wrap {
            position: relative;
            left: 40px;
            width: 70%;
            /* border: 1px solid lightgray; */
            border-radius: 3px;
            padding: 3px;
            background-color: black;
            opacity: 0.4;

        }

        .Input_wrap {
            position: absolute;
            top: 0px;
            left: 0px;
            width: 100%;
            height: 100%;
            background-color: black;
            opacity: 0.5;
        }

        /* textarea 설정 */
        #Smallchat .Input_field {
            height: 30px;
            width: 100%;
            padding-top: 5px;
            resize: none;
            border: none;
            outline: none;
            background-color: transparent;
            /* background-color: black !important; */
            font-size: 16px;
            line-height: 20px;
            min-height: 20px !important;
            overflow: hidden;
            /* background-color: teal; */
            color: white;
            opacity: 2 !important;

        }

        /* 이모티콘 버튼 */
        #Smallchat .Input_button-emoji {
            right: 35px;
            top: 20px;
        }

        /* 버튼 전체 */
        #Smallchat .Input_button {
            position: absolute;
            bottom: 15px;
            width: 25px;
            height: 25px;
            padding: 0;
            border: none;
            outline: none;
            background-color: transparent;
            cursor: pointer;
        }

        /* 보내기 버튼 */
        #Smallchat .Input_button-send {
            right: 5px;
            top: 20px;
        }

        /* 파일 업로드 버튼 관련 */
        .Input-file-hidden {
            visibility: hidden;
        }

        .Input-file-hidden+label {
            position: relative;
            top: -35px;
            left: 10px;
            background-image: url('resources/image/clip4.png');
            background-size: cover;

            width: 20px;
            height: 20px;
            z-index: 99;
        }

        /* 이모티콘 업로드 버튼, 그밖에 버튼 관련 */
        .Input-file .Icon {
            -webkit-transform: scale(1.1);
            -ms-transform: scale(1.1);
            transform: scale(1.1);
            -webkit-transition: all .1s ease-in-out;
            transition: all .1s ease-in-out;
        }

        /* 파일아이콘 있는 라벨에 커서올리면 검정 아이콘으로 바뀌게 */
        .Input-file-hidden+label:hover {
            background-image: url('resources/image/clip5.png');
        }

        /* 인풋공간 전체 버튼 애니메이션 */
        #Smallchat .Input-emoji .Input_button-emoji .Icon,
        #Smallchat .Input_button:hover .Icon {
            -webkit-transform: scale(1.2);
            -ms-transform: scale(1.2);
            transform: scale(1.2);
            -webkit-transition: all .1s ease-in-out;
            transition: all .1s ease-in-out;
        }

        #Smallchat .Input-emoji .Input_button-emoji .Icon path,
        #Smallchat .Input_button:hover .Icon path {
            fill: #2c2c46;
        }

        /* ---------------------------------------- */
        /* 메시지 대화내역 세부 css */
        /* 날짜로 대화창 구분하는 영역 */
        .seperate_content {text-align:center;margin-bottom:3px;}

        .seperate_line {
		    display: inline-block;
		    border-top: 1px solid white;
		    width: 34%;
		    opacity: 0.2;
/*             margin-left: 5px; */
/*             margin-right: 5px; */
        }

        .seperate_date {
		    position: relative;
		    display: inline-block;
		    margin-left: 3px;
		    margin-right: 3px;
		    top: 4px;
		    color: white;
		    opacity: 0.5;
		    font-size: 10px;
    		width:18%;
        }

        /* 메시지 한 묶음당 전체영역(메시지, 시간, 프로필) */
        /* 내가 보낸거 전체영역 */
        .message_from_me {
            /* display: flex; */
            position: relative;
            margin-bottom: 15px;
        }

        /* 상대가 보낸거 전체 영역 */
        .message_from_other {
            /* display: flex; */
            position: relative;
            margin-bottom: 15px;

        }

        /* 내 메시지 시간 표시 */
        .msg_time {
            position: relative;
            top: 12px;
            text-align: right;
            padding-right: 10px;
            color: rgba(255, 255, 255, 0.5);
            font-size: 10px;
            max-width: 90px;
            min-width: 50px;
        }

        /* 상대 메시지 시간 표시 */
        .msg_time_send {
            position: relative;
            top: 11px;
            text-align: left;
            padding-left: 10px;
            color: rgba(255, 255, 255, 0.5);
            font-size: 10px;
        }

        /* 사용자 이름 포함한 프로필 전체 */
        /* 내꺼 */
        .message_from_me .name_with_profile {
            display: flex;
            position: relative;
            /* left: 100px; */
            max-width: 200px;
            margin-bottom: 3px;
        }

        /* 상대꺼 */
        .message_from_other .name_with_profile {
            display: flex;
            position: relative;
            left: 7px;
   			max-width: 250px;
            margin-bottom: 3px;
        }

        /* 프로필 이름 */
        .message_from_me .name_with_profile .user_me {
            font-weight: 600;
            padding-top: 10px;
            /* margin-right: 5px; */
            min-width: 50px;
            max-width: 150px;
            overflow: hidden;
            white-space: nowrap;
            text-overflow: ellipsis;
            box-sizing: border-box;
            font-size:13px !important;
    		margin-right: 7px;
        }

        .message_from_other .name_with_profile .user_other {
            font-weight: 600;
            padding-top: 10px;
            margin-left: 7px;
            /* min-width: 50px; */
            min-width: 70px;
    		max-width: 150px;
            overflow: hidden;
            white-space: nowrap;
            text-overflow: ellipsis;
            font-size:13px !important;
        }

        /* 내 프로필 사진 */
        .message_from_me .img_cont_msg {
            height: 40px;
            width: 40px;
            min-width: 40px;
            background-color: white;
            border: 2px solid white;
            border-radius: 50%;
            /* position: absolute;
    right:7px; */
        }
        
        /* 상태방 프로필 사진 */
        .message_from_other .img_cont_msg {
            height: 40px;
            width: 40px;
            min-width: 40px;
            background-color: white;
            border: 2px solid white;
            border-radius: 50%;
            /* position: absolute;
    left:7px; */
        }
        
        /* 프로필 이미지 자체  */
        .img_cont_msg img{
        	border-radius: 50%;
        	width: 100%;
        	height: 100%;
        	position: relative;
        	left:0px;
        }

        /* 메시지 서식(시간, 메시지) */
        /* 내 메시지 */
        .msg_text_me {
            margin-top: auto;
            margin-bottom: auto;
            margin-left: 10px;
            border-radius: 25px;
            background-color: #82ccdd;
            padding: 10px;
            display: inline-block;
            position: relative;
            /* top: 44px; */
            right: 0px;
		    min-width: 41px;
		    max-width: 240px;
            white-space:pre-wrap;/*한글에 효험*/
   			word-break:break-all;/*영어에 효험*/
            /* box-sizing: border-box; */
            font-size:12px;
        }

        /* 상대방 메시지 */
        .msg_text_other {
            margin-top: auto;
            margin-bottom: auto;
            margin-right: 10px;
            border-radius: 25px;
            background-color: #78e08f;
            padding: 10px;
            display: inline-block;
            /* position: relative; */
            position: relative;
            /* top: 44px; */
            left: 17px;
            min-width: 50px;
            max-width: 300px;
            white-space:pre-wrap;
    		word-break:break-all;
    		font-size:12px;
        }
        
		/* 이모지 관련 */        
          #emojis{
		  	display:none;
		  	z-index:9999999;
		  	background-color: transparent !important;
		  }
		  
		  /* 모달창 관련 */
		  .modal-backdrop {
			  z-index: -1;
			}
		/* 모달창 안의 뱃지 */	
		.badge{
			width:60px;
			height:25px;
			padding:7px;
		}
    </style>
</head>

<body>
	<!-- 이모티콘 창 관련 -->
    <div id="emojis" style="position:absolute;"></div>
<script>
    $("#emojis").disMojiPicker()
    // 텍스트영역에 집어넣기
    $("#emojis").picker(
    		emoji => $('#forEmojiAdd').val(emoji)
    );
    twemoji.parse(document.body);
    	

</script>
<script type="text/javascript">

  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-36251023-1']);
  _gaq.push(['_setDomainName', 'jqueryscript.net']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();

</script>
<script>
try {
  fetch(new Request("https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js", { method: 'HEAD', mode: 'no-cors' })).then(function(response) {
    return true;
  }).catch(function(e) {
    var carbonScript = document.createElement("script");
    carbonScript.src = "//cdn.carbonads.com/carbon.js?serve=CK7DKKQU&placement=wwwjqueryscriptnet";
    carbonScript.id = "_carbonads_js";
    document.getElementById("carbon-block").appendChild(carbonScript);
  });
} catch (error) {
  console.log(error);
}
</script>
<script>
	// 이모지선택창 보여주는 함수
	function inputEmoji(emojiBtn){
		var emojiPositionT = $(emojiBtn).offset().top;
		var emojiPositionL = $(emojiBtn).offset().left;
		console.log(emojiPositionT)
		$('#emojis').toggle();
		selectEmojisOpenPosition(emojiPositionT, emojiPositionL);
	}
	// 이모지 선택창 위치 조정하는 함수
	function selectEmojisOpenPosition(emojiPositionT, emojiPositionL){
		$('#emojis').css('width', 240).css('height', 190);
		$('#emojis').css('top', 400-$('#emojis').css('height').replace('px', ''));
		$('#emojis').css('left', $(window).outerWidth() - $('#emojis').width()-getScrollbarWidth());
// 		$('#emojis').css('display', 9999999);
	}
	
	// 이모지 선택창 스크롤 따라다니는 함수
	$(function(){
		$(document).scroll(function(){
			var emojiPositionT = $('.Input_button-emoji').offset().top;
			var emojiPositionL = $('.Input_button-emoji').offset().left;
			
			$('#emojis').css('top', 400-$('#emojis').css('height').replace('px', ''));
			$('#emojis').css('left', $(window).outerWidth() - $('#emojis').width()-getScrollbarWidth());
			$('#emojis').css('width', 240).css('height', 190);
		})
		window.onclick = function(){
			var emojiPositionT = $('.Input_button-emoji').offset().top;
			var emojiPositionL = $('.Input_button-emoji').offset().left;
			
			$('#emojis').css('top', 400-$('#emojis').css('height').replace('px', ''));
			$('#emojis').css('left', $(window).outerWidth() - $('#emojis').width()-getScrollbarWidth());
			$('#emojis').css('width', 240).css('height', 190);
		}
	})
	
	// 이모지 클릭하고 픽커가 발동되면 히든 인풋에 담아놨던 이미지를 텍스트에리아에 넣어주는
	$(function(){
		$('#emojis').click(function(){
			var chatRoom = null;
			if($('#forEmojiAdd').val()!= null){
				$('.Layout-chatRoom').each(function(inded, item){
					if($(item).css('display')!='none'){
						chatRoom = $(item);
					}
				})
				var messageForEmoji  = chatRoom.find('#textMessage').val();
				$('#textMessage').val(messageForEmoji+$('#forEmojiAdd').val());
				
			}
			// 이모지를 인식하여 텍스트입력영역 키우기
			increaseHeightBecuaseEmoji();
		});
	})
	function increaseHeightBecuaseEmoji(){
	 // 입력하는 텍스트가 많아지면 창 키우고 아이콘들 위치도 변화
	    var inputField = $('.Input_field');
	    var inputFileLabel = $('.Input-file-hidden + label');
	    if (inputField.val().length < 15) {
	        inputField.css('height', 29);
	        $('.Input-blank').css('height', 70);
	        inputFileLabel.css('top', -35);
	        $('svg').css('position', 'relative').css('top', 0);
	        $('#emojis').css('top', '250px');
	    }
	    if (inputField.val().length >= 15 || (event.keyCode == 13&&event.shiftKey) || inputField.val().split('\n').length>=2){
	        inputField.css('height', 60);
	        $('.Input-blank').css('height', 100);
	        inputFileLabel.css('top', -50);
	        $('svg').css('position', 'relative').css('top', 14);
	        $('#emojis').css('top', '220px');
	    }
	}
</script>
    <!-- 채팅(레이아웃) -->
    <div class="AllWrap">
        <!-- <div class=""> -->
        <!-- 회원 정보 영역 -->
        <div class="memberInform_area">
            <!-- Content here -->
            <div class="memberInform_header">
                <h4>회원 정보</h4>
                <!-- 채팅방 참여자 정보 중 상대 고객정보 따로 저장해두기 -->
                <c:forEach var="i" begin="0" end="${chatUserInfos.size()-1 }" step="1">
                	<c:if test="${eachChatInfos.get(0).getClientId() == chatUserInfos.get(i).getmId() }">
                		<c:set var="customerInfo" value="${ chatUserInfos.get(i) }"/>
                	</c:if>
                </c:forEach>
            </div>
            <div class="memberInform_Content">
                <table class="table table-sm table-dark" border="0">
                    <tbody>
                        <tr>
                            <th scope="row"></th>
                            <td>이름</td>
                            <td colspan="2">${customerInfo.mName }</td>
                            <td></td>
                        </tr>
                        <tr>
                            <th scope="row"></th>
                            <td>회원 분류</td>
                            <td colspan="2">${customerInfo.typeName }</td>
                            <td></td>
                        </tr>
                        <tr>
                            <th scope="row"></th>
                            <td colspan="2">전화번호</td>
                            <td>
                            	<c:if test="${!empty customerInfo.phone }">
                            		${customerInfo.phone }
                            	</c:if>
                            	<c:if test="${empty customerInfo.phone }">
                            		${customerInfo.cellPhone }
                            	</c:if>
                            </td>
                            <td></td>
                        </tr>
                        <tr>
                            <th scope="row"></th>
                            <td colspan="2">이메일</td>
                            <td>${customerInfo.mEmail }</td>
                            <td></td>
                        </tr>
                        <tr>
                            <th scope="row"></th>
                            <td colspan="2">집단 분류</td>
                            <td>
                            	<c:if test="${!empty customerInfo.memType }">
	                            	${customerInfo.memTypeKind }
                            	</c:if>
                            	<c:if test="${empty customerInfo.memType }">
	                            	미입력
                            	</c:if>
                            </td>
                            <td></td>
                        </tr>
                        <tr>
                            <th scope="row"></th>
                            <td colspan="2">소속/스킬</td>
                            <td>
                            	<c:if test="${!empty customerInfo.memTypeName }">
	                            	${customerInfo.memTypeName }
                            	</c:if>
                            	<c:if test="${empty customerInfo.memTypeName }">
	                            	미입력
                            	</c:if>
                            </td>
                            <td></td>
                        </tr>
                        <tr class="projectInfo ingProject">
                            <th scope="row"></th>
                            <td colspan="2">*진행중인 프로젝트</td>
                            	<c:if test="${proInfos != null && !empty proInfos }">
	                            	<c:forEach var="i" begin="0" end="${proInfos.size()-1 }" step="1">
		                            	<c:if test="${proInfos.get(i).getProStatName() eq '진행중' }">
		                            		<c:set var="ingProjectExist" value="true"/>
		                                 </c:if>
		                             </c:forEach>
	                            	<c:if test="${ingProjectExist != null }">
			                            <td align="right">
		                                	<button type="button" class="btn btn-info ingPjMoreBtn" data-toggle="modal"
		                                    data-target="#ingPjContentModal">more</button>
	        		                    </td>
	                                 </c:if>
                                 </c:if>
                                 <c:if test="${ingProjectExist == null }">
                                 	<td align="left">
                                 		진행중인 프로젝트가 없습니다.
                                 	</td>
                                 </c:if>
                            <td></td>
                        </tr>
	                       	<c:if test="${proInfos != null && !empty proInfos }">
                            	<c:forEach var="i" begin="0" end="${proInfos.size()-1 }" step="1">
	                            	<c:if test="${proInfos.get(i).getProStatName() eq '진행중' }">
		                    
			                        <tr>
			                            <th scope="row"></th>
			                            <td colspan="2">&ensp;&ensp;- 타이틀</td>
			                            <td colspan="2" class="titleContent">
											${proInfos.get(i).getProName()}
			                            </td>
			                        </tr>
			                        <tr>
			                            <th scope="row"></th>
			                            <td colspan="2">&ensp;&ensp;- 금액</td>
			                            <td colspan="2">
			                            	<fmt:formatNumber type="number" maxFractionDigits="3" value="${proInfos.get(i).getProPayment()}" var="commaPrice2"/>
			                            	${commaPrice2 }원
			                            </td>
			                        </tr>
			                        <tr>
			                            <th scope="row"></th>
			                            <td colspan="2">&ensp;&ensp;- 기간</td>
			                            <td colspan="2">${fn:substring(proInfos.get(i).getProStartDate(),0,10)}~${fn:substring(proInfos.get(i).getProEndDate(),0,10)} (${proInfos.get(i).getProDuration()}일)</td>
			                        </tr>
			                        <tr>
			                            <th scope="row"></th>
			                            <td colspan="2">&ensp;&ensp;- 지역</td>
			                            <td colspan="2">
			                            	<c:if test="${proInfos.get(i).getProWorkPlace() eq null}">
			                            		미입력
			                            	</c:if>
			                            	<c:if test="${proInfos.get(i).getProWorkPlace() != null}">
				                            	${proInfos.get(i).getProWorkPlace()}
			                            	</c:if>
			                            </td>
			                        </tr>
	                        	</c:if>
	                        </c:forEach>
                        </c:if>
                        <!-- 진행 중 프로젝트 Modal -->
                        <div class="modal fade ingPjContentModal" style="display: none;" id="ingPjContentModal"
                            data-backdrop="static" data-keyboard="false" tabindex="-1"
                            aria-labelledby="staticBackdropLabel" aria-hidden="true">
                            <div class="modal-dialog modal-dialog-scrollable">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="staticBackdropLabel">프로젝트 내용</h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                   	<c:if test="${proInfos != null && !empty proInfos }">
                                    <pre class="modal-body" style="white-space: pre-line;">
<c:forEach var="i" begin="0" end="${proInfos.size()-1 }" step="1"><c:if test="${proInfos.get(i).getProStatName() eq '진행중' }">${proInfos.get(i).getProSummary() }</c:if></c:forEach>
                                    </pre>
	                            	</c:if>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary"
                                            data-dismiss="modal">Close</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <tr class=" projectInfo pastProejct">
                            <th scope="row"></th>
                            <td colspan="2">*프로젝트 전체 내역</td>
                            <td align="right">
                                <button type="button" class="btn btn-info pastPjMoreBtn" data-toggle="modal"
                                    data-target="#pastPjContentModal">more</button>
                            </td>
                            <td></td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <!-- 지난 프로젝트 Modal -->
            <div class="modal fade pastPjContentModal" style="display: none;" id="pastPjContentModal"
                data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel"
                aria-hidden="true">
                <div class="modal-dialog modal-dialog-scrollable" style="max-width: 90%;">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="staticBackdropLabel">프로젝트 내역 요약</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <table class="table table-striped">
                                <thead>
                                    <tr align="center">
                                        <th scope="col">날짜</th>
                                        <th scope="col">타이틀</th>
                                        <th scope="col">금액</th>
                                        <th scope="col">기간</th>
                                        <th scope="col">상태</th>
                                    </tr>
                                </thead>
                                <tbody>
                                	<c:if test="${proInfos != null && !empty proInfos }">
	                                	<c:forEach var="i" begin="0" end="${proInfos.size()-1 }" step="1">
		                                    <tr align="center">
		                                    	<c:set var="yearMonth" value="${fn:substring(proInfos.get(i).getProStartDate(), 0, 7)}"/>
		                                        <th scope="row">${fn:replace(yearMonth, '-', '.') }</th>
		                                        <td style="max-width: 400px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">${proInfos.get(i).getProName() }</td>
		                                        <td>
		                                        	<fmt:formatNumber type="number" maxFractionDigits="3" value="${proInfos.get(i).getProPayment()}" var="commaPrice" />
		                                        	${commaPrice }원
		                                        </td>
		                                        <td>${proInfos.get(i).getProDuration() }일</td>
		                                        <td>
		                                        	<c:choose>
		                                        		<c:when test="${proInfos.get(i).getProStatName()=='진행중' }">
		                                        			<span class="badge badge-primary">${proInfos.get(i).getProStatName() }</span>
		                                        		</c:when>
		                                        		<c:when test="${proInfos.get(i).getProStatName()=='완료' }">
		                                        			<span class="badge badge-success">${proInfos.get(i).getProStatName() }</span>
		                                        		</c:when>
		                                        		<c:when test="${proInfos.get(i).getProStatName()=='중단' }">
		                                        			<span class="badge badge-danger">${proInfos.get(i).getProStatName() }</span>
		                                        		</c:when>
		                                        		<c:when test="${proInfos.get(i).getProStatName()=='등록실패' }">
		                                        			<span class="badge badge-warning">${proInfos.get(i).getProStatName() }</span>
		                                        		</c:when>
		                                        		<c:otherwise>
		                                        			<span class="badge badge-dark">${proInfos.get(i).getProStatName() }</span>
		                                        		</c:otherwise>
		                                        	</c:choose>
		                                        </td>
		                                    </tr>
	                                    </c:forEach>
                                    </c:if>
                                    <c:if test="${proInfos == null || empty proInfos}">
                                    	<tr align="center">
	                                        <th scope="row"></th>
	                                        <td style="max-width: 400px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden;"></td>
	                                        <td>프로젝트 내역이 존재하지 않습니다.</td>
	                                        <td></td>
	                                        <td></td>
	                                    </tr>
                                    </c:if>
                                </tbody>
                            </table>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div id="Smallchat" style="display: inline-block; margin: 0px;">
            <!-- 채팅방----------------------------------------------------------- -->
            <div class="Layout Layout-open Layout-expand Layout-right Layout-chatRoom"
                style="color: rgb(255, 255, 255);border-radius: 10px;">
                <!-- 채팅방 내부 -->
                <div class="Messenger_messenger">
                    <!-- 채팅방 헤더 -->
                    <div class="Messenger_header">
                        <div class="Messenger_header_wrap"></div>
                        <h4 class="Messenger_prompt">디베뉴(DeVenue)</h4>
                        <h6 class="Messenger_prompt2">${eachChatInfos.get(0).getRoomName() }</h6>
                    </div>
                    <!-- 채팅방 메시지 뷰 -->
                    <div class="Messenger_content">
                        <div class="Messages Messages2">
                            <div class="Messenger_content_wrap"></div>
                            <div class="Messages_list">
                           		<c:set var="eachChatRoomId" value="${eachChatInfos.get(0).roomId }"/>
                           		<c:set var="eachChatRoomMemId" value="${eachChatInfos.get(0).clientId }"/>
                            	<c:if test="${eachChatInfos != null && !empty eachChatInfos}">
                            		<!-- 스크립트에서 쓰기위한 선언(방번호, 고객번호) -->
                            		<c:forEach var="i" begin="0" end="${eachChatInfos.size()-1 }" step="1">
                            			<!-- 날짜 구분선의 내용이될 변수 만들기  -->
                            			<c:set var="seperDate" value=""/>
                            			<c:set var="beforeDate" value=""/>
                            			<c:set var="msgDate" value="${fn:substring(eachChatInfos.get(i).getMsgCreateDate(),0,10) }"/>
                            			<c:set var="msgDate" value="${fn:replace(msgDate, '-', '/')}"/>
                            			<fmt:formatDate value="<%=new Date() %>" pattern="yyyy/MM/dd" var="todayDate"/>
<%--                             			<c:out value="${todayDate}"/> --%>
                           				<c:set var="msgDateArr" value="${fn:split(msgDate, '/') }"/>
                           				<c:set var="mYear" value="${msgDateArr[0] }"/>
                           				<c:set var="mMonth" value="${msgDateArr[1] }"/>
                           				<c:set var="mDate" value="${msgDateArr[2] }"/>
                           				
                           				<c:set var="tDateArr" value="${fn:split(todayDate, '/') }"/>
                           				<c:set var="tYear" value="${tDateArr[0] }"/>
                           				<c:set var="tMonth" value="${tDateArr[1] }"/>
                           				<c:set var="tDate" value="${tDateArr[2] }"/>
                            			
                            			<c:choose>
	                            			<c:when test="${msgDate == todayDate }">
	                            				<c:set var="seperDate" value="오늘"/>                            			
	                            			</c:when>
	                            			<c:when test="${mYear==tYear && mMonth==tMonth && tDate-mDate==1 }">
	                            				<c:set var="seperDate" value="어제"/>                            			
	                            			</c:when>
	                            			<c:otherwise>
	                            				<c:set var="seperDate" value="${fn:replace(msgDate, '/', '.') }"/>
	                            			</c:otherwise>
                            			</c:choose>
                            			
                            			<c:if test="${eachChatInfos.get(0).chatContent != null }">
	                            			<c:if test="${i != 0 }">
	                            				<c:set var="beforeDate" value="${fn:substring(eachChatInfos.get(i-1).getMsgCreateDate(),0,10) }"/>
	                            				<c:set var="beforeDate" value="${fn:replace(beforeDate, '-', '/')}"/>
	                            				<c:if test="${msgDate != beforeDate }">
	                            					 <!-- 날짜 구분선 -->
					                                <div class="seperate_content">
					                                    <div class="seperate_line"></div>
					                                    <p class="seperate_date">${seperDate }</p>
					                                    <div class="seperate_line"></div>
					                                </div>
	                            				</c:if>
	                            			</c:if>
	                            			<c:if test="${i == 0 }">
	                            				 <!-- 날짜 구분선 -->
				                                <div class="seperate_content">
				                                    <div class="seperate_line"></div>
				                                    <p class="seperate_date">${seperDate }</p>
				                                    <div class="seperate_line"></div>
				                                </div>
	                            			</c:if>
											<input type="hidden" class="msgDate" value="${msgDate }"/>
											
											<!-- 메시지별 시간 표시형식 지정 위함 -->
											<c:set var="splitDate" value="${fn:split(eachChatInfos.get(i).getMsgCreateDate(),' ') }"/>
											<c:set var="time" value="${splitDate[1] }"/>
											<c:set var="HM" value="${fn:substring(time, 0, 5) }"/>
											<c:set var="times" value="${fn:split(HM, ':') }"/>
											<c:set var="hours" value="${times[0]}"/>
											<c:set var="minut" value="${times[1]}"/>
											<c:if test="${hours < 12 }">
												<c:set var="seperHour" value="AM"/>
											</c:if>
											<c:if test="${hours >= 12 }">
												<c:set var="seperHour" value="PM"/>
											</c:if>
											<c:set var="hours" value="${hours % 12}"/>
											<c:set var="hours" value="${hours != 0 ? hours : 12}"/>
											<c:if test="${fn:length(minut) < 2 }">
												<c:set var="minut" value="0${minut}"/>
											</c:if>
											<c:set var="msgTime" value="${hours}:${minut} ${seperHour }"/>
											
											<!-- 먼저 누구로부터 온건지 구분 후 반메시지인지 파일 메시지인지 구분 -->
	                            			<!-- 채팅방 참여자 정보 중 메시지 보낸 유저 정보 따로 저장해두기 -->
	                            			<c:set var="msgUserInfo" value=""/>
							                <c:forEach var="j" begin="0" end="${chatUserInfos.size()-1 }" step="1">
							                	<c:if test="${eachChatInfos.get(i).getMsgFromId() == chatUserInfos.get(j).getmId() }">
							                		<c:set var="msgUserInfo" value="${ chatUserInfos.get(j) }"/>
							                	</c:if>
							                </c:forEach>
											<!-- 다른 관리자가 보낸 메시지도 내가 보낸 메시지처럼 인식시킨다 -->
											<c:if test="${eachChatInfos.get(i).getMsgFromId() != eachChatInfos.get(i).getClientId()}">
				                                <!-- 내가 보낸 메시지 + 프로필 -->
												<!-- 일반 메시지인 경우-->
												<c:if test="${eachChatInfos.get(i).getOringalFileName()==null}">
					                                <div class="message_from_me msg_unit">
					                                    <div class="name_with_profile">
					                                        <span class="msg_time">${msgTime }</span>
					                                        <!-- 일단은 회원번호로 하고, 나중에 뷰랑 쿼리랑 dto 객체 수정해서 닉네임까지 조인시키자  -->
					                                        <span class="user_me">${msgUserInfo.getmNick() } ${msgUserInfo.getmName() }</span>
					                                        <!-- 여기도 일단은 임시로 하고, 나중에 뷰랑 쿼리랑 dto 객체 수정해서 프사리네임이름까지 조인시키자  -->
					                                        <div class="img_cont_msg">
					                                        	<c:if test="${msgUserInfo.getProImgName() == null || msgUserInfo.getProImgName() == '' }">
						                                            <img src="${pageContext.servletContext.contextPath }/resources/proImg/user3.png" width="30" height="30">
					                                        	</c:if>
					                                        	<c:if test="${msgUserInfo.getProImgName() != null && msgUserInfo.getProImgName() != '' }">
						                                            <img src="${pageContext.servletContext.contextPath }/resources/proImg/${msgUserInfo.getProImgName()}" width="30" height="30">
					                                        	</c:if>
					                                        </div>
					                                    </div>
					                                    <div class="msg_text_me">${eachChatInfos.get(i).getChatContent() }</div>
					                                </div>
				                                </c:if>
				                                <!-- 파일 메시지인 경우 -->
				                                <c:if test="${eachChatInfos.get(i).getOringalFileName()!=null}">
					                                <div class="message_from_me msg_unit file_message">
					                                    <div class="name_with_profile">
					                                        <span class="msg_time">${msgTime }</span>
					                                        <span class="user_me">${msgUserInfo.getmNick() } ${msgUserInfo.getmName() }</span>
					                                        <div class="img_cont_msg">
					                                            <c:if test="${msgUserInfo.getProImgName() == null || msgUserInfo.getProImgName() == '' }">
						                                            <img src="${pageContext.servletContext.contextPath }/resources/proImg/user3.png" width="30" height="30">
					                                        	</c:if>
					                                        	<c:if test="${msgUserInfo.getProImgName() != null && msgUserInfo.getProImgName() != '' }">
						                                            <img src="${pageContext.servletContext.contextPath }/resources/proImg/${msgUserInfo.getProImgName()}" width="30" height="30">
					                                        	</c:if>
					                                        </div>
					                                    </div>
					                                    <div class="msg_text_me fileDown_msg"><div style="border-radius:3px;"><span style="left:5px;display:inline-block;position:relative;top:3px;margin-right:8px">${eachChatInfos.get(i).getOringalFileName()}</span><a style="display:inline-block; width:30px; height:30px;position:relative;left:3px;" href="${pageContext.servletContext.contextPath}/resources/chatFile/${eachChatInfos.get(i).getRenameFileName()}" download="${eachChatInfos.get(i).getOringalFileName()}"><svg width="2em" height="2em" style="position:relative; top:2px;" viewBox="0 0 16 16" class="bi bi-arrow-down-circle" fill="currentColor" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/><path fill-rule="evenodd" d="M4.646 7.646a.5.5 0 0 1 .708 0L8 10.293l2.646-2.647a.5.5 0 0 1 .708.708l-3 3a.5.5 0 0 1-.708 0l-3-3a.5.5 0 0 1 0-.708z"/><path fill-rule="evenodd" d="M8 4.5a.5.5 0 0 1 .5.5v5a.5.5 0 0 1-1 0V5a.5.5 0 0 1 .5-.5z"/></svg></a></div></div>
					                                </div>
				                                </c:if>
											</c:if>
			                                <!-- 상대가 보낸 메시지 + 프로필 -->
											<c:if test="${eachChatInfos.get(i).getMsgFromId() == eachChatInfos.get(i).getClientId() }">
												<!-- 일반 메시지인 경우 -->
												<c:if test="${eachChatInfos.get(i).getOringalFileName()==null}">
					                                <div class="message_from_other msg_unit">
					                                    <div class="name_with_profile">
					                                        <div class="img_cont_msg">
					                                            <c:if test="${msgUserInfo.getProImgName() == null || msgUserInfo.getProImgName() == '' }">
						                                            <img src="${pageContext.servletContext.contextPath }/resources/proImg/user3.png" width="30" height="30">
					                                        	</c:if>
					                                        	<c:if test="${msgUserInfo.getProImgName() != null && msgUserInfo.getProImgName() != '' }">
						                                            <img src="${pageContext.servletContext.contextPath }/resources/proImg/${msgUserInfo.getProImgName()}" width="30" height="30">
					                                        	</c:if>
					                                        </div>
					                                        <span class="user_other">${msgUserInfo.getmNick() } ${msgUserInfo.getmName() }</span>
					                                        <span class="msg_time_send">${msgTime }</span>
					                                    </div>
					                                    <div class="msg_text_other">${eachChatInfos.get(i).getChatContent() }</div>
					                                </div>
				                                </c:if>
				                                <!-- 파일 메시지인 경우 -->
												<c:if test="${eachChatInfos.get(i).getOringalFileName()!=null}">
					                                <div class="message_from_other msg_unit">
					                                    <div class="name_with_profile">
					                                        <div class="img_cont_msg">
					                                            <c:if test="${msgUserInfo.getProImgName() == null || msgUserInfo.getProImgName() == '' }">
						                                            <img src="${pageContext.servletContext.contextPath }/resources/proImg/user3.png" width="30" height="30">
					                                        	</c:if>
					                                        	<c:if test="${msgUserInfo.getProImgName() != null && msgUserInfo.getProImgName() != '' }">
						                                            <img src="${pageContext.servletContext.contextPath }/resources/proImg/${msgUserInfo.getProImgName()}" width="30" height="30">
					                                        	</c:if>
					                                        </div>
					                                        <span class="user_other">${msgUserInfo.getmNick() } ${msgUserInfo.getmName() }</span>
					                                        <span class="msg_time_send">${msgTime }</span>
					                                    </div>
					                                    <div class="msg_text_other"><div style="border-radius:3px;"><span style="display:inline-block;position:relative;top:3px;margin-right:8px; left:5px;">${eachChatInfos.get(i).getOringalFileName()}</span><a style="display:inline-block; width:30px; height:30px; position:relative; left:3px;" href="${pageContext.servletContext.contextPath}/resources/chatFile/${eachChatInfos.get(i).getRenameFileName()}" download="${eachChatInfos.get(i).getOringalFileName()}"><svg width="2em" height="2em" style="position:relative; top:2px;" viewBox="0 0 16 16" class="bi bi-arrow-down-circle" fill="currentColor" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/><path fill-rule="evenodd" d="M4.646 7.646a.5.5 0 0 1 .708 0L8 10.293l2.646-2.647a.5.5 0 0 1 .708.708l-3 3a.5.5 0 0 1-.708 0l-3-3a.5.5 0 0 1 0-.708z"/><path fill-rule="evenodd" d="M8 4.5a.5.5 0 0 1 .5.5v5a.5.5 0 0 1-1 0V5a.5.5 0 0 1 .5-.5z"/></svg></a></div></div>
					                                </div>
				                                </c:if>
											</c:if>
										 </c:if>
										<!-- 메시지 반복 끝 -->
                            		</c:forEach>
                            	</c:if>
                            </div>
                        </div>
                        <!-- 채팅방 메시지 입력 공간 -->
                        <div class="Input Input-blank">
                            <div class="Input_wrap"></div>
							<!-- 파일 첨부 버튼 -->
			                <button class="Input_button Input_button-file">
			                  <div class="Icon">
			                  <form method="POST" ecntype="multipart/from-data" id="fileForm" accept-charset="UTF-8">
			                    <input type="file" name="file" class="Input-file-hidden" id="file">
			                    <label for="file"></label>
			                   </form>
			                  </div>
			                </button>
			                <!-- 메시지 입력창 -->
			                <div class="Input-content-wrap">
			                  <textarea class="Input_field" placeholder="메시지를 입력하세요" id="textMessage" onkeydown="return enter()"></textarea>
			                  <input type="hidden" id="forEmojiAdd">
			                </div>
			                <!-- 이모티콘 버튼 -->
			                <button class="Input_button Input_button-emoji" onclick="inputEmoji(this);">
			                  <div class="Icon" style="width: 25px; height: 25px;">
			                    <svg width="60px" height="60px" viewBox="1332 47 56 56" version="1.1"
			                      xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"
			                      style="width: 18px; height: 18px;">
			                      <g id="emoji" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd"
			                        transform="translate(1332.000000, 47.000000)">
			                        <path
			                          d="M28,56 C12.536027,56 0,43.463973 0,28 C0,12.536027 12.536027,0 28,0 C43.463973,0 56,12.536027 56,28 C56,43.463973 43.463973,56 28,56 Z M28,50 C40.1502645,50 50,40.1502645 50,28 C50,15.8497355 40.1502645,6 28,6 C15.8497355,6 6,15.8497355 6,28 C6,40.1502645 15.8497355,50 28,50 Z"
			                          id="Oval-8" fill="#96AAB4" fill-rule="nonzero"></path>
			                        <path
			                          d="M28,47 C18.0588745,47 10,38.9411255 10,29 C10,27.5224898 11.5469487,26.5550499 12.8754068,27.2017612 C13.0116063,27.2662365 13.0926181,27.3037345 13.1866998,27.3464814 C13.4611235,27.4711684 13.7819537,27.6111958 14.1451774,27.7627577 C15.1908595,28.199088 16.3591406,28.6365764 17.6173846,29.0449298 C21.1841638,30.2025005 24.7379224,30.8945075 28,30.8945075 C31.2620776,30.8945075 34.8158362,30.2025005 38.3826154,29.0449298 C39.6408594,28.6365764 40.8091405,28.199088 41.8548226,27.7627577 C42.2180463,27.6111958 42.5388765,27.4711684 42.8133002,27.3464814 C42.9073819,27.3037345 42.9883937,27.2662365 43.0558366,27.2344634 C44.4530513,26.5550499 46,27.5224898 46,29 C46,38.9411255 37.9411255,47 28,47 Z M28,43 C34.6510529,43 40.2188483,38.3620234 41.6456177,32.1438387 C40.9980758,32.3847069 40.320642,32.6213409 39.6173846,32.8495777 C35.6841638,34.1260741 31.7379224,34.8945075 28,34.8945075 C24.2620776,34.8945075 20.3158362,34.1260741 16.3826154,32.8495777 C15.679358,32.6213409 15.0019242,32.3847069 14.3543823,32.1438387 C15.7811517,38.3620234 21.3489471,43 28,43 Z"
			                          id="Oval-8" fill="#96AAB4" fill-rule="nonzero"></path>
			                        <path
			                          d="M19,15 L19,20 C19,21.1045695 19.8954305,22 21,22 C22.1045695,22 23,21.1045695 23,20 L23,15 C23,13.8954305 22.1045695,13 21,13 C19.8954305,13 19,13.8954305 19,15 Z"
			                          id="Line" fill="#96AAB4" fill-rule="nonzero"></path>
			                        <path
			                          d="M32,15 L32,20 C32,21.1045695 32.8954305,22 34,22 C35.1045695,22 36,21.1045695 36,20 L36,15 C36,13.8954305 35.1045695,13 34,13 C32.8954305,13 32,13.8954305 32,15 Z"
			                          id="Line-Copy-2" fill="#96AAB4" fill-rule="nonzero"></path>
			                      </g>
			                    </svg>
			                  </div>
			                </button>
                            <!-- 메시지 보내는 버튼 -->
			                <button class="Input_button Input_button-send" onclick="sendMessage()" value="Send" type="button">
			                  <div class="Icon" style="width: 25px; height: 25px;">
			                    <svg width="60px" height="57px" viewBox="1496 193 57 54" version="1.1"
			                      xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"
			                      style="width: 18px; height: 18px;">
			                      <g id="Group-9-Copy-3" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd"
			                        transform="translate(1523.000000, 220.000000) rotate(-270.000000) translate(-1523.000000, -220.000000) translate(1499.000000, 193.000000)">
			                        <path
			                          d="M5.42994667,44.5306122 L16.5955554,44.5306122 L21.049938,20.423658 C21.6518463,17.1661523 26.3121212,17.1441362 26.9447801,20.3958097 L31.6405465,44.5306122 L42.5313185,44.5306122 L23.9806326,7.0871633 L5.42994667,44.5306122 Z M22.0420732,48.0757124 C21.779222,49.4982538 20.5386331,50.5306122 19.0920112,50.5306122 L1.59009899,50.5306122 C-1.20169244,50.5306122 -2.87079654,47.7697069 -1.64625638,45.2980459 L20.8461928,-0.101616237 C22.1967178,-2.8275701 25.7710778,-2.81438868 27.1150723,-0.101616237 L49.6075215,45.2980459 C50.8414042,47.7885641 49.1422456,50.5306122 46.3613062,50.5306122 L29.1679835,50.5306122 C27.7320366,50.5306122 26.4974445,49.5130766 26.2232033,48.1035608 L24.0760553,37.0678766 L22.0420732,48.0757124 Z"
			                          id="sendicon" fill="#96AAB4" fill-rule="nonzero"></path>
			                      </g>
			                    </svg>
			                  </div>
			                </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- </div> -->
    </div>



    <!-- 개인 스크립트 -->
    <script>
        $('.Layout-chatRoom').show();

        $(function () {
            // 입력하는 텍스트가 많아지면 창 키우고 아이콘들 위치도 변화
            var inputField = $('.Input_field')
            var inputFileLabel = $('.Input-file-hidden + label');
            inputField.keydown(function (event) {
                if (inputField.val().length < 39) {
                    inputField.css('height', 29);
                    $('.Input-blank').css('height', 70);
                    inputFileLabel.css('top', -35);
                    $('svg').css('position', 'relative').css('top', 0);
                    $('#emojis').css('top', '250px');
                }
                if (inputField.val().length >= 39 || (event.keyCode == 13&&event.shiftKey) || inputField.val().split('\n').length>=2){
                    inputField.css('height', 60);
                    $('.Input-blank').css('height', 100);
                    inputFileLabel.css('top', -50);
                    $('svg').css('position', 'relative').css('top', 14);
                    $('#emojis').css('top', '230px');
                }
             	// 이모지 창도 위치 조정
                var emojiPositionT = $('.Input_button-emoji').offset().top;
          	  	var emojiPositionL = $('.Input_button-emoji').offset().left;
                selectEmojisOpenPosition(emojiPositionT,emojiPositionL);
            });
        })
		// 처음 랩 크기 설정(css에서 해도 되지만 그냥)
        $('.Messenger_content_wrap').css('height', '100%');

        // 오버플로우 된 것 내부의 요소의 높이를 뽑아낼 수 없으니
        // 스크롤 이동에따라 덮개가 같이 이동하도록함
        $('.Messages').scroll(function () {
            $('.Messenger_content_wrap').css('top', $('.Messages').scrollTop());
        });

        // 내쪽 프로필, 메시지 위치 조정위해 길이 구하기
        function setChatMessagePosition(file){
      	if(file=='file'){
      		var nameLineWidth = $('.message_from_me');
      	}else {
      	  var nameLineWidth = $('.message_from_me').not('.file_message');
      	}
      	
      	nameLineWidth.each(function (index, item) {
          var contentWidth = $('.Layout-open').width();
          var scrollbarWidth = getScrollbarWidth();
          var titleWidth = textWidth($(item).find('.user_me').text(), 'sans-serif')
          if (titleWidth > 150) {
            titleWidth = 150;
          } else if (titleWidth < 50) {
            titleWidth = 50;
          } else {

          }
          var timeWidth = textWidth($(item).find('.msg_time').text(), 'sans-serif')
          if (timeWidth > 90) {
        	  timeWidth = 90;
          } else if (titleWidth < 50) {
        	  timeWidth = 50;
          } else {

          }
          var profileWidth = Math.abs($('.img_cont_msg').width())
          var etcWidth = 0;
		
          var result = contentWidth - scrollbarWidth - titleWidth - timeWidth - profileWidth - etcWidth;
          $(item).children('.name_with_profile').css('left', result);
          
          var messageMinWidth = Number($('.msg_text_me').css('min-width').replace('px', ''));
	  	    var messageMaxWidth = Number($('.msg_text_me').css('max-width').replace('px', ''));
          $('.msg_text_me').each(function(index, item){
        	var messageTextwidth = $(item).width();
	  	    if (messageTextwidth > messageMaxWidth) {
	  	      messageTextwidth = messageMaxWidth;
	  	      messageTextwidth = messageTextwidth + 0;
	  	    } else if (messageTextwidth < messageMinWidth) {
	  	      messageTextwidth = messageMinWidth;
	  	      messageTextwidth = messageTextwidth + 30;
	  	    } else {
	  	      messageTextwidth = messageTextwidth + 45;
	  	    }
  	        $(item).css('left', contentWidth- scrollbarWidth- messageTextwidth);
  		  });

        });
        }
        // 로딩시 메시지 위치조정 한번 실행
        $(function(){
      	  setChatMessagePosition();
      	setChatMessagePosition('file');
      	// 얘는 파일 다운태그 있는 텍스트 영역만을 조정
      	setChatFileMessagePosition();
        })
        
        // 리사이즈 될때마다 또
        $(window).resize(function(){
        	setChatMessagePosition();
          	setChatMessagePosition('file');
          	setChatFileMessagePosition();
        })

        //텍스트 길이 구해주는 함수
        function textWidth(text, fontProp) {
            var tag = document.createElement("div");
            tag.style.position = "absolute";
            tag.style.left = "-999em";
            tag.style.whiteSpace = "nowrap";
            tag.style.font = fontProp;
            tag.innerHTML = text;

            document.body.appendChild(tag);

            var result = tag.clientWidth;

            document.body.removeChild(tag);

            return result;
        }

        //스크롤바 너비 구하는 함수
        function getScrollbarWidth() {

            const outer = document.createElement('div');
            outer.style.visibility = 'hidden';
            outer.style.overflow = 'scroll';
            outer.style.msOverflowStyle = 'scrollbar';
            document.body.appendChild(outer);

            const inner = document.createElement('div');
            outer.appendChild(inner);

            const scrollbarWidth = (outer.offsetWidth - inner.offsetWidth);

            outer.parentNode.removeChild(outer);

            return scrollbarWidth;

        }


        $(function () {
            $('.ingPjMoreBtn').click(function () {
                $('.ingPjContentModal').show();
            })
        })
    </script>
    <script>
    // 채팅 파일 전송하게하는 버튼
    $(function(){
   	 $('#file').change(function(){
   		 if($(this).val()!=null){
   			 var isTransFile = confirm('파일을 전송하시겠습니까?');
   			 if(!isTransFile){
   				 return;
   			 }
   			 alert('에이작스 실행하러 간다')
   			 uploadFile();
   		 }
   	 });
    })
    
    // 안읽은 메시지 채팅방 들어가면 읽음 처리하는 함수
    // => 이건 여기서 할지 이 전에서 처리할지 고민, 로직은 바꾸긴 해야함
//     function readMessages(roomId, userId){
//    	// DB에 값 넣기
//         $.ajax({
//        	url:"readMessages.do",
//        	type:"get",
//    		data:{roomId:roomId, userId:userId},
//        	success:function(data){
//        		alert('readMessages 결과 : '+data);
       		
//        	},
//        	error:function(request, status, error){
//        		alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
//        	}
//         });
//     }
    </script>
    <script>
 // 채팅 백단관련 스크립트: 웹소켓 통신 쪽------------------------------------------------------------------
    var webSocket;
	// 서버의 admin의 서블릿으로 웹 소켓을 한다.
	if('${me.userType}' == "UT1"){
		webSocket = new WebSocket(
		"ws://localhost:8999/DeVenue/mainAdmin");

// 		alert('주관리자 웹소켓 전송')

	}else{
		// 일단은 서브관리자들도 주관리자 걸로
		webSocket = new WebSocket(
		"ws://localhost:8999/DeVenue/mainAdmin");
	}
	// 운영자에서의 open, close, error는 의미가 없어서 형태만 선언
	webSocket.onopen = function(message) {
	//접속하자마자 매칭을 위한 방번호 소켓에 전송.
	//매칭을 위한 방번호로, 임시로 부여한다. 만약 특정 방에 들어가지 않아서 null이면 0을 보내주기로 하자
	//반대로 관리자는 ui체계상 방번호를 고려하지 않고 해당 고객에게만 보내면 되기 때문에,
	//유저정보만 백단에서 비교한다.
		var roomId = '${eachChatRoomId}';
		var otherId = '${eachChatRoomMemId}';
// 		alert('roomId : ' + roomId + ', otherId : ' + otherId)
		webSocket.send(roomId+"room$Id$");
		webSocket.send(otherId+"other$Id$");
// 		alert('웹소켓 오픈')
	};
	webSocket.onclose = function(message) {
		isReadT = '';
// 		alert('웹소켓 종료되어서 리로드가 필요해')
		location.reload();
	};
	webSocket.onerror = function(message) {
		// 콘솔에 메시지를 남긴다.
		messageTextArea.value += "error...\n";
	};
	
	isReadT = '';
	// 서버로부터 메시지가 도착하면 화면에 메시지를 남긴다.(리턴한 것)
	webSocket.onmessage = function(message) {
		console.log('수신 message.data:'+message.data);
		console.log(typeof(message.data))
			if(message.data == 'Y'){
				window.isReadT ='Y';
				alert('난 접속을 했고! 상대방은 접속 되어있대!');
			}else{
				window.isReadT = 'N';
				
				// 메시지의 구조는 JSON 형태로 만들었다.
				let node = JSON.parse(message.data);

				// 메시지 내용과 시간을 분리한다(,로 구분하여 보냄)
				var mContent = node.message.split(',');
				if(mContent.length >= 3){
					window.isReadT = 'N';
					alert('3보나 크다');
					console.log('온메시지 함수안의 isReadT ' + isReadT);
				// 접속이 연결된 상태인 경우 서버에서 Y만 반환하여 대입후 빠져나감
				}else if(mContent.length == 1){
					window.isReadT = 'Y';
					return;
				}
				
				var messageContent  = mContent[0];
				console.log('메시지 전체 : ' + node);
				console.log('메시지 내용 자료형 : ' + typeof(messageContent));
				console.log('메시지 내용 : ' + messageContent);

				var messageTime = mContent[1];
				console.log('메시지 시간 : ' + messageTime);
				var viewDate = DateToString(messageTime);
				var msgSendMemNick = mContent[2];
				console.log('3번째 콘텐트'+mContent[2]);
				
				if($('.msgDate').length > 0){
					var msgDate = $('.msgDate:last').val().trim();
					console.log('날짜 : '+ msgDate);
					var todayDate = messageTime.substring(0, 10).trim();
					console.log('오늘날짜 : ' + todayDate);
					var mDArr = msgDate.split('/');
					var mY = mDArr[0];
					var mM = mDArr[1];
					var mD = mDArr[2];
					var tDArr = todayDate.split('/');
					var tY = tDArr[0];
					var tM = tDArr[1];
					var tD = tDArr[2];
					if(tM.length < 2){
						tM = "0"+tM;
					}
					if(tD.length < 2){
						tD = "0"+tD;
					}
					var reTodayDate = tY+"/"+tM+"/"+tD;
					// 만약 오늘 처음 보낸 메시지라면 오늘구분선 하나 넣어주기, 날짜를 담은 인풋히든 태그도 넣어준다.
					$seperLine = $('<div class="seperate_content"><div class="seperate_line"></div><p class="seperate_date">오늘</p><div class="seperate_line"></div></div>');
					if(mY==tY&&mM==tM&&mD==tD){
						alert('오늘 처음보낸 메시지가 아니다')
					}else if($('.Messages_list').find('.msg_unit').length >= 1){
						console.log("!!")
						alert('오늘 처음보낸 메시지다')				
						$('.Messages_list').append($seperLine);
						$('.Messages_list').append('<input type="hidden" class="msgDate" value="'+reTodayDate+'"/>');
					}
				}else if($('.Messages_list').find('.msg_unit').length < 1){
					consol.log("??")
					// 아무 메시지도 없었다면, 오늘구분선 하나 넣어주기
					$('.Messages_list').append('<div class="seperate_content"><div class="seperate_line"></div><p class="seperate_date">오늘</p><div class="seperate_line"></div></div>');
				}
				
				var proImgName = 'user3.png';
				<c:forEach var="i" begin="0" end="${chatUserInfos.size()-1}" step="1">
					if(msgSendMemNick == '${chatUserInfos.get(i).getmNick()} ${chatUserInfos.get(i).getmName()}'){
						if('${chatUserInfos.get(i).getProImgName()}'!=''||'${chatUserInfos.get(i).getProImgName()}'!=null){
							proImgName = '${chatUserInfos.get(i).getProImgName()}'
						}
					}
				</c:forEach>
				var isFile = String(messageContent).indexOf("$$$$");
				console.log(isFile)
				if(isFile!=-1){
					alert('파일이다'+isFile);
					
					var fileInfoArray = messageContent.replace(/@@@@/gi, '/').split('$$$$');
					var renameFileName = fileInfoArray[0];
					var originFileName = fileInfoArray[1];

					// 아래에 메시지를 추가한다.
					
					$fromOtherMsgContent = $('<div class="message_from_other msg_unit"><div class="name_with_profile"><div class="img_cont_msg"><img src="${pageContext.servletContext.contextPath}/resources/proImg/'+ proImgName +'" width="30" height="30"></div><span class="user_other">'+msgSendMemNick+'</span><span class="msg_time_send">'+viewDate+'</span></div><div class="msg_text_other"></div></div>');
					$fileDownATag = $('<div style="border-radius:3px;"><span style="left:5px;display:inline-block;position:relative;top:3px;margin-right:8px">'+originFileName+'</span><a style="display:inline-block; width:30px; height:30px;position:relative;left:3px;" href="${pageContext.servletContext.contextPath}/resources/chatFile/'+renameFileName+'" download="'+originFileName+'">'+'<svg width="2em" height="2em" style="position:relative; top:2px;" viewBox="0 0 16 16" class="bi bi-arrow-down-circle" fill="currentColor" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/><path fill-rule="evenodd" d="M4.646 7.646a.5.5 0 0 1 .708 0L8 10.293l2.646-2.647a.5.5 0 0 1 .708.708l-3 3a.5.5 0 0 1-.708 0l-3-3a.5.5 0 0 1 0-.708z"/><path fill-rule="evenodd" d="M8 4.5a.5.5 0 0 1 .5.5v5a.5.5 0 0 1-1 0V5a.5.5 0 0 1 .5-.5z"/></svg>'+'</a></div>');
					
					$fromOtherMsgContent.find('.msg_text_other').append($fileDownATag);
					
					$('.Messages_list').append($fromOtherMsgContent)
					
					// 메시지 포지션 설정	// -> 상대방 것이므로 할 필요 없음
// 					setChatMessagePosition('file');
				}else{
					alert('파일이 아니다'+isFile);
					// 아래에 메시지를 추가한다.
					$fromOtherMsgContent = $('<div class="message_from_other msg_unit"><div class="name_with_profile"><div class="img_cont_msg"><img src="${pageContext.servletContext.contextPath}/resources/proImg/'+ proImgName +'" width="30" height="30"></div><span class="user_other">'+msgSendMemNick+'</span><span class="msg_time_send">'+viewDate+'</span></div><div class="msg_text_other">'+messageContent+'</div></div>');
					$('.Messages_list').append($fromOtherMsgContent)
					
					// 메시지 포지션 설정
// 					setChatMessagePosition('notFile');
				}
				// 스크롤 최하단으로
				showRecentChatView();
			}
		// 스크롤 최하단으로
		showRecentChatView();
	};
	
	// 받은 날짜를 채팅에 어울리는 형식으로 변환( ex) AM 08:05 )
	function DateToString(date) {
		var splitDate =	date.substring(10).split('/');
		var hours = splitDate[0];
		var min = splitDate[1];
		
		var ampm = "";
		if(hours<12){
			seperHour = "AM"
		}else{
			seperHour = "PM"
		}
		hours = hours % 12;
	  	hours = hours != 0 ? hours : 12;
// 		if(hours < 10){
// 			hours = '0'+hours;
// 		}
// 		if(min < 10){
// 			min = '0'+min;
// 		}
		return "".concat(hours).concat(":").concat(min).concat(" ").concat(seperHour);
	};
	
	// 전송 버튼을 클릭하면 발생하는 이벤트
	function sendMessage() {
		
		// 텍스트 박스의 객체를 가져옴
		var message = $('#textMessage').val();
		var fileBtn = $("#file");

		alert('message' + message)
		
		// 채팅 메시지 입력하지 않거나 파일전송을 안하면 메시지 전송 안되게
		if(message=="" && fileBtn.val()==""){
			alert('메시지를 입력해주세요');
			return;
		}
		alert('리턴 안되고 넘어오나');
		// 현재 날짜
		let currentDateTime = new Date();
		// 뷰할 형태로 날짜 변환
		let viewDate = DateToString2(currentDateTime);
		// 메시지와 날짜 정보 반환
		var submitDate = DateTransForm(currentDateTime);
		// 보낼 전체 메시지
		var loginAdmin = '${me.mNick}';
		alert('로그인 유저: ' + loginAdmin)
		let allMessage = message + "," + submitDate + "," + '디베뉴 매니저 '+loginAdmin;
		
		// 유저 key를 취득한다. => 나는다른방식으로 처리해야겠지
// 		let key = $div.data("key");
		var key = "key";
		
		// 삽입할 내가보낸 메시지 영역
		// 마지막 메시지의 날짜와 오늘 날짜 비교
		if($('.msgDate').length > 0){
			var msgDate = $('.msgDate:last').val().trim();
			alert('날짜 : '+ msgDate);
			var todayDate = submitDate.substring(0, 9).trim();
			alert('오늘날짜 : ' + todayDate);
			var mDArr = msgDate.split('/');
			var mY = mDArr[0];
			var mM = mDArr[1];
			var mD = mDArr[2];
			var tDArr = todayDate.split('/');
			var tY = tDArr[0];
			var tM = tDArr[1];
			var tD = tDArr[2];
			if(tM.length < 2){
				tM = "0"+tM;
			}
			if(tD.length < 2){
				tD = "0"+tD;
			}
			var reTodayDate = tY+"/"+tM+"/"+tD;
			// 만약 오늘 처음 보낸 메시지라면 오늘구분선 하나 넣어주기, 날짜를 담은 인풋히든 태그도 넣어준다.
			$seperLine = $('<div class="seperate_content"><div class="seperate_line"></div><p class="seperate_date">오늘</p><div class="seperate_line"></div></div>');
			if(mY==tY&&mM==tM&&mD==tD){
				alert('오늘 처음보낸 메시지가 아니다')
			}else if($('.Messages_list').find('.msg_unit').length >= 1){
				alert('오늘 처음보낸 메시지다')				
				$('.Messages_list').append($seperLine);
				$('.Messages_list').append('<input type="hidden" class="msgDate" value="'+reTodayDate+'"/>');
			}
		}else if($('.Messages_list').find('.msg_unit').length < 1){
			// 아무 메시지도 없었다면, 오늘구분선 하나 넣어주기
			$('.Messages_list').append('<div class="seperate_content"><div class="seperate_line"></div><p class="seperate_date">오늘</p><div class="seperate_line"></div></div>');
		}
		
		var proImgName = 'user3.png'
		if('${me.proImgName}' != null || '${me.proImgName}' != ''){
			proImgName = '${me.proImgName}'
		}
		$fromMeMsgContent = $('<div class="message_from_me msg_unit"><div class="name_with_profile"><span class="msg_time">'+viewDate+'</span> <span class="user_me">${me.getmNick()} ${me.getmName()}</span><div class="img_cont_msg"><img src="${pageContext.servletContext.contextPath}/resources/proImg/'+proImgName+'" width="30" height="30"></div></div><div class="msg_text_me">'+message+'</div></div>');
		// 삽입
		$(".Messages_list").append($fromMeMsgContent);
		// 메시지 포지션 설정
		setChatMessagePosition();

		// 웹소켓으로 메시지를 보낸다.
		webSocket.send(key + "#####" + allMessage);
		
		alert('DB가지 전까지 오나');
		// DB에 보낸 메시지 저장하러 감
		
		if(isReadT == ''){
			var waitForServer3 = window.setInterval(function(){
				alert('isRead가 존재하지 않는 중..');
				if(isReadT != ''){
					alert('isReadT가 존재하게 되었나');
					saveTextMessage(message, submitDate);
					clearInterval(waitForServer3);
				}					
			},1000)
		}else{
			alert('isReadT가 존재해서 간다 에이작스로');
			saveTextMessage(message, submitDate);
		}
		
	}
	
	// DB에 보낸 일반 텍스트 메시지를 저장하는 함수
	function saveTextMessage(message, submitDate){
		var message = message;
		var time = submitDate;
		var from_id = ${me.mId};
		var roomId = '${eachChatRoomId}';
		var isRead = isReadT; 
		alert('룸아이디가 왜 NAN : '+roomId);

		var tMsgInform = {
				msg:message,
				time:time,
				from_id:from_id,
				room_id:roomId,
				isRead:isRead
		}
		console.log('읽었나'+isRead);
		
		$.ajax({
			url:"saveChatTextMessage.do",
			type:"get",
			data:tMsgInform,
			success:function(data){
				alert('DB에 보낸 일반 텍스트 메시지를 저장 성공 : '+data)

				isReadT='';
				
				// 텍스트 박스 추기화
				$('#textMessage').val('');
				// 텍스트 박스에 키다운 시켜서 창크기를 초기화하고 포커스 주기
				$('.Input_field').keydown().focus();
				
				// 스크롤 최하단으로
				showRecentChatView();
			},
			error:function(request,status,error){
			    alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
			},
			complete : function(data) {
	        	// 실패했어도 완료가 되었을 때 처리
	        	alert('DB에 보낸 일반 텍스트 메시지를 저장하러가는 에이작스 끝남')
			}
		});
	}
	
	// 서버로 보낼 파일 메시지를 발송하는 함수(파일을 선택하면 자동 발송)
	function uploadFile(){
		alert("에이작스 실행하러 왔다")
		
		var form = $('#fileForm')[0];
		var formData = new FormData(form);
		 // 코드로 동적으로 데이터 추가 가능.
//      formData.append("userId", "testUser!");
		
		 $.ajax({
             url: 'chatFileUpload.do',
             ecntype:'multipart/form-data',
             data: formData,
             type: 'POST',
             processData: false,
             contentType: false,
             timeout:600000,
             success: function(renameFileName){
                 alert(renameFileName);
                 console.log('파일저장이 끝나고..')
                 //파일전송
                 var submitDate = sendFileInfoMessage(renameFileName);
                 console.log('파일전송이 끝나고..')
                 alert('submitDate : '+submitDate)
                 if(submitDate != null){
	              // DB에 파일메시지 저장하러 감
	       			if(isReadT == ''){
	       				alert('isReadT 없는 중..')
	       				var waitForServer2 = window.setInterval(function(){
	       					if(isReadT != ''){
	       						alert('isReadT 확인!')
	       						saveFileInfoMessage(renameFileName, submitDate);
	       						clearInterval(waitForServer2);
	       					}					
	       				},1000)
	       			}else{
	       				alert('isReadT 요있네!..')
	       				saveFileInfoMessage(renameFileName, submitDate);
	       			}
	      			isReadT='';
	      			console.log('파일DB저장이 끝나고..')
                 }
             },
             error:function(data){
            	 alert('에러' + data);
             },
             complete:function(){
            	
             }
     	});
		 
	}
	
	// 파일을 전송하는 경우, 웹소켓 메시지로 파일 정보 및 다운로드 링크 전송
	function sendFileInfoMessage(renameFileName){
		let currentDateTime = new Date();
		var submitDate = DateTransForm(currentDateTime);
		let viewDate = DateToString2(currentDateTime);
		
		//원래 파일명 구하기			
		var fileValue = $("#file").val().split("\\");
		var originFileName = fileValue[fileValue.length-1]; // 파일명(마지막에 파잉명이 위치하니까)
		
		// 삽입할 내가보낸 메시지 영역
		// 마지막 메시지의 날짜와 오늘 날짜 비교
		if($('.msgDate').length > 0){
			var msgDate = $('.msgDate:last').val().trim();
			alert('날짜 : '+ msgDate);
			var todayDate = submitDate.substring(0, 9).trim();
			alert('오늘날짜 : ' + todayDate);
			var mDArr = msgDate.split('/');
			var mY = mDArr[0];
			var mM = mDArr[1];
			var mD = mDArr[2];
			var tDArr = todayDate.split('/');
			var tY = tDArr[0];
			var tM = tDArr[1];
			var tD = tDArr[2];
			if(tM.length < 2){
				tM = "0"+tM;
			}
			if(tD.length < 2){
				tD = "0"+tD;
			}
			var reTodayDate = tY+"/"+tM+"/"+tD;
			// 만약 오늘 처음 보낸 메시지라면 오늘구분선 하나 넣어주기, 날짜를 담은 인풋히든 태그도 넣어준다.
			$seperLine = $('<div class="seperate_content"><div class="seperate_line"></div><p class="seperate_date">오늘</p><div class="seperate_line"></div></div>');
			if(mY==tY&&mM==tM&&mD==tD){
				alert('오늘 처음보낸 메시지가 아니다')
			}else{
				alert('오늘 처음보낸 메시지다')				
				$('.Messages_list').append($seperLine);
				$('.Messages_list').append('<input type="hidden" class="msgDate" value="'+reTodayDate+'"/>');
			}
		}else{
			// 아무 메시지도 없었다면, 오늘구분선 하나 넣어주기
			$('.Messages_list').append('<div class="seperate_content"><div class="seperate_line"></div><p class="seperate_date">오늘</p><div class="seperate_line"></div></div>');
		}
		
		var proImgName = 'user3.png'
		if('${me.proImgName}' != null || '${me.proImgName}' != ''){
			proImgName = '${me.proImgName}'
		}
		$fromMeMsgContent = $('<div class="message_from_me msg_unit file_message"><div class="name_with_profile"><span class="msg_time">'+viewDate+'</span> <span class="user_me">${me.getmNick()} ${me.getmName()}</span><div class="img_cont_msg"><img src="${pageContext.servletContext.contextPath}/resources/proImg/'+proImgName+'" width="30" height="30"></div></div><div class="msg_text_me fileDown_msg"></div></div>');
		$fileDownATag = $('<div style="border-radius:3px;"><span style="left:5px;display:inline-block;position:relative;top:3px;margin-right:8px">'+originFileName+'</span><a style="display:inline-block; width:30px; height:30px;position:relative;left:3px;" href="${pageContext.servletContext.contextPath}/resources/chatFile/'+renameFileName+'" download="'+originFileName+'">'+'<svg width="2em" height="2em" style="position:relative; top:2px;" viewBox="0 0 16 16" class="bi bi-arrow-down-circle" fill="currentColor" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/><path fill-rule="evenodd" d="M4.646 7.646a.5.5 0 0 1 .708 0L8 10.293l2.646-2.647a.5.5 0 0 1 .708.708l-3 3a.5.5 0 0 1-.708 0l-3-3a.5.5 0 0 1 0-.708z"/><path fill-rule="evenodd" d="M8 4.5a.5.5 0 0 1 .5.5v5a.5.5 0 0 1-1 0V5a.5.5 0 0 1 .5-.5z"/></svg>'+'</a></div>');
		// 삽입
		$fromMeMsgContent.find('.msg_text_me').append($fileDownATag);
		// 콘텐츠로 인한 재 위치 조정
		$('.Messages_list').append($fromMeMsgContent);
		// 메시지 포지션 설정
		setChatMessagePosition('file');
		setChatFileMessagePosition();

		// 스크롤 최하단으로
		showRecentChatView();
		
		var key = "key"; //일단은 걍 보냄
		// 소켓으로 보낸다.
		var loginAdmin = '${me.mNick}';
		let allMessage = key+"#####"+renameFileName.replace(/@@@@/gi, '@@@@')+ '$$$$' + originFileName + "," + submitDate + "," + '디베뉴 매니저 '+loginAdmin;
		webSocket.send(allMessage);
		
		return submitDate;
	}
	// DB에 파일 메시지 저장하러 가는 함수
	function saveFileInfoMessage(renameFileName, submitDate){
		console.log('파일DB저장까진 오니..?..')
		//방번호, 파일원래이름, 리네임이름, 보낸시간, 보낸이 번호, 읽음여부
		var roomId = '${eachChatRoomId}';//임시로

		//원래 파일명 구하기			
		var fileValue = $("#file").val().split("\\");
		var originFileName = fileValue[fileValue.length-1]; // 파일명(마지막에 파잉명이 위치하니까)
		var renameFileName = renameFileName;
		var time = submitDate;
		var from_id = ${me.mId};
		var isRead = isReadT;
		console.log('파일 isRead는 잘 찍히나 : ' + isRead);
		var fMsgInform = {
				room_id:roomId,
				originFileName:originFileName,
				renameFileName:renameFileName,
				time:time,
				from_id:from_id,
				isRead:isRead
		}
		console.log(fMsgInform);
		$.ajax({
			url:"saveChatFileMessage.do",
			type:"get",
			data:fMsgInform,
			success:function(data){
				alert('DB에 보낸 파일 메시지를 저장 성공 : '+data)
				
				// 파일객체 초기화
			 	$('#file').val(null);
			},
			error:function(request,status,error){
			    alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
			},
			complete : function(data) {
	        	// 실패했어도 완료가 되었을 때 처리
	        	alert('DB에 보낸 파일 메시지를 저장하러가는 에이작스 끝남')
			}
		});
	}
	
	// 파일 메시지 받을시 위치 조정 함수
	function setChatFileMessagePosition(){
		 var contentWidth = $('.Layout-open').width();
         var scrollbarWidth = getScrollbarWidth();
		$('.fileDown_msg').each(function(index, item){
// 		    alert('파일메시지 길이 : ' + $(item).width())
	        $(item).css('left', contentWidth- scrollbarWidth- $(item).width() - $(item).find('svg').width() -8 -10);
		});
// 		alert('여기 들어와?')
	}
	
	
	// DB에 저장하거나 상대에게 넘겨졌을 때 날짜 형식으로 변환 위함(년/월/일/시/분/초/밀리초)
	function DateTransForm(date){
		var yy = date.getFullYear();
		var MM = date.getMonth()+1;
		var dd = date.getDate();
		var hh = date.getHours();
		var mm = date.getMinutes();
		var ss = date.getSeconds();
		var ms = date.getMilliseconds();
		
		var submitDate = "".concat(yy).concat("/").concat(MM).concat("/").concat(dd)
		.concat("/").concat(hh).concat("/").concat(mm).concat("/").concat(ss).concat("/")
		.concat(ms);

		return submitDate;
	}
	
	// 채팅에 어울리는 형식으로 날짜 변환( ex) AM 08:05 )
	function DateToString2(date) {
		var hours = date.getHours() < 10 ? "0" + date.getHours() : date
				.getHours();
		var min = date.getMinutes() < 10 ? "0" + date.getMinutes()
				: date.getMinutes();
		var ampm = "";
		if(hours<12){
			seperHour = "AM"
		}else{
			seperHour = "PM"
		}
		hours = hours % 12;
	  	hours = hours != 0 ? hours : 12;
// 		if(hours < 10){
// 			hours = '0'+hours;
// 		}
// 		if(min < 10){
// 			min = '0'+min;
// 		}
	  	return "".concat(hours).concat(":").concat(min).concat(" ").concat(seperHour);
	};
	
	// 텍스트 박스에서 엔터를 누르면
	function enter() {
		// 엔터를 누르면서 쉬프트를 누르지 않았을 때
		if (event.keyCode === 13&&!event.shiftKey) {
			// 서버로 메시지 전송
			sendMessage();
			// form에 의해 자동 submit을 막는다.
			return false;
			
		}
		return true;
	}

	$(function(){
		showRecentChatView();		
	})
  // 각 채팅창 입장 시 가장 최근 보낸 메시지 위치에 화면이 위치하게
  function showRecentChatView() {
      var firstScrollPosition = 0;
      $('.Messages').each(function(index, item){
    	  firstScrollPosition = $(item)[0].scrollHeight-$(item).innerHeight();
    	  $(item).scrollTop(firstScrollPosition);
      })
//       alert('스크롤탐 : ' + firstScrollPosition)
      $('.Messages').scroll();
  }
    </script>
</body>

</html>