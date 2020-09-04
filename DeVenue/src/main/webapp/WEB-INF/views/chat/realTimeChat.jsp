<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- summernote CSS : 텍스트 필드 플러그인 css !!!!!!!!!!!!!!!!!!!
    ============================================ -->
<link rel="stylesheet" href="${pageContext.servletContext.contextPath }/resources/css/summernote/summernote.css">


<!-- 개인적인 css 시작 -->
<style>
/* 채팅방 리스트 뿌려지는 영역 ------------------------------------------------------------------- */
/* 전체 영역 */
.content_chatRoom_list {
	/* background-color: maroon; */
	align-items: center;
	text-align: center;
	width: 80%;
}

/* 테이블 영역 */
.content_chatRoom_list table {
	width: 100%;
}

/* th */
.content_chatRoom_list table th {
	padding: 13px;
	/* background-color: mediumpurple; */
	text-indent: 5px;
	background-color: rgb(56, 56, 65);
	color: white;
}

/* 첫번째를 제외한 모든 tr */
.content_chatRoom_list table tr:not (:nth-of-type(2n-1) ):hover {
	background-color: rgb(227, 226, 238);
}

/* 모두 선택 라벨 */
.allMemCheck {
	margin: 0px;
	position: relative;
	top: 3px;
}

/* 각 td */
.content_chatRoom_list table td {
	padding: 13px;
	border: none;
}
/* 두세번째 td */
.content_chatRoom_list table tr td:nth-of-type(2),
	.content_chatRoom_list table tr td:nth-of-type(3) {
	padding-bottom: 0px;
}

/* 날짜부분 td */
.content_chatRoom_list table tr:nth-of-type(2n) td:last-of-type {
	width: 165px;
}

/* 회원 한명마다 밑줄 */
.content_chatRoom_list table tr:nth-of-type(3n) td,
	.content_chatRoom_list table tr:nth-of-type(1n) td:nth-of-type(1),
	.content_chatRoom_list table tr:nth-of-type(1n) td:nth-of-type(2) {
	border-bottom: 1px solid lightgray !important;
}

/* 체크 박스 */
.content_chatRoom_list input[type="checkBox"] {
	width: 15px;
	height: 15px;
	position: relative;
	top: 2px;
}
/* 모두선택 체크박스 */
#allMemCheck {
	position: relative;
	top: -1px;
}

/* 회원 프로필 이미지 */
.content_chatRoom_list .memProfileIcon {
	border-radius: 50%;
}

/* 회원 닉네임 영역 */
.content_chatRoom_list label {
	/* 이거 설정해주면 줄였을때 프사는 없어짐 */
	max-width: 80%;
	overflow: hidden;
	white-space: nowrap;
	text-overflow: ellipsis;
}

/* 알림 */
.content_chatRoom_list .alertRead {
	display: inline-block;
	width: 20px;
	height: 20px;
	padding: 0px 0px 0px 6px;
	background-color: red;
	border-radius: 50%;
	color: white;
	max-width: 20px;
	overflow: hidden;
	white-space: nowrap;
	text-overflow: ellipsis;
	position: relative;
	top: -7px;
}
/* 마지막 채팅내역 */
.lastChatContent {
	display: inline-block;
	max-width: 90%;
	overflow: hidden;
	white-space: nowrap;
	text-overflow: ellipsis;
}
/* 채팅시간 */
.content_chatRoom_list .chatTime {
	color: gray;
	font-size: 14px;
	font-weight: 500;
}

