<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!doctype html>
<html class="no-js" lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>디베뉴 관리자 채팅관리2 - 채팅 설정</title>
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
        /* 채팅 설정 영역 --------------------------------------------------------------------------*/
        /* 전체 컨텐트 랩 */
        .content_chatOption_wrap{
            width: 100%;
            height:100%;
            padding: 25px;
            padding-top: 50px;
            /* background-color: lightslategrey; */
        }

        /* 채팅 설정 타이틀 */
        .chatOption_title{
            font-size: 22px;
            font-weight: 550;
            color: rgb(10,10,10);
            margin-left: 1%;
        }

        /* 설정 영역 */
        .content_chatOption{
            margin-top: 25px;
            width:80%;
            background-color: #343a40;
            border-radius: 3px;
            padding: 35px;
            align-items: center;
            margin-bottom: 100px;
        }

        /* 각 폼태그 영역 */
        form{
            padding: 25px;
            background-color: white;
            border-bottom-left-radius: 3px;
            border-bottom-right-radius: 3px;
            border-top-right-radius: 3px;
            /* border-radius: 3px; */
            position: relative;
        }

        /* 탭 - 탭선택 부분 */
        .nav-tabs *{
            font-weight: 550;
            color:rgb(56, 56, 65) !important;
        }
        .tabMenu{
            background-color: rgb(83, 83, 95);
        }
        /* 탭 - 내용부분 */
        .tab-content{
        
        }

        /* 각 설정 타이틀 */
        .content_chatOption label{
            font-size: 16px;
            color: rgb(10,10,10);
            margin-bottom: 15px;
            margin-top: 15px;
        }

        /* 채팅 기본 소개 메시지 영역*/
        .chatIntro_message{
            margin-bottom: 25px;
        }

        /* 채팅 불가능 메시지 영역 */
        .chatNotOper_message{
            margin-bottom: 25px;
        }

        /* 채팅 가능 요일/시간 영역 */
        .operDate{
            margin-bottom: 25px;
        }
        .operDate input[type="checkbox"]{
            width:13px;
            height: 13px;
            margin-left: 10px;
        }
        .operDate input[type="number"]{
            width:60px;
            height: 30px;
            padding: 3px;
            text-indent: 5px;
            margin-left: 5px;
            border: 1px solid gray;
            border-radius: 3px;
        }
        /* 운영 요일 영역*/
        .operDay{
            margin-bottom: 25px;
        }
        /* 운영 시간 영역 */
        .operTime{
            margin-bottom: 35px;
        }
        /* 운영시간 자세히 정하는 영역 */
        .seperTimeOption_area{
            margin-left:7px;
        }
        /* 운영 시간 내부 span */
        .operTime span{
            font-weight: 550;

        }
        /* 각 요일 라벨 */
        .dayLabel{
            margin-left:3px;
            font-size: 13px !important;
            color: rgb(10,10,10);
            margin-bottom: 10px !important;
            margin-top: 0px !important;
        }
        /* 24시간 라벨 */
        .timeLabel{
            margin-left:3px;
            font-size: 13px !important;
            color: rgb(10,10,10);
            margin-bottom: 10px !important;
            margin-top: 0px !important;
        }

        /* 설정하기 버튼 */
        .completeBtn{
            width:100% !important;
        }
        .completeBtn:hover{
            color: white !important;
        }
    </style>
</head>

