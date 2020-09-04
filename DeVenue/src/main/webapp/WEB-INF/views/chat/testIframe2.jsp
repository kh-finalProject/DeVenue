<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.kh.DeVenue.util.model.vo.ChatRoom"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.kh.DeVenue.util.model.vo.Message"%>
<%@page import="com.kh.DeVenue.model.vo.Member"%>
<%@page import="com.kh.DeVenue.util.model.vo.ChatRel"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%
	// 불러오는 정보 중 부득이하게 자바코드를 쓸 필요가 있는 것만 스크립트로 선언해둠
	ArrayList<ChatRel> chatRels = (ArrayList)session.getAttribute("chatRels");
System.out.println(chatRels);
	ArrayList<ChatRoom> chatRooms = (ArrayList)session.getAttribute("chatRooms");
	System.out.println(chatRooms);
	ArrayList<Message> messages = (ArrayList)session.getAttribute("messages");
	System.out.println(messages);
	Member loginUser = (Member)session.getAttribute("loginUser");
	System.out.println(loginUser);
	Member otherUser = (Member)session.getAttribute("otherUser");
	System.out.println(otherUser);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<!-- 필요한 CDN -->
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
  body * {
    outline: none !important;
  }
	body{
	height: 500px;
         width: 300px;}
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

  /* 채팅창 메인 컨텐츠 영역의 pre에 대해 지정 ---------------------------------*/
  .Messenger_content_main pre::-webkit-scrollbar {
    width: 16px;
  }

  /* 막대 */
  .Messenger_content_main pre::-webkit-scrollbar-thumb {
    background-color: #86A8E7;
    border-radius: 10px;
    background-clip: padding-box;
    border: 2px solid transparent;
  }

  /* 나머지 공간 */
  .Messenger_content_main pre::-webkit-scrollbar-track {
    background: transparent;
  }

  /* 채팅방 목록 컨텐츠에서 지정 ---------------------------------*/
  .content_chatRoom_list::-webkit-scrollbar {
    width: 16px;
  }

  /* 막대 */
  .content_chatRoom_list::-webkit-scrollbar-thumb {
    background-color: #86A8E7;
    border-radius: 10px;
    background-clip: padding-box;
    border: 2px solid transparent;
  }

  /* 나머지 공간 */
  .content_chatRoom_list::-webkit-scrollbar-track {
    background: transparent;
  }

  

  /* 확대되기 전 아이콘 형태 --------------------------*/
  .chat_on {
    position: fixed;
    z-index: 100;
    width: 65px;
    height: 65px;
    right: 40px;
    bottom: 35px;
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
  }

  .chat_on_box p {
    font-size: 17px;
    margin-top: 10px;
    font-weight: 800;
    color: rgb(77, 75, 75);
    text-indent: 13px;
  }

  @media screen and (max-width: 768px) {}

  /*--------------------------------------------------------*/

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
/*     padding-top:10px; */
  }

  /* 채팅창 닫기 아이콘 */
  .chat_close_icon {
    cursor: pointer;
    color: #fff;
    font-size: 20px;
    position: absolute;
    right: 12px;
    top: 15px;
    z-index: 9;
  }

  /* 전체 레이아웃 관련--------------------------------------*/
  /* 채팅창 전체 색상을 그라데이션으로 줘봄(헤더만 했더니 너무 밝은 분위기가 나서) */
  #Smallchat .Messenger_messenger {
    background: #7F7FD5;
    background: -webkit-linear-gradient(to right, #91EAE4, #86A8E7, #7F7FD5);
    background: linear-gradient(to right, #91EAE4, #86A8E7, #7F7FD5);
  }

  #Smallchat .Layout {
    pointer-events: auto;
    box-sizing: content-box !important;
    z-index: 9999999;
    position: fixed;
/*     bottom: 20px; */
	top:0px;
    min-width: 50px;
    max-width: 300px;
    max-height: 30px;
    display: -webkit-box;
    display: -webkit-flex;
    display: -ms-flexbox;
    display: flex;
    -webkit-box-orient: vertical;
    -webkit-box-direction: normal;
    -webkit-flex-direction: column;
    -ms-flex-direction: column;
    flex-direction: column;
    -webkit-box-pack: end;
    -webkit-justify-content: flex-end;
    -ms-flex-pack: end;
    justify-content: flex-end;
    border-radius: 50px;
    box-shadow: 5px 0 20px 5px rgba(0, 0, 0, .1);
/*     -webkit-animation: appear .15s cubic-bezier(.25, .25, .5, 1.1); */
/*     animation: appear .15s cubic-bezier(.25, .25, .5, 1.1); */
/*     -webkit-animation-fill-mode: forwards; */
/*     animation-fill-mode: forwards; */
/*     opacity: 0; */
/*     -webkit-transition: right .1s cubic-bezier(.25, .25, .5, 1), bottom .1s cubic-bezier(.25, .25, .5, 1), min-width .2s cubic-bezier(.25, .25, .5, 1), max-width .2s cubic-bezier(.25, .25, .5, 1), min-height .2s cubic-bezier(.25, .25, .5, 1), max-height .2s cubic-bezier(.25, .25, .5, 1), border-radius 50ms cubic-bezier(.25, .25, .5, 1) .15s, background-color 50ms cubic-bezier(.25, .25, .5, 1) .15s, color 50ms cubic-bezier(.25, .25, .5, 1) .15s; */
/*     transition: right .1s cubic-bezier(.25, .25, .5, 1), bottom .1s cubic-bezier(.25, .25, .5, 1), min-width .2s cubic-bezier(.25, .25, .5, 1), max-width .2s cubic-bezier(.25, .25, .5, 1), min-height .2s cubic-bezier(.25, .25, .5, 1), max-height .2s cubic-bezier(.25, .25, .5, 1), border-radius 50ms cubic-bezier(.25, .25, .5, 1) .15s, background-color 50ms cubic-bezier(.25, .25, .5, 1) .15s, color 50ms cubic-bezier(.25, .25, .5, 1) .15s */
  }

  #Smallchat .Layout-right {
/*     right: 20px */
  }

  #Smallchat .Layout-open {
    overflow: hidden;
    min-width: 300px;
    max-width: 300px;
    height: 500px;
    max-height: 500px;
    border-radius: 10px;
    color: #fff;
/*     -webkit-transition: right .1s cubic-bezier(.25, .25, .5, 1), bottom .1s cubic-bezier(.25, .25, .5, 1.1), min-width .2s cubic-bezier(.25, .25, .5, 1.1), max-width .2s cubic-bezier(.25, .25, .5, 1.1), max-height .2s cubic-bezier(.25, .25, .5, 1.1), min-height .2s cubic-bezier(.25, .25, .5, 1.1), border-radius 0ms cubic-bezier(.25, .25, .5, 1.1), background-color 0ms cubic-bezier(.25, .25, .5, 1.1), color 0ms cubic-bezier(.25, .25, .5, 1.1); */
/*     transition: right .1s cubic-bezier(.25, .25, .5, 1), bottom .1s cubic-bezier(.25, .25, .5, 1.1), min-width .2s cubic-bezier(.25, .25, .5, 1.1), max-width .2s cubic-bezier(.25, .25, .5, 1.1), max-height .2s cubic-bezier(.25, .25, .5, 1.1), min-height .2s cubic-bezier(.25, .25, .5, 1.1), border-radius 0ms cubic-bezier(.25, .25, .5, 1.1), background-color 0ms cubic-bezier(.25, .25, .5, 1.1), color 0ms cubic-bezier(.25, .25, .5, 1.1); */
  }

  #Smallchat .Layout-expand {
    height: 500px;
    min-height: 500px;
/*     display: none; */
  }

  #Smallchat .Layout-mobile {
    bottom: 10px
  }

  #Smallchat .Layout-mobile.Layout-open {