/* 페이지네이션 ----------------------------------*/
/* 전체 영역 */
.pagination {
	color: black !important;
}
</style>
</head>
<body>
	<jsp:include page="../common/adminNavbar.jsp" />
	<!-- 여기서부터 콘텐츠 시작하면 됨 -->
	<div class="content_chatList">
		<lable class="chatList_title">실시간 생성 리스트</lable>

		<!-- 채팅 리스트 뿌려지는 공간 -->
		<div class="content_chatRoom_list">
			<table>
				<tr align="center">
					<th style="text-align: center;"><input type="checkbox" id="allMemCheck"> <label for="allMemCheck" class="allMemCheck">모두 선택</label></th>
					<th colspan="4" style="text-align: center;">회원별 채팅방</th>
					<th style="text-align: right;">
						<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#marketing_message_modal">선택 전송</button>
					</th>
				</tr>
				<!-- 하나의 채팅방 -->
				<tr class="chatRoom">
					<td rowspan="2" align="center">
						<!-- 회원별 채팅방 체크 --> <input type="checkbox" class="memCheck">
					</td>
					<td rowspan="2" align="center">
						<!-- 회원 프사 --> <img class="memProfileIcon" src="img/admin1.jpg" width="60px" height="60px">
					</td>
					<td colspan="3" align="left">
						<!-- 회원 이름or닉네임 +- 회원/비회원 여부 + 안읽은 메시지 표시(수까지)--> <label>김회원[회원]</label> <span class="alertRead">5</span>
					</td>
					<td align="center">
						<!-- 마지막 채팅 날짜 및 시간(ex) 2020-08-01 14:00) --> <label class="chatTime">2020-08-01 14:00</label>
					</td>
				</tr>
				<tr class="relTr chatRoom">
					<!-- 마지막 채팅 -->
					<td colspan="3" align="left"><span class="lastChatContent"> 이것은 회원이 마지막으로 보냈던 채팅이다아sdassssssssdsad앙아아아앙 </span></td>
					<!-- 그냥 줄 맞추기 위해 남겨놓은거 -->
					<td></td>
				</tr>
				
			</table>
			<!-- 페이지네이션 -->
			<nav aria-label="Page navigation example">
				<ul class="pagination">
					<li class="page-item"><a class="page-link" href="#" aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
					</a></li>
					<li class="page-item"><a class="page-link" href="#">1</a></li>
					<li class="page-item"><a class="page-link" href="#">2</a></li>
					<li class="page-item"><a class="page-link" href="#">3</a></li>
					<li class="page-item"><a class="page-link" href="#" aria-label="Next"> <span aria-hidden="true">&raquo;</span>
					</a></li>
				</ul>
			</nav>
		</div>
	</div>

	<!-- 유저가 접속할 때마다 이 템플릿으로 채팅창을 생성한다. -->
	<div class="template" style="display: none; margin-left: 200px">
		<form>
			<!-- 메시지 텍스트 박스 -->
			<input type="text" class="message" onkeydown="if(event.keyCode === 13) return false;">
			<!-- 전송 버튼 -->
			<input value="Send" type="button" class="sendBtn">
		</form>
		<br />
		<!-- 서버와 메시지를 주고 받는 콘솔 텍스트 영역 -->
		<textarea rows="10" cols="50" class="console" disabled="disabled"></textarea>
		<div id="downArea" style="width: 100px; height: 100px; background-color: gray">
			<a href="/DeVenue/resources/chatFile/20200820185614.profile-bg.jpg" download="profile-bg.jpg">다운로드</a>
		</div>
	</div>

	<!-- 관리자 메뉴바에서 영역을 마무리 하지 않았기 때문에(감싸주기 위해) 여기서 마무리 -->
	</div>
	</div>


	<!-- summernote JS : 텍스트 필드 플러그인 js !!!!!!!!!!!!!!!!!!!1
    ============================================ -->
	<script src="${pageContext.servletContext.contextPath }/resources/js/summernote/summernote.min.js"></script>
	<script src="${pageContext.servletContext.contextPath }/resources/js/summernote/summernote-active.js"></script>


	<!-- 개인 스크립트 ------------------------------------------------------------------------->
	<script>
        // 모두선택 체크박스
        $('#allMemCheck').click(function(){
            var isChecked = $('#allMemCheck').prop('checked');
                $('.memCheck').each(function(index,item){
                    $(item).prop('checked', isChecked);
                })
        })
        // 선택한 회원의 회원번호를 모아야함
        // 해당 회원들에게 단체메시지 전송(모달창에서)
        function sendGroupMessage(){
            
        }

        $(function(){
            // 체크박스 해당 td 눌러도 체크되게
            $('td:first-of-type').each(function(index, item){
            	$(item).click(function(){
	            	var checkbox = $(item).children('input[type=checkbox]');
            		var isChecked = checkbox.prop('checked');
            		if(isChecked){
            			checkbox.prop('checked', false);
            		}else{
            			checkbox.prop('checked', true);
            		}
            	});
            })
            // 각 tr(채팅방) 클릭하면 새 채팅방 뜨게
            $('.chatRoom').each(function(index, item){
            	$(item).find('td:not(:first-of-type)').click(function(){
            		window.open('adminChatRoom.do', "PopupWin", "width=1000,height=490");
            	});
            });

            // 한 tr을 호버하면 다음 tr(같은 영역의)도 호버라고 생각하게
            $('tr').hover(function(){
            	if($(this).hasClass('relTr')){
            		$(this).css('background', 'rgb(227, 226, 238)');
                    $(this).prev('tr').css('background', 'rgb(227, 226, 238)');
            	}else{
	            	$(this).css('background', 'rgb(227, 226, 238)');
	                $(this).next('.relTr').css('background', 'rgb(227, 226, 238)');
            	}
            }).mouseleave(function(){
            	if($(this).hasClass('relTr')){
            		$(this).css('background', 'white');
                    $(this).prev('tr').css('background', 'white');
            	}else{
	            	$(this).css('background', 'white');
	                $(this).next('.relTr').css('background', 'white');
            	}
            })


        });
        
    </script>

	<!-- 소스를 간단하게 하기 위하 Jquery를 사용했습니다. -->
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

	<script type="text/javascript">
		var webSocket;
		// 서버의 admin의 서블릿으로 웹 소켓을 한다.
		if(${loginUser.userType == "UT1"}){
			webSocket = new WebSocket(
			"ws://localhost:8999/DeVenue/mainAdmin");
	
			alert('주관리자 웹소켓 전송')
	
		}else{
// 			webSocket = new WebSocket(
// 					"ws://localhost:8571/DeVenue/admin");
			// 일단은 서브관리자들도 주관리자 걸로
			webSocket = new WebSocket(
			"ws://localhost:8999/DeVenue/mainAdmin");
		}
		// 운영자에서의 open, close, error는 의미가 없어서 형태만 선언
		webSocket.onopen = function(message) {
			alert()
		};
		webSocket.onclose = function(message) {
			alert('서버 닫힘')
		};
		webSocket.onerror = function(message) {
		};
		
		// 서버로 부터 메시지가 오면
		webSocket.onmessage = function(message) {
			console.log('수신 message.data:'+message.data);
			console.log(typeof(message.data))

				// 메시지의 구조는 JSON 형태로 만들었다.
// 				if(typeof(message.data)=="JSON"){
					let node = JSON.parse(message.data);
// 				}else{
// 					console.log('ddd')
// 				}
				// 메시지의 status는 유저의 접속 형태이다.
				// visit은 유저가 접속했을 때 알리는 메시지다.
// 				if (node.status === "visit") {
					// 위 템플릿 div를 취득한다.
					let form = $(".template").html();
					// div를 감싸고 속성 data-key에 unique키를 넣는다.
					form = $("<div class='float-left' style='margin-left:200px'></div>").attr("data-key",
							node.key).append(form);
					// body에 추가한다.
					$("body").append(form);
					// message는 유저가 메시지를 보낼 때 알려주는 메시지이다.
// 				} else if (node.status === "message"||node.status==null) {
					// key로 해당 div영역을 찾는다.
					let $div = $("[data-key='" + node.key + "']");
					// console영역을 찾는다.
					let log = $div.find(".console").val();
					// 메시지 내용과 시간을 분리한다(,로 구분하여 보냄)
					var mContent = node.message.split(',');
					var messageContent  = mContent[0];
					console.log('메시지 전체 : ' + node);
					console.log('메시지 내용 자료형 : ' + typeof(messageContent));
					console.log('메시지 내용 : ' + messageContent);

					var messageTime = mContent[1];
					console.log('메시지 시간 : ' + messageTime);
					var viewDate = DateToString(messageTime);
					
					var isFile = String(messageContent).indexOf("$$$$");
					console.log(isFile)
					if(isFile!=-1){
						alert('파일이다'+isFile);
						
						var fileInfoArray = messageContent.replace(/_/gi, '/').split('$');
						var renameFileName = fileInfoArray[0];
						var originFileName = fileInfoArray[1];
						
						// 아래에 메시지를 추가한다.
						$div.find(".console").val(
								log + "(고객) => " + originFileName + " " + viewDate + "\n");
						var downATag = '<a href="${pageContext.servletContext.contextPath }/resources/chatFile/'+renameFileName+'" download="'+originFileName+'">다운로드</a>';
						$('#downArea').append(downATag)
						console.log(downATag);
						console.log($('#downArea').html())
						
					}else{
						alert('파일이 아니다'+isFile);

						// 아래에 메시지를 추가한다.
						$div.find(".console").val(
								log + "(고객) => " + messageContent + " " + viewDate + "\n");
						
					}
					
					// bye는 유저가 접속을 끊었을 때 알려주는 메시지이다.
// 				} else if (node.status === "bye") {
					// 해당 키로 div를 찾아서 dom을 제거한다.
// 					$("[data-key='" + node.key + "']").remove();
// 				}
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
			if(hours < 10){
				hours = '0'+hours;
			}
			if(min < 10){
				min = '0'+min;
			}
		  	return "".concat(seperHour).concat(" ").concat(hours).concat(":").concat(min);
		};
		
		// 전송 버튼을 클릭하면 발생하는 이벤트
		$(document).on("click", ".sendBtn", function() {
			// div 태그를 찾는다.
			let $div = $(this).closest(".float-left");
			// 메시지 텍스트 박스를 찾아서 값을 취득한다.
			let message = $div.find(".message").val();
			// 현재 날짜
			let currentDateTime = new Date();
			// 뷰할 형태로 날짜 변환
			let viewDate = DateToString2(currentDateTime);
			// 메시지와 날짜 정보 반환
			var submitDate = DateTransForm(currentDateTime);
			// 보낼 전체 메시지
			let allMessage = message + "," + submitDate;
			// 유저 key를 취득한다.
			let key = $div.data("key");
			// console영역을 찾는다.
			let log = $div.find(".console").val();
			// 아래에 메시지를 추가한다.
			$div.find(".console").val(log + "(me) => " + message + " " + viewDate + "\n");
			// 텍스트 박스의 값을 초기화 한다.
			$div.find(".message").val("");
			// 웹소켓으로 메시지를 보낸다.
			webSocket.send(key + "#####" + allMessage);
		});
		
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
			if(hours < 10){
				hours = '0'+hours;
			}
			if(min < 10){
				min = '0'+min;
			}
		  	return "".concat(seperHour).concat(" ").concat(hours).concat(":").concat(min);
		};
		
		// 텍스트 박스에서 엔터키를 누르면
		$(document).on("keydown", ".message",
			function() {
				// keyCode 13은 엔터이다.
				if (event.keyCode === 13) {
					// 버튼을 클릭하는 트리거를 발생한다.
					$(this).closest(".float-left").find(".sendBtn")
							.trigger("click");
					// form에 의해 자동 submit을 막는다.
					return false;
				}
				return true;
		})
	</script>
</body>
</html>