<body>
 	<!-- 관리자 메뉴바 포함 -->
	<jsp:include page="../common/adminNavbar.jsp" />
    <!-- 여기서부터 콘텐츠 시작하면 됨 -->
    <div class="content_chatOption_wrap">
        <lable class="chatOption_title">채팅 설정</lable>
        <!-- 채팅 설정란 전체 -->
        <div class="content_chatOption">
            <!-- 탭 메뉴 -->
            <ul class="nav nav-tabs">
                <li class="nav-item">
                    <a class="nav-link active tabMenu" data-toggle="tab" href="#qwe">응답 메시지</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link tabMenu" data-toggle="tab" href="#asd">시간 설정</a>
                </li>
            </ul>
            <!-- 탭 공간 -->
            <div class="tab-content">
                <!-- 탭 내용 -->
                <div class="tab-pane fade show active" id="qwe">
                    <form action="#" method="post" id="chatOptionForm" onsubmit="return submitChatOption();">
                        <!-- 채팅 기본 소개 메시지 -->
                        <div class="chatIntro_message">
                            <label>채팅창 기본 소개 메시지</label>
                            <div  style="display:flex;">
	                            <div id="viewIntro" style="width:30%; margin-right:1%;">
	                            	<div style="text-align:center;margin-bottom:10px;margin-top: 5px;font-weight:600;">기존 문구</div>
	                            	<pre>${chatSet.introContent }</pre>
	                            </div>
	                            <div>
	                            	<div style="text-align:center;margin-bottom:10px;margin-top: 5px;font-weight:600;">새로 입력</div>
		                            <input type="hidden" name="introMessage">
		                            <div class="summernote">
		                            </div>
	                            </div>
                            </div>
                        </div>
                        <hr>
                        <!-- 채팅 불가능 안내 메시지 -->
                        <div class="chatNotOper_message">
                            <label>채팅창 불가능 안내 메시지</label>
                            <div  style="display:flex;">
	                            <div id="viewOutro" style="width:30%; margin-right:1%;">
	                            	<div style="text-align:center;margin-bottom:10px;margin-top: 5px;font-weight:600;">기존 문구</div>
	                            	<pre>${chatSet.outTimeContent }</pre>
	                            </div>
	                            <div>
	                            	<div style="text-align:center;margin-bottom:10px;margin-top: 5px;font-weight:600;">새로 입력</div>
		                           	<input type="hidden" name="notOperMessage">
	                            	<div class="summernote">
		                            </div>
	                            </div>
                            </div>
                        </div>
                        <button type="submit" class="btn btn-dark completeBtn">설정하기</button>
                    </form>
                </div>
                <div class="tab-pane fade" id="asd">
                    <form action="#" method="get" id="operTimeForm">
                        <!-- 경고 알림 양식 -->
                        <div class="alert alert-warning warnTimeAlert" role="alert" style="position: relative; z-index: 9999; left:0px; width: 100%;">
                            Warning 시작시간이 종료시간보다 큽니다.
                        </div>
                        <div class="alert alert-warning warnSubmitAlert" role="alert" style="position: relative; z-index: 999999; left:0px; width: 100%;">
                            Warning 모두 입력해야 합니다.(요일도 하나이상 선택)
                        </div>
                        
                        <!-- 채팅 가능 요일/시간 -->
                        <div class="operDate">
                            <div class="operDay">
                            	<!-- 요일별 값을 저장 -->
                            	<c:set var="mondayValue" value="${chatSet.monday }"/>
                            	<c:set var="tuesdayValue" value=",${chatSet.tuesday }"/>
                            	<c:set var="wednesdayValue" value=",${chatSet.wednesday }"/>
                            	<c:set var="thursdayValue" value=",${chatSet.thursday }"/>
                            	<c:set var="fridayValue" value=",${chatSet.friday }"/>
                            	<c:set var="saturdayValue" value=",${chatSet.saturday }"/>
                            	<c:set var="sundayValue" value=",${chatSet.sunday }"/>
                               	<c:set var="isDayValues" value="${mondayValue}${tuesdayValue}${wednesdayValue}${thursdayValue}${fridayValue}${saturdayValue}${sundayValue }"/>
                                <c:set var="isDayChecekd1" value="${fn:replace(isDayValues,'Y', 'checked') }"/>
                                <c:set var="isDayChecekd2" value="${fn:replace(isDayChecekd1,'N', ' ') }"/>
                                <c:set var="isDayChecekdSplit" value="${fn:split(isDayChecekd2,',') }"/>
                                
                                <label>채팅 상담 요일</label><br>
                                <input type="checkbox" class="allDayCheckbox" id="allDayCheckbox" value="all">
                                <label for="allDayCheckbox" class="timeLabel">모두 선택</label>
                                <br>
                                <input type="checkbox" id="monday" class="dayCheckbox" name="monday" ${isDayChecekdSplit[0] }>
                                <label for="monday" class="dayLabel">월</label>
                                <input type="checkbox" id="tuesday" class="dayCheckbox" name="tuesday" ${isDayChecekdSplit[1] }>
                                <label for="tuesday" class="dayLabel">화</label>
                                <input type="checkbox" id="wednesday" class="dayCheckbox" name="wednesday" ${isDayChecekdSplit[2] }>
                                <label for="wednesday" class="dayLabel">수</label>
                                <input type="checkbox" id="thursday" class="dayCheckbox" name="thursday" ${isDayChecekdSplit[3] }>
                                <label for="thursday" class="dayLabel">목</label>
                                <input type="checkbox" id="friday" class="dayCheckbox" name="friday" ${isDayChecekdSplit[4] }>
                                <label for="friday" class="dayLabel">금</label>
                                <input type="checkbox" id="saturday" class="dayCheckbox" name="saturday" ${isDayChecekdSplit[5] }>
                                <label for="saturday" class="dayLabel">토</label>
                                <input type="checkbox" id="sunday" class="dayCheckbox" name="sunday" ${isDayChecekdSplit[6] }>
                                <label for="sunday" class="dayLabel">일</label>
                            </div>
                            <div class="operTime">
                            	<!-- 운영시간에 필요한 변수  -->
                            	<c:set var="startTimeSplit" value="${fn:split(chatSet.possibleTime_start, ':') }"/>
                            	<c:set var="endTimeSplit" value="${fn:split(chatSet.possibleTime_end, ':') }"/>
                            	
                                <label>채팅 상담 시간</label><br>
                                <input type="checkbox" class="allTimeCheckbox" id="allTimeCheckbox" value="all">
                                <label for="allTimeCheckbox" class="timeLabel">24시간</label>
                                <br>
                                <div class="seperTimeOption_area">
                                    <span>시작: </span>
                                    <input type="number" id="startH" class="time operStartTimeS" step="1" min="0" max="24" placeholder="시" required value="${startTimeSplit[0] }" name="startH">
                                    <input type="number" id="startM" class="time operStartTimeM" step="1" min="0" max="60" placeholder="분" required value="${startTimeSplit[1] }" name="startM">
                                    &nbsp;
                                    <span>종료: </span>
                                    <input type="number" id="endH" class="time operEndTimeS" step="1" min="0" max="24" placeholder="시" required value="${endTimeSplit[0] }" name="endH">
                                    <input type="number" id="endM" class="time operEndTimeM" step="1" min="0" max="59" placeholder="분" required value="${endTimeSplit[1] }" name="endM">
                                </div>
                            </div>
                        </div>
                        <button type="button" class="btn btn-dark completeBtn" onclick="sendOperTime();">설정하기</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
	

    <!-- summernote JS : 텍스트 필드 플러그인 js !!!!!!!!!!!!!!!!!!!1
		============================================ -->

    <script src="${pageContext.servletContext.contextPath}/resources/js/summernote/summernote.min.js"></script>
    <script src="${pageContext.servletContext.contextPath}/resources/js/summernote/summernote-active.js"></script>


    <!-- 개인 스크립트 -->
    <script>
        //처음부터 탭 뜨게
        $(document).ready(function(){
            $('.active').click();
        });

        $(function(){
             // 모든 요일 체크
            $('#allDayCheckbox').click(function(){
            var isChecked = $('#allDayCheckbox').prop('checked');
                $('.dayCheckbox').each(function(index,item){
                    $(item).prop('checked', isChecked);
                })
            })

            // 24시간 체크했을 경우 시간 선택 안되게
            $('#allTimeCheckbox').click(function(){
                var is24 = $(this).prop('checked')
                if(is24 == true){
                    $('.time').prop('disabled', true).css('background', 'lightgray');
                    $('.warnTimeAlert').hide();
                    $('#startH').val(0);
                    $('#startM').val(0);
                    $('#endH').val(23);
                    $('#endM').val(59);
                    possibleSubmit = true;
                }else if(is24 == false){
                    $('.time').prop('disabled', false).css('background', 'inherit');
                    $('#startH').val('');
                    $('#startM').val('');
                    $('#endH').val('');
                    $('#endM').val('');
                    
                    if($('.operStartTimeS').val() > $('.operEndTimeS').val()){
                    $('.warnTimeAlert').show();
                    possibleSubmit = false;
                    }else if($('.operStartTimeS').val() == $('.operEndTimeS').val()){
                        if($('.operStartTimeM').val() > $('.operEndTimeM').val()){
                            $('.warnTimeAlert').show();
                            possibleSubmit = false;
                        }else{
                            $('.warnTimeAlert').hide();
                            possibleSubmit = true;
                        }
                    }else{
                        $('.warnTimeAlert').hide();
                        possibleSubmit = true;
                    }
                }
            })

            // 시작시간은 반드시 종료시간보다 작아야 함(서브밋 못하고 알람설정까지)
            $('.warnTimeAlert').hide();
            $('.seperTimeOption_area').change(function(){
                if($('.operStartTimeS').val() > $('.operEndTimeS').val()){
                    $('.warnTimeAlert').show();
                    possibleSubmit = false;
                }else if($('.operStartTimeS').val() == $('.operEndTimeS').val()){
                    if($('.operStartTimeM').val() > $('.operEndTimeM').val()){
                        $('.warnTimeAlert').show();
                        possibleSubmit = false;
                    }else{
                        $('.warnTimeAlert').hide();
                        possibleSubmit = true;
                    }
                }else{
                    $('.warnTimeAlert').hide();
                    possibleSubmit = true;
                }
            })
          
            // 요일 변화 감지하여 체크된게 없으면 경고
            $('.dayCheckbox').change(function(){
	            var dayCheckbox =  $('.dayCheckbox');
	            var countUnCheck = 0;
	            dayCheckbox.each(function (index, item) {
	                if($(item).prop('checked') == false){
	                    countUnCheck += 1;
	                }
	            });
	            
	            if(countUnCheck >= 7){
	            	$('.warnSubmitAlert').show();
	            }else{
	            	$('.warnSubmitAlert').hide();
	            }
            })
        })
        
        // summernote의 내용을 제출하기위해서 값을 옮김
        var possibleSubmit = true;
        function submitChatOption(){
            var hidden =  $('input[type=hidden]');
            hidden.each(function (index, item) {
                var sHTML = $(item).next().summernote('code');
                $(item).val(sHTML)
                // alert($(item).val());
            });

            return possibleSubmit;
        };

         
        // 채팅 시간설정 제출 관련 함수들-------------------------------------------
        $('.warnSubmitAlert').hide();
        function sendOperTime(){
//         	var possibleSubmit = true;
//         	// 요일이 체크 되었는지
//         	possibleSubmit = submitChatOption2();
            
//         	// 경고 알람이 떠있는 상태라면
//         	if(!possibleSubmit){
//         		$('.warnSubmitAlert').show();
//         		return;
//         	}
        	
//         	// 모든 시간이 기입 되었는지
//         	$('input[type=number]').each(function(index, item){
//         		if($(item).val()==''){
//         			$('.warnSubmitAlert').show();
//         			return;
//         		}
//         	})
        	
//         	// 시작시간보다 종료시간이 더 커서 알람이 떠있다면
//         	if($('.warnTimeAlert').css('display')!='none'){
//         		return;
//         	}
        	
        	// 넣어줄 value들 정리 후 객체로 한번에
        	
        	$('.dayCheckbox').each(function(index, item){
        		if($(item).prop('checked')==true){
        			$(item).val('Y');
        		}else{
        			$(item).val('N');
        		}
        	})
        	var monday = $('#monday').val()
        	var tuesday = $('#tuesday').val()
        	var wednesday = $('#wednesday').val()
        	var thursday = $('#thursday').val()
        	var friday = $('#friday').val()
        	var saturday = $('#saturday').val()
        	var sunday = $('#sunday').val()

        	var startH = $('#startH').val();
        	var startM = $('#startM').val();
        	var endH = $('#endH').val();
        	var endM = $('#endM').val();
        	
        	// 날짜는 시/분 앞에 0을 붙여야하는지 기억나지 않으므로 일단 분만 0붙여서 보내자
        	if(startM.length < 2){
        		startM = "0"+startM;
        	}
        	if(endM.length < 2){
        		endM = "0"+endM;
        	}
        	var startTime = startH + ":" + startM;
        	var endTime = endH + ":" + endM;
        	
        	var ChatSet ={
        			monday:monday,
        			tuesday:tuesday,
        			wednesday:wednesday,
        			thursday:thursday,
        			friday:friday,
        			saturday:saturday,
        			sunday:sunday,
        			possibleTime_start:startTime,
        			possibleTime_end:endTime
        	}
        	// ajax로 제출(다시 json객체로 ChatSet을 가져와서 각 위치에 값을 넣어주자)
        	$.ajax({
				url:"updateChatSet.do",
				type:"get",
				data:ChatSet,
				success:function(data){
					
				},
				error:function(request,status,error){
				    alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
				},
				complete : function(data) {
		        	// 실패했어도 완료가 되었을 때 처리
		        	alert('DB에 채팅 설정 넣어부는 에이작스 끝남')
				}
			});
        	
        }
     	// 요일이 모두 체크됐는지
        function CheckInputAll(){
            var dayCheckbox =  $('.dayCheckbox');
            var countUnCheck = 0;
            dayCheckbox.each(function (index, item) {
                if($(item).prop('checked') == false){
                    countUnCheck += 1;
                }
            });
            
            if(countUnCheck >= 7){
                return false;
            }else{
                return true;
            }
        }
     	// 요일을 하나이상 체크해야 제출(시간 설정)
        function submitChatOption2(){
            if(!CheckInputAll()){
                $('.warnSubmitAlert').show();
                return false;
            }else{
                $('.warnSubmitAlert').hide();
                return true;
            }
        };
        //---------------------------------------------------------------------
    </script>
</body>

</html>