/*     width: calc(100% - 20px); */
/*     min-width: calc(100% - 20px) */
  }

  #Smallchat .Layout-mobile.Layout-expand {
    bottom: 0;
    height: 100%;
    min-height: 100%;
    width: 100%;
    min-width: 100%;
    border-radius: 0 !important
  }

  @-webkit-keyframes appear {
    0% {
      opacity: 0;
      -webkit-transform: scale(0);
      transform: scale(0)
    }

    to {
      opacity: 1;
/*       -webkit-transform: scale(1); */
/*       transform: scale(1) */
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
/*       -webkit-transform: scale(1); */
/*       transform: scale(1) */
    }
  }

  /* --------------------------------------------- */

  /* 메신저(채팅방) 창-------------------------- */
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

  /* #Smallchat .Messenger_header,#Smallchat .Messenger_messenger {
 display:-webkit-box;
 display:-webkit-flex;
 display:-ms-flexbox;
 display:block
} */
  /* ------------------------------------------- */


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

  /* 헤더에 번개와 달 이미지 */
  .am_pm {
    margin-bottom: 7px;
    position:relative;
    left:-7px;
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
    font-size: 12px !important;
    line-height: 18px;
    font-weight: 400;
    overflow: hidden;
    white-space: nowrap;
    text-overflow: ellipsis;
    position:relative !important;
    left:32px !important;
    top:-25px !important;
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
    height: 450px;
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
    width: 194px;
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
    width: 180px;
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
    z-index: 10000;
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
/*     margin-left: 3%; */
/*     margin-right: 1%; */
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
    font-size: 5px !important;
    max-width: 90px;
    min-width: 50px;
  }

  /* 상대 메시지 시간 표시 */
  .msg_time_send {
    position: relative;
    top: 13px;
    text-align: left;
    margin-left: 5px;
    color: rgba(255, 255, 255, 0.5);
    font-size: 5px !important;
    min-width: 50px;
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
    font-size:13px;
  }

  /* 내 프로필 사진 */
  .message_from_me .img_cont_msg {
    height: 40px;
    width: 40px;
    min-width: 40px;
    background-color: black;
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
    background-color: darkmagenta;
    border: 2px solid white;
    border-radius: 50%;
    /* position: absolute;
    left:7px; */
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
    max-width: 240px;
    white-space:pre-wrap;
    word-break:break-all;
    font-size:12px;
  }

  /* 접속상태 여부를 체크 할까말까 */
  .online_icon {
    position: absolute;
    height: 15px;
    width: 15px;
    background-color: #4cd137;
    border-radius: 50%;
    bottom: 0.2em;
    right: 0.4em;
    border: 1.5px solid white;
  }

  .offline {
    background-color: #c23616 !important;
  }

  /* ----------------------------채팅 메인창 css ---------------------------- */
  /* 채팅 메인창 전체 레이아웃*/
  .Layout-chatMain {
    background: #7F7FD5;
    background: -webkit-linear-gradient(to right, #91EAE4, #86A8E7, #7F7FD5);
    background: linear-gradient(to right, #91EAE4, #86A8E7, #7F7FD5);
  }

  /* 채팅 메인창 헤더 */
  .Messenger_header_main {
    position: relative;
    /* position: relative; */
    /* top:-12px; */
    align-items: center;
    height: 40%;
    width: 100%;

    margin-top: 0px;
    /* position: absolute; */
    /* top:0px; */
    z-index: 3;
    text-indent: 15px;
  }

  /* 채팅 메인창 헤더 랩 */
  .Messenger_header_wrap_main {
    width: 100%;
    height: 40%;
    background-color: black;
    opacity: 0.4;
    position: absolute;
    z-index: 1;
  }

  /* 채팅 메인창 타이틀 */
  .Messenger_prompt_main {
    padding-top: 20px;
    padding-bottom: 10px;
    margin: 0px;
  }

  /* 채팅 메인창 설정 아이콘 전체 */
  .chat_option_icon_main {
    position: absolute;
    top: 16.5px;
    right: 39px;
    cursor: pointer;
    z-index: 999999;
  }

  /* 채팅 메인창 클로즈 아이콘 전체 */
  .chat_close_icon_main {
    position: absolute;
    right: 14px;
    top: 14px;
    cursor: pointer;
    color: #fff;
    font-size: 20px;
    z-index: 9;
  }

  /* 응답안됨/빠름 문구 */
  .Messenger_prompt2_main {
    font-size: 14px;
    padding-top: 5px;
    margin-bottom: 1px;
  }

  /* 응답 가능 혹은 즉답여부 문구 */
  .Messenger_prompt3_main {
    margin-top: 0px;
    margin-bottom: 0px;
    opacity: 0.8;
    max-width: 200px;
    overflow: hidden;
    white-space: nowrap;
    text-overflow: ellipsis;
  }

  /* 운영시간보기 문구 */
  .Messenger_prompt4_main {
    margin-top: 15px;
    position: relative;
    /* margin-bottom: 0px; */
  }

  /* 시계 아이콘 */
  .timeIcon {
    position: relative;
    top: -2px;
  }

  /* 운영시간 모달창 */
  .operTimeModal {
    position: absolute;
    top: 20px;
    left: 14px;
    background-color: black;
    opacity: 0.9;
    z-index: 9999;
    border-radius: 5px;
  }

  .operTimeModal * {
    background-color: black;
    color: white;
  }

  .operTimeModal pre {
    border: none;
    margin-bottom: 0px;
    text-align:center;
  }

  /* 번개(빠름) 아이콘 */
  .thunderIcon {
    position: relative;
    top: -1px;
    left: -3px;
  }
  /* zzz(운영시간 아님) 아이콘 */
  .zzzIcon {
    position: relative;
    top: -4px;
    left: -3px;
  }

  /* 채팅 메인창 메인 이미지 */
  .Messenger_header_mainImgView {
    background-color: rgb(141, 139, 139);
    opacity: 0.8;
    position: absolute;
    top: 55px;
    right: 16px;
    height: 80px;
    width: 80px;
    border-radius: 50%;
  }

  /* 야간 아이콘 */
  .nightIcon {
    margin-top: 10px;
    margin-left: 0px;
  }

  /* 주간 아이콘 */
  .morningIcon {
    margin-top: 10px;
    margin-left: 3px;
  }

  /* 관리자4명 프로필 이미지 */
  .during_oper * {
    border: 2px solid white;
    border-radius: 50%;
  }

  .operIcon1 {
    position: relative;
    top: -80px;
    left: 178px;
  }

  .operIcon2 {
    position: relative;
    top: -80px;
    left: 178px;
  }

  .operIcon3 {
    position: relative;
    top: -40px;
    left: 90px;
  }

  .operIcon4 {
    position: relative;
    top: -40px;
    left: 90px;
  }

  /* 채팅 메인창 안내콘텐트 */
  .Messenger_content_main {
    background-color: white;
    height: 100%;
  }

  .Messenger_content_main table {
    width: 93%;
    margin: auto;
    position: relative;
    top: -50px;
    z-index: 1;
    background-color: white;
    box-shadow: 0px 4px 4px 0px lightgray;
    border-radius: 10px;
    max-height: 255px;
    min-height: 180px;
  }

  /* 담당 관리자 이미지 */
  .charge_adminIcon {
    margin-top: 6px;
    margin-left: 6px;
    border-radius: 50%;
  }

  .Messenger_content_main pre {
    border: none;
    background-color: white;
    overflow-x: hidden;
    overflow-y: auto;
    max-height: 185px;
    margin-bottom: 0px;
  }

  /* 채팅 메인창 콘텐트영역 버튼 */
  .btn {
    height: 40px;
    width: 130px;
    padding: 20px;
    padding-top: 10px;
    font-size: 13px;
    background-color: #7F7FD5;
    color: white;
    border-radius: 30px;
    margin-bottom: 15px;
  }

  .btn img {
    margin-right: 5px;
    position: relative;
    top: -1px;
  }

  .btn:hover {
    color: white;
    box-shadow: 1px 1px 2px 2px lightgray;
  }

  .btn:active {
    color: white;
    box-shadow: 1px 1px 2px 2px lightgray;
  }

  .goToNewChatBtn {
    width: 120px;
    padding-left: 15px;
    margin-top:5px;
  }

  .goToOldChatBtn {
    width: 120px;
    padding-left: 15px;
    background-color: #65a09c;
    margin-top:5px;
  }

  /* 채팅 메인창 풋터 */
  /* .Messenger_footer_main {
    background-color: white;
    color: rgb(153, 152, 152);
    font-size: 12px;
    text-align: center;
    height: 100%;
    position: relative;
    bottom: 0px;
  } */

  /* 채팅 메인창 풋터 안 텍스트 */
  .Messenger_footer_text {
    position: absolute;
    left:100px;
    bottom: 10px;
    font-size: 12px;
    color: rgb(153, 152, 152);
  }

  /* 채팅 설정창 css ---------------------------------------------------------- */
  .Layout-chatOption {
    background: #7F7FD5;
    background: -webkit-linear-gradient(to right, #91EAE4, #86A8E7, #7F7FD5);
    background: linear-gradient(to right, #91EAE4, #86A8E7, #7F7FD5);
  }

  /* 채팅 설정창 헤더 */
  .Messenger_header_option {
    position: relative;
    /* position: relative; */
    /* top:-12px; */
    align-items: center;
    height: 35%;
    width: 100%;

    margin-top: 0px;
    /* position: absolute; */
    /* top:0px; */
    z-index: 3;
    padding: 15px;
    padding-top: 18px;
    padding-left: 15px;
  }

  /* 채팅 설정창 헤더 랩 */
  .Messenger_header_wrap_option {
    width: 100%;
    height: 35%;
    background-color: black;
    opacity: 0.4;
    position: absolute;
    z-index: 1;
  }
  /* 테이블로 구성함 */
  .option_header_content{
    position: relative;
    margin-top: 10px;
    left: -3px;
  }
  .option_header_content tr:first-of-type td:first-of-type{
    max-width: 200px;
    width:200px;
  }
  .option_header_content tr:first-of-type td:first-of-type div:last-of-type{
    font-size: 12px;
  }

  /* 채팅 설정창 타이틀 */
  .option_title{
    font-size: 12px;
    padding-left: 15px;
  }
  /* 채팅 헤더 타이틀 */
  .Messenger_prompt_option1{
    padding-top: 5px;
  }
  .Messenger_prompt_option2{
    font-size: 12px;
    font-weight: 300 !important;
  }
  .Messenger_prompt_option3{
    padding-top: 10px;
    overflow: hidden;
    white-space: nowrap;
    max-width: 300px;
    text-overflow: ellipsis;
  }

  .Messenger_content_option{
    position: relative;
    background-color: white;
    height: 100%;
    color: gray;
    padding: 15px;
  }

  /* 번역기 플러그인 css바꾸기 */
  #google_translate_element{
    position: relative;
    top:5px;
    left:-20px;
    z-index: 999999999;
    height: 35px;
    margin-bottom: 10px;
  }
  #google_translate_element div:first-of-type{
    border-radius: 5px;
    /* border: 1px solid lightgray; */
    border: none;
    padding: 8px;
    width:110px;
    position: relative;
    top:-10px;
  }
  .goog-te-gadget {
    border:none !important;
  }
  #google_translate_element div:first-of-type a span{
    padding-right: 10px;
  }
  #google_translate_element *{
    /* background-color: teal !important; */
  }
  .goog-te-gadget-simple{

  }
  #google_translate_element img{
    display: none;
  }
  
  /* 설정창 콘텐트 안의 항목 */
  .Messenger_content_option label{
      font-weight: 500;
  }
  .Messenger_content_option table td:first-of-type{
    width:330px;
  }

  /* 슬라이더(w3school예제) */
  .switch {
    position: relative;
    display: inline-block;
    width: 60px;
    height: 30px;
  }

  .switch input {
    opacity: 0;
    width: 0;
    height: 0;
  }

  .slider {
    position: absolute;
    cursor: pointer;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    background-color: #ccc;
    -webkit-transition: .4s;
    transition: .4s;
  }

  .slider:before {
    position: absolute;
    content: "";
    height: 23px;
    width: 23px;
    left: 4px;
    bottom: 4px;
    background-color: white;
    -webkit-transition: .4s;
    transition: .4s;
  }

  input:checked+.slider {
    background-color: #73b9b5;
  }

  input:focus+.slider {
    box-shadow: 0 0 1px #73b9b5;
  }

  input:checked+.slider:before {
    -webkit-transform: translateX(26px);
    -ms-transform: translateX(26px);
    transform: translateX(26px);
  }

  /* Rounded sliders */
  .slider.round {
    border-radius: 34px;
  }

  .slider.round:before {
    border-radius: 50%;
  }

  /* 채팅방 목록 창 -------------------------------------------------------------- */
  .Messenger_content_rooms_wrap{
    position: absolute;
    top:0px;
    left:0px;
    box-sizing: border-box;
    height: 100%;
    /* width: 100%; */
    /* height: transparent; */
    background-color: black;
    opacity: 0.3;
    z-index: 99;
  }

  /* 헤더와 콘텐트 사이 구분 영역 */
  .between_header_content{
    height: 3px;
    background-color: black;
    opacity: 0.5;
  }

  .content_chatRoom_list{
    position: absolute;
    top: 60px;/*헤더만큼 띄워 줘야 함*/
    left: 0px;
    /* background-color: red; */
    /* opacity: 0.5; */
    width: 100%;
    height: 100%;
    margin: 0px;
    padding: 0px;
    overflow-x: hidden;
    overflow-y: auto;
  }
  /* 채팅방 테이블 설정 */
  .content_chatRoom_list table{
      width:300px;
      /* border:1px solid red; */
  }
  /* 채팅방 테이블 td 설정 */
  .content_chatRoom_list table td{
      padding: 7px;
      padding-top: 10px;
      border:none;
  }
  /* 회원 한명마다 밑줄 */
  .content_chatRoom_list table tr:nth-of-type(2n) td
  , .content_chatRoom_list table tr:nth-of-type(1n) td:nth-of-type(1){
      border-bottom: 1.5px solid rgb(0, 0, 0, .1) !important;
  }
  /* 회원 프로필 이미지 */
  .content_chatRoom_list .memProfileIcon{
      border-radius: 50%;
      border: 1.5px solid white;
  }

  /* 회원 닉네임 영역 */
  .content_chatRoom_list label{
      /* 이거 설정해주면 줄였을때 프사는 없어짐 */
      max-width: 140px;
      overflow: hidden;
      white-space: nowrap;
      text-overflow: ellipsis;
      font-size: 13px;
      color: rgb(255, 255, 255, .9);
      font-weight: 500;
      margin-bottom: 0px;
      position: relative;
      top:8px;
  }

  /* 알림 */
  .content_chatRoom_list .alertRead{
      display: inline-block;
      width: 16px;
      height: 16px;
      padding: 0px 0px 2px 4.5px;
      background-color: red;
      border-radius: 50%;
      color:white;
      max-width: 20px;
      overflow: hidden;
      white-space: nowrap;
      text-overflow: ellipsis;
      position: relative;
      top:6px;
      font-size: 11px;
      font-weight:600;
  }
  /* 마지막 채팅내역 영역*/
  .lastChatContent{
      display: inline-block;
      max-width: 200px;
      overflow: hidden;
      white-space: nowrap;
      text-overflow: ellipsis;
      font-size: 12px;
      color: rgb(255, 255, 255, .7);
      position: relative;
      top:-10px;
      padding-bottom:1px;
  }
  /* 마지막 채팅내역 직접 */
  .lChatContent{
  	font-size: 12px !important;
  }
  /* 채팅시간 */
  .content_chatRoom_list .chatTime{
      color: rgb(255, 255, 255, .7);
      font-size: 10px;
      font-weight: 400;
      position: relative;
      top:-3.5px;
      right:0px;
  }

  /* 채팅방 목록풋터는 채팅방꺼 가져옴 */
  /* 채팅방 검색창 랩 */
  .Input-content-wrap2{
    position: relative;
    top:-3px;
    left: 40px;
    width: 194px;
    /* border: 1px solid lightgray; */
    border-radius: 3px;
    padding: 3px;
    background-color: black;
    opacity: 0.4;

  }
  .Input-search-wrap{
    width:250px !important;
    left: 26px !important;
    border-radius: 8px !important;
  }
  /* 채팅방 검색창 input태그 */
  .Input_search_field{

  }
  /* 메시지 입력하는 textarea */
  #Smallchat .Input-blank2 .Input_field2 {
    max-height: 60px;
  }
  /* textarea 설정 */
  #Smallchat .Input_field2 {
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

  
  /* 메세지 뷰창 색을 위해 한번 더 쌈 */
  .Messenger_content_wrap2 {
    position: relative;
    box-sizing: border-box;
    height: 100%;
    /* width: 100%; */
    /* height: transparent; */
    background-color: black;
    opacity: 0.3;
    margin: 0px;

  }
  /* 채팅방 클릭하면 나갈건지 해당 채팅으로 갈건지 묻는 영역 띄우기 */
  .popWrap{
    position: absolute; background-color: white; padding: 5px;
    border-radius: 3px;
    opacity: 0.8;
    right:10px;
    top:24px;
    z-index:9999999;
    color:black !important;
  }
  .popBtns{
    text-align: left;
    background-color: inherit; border:none; margin:5px;
    color:black;
    width: 100px;
    height: 30px;
    position: relative;
    left:0px;
    font-size: 13px !important;
  }
  .popBtns:hover{
    color: #647dac;
    /* color:goldenrod; */
  }
  .goToChatRoomBtn{
    
  }
  .deleteChatRoomBtn{

  }
  #emojis{
  	display:none;
  }
</style>

</head>

<body id="chatBody">
	<!-- 이모티콘 창 관련 -->
    <div id="emojis" style="position:absolute; top:0px; left:0px;">

    </div>
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
		$('#emojis').css('top', emojiPositionT-$('#emojis').height()/1.25);
		$('#emojis').css('left', emojiPositionL-$('#emojis').width()*2.1);
		$('#emojis').css('z-index', 99999999999999);
		$('#emojis').css('width', 240).css('height', 190);
	}
	
	// 이모지 선택창 스크롤 따라다니는 함수
	$(function(){
		$(document).scroll(function(){
			var emojiPositionT = $('.Input_button-emoji').offset().top;
			var emojiPositionL = $('.Input_button-emoji').offset().left;
			
			$('#emojis').css('top', emojiPositionT-$('#emojis').height()/1.25);
			$('#emojis').css('left', emojiPositionL-$('#emojis').width()*2);
			$('#emojis').css('width', 240).css('height', 190);
		})
		window.onclick = function(){
			var emojiPositionT = $('.Input_button-emoji').offset().top;
			var emojiPositionL = $('.Input_button-emoji').offset().left;
			
			$('#emojis').css('top', emojiPositionT-$('#emojis').height()/1.25);
			$('#emojis').css('left', emojiPositionL-$('#emojis').width()*2.1);
			$('#emojis').css('width', 240).css('height', 190);
		}
	})
	
	// 이모지 클릭하고 픽커가 발동되면 히든 인풋에 담아놨던 이미지를 텍스트에리아에 넣어주는
	$(function(){
		$('#emojis').click(function(){
			if($('#forEmojiAdd').val()!= null){
				var messageForEmoji  = $('#textMessage').val();
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
	    }
	    if (inputField.val().length >= 15 || (event.keyCode == 13&&event.shiftKey) || inputField.val().split('\n').length>=2){
	        inputField.css('height', 60);
	        $('.Input-blank').css('height', 100);
	        inputFileLabel.css('top', -50);
	        $('svg').css('position', 'relative').css('top', 14);
	    }
	}
</script>
  <!-- 채팅(레이아웃) -->
  <div class="container">
    <div class="row">
      <div id="Smallchat">
        <!-- 채팅 메인창 -->
        <div class="Layout Layout-open Layout-expand Layout-right Layout-chatMain"
          style="color: rgb(255, 255, 255);border-radius: 10px;">
          <!-- 채팅 메인창 헤더 -->
          <div class="Messenger_header_wrap_main"></div>
          <div class="Messenger_header_main">
            <h4 class="Messenger_prompt_main">디베뉴(DeVenue)</h4>
            <span class="chat_option_icon_main">
              <img class="option_move" onclick="goToOption();" src="resources/image/option.png" width="16px" height="16px">
            </span>
            <span class="chat_close_icon_main">
              <p class="fa" aria-hidden="true"><span class="notranslate">X</span></p>
            </span>
            <!-- 운영시간 이니면 문구 바꿔줘야함 -->
            <h6 class="Messenger_prompt2_main">
              응답 시간 빠름&nbsp;
              <!-- 운영시간 아니면 이거 안뜨게 해야함(스크립트로 처리) -->
<!--               <img class="thunderIcon" src="resources/image/thunder.png" width="20px" height="20px"> -->
<!--               <img class="zzzIcon" src="resources/image/zzz1.png" width="20px" height="20px"> -->
            </h6>
            <h6 class="Messenger_prompt3_main"></h6>
            <h6 class="Messenger_prompt4_main">
              운영시간 보기
              <img class="timeIcon" src="resources/image/clock3.png" width="12px" height="12px">
              <div class="operTimeModal">
              <!-- 운영시간 안내 모달을 위해 운영시간 계산 -->
              <c:set var="operDays" value=""/>
              	<c:if test="${chatSet.monday eq 'Y'}"><c:set var="operDays" value="${operDays='월, ' }"/></c:if>
              	<c:if test="${chatSet.tuesday eq 'Y'}"><c:set var="operDays" value="${operDays+='화, ' }"/></c:if>
              	<c:if test="${chatSet.wednesday eq 'Y'}"><c:set var="operDays" value="${operDays+='수, ' }"/></c:if>
              	<c:if test="${chatSet.thursday eq 'Y'}"><c:set var="operDays" value="${operDays+='목, ' }"/></c:if>
              	<c:if test="${chatSet.friday eq 'Y'}"><c:set var="operDays" value="${operDays+='금, ' }"/></c:if>
              	<c:if test="${chatSet.saturday eq 'Y'}"><c:set var="operDays" value="${operDays+='토, ' }"/></c:if>
              	<c:if test="${chatSet.sunday eq 'Y'}"><c:set var="operDays" value="${operDays+='일' }"/></c:if>
              	<c:set var="prevLastIndex" value="${fn:length(operDays)-2 }"/>
              	<c:set var="lastIndex" value="${fn:length(operDays) }"/>
              	<c:set var="last2Word" value="${fn:substring(operDays, prevLastIndex, lastIndex) }"/>
              	<c:if test="${last2Word eq ', '}">
              		<c:set var="operDays" value="${fn:substring(operDays, 0, prevLastIndex)}"/>
              	</c:if>
              	<c:if test="${operDays eq '' }">
              		<c:set var="operDays" value="운영 중단"/>
              	</c:if>
<pre>${operDays}
${chatSet.possibleTime_start } AM ~ ${chatSet.possibleTime_end } PM

Timezone: Asia/Seoul</pre>
              </div>
            </h6>
            <!-- 운영시간, 운영시간 아니냐에 따라 이미지 div 전환 -->
            <!-- <div class="Messenger_header_mainImgView"> -->
            <!-- <img class="nightIcon" src="resources/image/moon.png" width="55px" height="55px"> -->
            <!-- <img class="morningIcon" src="resources/image/sun.png" width="57px" height="57px"> -->
            <!-- </div> -->
            <div class="during_oper">
              <img class="operIcon1" src="resources/image/admin1.jpg" width="40px" height="40px">
              <img class="operIcon2" src="resources/image/admin1.jpg" width="40px" height="40px">
              <img class="operIcon3" src="resources/image/admin1.jpg" width="40px" height="40px">
              <img class="operIcon4" src="resources/image/admin1.jpg" width="40px" height="40px">
            </div>
          </div>
          <!-- 채팅 메인창 콘텐트 -->
          <div class="Messenger_content_main">
            <div class="Messenger_content_mainContent">
              <table>
                <tr>
                  <td style="vertical-align: baseline; padding-top: 3px;">
                    <img class="charge_adminIcon" src="resources/image/admin1.jpg" width="35px" height="35px">
                  </td>
                  <td>
<!-- 디베뉴에 방문해주셔서 감사합니다. -->
<!-- 궁금하신 점이 있으시면 질문해주세요 :) -->

<!-- 디베뉴 이용 절차, 프로젝트 견적 등이 -->
<!-- 궁금하신가요? -->
<!-- <a href="#">'자주 묻는 질문' 보러 가기 ▶</a> -->
                    <pre id="introCPre" style="display:none;">${chatSet.introContent }</pre>
                    <pre id="outTimeCPre" style="display:none;">${chatSet.outTimeContent }</pre>
                  </td>
                </tr>
                <tr>
                  <td colspan="2" align="center">
                    <!-- <button class="btn" id="toNewChat" onclick="goToNewChat()">
                          <img class="" src="resources/image/send.png" width="12px" height="12px">
                          새 대화 시작
                        </button> -->
                    <button class="goToOldChatBtn btn" id="toOldChat" onclick="goToOldChat()">
                      <img class="" src="resources/image/send.png" width="12px" height="12px">
                      이어서 대화
                    </button>
                    <button class="goToNewChatBtn btn" id="toNewChat" onclick="goToNewChat()">
                      <img class="" src="resources/image/send.png" width="12px" height="12px">
                      새 대화 시작
                    </button>
                  </td>
                </tr>
              </table>
              <div class="Messenger_footer_text">©HRtalkService</div>
            </div>
            <!-- 채팅 메인창 풋터 -->
            <!-- <div class="Messenger_footer_main"> -->
            <!-- </div> -->
          </div>

        </div>
        <!-- 채팅 설정창 -------------------------------------------------------------->
        <div class="Layout Layout-open Layout-expand Layout-right Layout-chatOption"
          style="color: rgb(255, 255, 255);border-radius: 10px;">
          <!-- 채팅 설정창 헤더 -->
          <div class="Messenger_header_wrap_option"></div>
          <div class="Messenger_header_option">
            <div class="option_header_top">
              <img class="backIcon" style="z-index: 999999;" id="goToMain" src="resources/image/back.png" width="10px" height="20px">
              <span class="option_title">정보 및 설정</span>
              <span class="chat_close_icon_main">
                <p class="fa" aria-hidden="true"><span class="notranslate">X</span></p>
              </span>
            </div>
            <table class="option_header_content" >
              <tr>
                <td>
                  <h4 class="Messenger_prompt_option1">디베뉴(DeVenue)</h4>
                  <div class="Messenger_prompt_option2">http://www.devenue.com</div>
                  <div class="Messenger_prompt_option3">
                    디베뉴는 기업의 IT프로젝트와<br> 
                    개발회사&프리랜서를 간편한 절차로 이어주는 회사입니다
                  </div>
                </td>
                <td>
                  <img class="comLogo" src="resources/image/comLogo2.jpg" width="75px" height="75px" style="border-radius: 50%;">
                </td>
              </tr>
            </table>
          </div>
          <!-- 채팅 설정창 콘텐트 -->
          <div class="Messenger_content_option">
            <p>옵션</p>
            <!-- 번역기 -->
            <div id="google_translate_element"></div>
            <script type="text/javascript">
              function googleTranslateElementInit() {
                new google.translate.TranslateElement(
                  {
                    gaTrack: true,  // Google 애널리틱스
                    gaId: 'UA-*******', // Google 애널리틱스 웹 속성 ID
                    pageLanguage: 'ko',
                    // includedLanguages: 'ko,en,ja,zh-CN,de,mn,ru,vi',
                    includedLanguages: 'ko,en,ja,zh-CN',
                    layout: google.translate.TranslateElement.InlineLayout.SIMPLE, autoDisplay: false,
                    multilanguagePage: true
                  },
                  'google_translate_element'
                );
              }
            </script>
            <script type="text/javascript" src="//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>
            <!-- 스위치 -->
            <table>
              <tr>
                <td>
                  <label for="isMessageTran">메시지 번역 표시</label>
                </td>
                <td>
                  <label class="switch">
                    <input type="checkbox" id="isMessageTran" checked>
                    <span class="slider round"></span>
                  </label>
                </td>
              </tr>
              <tr>
                <td>
                  <label for="isCompleteSave">종료된 상담 표시</label>
                </td>
                <td>
                  <label class="switch">
                    <input type="checkbox" id="isCompleteSave" checked>
                    <span class="slider round"></span>
                  </label>
                </td>
              </tr>
              <tr>
                <td>
                  <label for="isNoMessage">마케팅 메시지 수신 거부</label>
                </td>
                <td>
                  <label class="switch">
                    <input type="checkbox" id="isNoMessage">
                    <span class="slider round"></span>
                  </label>
                </td>
              </tr>
          </table>
          </div>
        </div>
        <!-- 채팅방 목록 -------------------------------------------------------->
        <div class="Layout Layout-open Layout-expand Layout-right Layout-chatRooms"
        style="color: rgb(255, 255, 255);border-radius: 10px;">
          <!-- 채팅방 목록 내부 -->
          <div class="Messenger_messenger">
            <!-- 채팅방 목록 헤더(채팅방과 동일) -->
            <div class="Messenger_header">
              <div class="Messenger_header_wrap"></div>
              <img style="position: absolute; z-index: 99999; top:20px; left:10px" class="backIcon" id="goToMain" src="resources/image/back.png" width="10px" height="22px">
              <h4 class="Messenger_prompt">디베뉴(DeVenue)&nbsp;&nbsp;
                <img class="am_pm" src="resources/image/moon2.png" width="13px"
                  height="13px"></h4>
              <h6 class="Messenger_prompt2"></h6>
              <span class="chat_close_icon">
                <p class="fa" aria-hidden="true"><span class="notranslate">X</span></p>
              </span>
            </div>
            <!-- 헤더와 콘텐트 사이 구분을 더 좋게 하기 위해 -->
            <div class="between_header_content"></div>
            <!-- 채팅방들 -->
            <div class="Messenger_content">
              <div class="Messenger_content_wrap2"></div>
                <!-- 채팅 리스트 뿌려지는 공간 -->
              <div class="content_chatRoom_list">
                <table border="0" id="chatRoom_list_area">
                	<c:if test="${!empty chatRooms && !empty messages}">
                	<fmt:formatNumber value="0" var="alertReadResult"/>
                	<c:forEach var="room" items="${chatRooms }" varStatus="status">
<!--                     하나의 채팅방 -->
                    <tr class="chatRoom">
                        <td rowspan="2"align="center">
<!--                             회원 프사 -->
                            <img class="memProfileIcon" src="resources/image/admin1.jpg" width="45px" height="45px">
                        </td>
                        <td colspan="3" align="left">
<!--                             회원 이름or닉네임 +- 회원/비회원 여부 + 안읽은 메시지 표시(수까지) -->
                            <label>${room.roomName }</label>
							 <fmt:formatNumber value="0" var="countUnRead"/>
                             <c:forEach var="i" begin="0" end="${messages.size()-1}" step="1">
	                            <c:if test="${room.roomId eq messages.get(i).roomId }">
		                            <c:if test="${messages.get(i).read == 'N' && messages.get(i).fromId != loginUser.mId}">
			                            <c:set var="countUnRead" value="${countUnRead + 1}"/>
		                            </c:if>
	                            </c:if>
                            </c:forEach>
                            <span class="alertRead">${countUnRead }</span>
                            <!-- 계속 안읽은 메시지 수를 쌓아서 저장하는 변수 -->
                            <c:set var="alertReadResult" value="${alertReadResult + countUnRead}"/>
                            <fmt:formatNumber value="0" var="countUnRead"/>
                        </td>
                        <td align="center" style="position:relative;text-align:right;padding-right:10px;">
                             <svg class="chatRoomsDot" width="1em" style="color:white;" height="1em" viewBox="0 0 16 16" class="bi bi-three-dots" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
							  <path fill-rule="evenodd" d="M3 9.5a1.5 1.5 0 1 1 0-3 1.5 1.5 0 0 1 0 3zm5 0a1.5 1.5 0 1 1 0-3 1.5 1.5 0 0 1 0 3zm5 0a1.5 1.5 0 1 1 0-3 1.5 1.5 0 0 1 0 3z"/>
							</svg>
							<!-- 채팅 방 나가까 채팅방으로 갈까 팝업과 룸아이디 저장 태그 -->
					       <div class="popWrap" style="z-index: 999999999;">
							<input type="hidden" class="roomIdHidden" value="${room.roomId }"/>
					         <button type="button" class="goToChatRoomBtn popBtns">
					           <svg width="1em" height="1em" style="position:relative; top:2px;" viewBox="0 0 16 16" class="bi bi-box-arrow-in-right" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
					             <path fill-rule="evenodd" d="M8.146 11.354a.5.5 0 0 1 0-.708L10.793 8 8.146 5.354a.5.5 0 1 1 .708-.708l3 3a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708 0z"/>
					             <path fill-rule="evenodd" d="M1 8a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9A.5.5 0 0 1 1 8z"/>
					             <path fill-rule="evenodd" d="M13.5 14.5A1.5 1.5 0 0 0 15 13V3a1.5 1.5 0 0 0-1.5-1.5h-8A1.5 1.5 0 0 0 4 3v1.5a.5.5 0 0 0 1 0V3a.5.5 0 0 1 .5-.5h8a.5.5 0 0 1 .5.5v10a.5.5 0 0 1-.5.5h-8A.5.5 0 0 1 5 13v-1.5a.5.5 0 0 0-1 0V13a1.5 1.5 0 0 0 1.5 1.5h8z"/>
					           </svg>&nbsp;
					           채팅방으로
					         </button>
					         <br>
					         <button type="button" class="deleteChatRoomBtn popBtns">
					           <svg width="1em" height="1em" style="position:relative; top:2px;" viewBox="0 0 16 16" class="bi bi-box-arrow-left" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
					             <path fill-rule="evenodd" d="M4.354 11.354a.5.5 0 0 0 0-.708L1.707 8l2.647-2.646a.5.5 0 1 0-.708-.708l-3 3a.5.5 0 0 0 0 .708l3 3a.5.5 0 0 0 .708 0z"/>
					             <path fill-rule="evenodd" d="M11.5 8a.5.5 0 0 0-.5-.5H2a.5.5 0 0 0 0 1h9a.5.5 0 0 0 .5-.5z"/>
					             <path fill-rule="evenodd" d="M14 13.5a1.5 1.5 0 0 0 1.5-1.5V4A1.5 1.5 0 0 0 14 2.5H7A1.5 1.5 0 0 0 5.5 4v1.5a.5.5 0 0 0 1 0V4a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 .5.5v8a.5.5 0 0 1-.5.5H7a.5.5 0 0 1-.5-.5v-1.5a.5.5 0 0 0-1 0V12A1.5 1.5 0 0 0 7 13.5h7z"/>
					           </svg>&nbsp;
					           나가기
					         </button>
					         </div>
                        </td>
                    </tr>
                    <tr>
<!--                       마지막 채팅 -->
                      <td colspan="3" align="left">
                        <span class="lastChatContent">
							<c:forEach var="i" begin="0" end="${messages.size()-1}" step="1">
	                            <c:if test="${room.roomId eq messages.get(i).roomId }">
	                            	<c:set var="lCContent" value="${messages.get(i).chatContent }"/>
	                            </c:if>
                            </c:forEach>
                            <label class="lChatContent">${lCContent}</label>
                        </span>
                      </td>
                      <td style="text-align:right;padding-right:10px;">
                   		<c:forEach var="i" begin="0" end="${messages.size()-1}" step="1">
                           <c:if test="${room.roomId eq messages.get(i).roomId }">
                           		<c:set var="oriLastTime" value="${messages.get(i).msgCreaetDate }"/>
	                           	<fmt:parseDate value="${fn:substring(messages.get(i).msgCreaetDate, 11, 16)}" var="lastChatTimeString" pattern="HH:mm"/>
								<fmt:formatDate value="${lastChatTimeString}" pattern="HH:mm" var="lastChatTime"/>
                           </c:if>
                        </c:forEach>
                        <!-- 마지막 채팅 시간 -->
                        <input type="hidden" class="oriLastTimeHidden" value="${oriLastTime }"/>
<%--                         <input type="hidden" class="LastTimeHidden" value="${oriLastTime }"/> --%>
                        <label class="chatTime">
                        ${lastChatTime }
                        </label>
                        <script>
                        	$(function(){
                        		// 채팅방 목록 안읽은 메시지에 관한 함수
                        		$('.alertRead').each(function(index, item){
                        			if($(item).html()=='0'){
                        				$(item).css('display', 'none');
                        			}else{
                        				$(item).css('display', 'inline-block');
                        			}
                        		});
                        		// 채팅방 목록 시간설정에 관한 함수
                        		$('.oriLastTimeHidden').each(function(index, item){
                        			
			                		// 채팅방 목록 마지막 메시지 보낸 날짜 띄우는 함수
	                        		// 오늘이면 시간, 오늘이 아니면 하루전은 어제, 이틀전부턴 날짜 ex)2020-08-22
	                        		// '2020-08-24 08:35:10.021417'의 형태로 날짜가 넘어옴(메시지는 타임스탬프형)
	                        		var oriLastDate = $(this).val();
									var todayYMD = getYYYYMMDD();
									var originLastYMD = oriLastDate.substring(0,10);
									var oriDate = Number(originLastYMD.split('-')[2]);
									var toDate = Number(todayYMD.split('-')[2]);
									var mDateGap = Math.abs(toDate-oriDate);
									console.log(originLastYMD)
									// 오늘과 동일한 날짜라면
	                        		if(originLastYMD == todayYMD){
	                        			// 시간만 뜨게 그대로 놔두자
	                        		// 오늘 이전이라면
	                        		}else{
	                        			// 어제라면
	                        			if(mDateGap == 1){
	                        				$(this).next('.chatTime').html('어제');
	                        			// 어제가 아니면 그냥 YMD 반환
	                        			}else{
	                        				$(this).next('.chatTime').html(originLastYMD);
	                        			}
	                        			
	                        		};
                        		});
                        	 	
                        	});
                        	function getYYYYMMDD(){
                        		var today = new Date();
                        		var Y = today.getFullYear();
                        		var M = today.getMonth() + 1;
                        		var D = today.getDate();

                        		if(String(M).length == 1){
                        			M = '0'+M;
                        		}
                        		if(String(D).length == 1){
                        			D = '0'+D;
                        		}
                        		var YMD = Y+"-"+M+"-"+D;
//                         	 	console.log('YMD : ' + YMD)
                        	 	
                        	 	return YMD;
                        	}
                        </script>
                      </td>
                    </tr>
                    </c:forEach>
                    </c:if>
                    <c:if test="${empty chatRooms }">
                    	채팅방 없뜸 이어서 채팅버튼 안보이게 해야 함
                    </c:if>
                </table>
              </div>
              <div style="background-color: black; opacity: 0.5; color:rgb(150, 148, 148); text-align: center;">
                <label style="position:relative; top: 8px; font-size: 12px; font-weight: 300 !important; ">채팅방을 찾아보세요</label>
              </div>
              <!-- 채팅방 메시지 입력 공간 -->
              <div class="Input Input-blank2">
                <div class="Input_wrap"></div>
                <!-- 메시지 입력창 -->
                <div class="Input-content-wrap2 Input-search-wrap">
                  <textarea class="Input_field2 Input_search_field" placeholder="   Search"></textarea>
                </div>
              </div>
            </div>
          </div>
        </div>
        <!-- 채팅방----------------------------------------------------------- -->
        <div class="Layout Layout-open Layout-expand Layout-right Layout-chatRoom"
          style="color: rgb(255, 255, 255);border-radius: 10px;">
          <!-- 채팅방 내부 -->
          <div class="Messenger_messenger">
            <!-- 채팅방 헤더 -->
            <div class="Messenger_header">
              <div class="Messenger_header_wrap"></div>
              <img style="position: absolute; z-index: 99999; top:20px; left:10px" class="backIcon" id="goToMain" src="resources/image/back.png" width="10px" height="22px">
              <h4 class="Messenger_prompt">디베뉴(DeVenue)&nbsp;&nbsp;
                <img class="am_pm" src="resources/image/moon2.png" width="13px"
                  height="13px"></h4>
              <h6 class="Messenger_prompt2">?? 후 상담이 재개됩니다</h6>
              <span class="chat_close_icon">
                <p class="fa" aria-hidden="true"><span class="notranslate">X</span></p>
              </span>
            </div>
            <!-- 채팅방 메시지 뷰 -->
            <div class="Messenger_content">
              <div class="Messages Messages2">
                <div class="Messenger_content_wrap"></div>
                <!-- 방도있고 메시지도 있어야 띄워줄 것임 -->
                <%if(chatRooms != null && messages != null && !chatRooms.isEmpty() && !messages.isEmpty()) {%>
                <%for(int i = 0; i < chatRooms.size(); i++){ %>
                <div class="Messages_list" style="display:none">
		          <!-- 하나의 채팅방에 주어질 채팅방 번호 -->
		          <input type="hidden" name="room_id" id="chatRoom_room_id"/>
		          <!-- 하나의 채팅방에 상대방 정보 담는 히든 태그들 -->
		          <input type="hidden" name="to_id" id="chatRoom_to_id"/>
		          <input type="hidden" name="userType" id="chatRoom_userType"/>
		          <input type="hidden" name="mEmail" id="chatRoom_mEmail"/>
		          <input type="hidden" name="mNick" id="chatRoom_mNick"/>
		          <input type="hidden" name="mName" id="chatRoom_mName"/>
		          <input type="hidden" name="is_ad" id="chatRoom_is_ad"/>
				 <%for(int j = 0; j < messages.size(); j++){ %>
				 	<%if(messages.get(j).getRoomId() == chatRooms.get(i).getRoomId()){ %>
				 		<%if(messages.get(j).getFromId() == loginUser.getmId()){ %>

		                    <%
		                    	// 날짜 변할 때 마다 구분선(오늘이 시작되면 오늘, 오늘 하루전이면 어제, 나머지는 2020-01-10 식으로)
		                    	String seperDate = "";
		                    	String msgDate = "";
		                    	String beforeDate = "";
		                    	if(j != 0){
			                    	msgDate = messages.get(j).getMsgCreaetDate().substring(0,10).replace("-", "/");
			                    	beforeDate = messages.get(j-1).getMsgCreaetDate().substring(0,10).replace("-", "/");
			                    	SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
			                    	String todayDate = sdf.format(new Date());
	
			                    	String[] msgDateArr = msgDate.split("\\/");
			                    	int mYear = Integer.valueOf(msgDateArr[0]);
			                    	int mMonth = Integer.valueOf(msgDateArr[1]);
			                    	int mDate = Integer.valueOf(msgDateArr[2]);
			                    	
			                    	String[] tDateArr = msgDate.split("\\/");
			                    	int tYear = Integer.valueOf(tDateArr[0]);
			                    	int tMonth = Integer.valueOf(tDateArr[1]);
			                    	int tDate = Integer.valueOf(tDateArr[2]);
		                    	
			                    	if(msgDate.equals(todayDate)){
			                    		seperDate = "오늘";
			                    	}else if(mYear==tYear && mMonth==tMonth && tDate-mDate==1){
			                    		seperDate = "어제";
			                    	}else{
			                    		seperDate = msgDate.replace("/", ".");
			                    	}
		                    	}else {
		                    		msgDate = messages.get(j).getMsgCreaetDate().substring(0,10).replace("-", "/");
		                    		System.out.println(msgDate);
			                    	SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
			                    	String todayDate = sdf.format(new Date());
	
			                    	String[] msgDateArr = msgDate.split("\\/");
			                    	int mYear = Integer.valueOf(msgDateArr[0]);
			                    	int mMonth = Integer.valueOf(msgDateArr[1]);
			                    	int mDate = Integer.valueOf(msgDateArr[2]);
			                    	
			                    	String[] tDateArr = msgDate.split("\\/");
			                    	int tYear = Integer.valueOf(tDateArr[0]);
			                    	int tMonth = Integer.valueOf(tDateArr[1]);
			                    	int tDate = Integer.valueOf(tDateArr[2]);
		                    	
			                    	if(msgDate.equals(todayDate)){
			                    		seperDate = "오늘";
			                    	}else if(mYear==tYear && mMonth==tMonth && tDate-mDate==1){
			                    		seperDate = "어제";
			                    	}else{
			                    		seperDate = msgDate.replace("/", ".");
			                    	}
		                    	}
		                    %>
				 		  <%if(j!=0){ %>
				 		  	<%if(!msgDate.equals(beforeDate)){%>
			                  <!-- 날짜 구분선 -->
			                  <div class="seperate_content">
			                    <div class="seperate_line"></div>
			                    <p class="seperate_date"><%=seperDate %></p>
			                    <div class="seperate_line"></div>
			                  </div>
		  	                <%}%>
		                  <%}%>
				 		  <%if(j==0){ %>
		                  	<!-- 날짜 구분선 -->
		                  <div class="seperate_content">
		                    <div class="seperate_line"></div>
		                    <p class="seperate_date"><%=seperDate %></p>
		                    <div class="seperate_line"></div>
		                  </div>
						  <%} %>
		                  <!-- 내가 보낸 메시지 + 프로필 -->
		                    <%if(messages.get(j).getOriginFileName() == null){ %>
			                	<div class="message_from_me msg_unit">
		                    	<div class="name_with_profile">
		                      <%
		                        String[] splitDate = messages.get(j).getMsgCreaetDate().split(" ");
			          			String time = splitDate[1];
			          			String HM = time.substring(0, 4);
			          			String[] times = HM.split(":");
			          			int hours = Integer.valueOf(times[0]);
			          			int minut = Integer.valueOf(times[1]);
			          			
			          			String ampm = "";
			          			String seperHour = "";
			          			if(hours<12){
			          				seperHour = "AM";
			          			}else{
			          				seperHour = "PM";
			          			}
			          			hours = hours % 12;
			          		  	hours = hours != 0 ? hours : 12;
								
			          		  	String hour = Integer.valueOf(hours).toString();
			          		  	String minu = Integer.valueOf(minut).toString();
			          		  	if(minu.length()<2){
			          		  		minu = "0"+minu;
			          		  	}
			          		  	
			          		  	String msgTime = "".concat(hour).concat(":").concat(minu).concat(" ").concat(seperHour);
		                      %>
		                      <span class="msg_time"><%=msgTime %></span>
		                      <%if(loginUser.getUserType().equals("UT1")||loginUser.getUserType().equals("UT2")){ %>
		                      	<span class="user_me">디베뉴 매니저 <%=loginUser.getmNick() %></span>
		                      <%} else{%>
		                      	<span class="user_me"><%=loginUser.getmNick() %> <%=loginUser.getmName() %></span>
		                      <%} %>
		                      <div class="img_cont_msg">
		                        <img src="resources/image/talk4.png" width="30" height="30">
		                      </div>
		                    </div>
		                    	<div class="msg_text_me"><%=messages.get(j).getChatContent() %></div>
		                    <%} else{%>
		                    	<div class="message_from_me msg_unit file_message">
		                    	<div class="name_with_profile">
		                      <%
		                        String[] splitDate = messages.get(j).getMsgCreaetDate().split(" ");
			          			String time = splitDate[1];
			          			String HM = time.substring(0, 4);
			          			String[] times = HM.split(":");
			          			int hours = Integer.valueOf(times[0]);
			          			int minut = Integer.valueOf(times[1]);
			          			
			          			String ampm = "";
			          			String seperHour = "";
			          			if(hours<12){
			          				seperHour = "AM";
			          			}else{
			          				seperHour = "PM";
			          			}
			          			hours = hours % 12;
			          		  	hours = hours != 0 ? hours : 12;
	
			          		  	String hour = Integer.valueOf(hours).toString();
			          		  	String minu = Integer.valueOf(minut).toString();
			          		  	if(minu.length()<2){
			          		  		minu = "0"+minu;
			          		  	}
			          		  	
			          		  	String msgTime = "".concat(hour).concat(":").concat(minu).concat(" ").concat(seperHour);
		                      %>
		                      <span class="msg_time"><%=msgTime %></span>
		                      <%if(loginUser.getUserType().equals("UT1")||loginUser.getUserType().equals("UT2")){ %>
		                      	<span class="user_me">디베뉴 매니저 <%=loginUser.getmNick() %></span>
		                      <%} else{%>
		                      	<span class="user_me"><%=loginUser.getmNick() %> <%=loginUser.getmName() %></span>
		                      <%} %>
		                      <div class="img_cont_msg">
		                        <img src="resources/image/talk4.png" width="30" height="30">
		                      </div>
		                    </div>
		                    	<div class="msg_text_me fileDown_msg"><div style="border-radius:3px;"><span style="left:5px;display:inline-block;position:relative;top:-7px;margin-right:8px"><%=messages.get(j).getOriginFileName() %></span><a style="display:inline-block; width:30px; height:30px;position:relative;left:3px;" href="${pageContext.servletContext.contextPath}/resources/chatFile/<%=messages.get(j).getRenameFileName() %>" download="<%=messages.get(j).getOriginFileName()%>"><svg width="2em" height="2em" style="position:relative; top:2px;" viewBox="0 0 16 16" class="bi bi-arrow-down-circle" fill="currentColor" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/><path fill-rule="evenodd" d="M4.646 7.646a.5.5 0 0 1 .708 0L8 10.293l2.646-2.647a.5.5 0 0 1 .708.708l-3 3a.5.5 0 0 1-.708 0l-3-3a.5.5 0 0 1 0-.708z"/><path fill-rule="evenodd" d="M8 4.5a.5.5 0 0 1 .5.5v5a.5.5 0 0 1-1 0V5a.5.5 0 0 1 .5-.5z"/></svg></a></div></div>
		                    <%} %>
		                  </div>
		                <%}else{ %>
		                  <!-- 상대가 보낸 메시지 + 프로필 -->
		                  <div class="message_from_other msg_unit">
		                    <div class="name_with_profile">
		                      <div class="img_cont_msg">
		                        <img src="resources/image/talk4.png" width="30" height="30">
		                      </div>
		                      <c:if test="${otherUser.userType =='UT1' || otherUser.userType =='UT2' }">
		                      	<span class="user_other">디베뉴 매니저 ${otherUser.mNick }</span>
		                      </c:if>
		                      <c:if test="${otherUser.userType !='UT1' && otherUser.userType !='UT2' }">
		                      	<span class="user_other">${otherUser.mNick }</span>
		                      </c:if>
		                      <%
		                        String[] splitDate = messages.get(j).getMsgCreaetDate().split(" ");
			          			String time = splitDate[1];
			          			String HM = time.substring(0, 4);
			          			String[] times = HM.split(":");
			          			int hours = Integer.valueOf(times[0]);
			          			int minut = Integer.valueOf(times[1]);
			          			
			          			String ampm = "";
			          			String seperHour = "";
			          			if(hours<12){
			          				seperHour = "AM";
			          			}else{
			          				seperHour = "PM";
			          			}
			          			hours = hours % 12;
			          		  	hours = hours != 0 ? hours : 12;
	
			          		  	String hour = Integer.valueOf(hours).toString();
			          		  	String minu = Integer.valueOf(minut).toString();
			          		  	if(minu.length()<2){
			          		  		minu = "0"+minu;
			          		  	}
			          		  	
			          		  	String msgTime = "".concat(hour).concat(":").concat(minu).concat(" ").concat(seperHour);
		                      %>
		                      <span class="msg_time_send"><%=msgTime %></span>
		                    </div>
		                    <%if(messages.get(j).getOriginFileName() == null){ %>
		                    	<div class="msg_text_other"><%=messages.get(j).getChatContent() %></div>
		                    <%} else{%>
		                    	<div class="msg_text_other"><div style="border-radius:3px;"><span style="display:inline-block;position:relative;top:-6px;margin-right:8px; left:5px;"><%=messages.get(j).getOriginFileName() %></span><a style="display:inline-block; width:30px; height:30px; position:relative; left:3px;" href="${pageContext.servletContext.contextPath}/resources/chatFile/<%=messages.get(j).getRenameFileName() %>" download="<%=messages.get(j).getOriginFileName()%>"><svg width="2em" height="2em" style="position:relative; top:2px;" viewBox="0 0 16 16" class="bi bi-arrow-down-circle" fill="currentColor" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/><path fill-rule="evenodd" d="M4.646 7.646a.5.5 0 0 1 .708 0L8 10.293l2.646-2.647a.5.5 0 0 1 .708.708l-3 3a.5.5 0 0 1-.708 0l-3-3a.5.5 0 0 1 0-.708z"/><path fill-rule="evenodd" d="M8 4.5a.5.5 0 0 1 .5.5v5a.5.5 0 0 1-1 0V5a.5.5 0 0 1 .5-.5z"/></svg></a></div></div>
		                    <%} %>
		                  </div>
                  		<%} %>
                  		<%} %>
                  	<!-- 여기까지가 룸번호랑 동일한 메시지 거르는 이프문 끝 -->
                 <%} %>
                 <!-- 여기까지가 메시지 반복 끝 -->
                </div>
                <%} %>
                <!-- 여기까지가 채팅방 하나씩에 대응하는 채팅창 -->
                <%} %>
              </div>
              <!-- 채팅방 메시지 입력 공간 -->
              <div class="Input Input-blank">
                <div class="Input_wrap"></div>
                <!-- 파일 첨부 버튼 -->
                <button class="Input_button Input_button-file">
                  <div class="Icon">
                  <form method="POST" ecntype="multipart/from-data" id="fileForm">
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
<!--                 <div style="position:absolute"> -->
<!--                 	<p>&#x1F601;</p> -->
<!--                 </div> -->
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
        <!--===============채팅 아이콘 상태===============-->
        <div class="chat_on">
          <span class="chat_on_icon">
            <i class="fa fa-comments" aria-hidden="true"></i>
            <!--
          [ARIA]
          - 장애를 가진 사용자가 웹 콘텐츠와 웹 어플리케이션(특히 JavaScript를 사용하여 개발한 경우)에 
          더 쉽게 접근할 수 있는 방법을 정의하는 여러 특성
          * aria-hidden 속성
          접근성 API(보조기기 접근 가능성) 차단 상태(보조기기가 무시할 수 있게)
          텍스트 들에게만 적용 되고 button, combobox 같은 ui 컴퍼넌트들은 적용이 되지 않음
        -->
          </span>
          <img src="resources/image/talk4.png" width="55" height="50" style="margin-left: -5px; margin-top: -5px;" />
          <c:if test="${!(alertReadResult eq 0)||alertReadResult eq null}">
	          <div class="allAlertRead" style="font-weight:600;font-size:14px; background-color:red;color:white;position:relative;position:absolute;top:0px;right:-1px;border-radius:50%;padding:7px;padding-bottom:1px;padding-top:1px;">
	        	${alertReadResult}
	          </div>
          </c:if>
        </div>
        <div class="chat_on_box">
          <p>채팅 상담</p>
        </div>
        <!--============================================-->
      </div>
    </div>
  </div>
  
  <!-- 주 관리자의 정보만 따로 빼기위한 구문 -->
  <c:forEach var="i" begin="0" end="${admins.size()-1 }" step="1">
	  <c:if test="${admins.get(i).userType eq 'UT1'}">
		<c:set var="mainAdmin" value="${admins.get(i) }"/>
	  </c:if>
  </c:forEach>
</body>
<script>
	// 거의 ui관련 스크립트(백단 가는 것도 있음)-------------------------------------------------------------

  // 로드시 채팅 아이콘 상태일 때 채팅창 와리가리 설정
  $(document).ready(function () {
    $(".chat_on").click(function () {
      // $('.Layout-chatRoom').show();
      $(".Layout-chatMain").show();//토글(toeoggle())해도되고
      // $('.Layout-chatOption').show()
      $(".chat_on").hide(300);
      $(".chat_on_box").hide(300);
    });

    $(".chat_close_icon, .chat_close_icon_main").click(function () {
      $(".Layout").hide();
      $(".chat_on").show(300);
      $('.chat_on_box').show(300);
    });
  });

  $(function () {
    // 입력하는 텍스트가 많아지면 창 키우고 아이콘들 위치도 변화
    var inputField = $('.Input_field')
    var inputFileLabel = $('.Input-file-hidden + label');
    inputField.keydown(function (event) {
      if (inputField.val().length < 15) {
        inputField.css('height', 29);
        $('.Input-blank').css('height', 70);
        inputFileLabel.css('top', -35);
        $('svg').css('position', 'relative').css('top', 0);
      }
      if (inputField.val().length >= 15 || (event.keyCode == 13&&event.shiftKey) || inputField.val().split('\n').length>=2){
        inputField.css('height', 60);
        $('.Input-blank').css('height', 100);
        inputFileLabel.css('top', -50);
        $('svg').css('position', 'relative').css('top', 14);
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
  // 스크롤 이동에따라 반투명 덮개가 같이 이동하도록함
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
    if (titleWidth > 90) {
      titleWidth = 90;
    } else if (titleWidth < 50) {
      titleWidth = 50;
    } else {

    }
    var timeWidth = textWidth($(item).find('.msg_time').text(), 'sans-serif')
    if (titleWidth > 90) {
      titleWidth = 90;
    } else if (titleWidth < 50) {
      titleWidth = 50;
    } else {

    }
    var profileWidth = Math.abs($('.img_cont_msg').width())
    var etcWidth = 10;


    var messageTextwidth = textWidth($(item).find('.msg_text_me').text(), 'sans-serif');
    var messageMinWidth = Number($('.msg_text_me').css('min-width').replace('px', ''));
    var messageMaxWidth = Number($('.msg_text_me').css('max-width').replace('px', ''));
    if (messageTextwidth > messageMaxWidth) {
      messageTextwidth = messageMaxWidth;
      messageTextwidth += 10 + 10 + 0;
    } else if (messageTextwidth < messageMinWidth) {
      messageTextwidth = messageMinWidth;
      messageTextwidth += 10 + 10 + 10;
    } else if (messageTextwidth < 110){ //중간단계 하나 해줌
    	messageTextwidth += 10 + 10 + 10;
	}else{
      messageTextwidth += 10 + 10 + 0;
    }

    var result = contentWidth - scrollbarWidth - titleWidth - timeWidth - profileWidth - etcWidth;
    var result2 = contentWidth - scrollbarWidth - messageTextwidth;

    console.log(textWidth($(item).find('.msg_text_me').text(), 'sans-serif'))

    $(item).children('.name_with_profile').css('left', result);
    $(item).children('.msg_text_me').css('left', result2);
  });
  }
  // 로딩시 메시지 위치조정 한번 실행
  $(function(){
	  setChatMessagePosition();
	// 파일 메시지를 위해서도 메시지 포지션 설정
	setChatMessagePosition('file');
	setChatFileMessagePosition();
  })
  
  //텍스트 길이 구해주는 함수
  function textWidth(text, fontProp) {
    var tag = document.createElement("div");
    tag.style.position = "absolute";
    tag.style.left = "-999em";
    tag.style.whiteSpace = "pre-wrap";
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

  //운영시간 모달창 와리가리
  $('.operTimeModal').hide();

  $(document).ready(function () {
    $(".Messenger_prompt4_main").click(function () {
      $(".operTimeModal").show();
    });
    $(document).click(function (event) {
      if (event.target != $('.Messenger_prompt4_main')[0]) {
        $('.operTimeModal').hide();
      }
    })
  });

  // 새 채팅방으로
  function goToNewChat() {
    $('.Layout-chatRoom').show();
    $('.Layout-chatOption').hide();
//     $(".Layout-chatMain").hide();
    showRecentChatView();

    // 기존의 채팅방(대화내역)이 있다면 물어봄
	if($('.chatRoom') != null){
		var isNewChat = confirm('새 채팅방을 열면 기존의 대화내역이 사라집니다.\n새 대화방을 여시겠습니까?');
		if(isNewChat){
			// 새 채팅을 열겠다고 하면 기존의 채팅방 삭제 후 재생성, 웹소켓 새로 연결
			// 기존의 채팅방이 없는 경우 새로 생성
			// (관리자와 매칭하면서)
			deleteAllChat();
		}else{
		    $(".Layout-chatMain").show();
		    $('.Layout-chatRoom').hide();
		    $('.Layout-chatOption').hide();
			return;
		}
	}
	
	// 오직 1:1을 위한 소켓 생성
	// 	webSocket = null;
	// 	var newWebSocket = new WebSocket(
	// 				"ws://localhost:8571/DeVenue/newChatClient");
	// 	webSocket = newWebSocket;
  }
  // 기존 채팅관련 모두 삭제
  function deleteAllChat(){
		var userId = ${loginUser.mId};
		$.ajax({
			url:"deleteAllChatRoom.do",
			type:"get",
			data:{userId:userId},
			success:function(data){
				alert('delete의 결과 : '+data);
				// 채팅방 이름을 위해 상대관리자 닉네이, 상대관리자 회원 번호가 필요함..
				// 처음엔 무조건 주관리자와 매칭되는 시스템으로 하자
				insertNewChat();
			},
			error:function(request,status,error){
			    alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
			},
			complete : function(data) {
	        	// 실패했어도 완료가 되었을 때 처리
	        	alert('채팅방 삭제하러가는 에이작스 끝남')
			}
		});
  }
  // 새 채팅방 생성
  function insertNewChat(){
	  var userId = ${loginUser.mId};
		var userNick = '${loginUser.mNick}';
		var mainAdminNo = ${mainAdmin.mId};
		var mainAdminNick = '${mainAdmin.mNick}';
		var insertInformForChatRoom = {
				userId:userId,
				userNick:userNick,
				mAdminNo:mainAdminNo,
				mAdminNick:mainAdminNick
		}
		$.ajax({
			url:"insertNewChatRoom.do",
			type:"get",
			data:insertInformForChatRoom,
			success:function(data){
				alert('생성된 방의 번호 : '+data)
				// 채팅방에 있는 히든 태그에 방번호/상대번호를 넣어놔서 표시
				$('#chatRoom_room_id').val(data);
				$('#chatRoom_to_id').val('${mainAdmin.mId}');
				$('#chatRoom_userType').val('${mainAdmin.userType}');
				$('#chatRoom_mEmail').val('${mainAdmin.mEmail}');
				$('#chatRoom_mNick').val('${mainAdmin.mNick}');
				$('#chatRoom_mName').val('${mainAdmin.mName}');
				$('#chatRoom_is_ad').val('${mainAdmin.is_ad}');
				
				// 기존에 채팅방에 있던 내역 싹 비워버리기(채팅방 들어갈때마다 하는 작업이니 함수로 따로 빼놓자)
				eraseMessages();
				
				// 오늘구분선 하나 넣어주기
				$('.Messages_list').html('<div class="seperate_content"><div class="seperate_line"></div><p class="seperate_date">오늘</p><div class="seperate_line"></div></div>');
				
				// 기존에 있던 채팅방 리스트 ui도 싹 밀어버리기(새 채팅방에서 뒤로가기 했을 때 그 채팅방이 채팅방 목록에 추가되게 하려면 이렇게 하면 안되겠지만..)
				$('#chatRoom_list_area').html('');
				
				// 새채팅방을 채팅방 리스트 ui에 추가해주기
				
			},
			error:function(request,status,error){
			    alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
			},
			complete : function(data) {
	        	// 실패했어도 완료가 되었을 때 처리
	        	alert('채팅방 생성하러가는 에이작스 끝남')
			}
		});
  }
  // 채팅방 들어갔을때 쌓여있는 메시지 등을 싹 지워주는 함수
	function eraseMessages(){
		$('.Messages_list').html('');
	}
  
  // 기존 채팅방 목록 으로
  function goToOldChat() {
    $('.Layout-chatRooms').show();
    showRecentChatView();
    $('.Layout-chatRoom').hide();
    // $(".Layout-chatMain").hide();
    $('.Layout-chatOption').hide();
  }

  // 옵션창으로
  function goToOption() {
    $('.Layout-chatOption').show();
    // $(".Layout-chatMain").hide();
    $('.Layout-chatRoom').hide();
  }

  // 번역기 중국어 선택시 공간 늘어나기
  $(function(){
    var ch  = $('#google_translate_element span');
    ch.each(function(item){
      $(item).click(function(){
        alert(item)
        if($(item).text() == '중국어(간체)'){
          $('#google_translate_element div:first-of-type').css('width', '130px');
        }
      })
    })
  })

  // 뒤로가기(메인화면으로) 함수
  $('.backIcon').click(function(){
    $(".Layout-chatMain").show();
    $('.Layout-chatOption').hide();
    $('.Layout-chatRoom').hide();
    $('.Layout-chatRooms').hide();
  })
  
  // 번역 처리 함수
  var allTag = $('.chatBody *');
  $(document).ready(function () {
    // googleTranslateElementInit
    //<span class="notranslate">X</span>
    $('#isMessageTran').change(function(){
      console.log($('#isMessageTran').prop('checked'))
      if($('#isMessageTran').prop('checked')==false){

		$('body').addClass("notranslate");
		$('html').removeClass();
		$('html').prop('lang', 'kr')
		$('iframe').css('display', 'none').css('height', "0px !important");
		// $('body *').addClass("notranslate");
		$('#google_translate_element *').click();
		
		// 번역기 툴바 안보이게
		

      }else if($('#isMessageTran').prop('checked')==true){
        // console.log(allTag)
        // $('body *').remove();
        // $('body').append(allTag[0]);
        // document.body.className = ""
        $('body').removeClass("notranslate");
        // $('body *').removeClass("notranslate");
        // location.reload()
      }
    })

  })

  // 서치창도 입력하는 텍스트가 많아지면 창 키우고 아이콘들 위치도 변화
  $(function () {
    var inputField2 = $('.Input_field2')
    inputField2.keydown(function (event) {
      if (inputField2.val().length < 15) {
        inputField2.css('height', 29);
        $('.Input-blank2').css('height', 70);
      }
      if (inputField2.val().length >= 15 || (event.keyCode == 13&&event.shiftkey)) {
        inputField2.css('height', 60);
        $('.Input-blank2').css('height', 100);
      }
    });
  })

  //채팅방 목록의 max 높이를 계산해주는
  $(function(){
    var wholeHeight = $('.Layout').height();
    var etcHeight = $('.Messenger_header_wrap').height() + $('.between_header_content').height() + $('.Input-blank2').height();
    var roomListHeight = wholeHeight - etcHeight;
    $('.content_chatRoom_list').css('max-height', roomListHeight);
  })

  //채팅방 목록의 랩 이동을 따로 정의
  $('.Messenger_content_wrap2').css('height', '100%');
  // 오버플로우 된 것 내부의 요소의 높이를 뽑아낼 수 없으니
  // 스크롤 이동에따라 덮개가 같이 이동하도록함(스크롤있는 대상에 스크롤되면 랩이 기준점에 따라 이동)
  $('.content_chatRoom_list').scroll(function () {
    $('.Messenger_content_wrap2').css('top', $('.content_chatRoom_list table').scrollTop());
  });

  // 각 채팅방 호버 효과
  $(function(){
    $('.chatRoom').mouseenter(function(){
      //  -webkit-linear-gradient(to right, #91EAE4, #86A8E7, #7F7FD5);
      var chatRoomHoverCss = {'background-color':'#647dac',  'opacity': '1'};
      $(this).css(chatRoomHoverCss);
      $(this).next('tr').css(chatRoomHoverCss);
//       $(this).find('.popWrap').css('opacity', '1').css('background-color','black');
    }).mouseleave(function(){
      var chatRoomHoverCss = {'background-color':'inherit',  'opacity': '1'};
      $(this).css(chatRoomHoverCss);
      $(this).next('tr').css(chatRoomHoverCss);
    })
    $('.chatRoom + tr').mouseenter(function(){
      //  -webkit-linear-gradient(to right, #91EAE4, #86A8E7, #7F7FD5);
      var chatRoomHoverCss = {'background-color':'#647dac',  'opacity': '1'};
      $(this).css(chatRoomHoverCss);
      $(this).prev('tr').css(chatRoomHoverCss);
    }).mouseleave(function(){
      var chatRoomHoverCss = {'background-color':'inherit',  'opacity': '1'};
      $(this).css(chatRoomHoverCss);
      $(this).prev('tr').css(chatRoomHoverCss);
    })
  })

  //채팅방 클릭하면 채팅방으로/나가기 버튼 모달 뜨게(일단은 그냥 ui적으로만)
  $('.popWrap').hide();
  $(function(){
    $('.chatRoomsDot').each(function(index, item){
      $(item).click(function(event){
        if($(this).next('.popWrap').css('display')=='none'){
        	$(this).next('.popWrap').show();
        }else if($(this).next('.popWrap').css('display')!='none'&&event.target!=$('.popWrap')){
        	$(this).next('.popWrap').hide();
        }
      });
    });
  });
  
  // 각 채팅창 입장 시 가장 최근 보낸 메시지 위치에 화면이 위치하게
  function showRecentChatView() {
      var firstScrollPosition = $('.Messages')[0].scrollHeight-$('.Messages').innerHeight();
      $('.Messages').scrollTop(firstScrollPosition);
  }
  
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
 
 // 채팅 설정창 (번역은 위에)
 $(function(){
	 // 마케팅 정보 수신 동의 항목이 변경  될 경우, DB가서 업데이트
	 $('#isNoMessage').change(function(){
		 var isAd = $(this).prop('checked');
		 if(isAd == true){
			 isAd = 'N';
		 }else{
			 isAd = 'Y';
		 }
		 var userId = ${loginUser.mId};
		 
		 $.ajax({
			url:"updateIsAdvertise.do",
			type:"get",
			data:{isAd:isAd, userId:userId},
			success:function(data){
				alert('마케팅 정보 수신 동의 여부  변경 성공 : ' + data);
			},
			error:function(request,status,error){
			    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		 });
	 });
	 
	 // 종료된 상담 표시를 해제하면 기존의 채팅은 볼 수 없음 - 결국 새 채팅방르로 가지므로 지워지기도 함
	 $('#isCompleteSave').change(function(){
		var isSaveCompleteChat = $(this).prop('checked'); 
		if(isSaveCompleteChat){
			$('#toOldChat').css('display', 'inline-block');
		}else{
			$('#toOldChat').css('display', 'none');
		}
	 });
 });
 
 // 채팅방 목록창 (DB관련)
 $(function(){
	 // 채팅방별로 나가기 버튼 클릭하면 해당 채팅방 삭제(당연 메시지도 삭제)
	 $('.deleteChatRoomBtn').each(function(index, item){
		 $(item).click(function(){
			 var isOutChatRoom = confirm('채팅방을 나가시겠습니까?');
			 if(isOutChatRoom){
				 var roomId = $(this).parent().find('.roomIdHidden').val();
				 var deleteTarget = $(this);
				 $.ajax({
					url:"deleteEachChatRoom.do",
					type:"get",
					data:{roomId:roomId},
					success:function(data){
						alert('개별 채팅방 삭제 성공 : ' + data);
						
						// DB에서 삭제한 채팅방은 화면에서도 지워야함
						deleteTarget.parents('.chatRoom').next('tr').remove();
						deleteTarget.parents('.chatRoom').remove();
					},
					error:function(request,status,error){
					    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					}
				 });
			 }else{
				 return;
			 }
		 });
	 });
	 
	 // 채탱방으로 버튼 클릭하면 해당 채팅방으로 이동
	 $('.goToChatRoomBtn').each(function(index, item){
		 $(item).click(function(){
			 // 창 전환
			 $('.Layout-chatRoom').show();
			 $('.Layout-chatOption').hide();
		     $(".Layout-chatMain").hide();
			
			 var roomId = $(item).parents('.chatRoom').find('.roomIdHidden').val();
		     var userId = ${loginUser.mId};
		     
		     // DB에 값 넣기
		     $.ajax({
		    	url:"getOtherUser.do",
		    	type:"get",
				data:{roomId:roomId, userId:userId},
		    	success:function(data){
		    		alert(data);
			     	// 띄운 채팅창목록 내부의 히든태그에 방번호와 상대 정보의 값을 넣어야 함
					$('#chatRoom_room_id').val(roomId);
					$('#chatRoom_to_id').val('${otherUser.mId}');
					$('#chatRoom_userType').val('${otherUser.userType}');
					$('#chatRoom_mEmail').val('${otherUser.mEmail}');
					$('#chatRoom_mNick').val('${otherUser.mNick}');
					$('#chatRoom_mName').val('${otherUser.mName}');
					$('#chatRoom_is_ad').val('${otherUser.is_ad}');
					
					// 해당 채팅방 띄움
					$('.Messages_list').each(function(index, item){
						$(item).css('display', 'none');
						var innerRoomId = $(item).find('#chatRoom_room_id').val();
						if(roomId == innerRoomId){
							$(item).css('display', 'block');
						}
					});
					
					// 가장 최근 메시지 보여지게 스크롤 이동
				    showRecentChatView();
		    	},
		    	error:function(request, status, error){
		    		alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		    	}
		     });

		     // 해당하는 데이터로 창을 띄움
			 
		 })
	 });
	 
	 // 채팅방 목록에서 검색으로 채팅방 찾기()
     $('.Input_search_field').keydown(function(event){
		if(event.keyCode == 13&&(event.keyCode == 13&&!event.shiftKey)){
		  if($(this).val().trim() == ''){
			  alert('검색어를 입력해 주세요.');
			  return;
		  }
		  var searchText = $(this).val();
		  var roomIds = '';
		  $('.roomIdHidden').each(function(index, item){
			  if(index != 0){
				  roomIds += ','+ $(item).val();
			  }else{
				  roomIds += $(item).val();
			  }
		  });
		  alert(roomIds);
		  $.ajax({
			 url:"searchChatRoom.do",
			 type:"get",
			 data:{searchText:searchText, roomIds:roomIds},
			 success:function(data){
				// 텍스트에리아 박스에 키다운 시켜서 창크기를 초기화하고 포커스 주기
				$('.Input_search_field').val('').keydown().focus();

				if(data=='no'){
					alert('검색 결과가 없습니다')					 
				 }else{
					 var resultRoomIds = data.replace('[','').replace(']','').split(', ');
					alert('채팅방 검색 성공 : ' + resultRoomIds[0]);
				 }
				
				// 검색 결과로 해탕 텍스트가 있는 채팅방 번호가 리셋될 것
				// 리셋된 번호에 매칭되는 채팅방 색을 바꿔주고 채팅방이 많을 경우 그곳으로 스크롤이 가게하자 => 이건 나중에 시간 나면 더 생각해보자..
				 $('.roomIdHidden').each(function(index, item){
					$(item).parents('.chatRoom').css('background-color', 'inherit');  
					$(item).parents('.chatRoom').next('tr').css('background-color', 'inherit');  
				  
					 for(var i = 0; i < resultRoomIds.length; i++){
						  if($(item).val() == resultRoomIds[i]){
							$(item).parents('.chatRoom').css('background-color', '#647dac');  
							$(item).parents('.chatRoom').next('tr').css('background-color', '#647dac');
						  }
					 }
				  });
			},
			error:function(request,status,error){
			    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		  });
		}
    });
 })
 
</script>
<script type="text/javascript">
// 채팅 백단관련 스크립트 : 처음 로딩 쪽 ------------------------------------------------------------------
$(function(){
	// 채팅을 위해 로그인한 회원의 채팅관련 정보(채팅 관계테이블에 따른 채팅방과 메시지들)를 죄다 불러옴
	// 관리자들에 대한 정보는 로그인할 시 세션에 담았음(admins)
	// 채팅 설정에 관한것도 불러와야함(운영시간, 관리자 프사 등등.. 프사부분은 호준이와 합의 후 진행하자 회원가입이니까)
	// 챗봇에 관한 것도 불러와야함(운영시간 아닐 경우 사용, 아직은 보류)
	var userId = ${loginUser.mId};
	$.ajax({
		url:"loadChatData.do",
		type:"get",
		data:{userId:userId},
		success:function(data){
			alert('챗데이터 로딩 성공 : ' + data);
			console.log('${ask.get(0).askTitle}');
			
			changeChatMainAllowOper();
			
		},
		error:function(request,status,error){
		    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	});

	// 계속 업데이트 받기 위해 로드시 외에도 1분에 한번씩 불러옴(지금은 테스트용으로 10초에 한번)
	var loadCount = 0;
	var intervalLoadChatData = setInterval(function(){
		var userId = ${loginUser.mId};
		$.ajax({
			url:"loadChatData.do",
			type:"get",
			data:{userId:userId},
			success:function(data){
				loadCount += 1;
				alert('챗데이터 로딩 성공 : ' + loadCount);
				
				changeChatMainAllowOper();
			},
			error:function(request,status,error){
			    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		});
	},100000);
});
// 운영시간에 따라 채팅 메인창 문구 바꿔주기
function changeChatMainAllowOper(){
	// 운영시간 여부에 따라 '운영시간 아님' '응답시간 빠름' 둘 중 하나를 넣어준다.
	// 안에 있는 번개 이미지는 운영시간 아닐 땐 없애준다
	var currentH = new Date().getHours();
	var currentM = new Date().getMinutes();
	
	var operStartTime = '${chatSet.possibleTime_start}'.split(':');
	var operSH = operStartTime[0];
	var operSM = operStartTime[1];
	var operEndTime = '${chatSet.possibleTime_end}'.split(':');
	var operEH = operEndTime[0];
	var operEM = operEndTime[1];
	
	var hourGap = operSH - currentH;
	var minuGap = operSM - currentM;
	
	var operDaysSplit = '${operDays}'.split(', ');
	for(var i = 0; i < operDaysSplit.length; i++){
		if(operDaysSplit[i]=='월'){operDaysSplit[i]=1};
		if(operDaysSplit[i]=='화'){operDaysSplit[i]=2};
		if(operDaysSplit[i]=='수'){operDaysSplit[i]=3};
		if(operDaysSplit[i]=='목'){operDaysSplit[i]=4};
		if(operDaysSplit[i]=='금'){operDaysSplit[i]=5};
		if(operDaysSplit[i]=='토'){operDaysSplit[i]=6};
		if(operDaysSplit[i]=='일'){operDaysSplit[i]=0};
	}
	
	var today = getInputDayLabel();
	var gap = null;
	var minGap = 7-1;
	for(var i = 0; i < operDaysSplit.length-1; i++){
		if(operDaysSplit[i]==today){
			minGap = 0;
			break;
		}else{
			gap = Math.abs(today-operDaysSplit[i]);
			if(minGap>gap){
				minGap = gap;
			}
		}
	}
	
	// 비운영 중인 경우
	if(currentH < operSH || currentH > operEH ||(currentH == operSH && currentM < operSM)||(currentH == operEH && currentM > operEH)){
		$('.Messenger_prompt2_main').html('운영시간 아님&nbsp;&nbsp;<img class="zzzIcon" src="resources/image/zzz1.png" width="20px" height="20px">')
		// 운영시간 시작까지 남은 시간을 계산, '~뒤 상담이 운영됩니다' 라고 띄워줌(하루 미만일땐 시간, 한시간 미만일땐 분 그외엔 일 )
		// 비운영 중이지만 운영일인 경우
		if(minGap == 0){
			// 한시간도 안남은 경우
			if(hourGap == 0){
				$('.Messenger_prompt3_main').text(Math.abs(minuGap) + '분 뒤 상담이 운영됩니다.');
				$('.Messenger_prompt2').text(Math.abs(minuGap) + '분 뒤 상담이 재개됩니다');
			}else{
				$('.Messenger_prompt3_main').text(Math.abs(hourGap) + '시간 뒤 상담이 운영됩니다.');
				$('.Messenger_prompt2').text(Math.abs(hourGap) + '시간 뒤 상담이 재개됩니다');
			}
		// 운영일이 남은 경우
		}else{
			$('.Messenger_prompt3_main').text(Math.abs(minGap) + '일 뒤 상담이 운영됩니다.');
			$('.Messenger_prompt2').text(Math.abs(minGap) + '일 뒤 상담이 재개됩니다');
		}
		$('#outTimeCPre').css('display', 'block');
		$('#introCPre').css('display', 'none');
	}else{//운영 중인 경우
		$('.Messenger_prompt2_main').html('응답시간 빠름&nbsp;&nbsp;<img class="thunderIcon" src="resources/image/thunder.png" width="20px" height="20px">')
		$('.Messenger_prompt3_main').html('보통 몇 분 내에 응답합니다.');
		$('.Messenger_prompt2').text('IT 아웃소싱 플랫폼 디베뉴입니다');
		$('#introCPre').css('display', 'block');
		$('#outTimeCPre').css('display', 'none');
	}
	
	// 운영시간 상관없이 낮/밤 나눠지는 경우(채팅창 아이콘)
	if(currentH < 5 || currentH > 18){
		$('.am_pm').prop('src', "resources/image/moon2.png");
	}else{
		$('.am_pm').prop('src', "resources/image/thunder.png");
	}
}
// 오늘 요일 알아내기
function getInputDayLabel() {
    
//     var week = new Array('일', '월', '화', '수', '목', '금', '토');
    
    var today = new Date().getDay();
//     var todayLabel = week[today];
    
    return today;
}


// 채팅 백단관련 스크립트: 웹소켓 통신 쪽------------------------------------------------------------------
		// 서버의 broadsocket의 서블릿으로 웹 소켓을 한다. => 채팅방 들어가면 열도록 바꾸자
			webSocket = new WebSocket(
				"ws://localhost:8999/DeVenue/newChatClient");
// 		var webSocket = new WebSocket("ws://localhost:8571/DeVenue/broadsocket");

		// 접속이 완료되면
		webSocket.onopen = function(message) {
			// 콘솔에 메시지를 남긴다.
// 			messageTextArea.value += "Server connect...\n";
			alert('웹소켓 오픈')
		};
		// 접속이 끝기는 경우는 브라우저를 닫는 경우이기 떄문에 이 이벤트는 의미가 없음.
		webSocket.onclose = function(message) {
			isReadT = '';
			alert('웹소켓 종료')
		};
		// 에러가 발생하면
		webSocket.onerror = function(message) {
			// 콘솔에 메시지를 남긴다.
			messageTextArea.value += "error...\n";
		};
		
		isReadT = '';
		// 서버로부터 메시지가 도착하면 콘솔 화면에 메시지를 남긴다.(리턴한 것)
		webSocket.onmessage = function(message) {
			alert('메세지 왔다')
			// 내가 메시지 보낼때 상대가 비접속시 반환되는 메시지 형태에 따라 저장할 읽음 여부 상태값 바꿈 
			var mContent = message.data.split(',');
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
			var messageTime = mContent[1];
			console.log(messageTime);
			var viewDate = DateToString2(messageTime);
			var otherId = 0;
			var otherNick = '';

			console.log('전체 메시지' + message.data);
			console.log('메시지 내용' + messageContent);
			console.log('메시지 시간' + messageTime);
			console.log('보일 메시지' + viewDate);
			// 삽입할 받은 메시지 영역
			$fromOtherMsgContent = $('<div class="message_from_other msg_unit"><div class="name_with_profile"><div class="img_cont_msg"><img src="resources/image/talk4.png" width="30" height="30"></div><span class="user_other">디베뉴 매니저 '+'${otherUser.mNick}'+'</span><span class="msg_time_send">'+viewDate+'</span></div><div class="msg_text_other">'+messageContent+'</div></div>');
			// 삽입
			$('.Messages_list').append($fromOtherMsgContent);
			// 메시지 포지션 설정
			setChatMessagePosition('notFile');
			// 스크롤 최하단으로
			showRecentChatView();
// 			messageTextArea.value += "(관리자) => " + messageContent + " " + viewDate + "\n";

			// 새로 생성된 채팅방을 append해주기 => 글쎄.. 어렵네
		};
		
		// 받은 날짜를 채팅에 어울리는 형식으로 변환( ex) AM 08:05 )
		function DateToString2(date) {
			var splitDate =	date.split('/');
			var hours = splitDate[3];
			var min = splitDate[4];
			
			var ampm = "";
			if(hours<12){
				seperHour = "AM"
			}else{
				seperHour = "PM"
			}
			hours = hours % 12;
		  	hours = hours != 0 ? hours : 12;

		  	return "".concat(hours).concat(":").concat(min).concat(" ").concat(seperHour);
		};
		
		// 서버로 일반 텍스트 메시지를 발송하는 함수
		// Send 버튼을 누르거나 텍스트 박스에서 엔터를 치면 실행
		function sendMessage() {
			// 텍스트 박스의 객체를 가져옴
			var message = document.getElementById("textMessage");
			var msgValue = message.value;
			// 채팅 메시지 입력하지 않거나 파일전송을 안하면 메시지 전송 안되게
			if($('#textMessage').val()=="" && $('#file').val()==""){
				alert('메시지를 입력해주세요');
				return;
			}
			let currentDateTime = new Date();
			var submitDate = DateTransForm(currentDateTime);
			let viewDate = DateToString(currentDateTime);
			let allMessage = message.value + "," + submitDate;
			console.log('보내는 메시지' + allMessage)
			// 삽입할 내가보낸 메시지 영역
			$fromMeMsgContent = $('<div class="message_from_me msg_unit"><div class="name_with_profile"><span class="msg_time">'+viewDate+'</span> <span class="user_me">${loginUser.getmNick()} ${loginUser.getmName()}</span><div class="img_cont_msg"><img src="resources/image/talk4.png" width="30" height="30"></div></div><div class="msg_text_me">'+message.value+'</div></div>');
			// 삽입
			$('.Messages_list').append($fromMeMsgContent);
			// 메시지 포지션 설정
			setChatMessagePosition();
			// 스크롤 최하단으로
			showRecentChatView();
			// 소켓으로 보낸다.
			webSocket.send(allMessage);
			// 텍스트 박스 추기화
			message.value = "";
			// 텍스트 박스에 키다운 시켜서 창크기를 초기화하고 포커스 주기
			$('.Input_field').keydown().focus();
			
			// DB에 보낸 메시지 저장하러 감
			if(isReadT == ''){
				var waitForServer = window.setInterval(function(){
					if(isReadT != ''){
						saveTextMessage(msgValue, submitDate);
						clearInterval(waitForServer);
					}					
				},1000)
			}else{
				saveTextMessage(msgValue, submitDate);
			}
			
			isReadT='';
		}
		// DB에 보낸 일반 텍스트 메시지를 저장하는 함수
		function saveTextMessage(msgValue, submitDate){
			var message = msgValue;
			var time = submitDate;
			var from_id = ${loginUser.mId};
			var room_id = Number($('#chatRoom_room_id').val());
			var isRead = isReadT; 
			var tMsgInform = {
					msg:message,
					time:time,
					from_id:from_id,
					room_id:room_id,
					isRead:isRead
			}
			console.log('읽었나'+isRead);
			$.ajax({
				url:"saveChatTextMessage.do",
				type:"get",
				data:tMsgInform,
				success:function(data){
					alert('DB에 보낸 일반 텍스트 메시지를 저장 성공 : '+data)
				},
				error:function(request,status,error){
				    alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
				},
				complete : function(data) {
		        	// 실패했어도 완료가 되었을 때 처리
		        	alert('DB에 보낸 일반 텍스트 메시지를 저장하러가는 에이작스 끝남')
				}
			});
		};
		
		// 서버로 보낼 파일 메시지를 발송하는 함수(파일을 선택하면 자동 발송)
		function uploadFile(){
			alert("에이작스 실행하러 왔다")
			
			var form = $('#fileForm')[0];
			var formData = new FormData(form);
			 // 코드로 동적으로 데이터 추가 가능.
//          formData.append("userId", "testUser!");

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
                  	// DB에 파일메시지 저장하러 감
         			if(isReadT == ''){
         				var waitForServer = window.setInterval(function(){
         					if(isReadT != ''){
         						saveFileInfoMessage(renameFileName, submitDate);
         						clearInterval(waitForServer);
         					}					
         				},1000)
         			}else{
         				saveFileInfoMessage(renameFileName, submitDate);
         			}
        			isReadT='';
        			console.log('파일DB저장이 끝나고..')
                 },
                 error:function(data){
                	 alert('에러' + data);
                 }
         	});
			 
		}
		
		// 파일을 전송하는 경우, 웹소켓 메시지로 파일 정보 및 다운로드 링크 전송
		function sendFileInfoMessage(renameFileName){
			let currentDateTime = new Date();
			var submitDate = DateTransForm(currentDateTime);
			let viewDate = DateToString(currentDateTime);
			
			//원래 파일명 구하기			
			var fileValue = $("#file").val().split("\\");
			var originFileName = fileValue[fileValue.length-1]; // 파일명(마지막에 파잉명이 위치하니까)

			// 삽입할 내가보낸 메시지 영역
			$fromMeMsgContent = $('<div class="message_from_me msg_unit file_message"><div class="name_with_profile"><span class="msg_time">'+viewDate+'</span> <span class="user_me">${loginUser.getmNick()} ${loginUser.getmName()}</span><div class="img_cont_msg"><img src="resources/image/talk4.png" width="30" height="30"></div></div><div class="msg_text_me fileDown_msg"></div></div>');
			$fileDownATag = $('<div style="border-radius:3px;"><span style="left:5px;display:inline-block;position:relative;top:-7px;margin-right:8px">'+originFileName+'</span><a style="display:inline-block; width:30px; height:30px;position:relative;left:3px;" href="${pageContext.servletContext.contextPath}/resources/chatFile/'+renameFileName+'" download="'+originFileName+'">'+'<svg width="2em" height="2em" style="position:relative; top:2px;" viewBox="0 0 16 16" class="bi bi-arrow-down-circle" fill="currentColor" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/><path fill-rule="evenodd" d="M4.646 7.646a.5.5 0 0 1 .708 0L8 10.293l2.646-2.647a.5.5 0 0 1 .708.708l-3 3a.5.5 0 0 1-.708 0l-3-3a.5.5 0 0 1 0-.708z"/><path fill-rule="evenodd" d="M8 4.5a.5.5 0 0 1 .5.5v5a.5.5 0 0 1-1 0V5a.5.5 0 0 1 .5-.5z"/></svg>'+'</a></div>');
			// 삽입
			$fromMeMsgContent.find('.msg_text_me').append($fileDownATag);
			// 콘텐츠로 인한 재 위치 조정
			$('.Messages_list').append($fromMeMsgContent);
			// 메시지 포지션 설정
			setChatMessagePosition('file');
			setChatFileMessagePosition();

			// 스크롤 최하단으로
			showRecentChatView();
			
			// 소켓으로 보낸다.
			let allMessage = renameFileName.replace(/\\/gi, '_')+ '$$$$' + originFileName + "," + submitDate;
			webSocket.send(allMessage);
			
			return submitDate;
		}
		// DB에 파일 메시지 저장하러 가는 함수
		function saveFileInfoMessage(renameFileName, submitDate){
			console.log('파일DB저장까진 오니..?..')
			//방번호, 파일원래이름, 리네임이름, 보낸시간, 보낸이 번호, 읽음여부
			var room_id = Number($('#chatRoom_room_id').val());
			//원래 파일명 구하기			
			var fileValue = $("#file").val().split("\\");
			var originFileName = fileValue[fileValue.length-1]; // 파일명(마지막에 파잉명이 위치하니까)
			var renameFileName = renameFileName;
			var time = submitDate;
			var from_id = ${loginUser.mId};
			var isRead = isReadT;
			console.log('파일 isRead는 잘 찍히나 : ' + isRead);
			var fMsgInform = {
					room_id:room_id,
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
			$('.fileDown_msg').each(function(index, item){
				var msgPosition = $(item).css('left');
				$(item).css('left', Number(msgPosition.replace('px', '')) - 30 - 8);
			});
			console.log('파일메시지 위치조정 되나')
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
		function DateToString(date) {
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
// 			if(hours < 10){
// 				hours = '0'+hours;
// 			}
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
	</script>
</html>