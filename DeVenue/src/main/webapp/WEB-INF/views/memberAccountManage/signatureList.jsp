<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
        integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

    <!--responsive meta tag-->
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <title>계정관리3 - 날인 방법 리스트 관리</title>

    <!-- Bootstrap core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom fonts for this template -->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet">
    <link href="vendor/simple-line-icons/css/simple-line-icons.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic" rel="stylesheet"
        type="text/css">

    <!--jQuery-->
    <script src="http://code.jquery.com/jquery-Latest.min.js"></script>

    <style>
        body {
            font-family: 'Lato', 'Helvetica Neue', Helvetica, Arial, sans-serif;
            /* font-family: 'Jua', sans-serif; */
        }

        h1,
        h2,
        h3,
        h4,
        h5,
        h6 {
            font-family: 'Lato', 'Helvetica Neue', Helvetica, Arial, sans-serif;
            font-weight: 700;
        }

          /* 개별 css---------------------------------------------------------------- */
        /* 전체 컨텐츠 영역(Section) 랩 */
        .allWrap{
            background-color: #212426;
            color: white;
            padding: 30px;
            width: 70%;
            margin: auto;
            margin-left:17%;
        }
        /* 오버플로우 처리를 할까말까(귀찮.. 다시 여백조정해야해) */
        .allWrap *{
            /* overflow: hidden !important;
            max-width: 99%;
            white-space: nowrap !important;
            text-overflow: ellipsis !important; */
        }
        /* 테이블 공통 */
        .allWrap table{
            margin: auto;
            margin-top: 15px;
        }
        .allWrap table td{
            padding: 8px;
            font-size: 14px;
        }
        /* 버튼 공통 css */
        .allWrap .btn{
            font-size: 12px;
            font-weight: 550;
        }

        /* 전체 타이틀 영역 */
        .signature_title{
            border-radius: 5px;
            border:1px solid gray;
            padding:15px;
            margin-bottom: 15px;
            background-color: #292e33;
        }
        /* 전체 타이틀의 메인 타이틀 */
        .signature_title div:first-of-type{
            text-indent: 10px;
            font-weight: 550;
            font-size: 18px;
        }
        /* 전체 타이틀의 서브 타이틀 */
        .signature_title div:last-of-type{
            margin-top: 10px;
            font-size: 14px;
            text-indent: 10px;
            color: rgb(189, 189, 189);
        }

        /* 컨텐츠 영역 전체 */
        .signature_content{
            border-radius: 5px;
            border:1px solid gray;
            padding:25px;
            margin-bottom: 15px;
            background-color: #292e33;
        }

        /* 컨텐츠 영역 타이틀 공통 */
        .signature_list_title{
            font-size: 17px;
            font-weight: 550;
            position: relative;
        }

        /* 날인 등록 버튼 css */
        .sigAddBtn{
            position: absolute;
            right: 0px;
        }

        /* 탭 - 탭선택 부분 */
        .nav-tabs{
            border:none;
            margin-top: 15px;
        }
        .nav-tabs *{
            font-weight: 550;
            color:rgb(56, 56, 65) !important;
            font-size: 14px;
        }
        .tabMenu{
            background-color: rgb(83, 83, 95);
        }
        /* 탭 - 내용부분 */
        .tab-content{
            background-color: white;
            padding: 25px;
            border-bottom-left-radius: 3px;
            border-bottom-right-radius: 3px;
            border-top-right-radius: 3px;
            /* border-radius: 3px; */
            position: relative;
            margin-bottom: 10px;
        }
        /* 탭 안의 날인 이미지 관련 */
        .tab-pane img{
            border:1px solid #212426;
            border-radius: 1px;
            margin: 5px;
            position: absolute;
            top:-5px;
            left:-5px;
        }
        .sigImgArea{
            display: inline-block;
            position: relative;
            /* background-color: #2793F2; */
            padding: 0px;
            border:none;
            width: 130px;
            height: 130px;
            margin:15px;
            border-radius: 1px;
        }
        .wrap_sigImg{
            display: inline-block;
            background-color: #212426;
            opacity: 0.8;
            height: 130px;
            width: 130px;
            position: absolute;
            top:0px;
            left:0px;
            z-index: 1;
            border-radius: 1px;
        }

        .sigImgArea .deleteSigBtn{
            position: absolute;
            top:5px;
            right:5px;
            padding: 5px 8px 5px 8px;
            z-index: 2;
            font-weight: 550;
        }
		.sigImgArea .useSigBtn{
            position: absolute;
            top:37px;
            right:5px;
            padding: 5px 8px 5px 8px;
            z-index: 2;
            font-weight: 550;
        }
     	.sigImgArea .useCrown{
            position: absolute;
            top:-10px;
            left:-8px;
            padding: 5px 8px 5px 8px;
            z-index: 2;
            font-weight: 550;
        }
    </style>

</head>

<body>
   	<!-- 메인 메뉴바 -->
   	<jsp:include page="../common/menubar.jsp"/>
    <!-- 메뉴바 끝----------------------------------------------------------- -->
	<!-- 마이페이지 사이드 메뉴바 -->
	<jsp:include page="../common/pSideMenubar.jsp"/>

    <!-- Section -->
    <div class="allWrap">
        <div class="signature_title">
            <div class="title_main">날인 방법 관리</div>
            <div class="title_serve">디베뉴 안심계약에 사용할 날인 방법을 관리하세요.</div>
        </div>
        <div class="signature_content">
            <div class="signature_list_title">
                <label>날인 방법 목록</label>
                <button type="button" class="btn btn-info sigAddBtn" data-toggle="modal" data-target="#chooseModal">
                    <svg width="1.1em" height="1.1em" style="position: relative; top:-1.5px; left:-2px;" viewBox="0 0 16 16" class="bi bi-plus-square" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                        <path fill-rule="evenodd" d="M8 3.5a.5.5 0 0 1 .5.5v4a.5.5 0 0 1-.5.5H4a.5.5 0 0 1 0-1h3.5V4a.5.5 0 0 1 .5-.5z"/>
                        <path fill-rule="evenodd" d="M7.5 8a.5.5 0 0 1 .5-.5h4a.5.5 0 0 1 0 1H8.5V12a.5.5 0 0 1-1 0V8z"/>
                        <path fill-rule="evenodd" d="M14 1H2a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z"/>
                    </svg>
                    날인 방법 등록
                </button>
            </div>
            <c:if test="${sigList != null && ! empty sigList }">
         		<c:set var="mainSigExist" value="false"/>
               	<c:forEach var="i" begin="0" end="${sigList.size()-1 }" step="1">
               		<c:if test="${sigList[i].isMain == 'Y'}">
               			<c:set var="mainSigExist" value="true"/>
           			 </c:if>
               	</c:forEach>
               	<c:if test="${mainSigExist eq 'false'}">
					<div class="alert alert-danger" role="alert" style="font-size:14px;margin-top:5px;">
						<svg width="1.3em" height="1.3em" style="position: relative; top:-2px;  margin-right: 10px;" viewBox="0 0 16 16" class="bi bi-exclamation-circle-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
						    <path fill-rule="evenodd" d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM8 4a.905.905 0 0 0-.9.995l.35 3.507a.552.552 0 0 0 1.1 0l.35-3.507A.905.905 0 0 0 8 4zm.002 6a1 1 0 1 0 0 2 1 1 0 0 0 0-2z"/>
						</svg>
						주사용 날인이 정해지지 않았습니다.
						계약서 작성시 <b>주사용 날인이 필요</b>합니다.
					</div>
               	</c:if>
            </c:if>
            <c:if test="${sigList == null || empty sigList }">
	            <div class="alert alert-info" role="alert" style="font-size:14px;margin-top:5px;">
					<svg width="1.3em" height="1.3em" style="position: relative; top:-2px;  margin-right: 10px;" viewBox="0 0 16 16" class="bi bi-exclamation-circle-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
					    <path fill-rule="evenodd" d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM8 4a.905.905 0 0 0-.9.995l.35 3.507a.552.552 0 0 0 1.1 0l.35-3.507A.905.905 0 0 0 8 4zm.002 6a1 1 0 1 0 0 2 1 1 0 0 0 0-2z"/>
					</svg>
					현재 등록된 날인이 없습니다. 날인을 등록해 주세요
				</div>
			</c:if>
			<c:if test="${sigList != null && ! empty sigList }">
	            <c:forEach var="i" begin="0" end="${sigList.size()-1 }" step="1">
	            	<c:if test="${sigList[i].isMain == 'Y'}">
	            		<a onclick="toCurrentSig();" class="currentSigView" style="text-align:center;background-color:transparent;position:absolute;position:fixed;bottom:20px;left:30px;z-index:99;width:150px;height:auto;text-decoration: none;">
	            			<div style="background-color: white;width:133px;height:132px;margin:auto;border:1px solid white;">
	            				<img class="sigImg" style="border:none;" src="${pageContext.servletContext.contextPath }/resources/sigImg/${sigList[i].renameFileName}" width="130px" height="130px">
	            			</div>
	            			<label style="font-size: 13px;font-weight: 550;color: white;display: block">현재 사용 날인</label>
	            		</a>
	            	</c:if>
	            </c:forEach>
			</c:if>
            <!-- 탭 메뉴로 서명날인/도장날인 구분 -->
            <ul class="nav nav-tabs">
                <li class="nav-item">
                    <a class="nav-link active tabMenu" data-toggle="tab" href="#qwe" id="qweATag">서명 날인</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link tabMenu" data-toggle="tab" href="#asd" id="asdATag">도장 날인</a>
                </li>
            </ul>
            <!-- 탭 공간 -->
            <div class="tab-content">
                <!-- 탭 내용 -->
                <div class="tab-pane fade show active" id="qwe">
                    <!-- <label for="" style="color: #343a40; font-weight: 550; font-size: 14px;">등록된 서명</label> -->
                    <span class="badge badge-info" style="padding: 7px;">등록된 서명</span>
                    <hr style="margin: 10px; margin-left: 0px; margin-right: 0px;">
                    <c:if test="${sigList != null && ! empty sigList }">
                    	<c:forEach var="i" begin="0" end="${sigList.size()-1 }" step="1">
                    		<c:if test="${sigList[i].sigType == 'SIGN'}">
			                    <span class="sigImgArea">
			                        <span class="wrap_sigImg"></span>
			                        <img class="sigImg" src="${pageContext.servletContext.contextPath }/resources/sigImg/${sigList[i].renameFileName}" width="130px" height="130px">
			                        <button type="button" class="btn btn-secondary deleteSigBtn" onclick="deleteSig(this);">삭제</button>
			                        <input type="hidden" value="${sigList[i].id }"/>
			                        <c:if test="${sigList[i].isMain == 'N'}">
			                        	<button type="button" class="btn btn-success useSigBtn" onclick="changeMainSig(this);">사용</button>
			                        </c:if>
			                        <c:if test="${sigList[i].isMain == 'Y'}">
			                        	<img id="mainSigPosition" class="useCrown" src="${pageContext.servletContext.contextPath }/resources/image/crown4.png" width="" height="" style="border:none;"/>
			                        	<c:set var="mainSigId" value="${sigList[i].id }"/>
			                        </c:if>
			                    </span>
		                    </c:if>
	                    </c:forEach>
	                </c:if>
                </div>
                <div class="tab-pane fade" id="asd">
                    <span class="badge badge-info" style="padding: 7px;">등록된 도장</span>
                    <hr style="margin: 10px; margin-left: 0px; margin-right: 0px;">
                    <c:if test="${sigList != null && ! empty sigList }">
                    	<c:forEach var="i" begin="0" end="${sigList.size()-1 }" step="1">
                    		<c:if test="${sigList[i].sigType == 'STAMP'}">
			                    <span class="sigImgArea">
			                        <span class="wrap_sigImg"></span>
			                        <img class="sigImg" src="${pageContext.servletContext.contextPath }/resources/sigImg/${sigList[i].renameFileName}" width="130px" height="130px">
			                        <button type="button" class="btn btn-secondary deleteSigBtn" onclick="deleteSig(this);">삭제</button>
			                        <input type="hidden" value="${sigList[i].id }"/>
			                        <c:if test="${sigList[i].isMain == 'N'}">
			                        	<button type="button" class="btn btn-success useSigBtn" onclick="changeMainSig(this);">사용</button>
			                        </c:if>
			                        <c:if test="${sigList[i].isMain == 'Y'}">
			                        	<img id="mainSigPosition" class="useCrown" src="${pageContext.servletContext.contextPath }/resources/image/crown4.png" width="" height="" style="border:none;"/>
			                        	<c:set var="mainSigId" value="${sigList[i].id }"/>
			                        </c:if>
			                    </span>
		                   </c:if>
	                    </c:forEach>
	                </c:if>
                </div>
            </div>
        </div>
    </div>
    <!-- 서명/도장 생성 선택하는 모달 -->
    <div class="modal" id="chooseModal" tabindex="-1">
        <div class="modal-dialog modal-dialog-centered" style="max-width: 600px !important; width: 600px !important">
            <div class="modal-content" style="background-color: #212529;">
            <div class="modal-header" style="background-color: #212529; width: 100%; color: white;">
                <h5 class="modal-title">날인 방법 등록</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body" style="padding: 25px;">
                <div style="text-align: center; background-color: white; color: white; border-radius: 2px; padding: 15px;display: flex;">
                    <div id="toMouseSig_area" class="createSigSelection mouse" style="width:50%; background-color: #343a40; border-top-left-radius: 3px; border-bottom-left-radius: 3px; padding: 20px;">
                        <svg width="3em" height="3em" style="margin-bottom: 10px;" viewBox="0 0 16 16" class="bi bi-mouse2" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                            <path fill-rule="evenodd" d="M3 5.188C3 2.341 5.22 0 8 0s5 2.342 5 5.188v5.625C13 13.658 10.78 16 8 16s-5-2.342-5-5.188V5.189zm4.5-4.155C5.541 1.289 4 3.035 4 5.188V5.5h3.5V1.033zm1 0V5.5H12v-.313c0-2.152-1.541-3.898-3.5-4.154zM12 6.5H4v4.313C4 13.145 5.81 15 8 15s4-1.855 4-4.188V6.5z"/>
                        </svg><br>
                        <button type="button" class="btn btn-info" style="margin-bottom: 10px; font-size: 13px;">마우스로 서명</button>
                        <br>
                        <label style="font-size: 13px;">마우스로 서명을 입력하여<br>등록합니다.</label>
                    </div>
                    <div style="width: 5px; height: 100%; background-color: gray;"></div>
                    <div id="toStampSig_area"  class="createSigSelection stamp" style="width:50%; background-color: #343a40;  border-top-right-radius: 3px; border-bottom-right-radius: 3px; padding: 20px;">
                        <svg width="3em" height="3em" style="margin-bottom: 10px;" viewBox="0 0 16 16" class="bi bi-images" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                            <path fill-rule="evenodd" d="M12.002 4h-10a1 1 0 0 0-1 1v8a1 1 0 0 0 1 1h10a1 1 0 0 0 1-1V5a1 1 0 0 0-1-1zm-10-1a2 2 0 0 0-2 2v8a2 2 0 0 0 2 2h10a2 2 0 0 0 2-2V5a2 2 0 0 0-2-2h-10z"/>
                            <path d="M10.648 8.646a.5.5 0 0 1 .577-.093l1.777 1.947V14h-12v-1l2.646-2.354a.5.5 0 0 1 .63-.062l2.66 1.773 3.71-3.71z"/>
                            <path fill-rule="evenodd" d="M4.502 9a1.5 1.5 0 1 0 0-3 1.5 1.5 0 0 0 0 3zM4 2h10a1 1 0 0 1 1 1v8a1 1 0 0 1-1 1v1a2 2 0 0 0 2-2V3a2 2 0 0 0-2-2H4a2 2 0 0 0-2 2h1a1 1 0 0 1 1-1z"/>
                        </svg><br>
                        <button type="button" class="btn btn-info" style="margin-bottom: 10px; font-size: 13px;">도장 이미지 업로드</button>
                        <br>
                        <label style="font-size: 13px;">촬영 또는 스캔한 서명 이미지를<br>사용하여 등록합니다.</label>
                    </div>
                </div>
            </div>
            <!-- <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
            </div> -->
            </div>
        </div>
    </div>
	<!-- 풋터 가져오기  -->
    <jsp:include page="../common/footer.jsp"/>

     <!-- 개인 스크립트 시작 -->
     <script>
         $(function(){
             // 날인 이미지 호버하면 컬러랩 덮어씌워지고 삭제버튼 보여주기
             $('.wrap_sigImg').hide();
             $('.deleteSigBtn').hide();
             $('.useSigBtn').hide();
             $('.sigImgArea').each(function(index, item){
                 $(item).mouseenter(function(){
                     $(item).find('.wrap_sigImg').show();
                     $(item).find('.deleteSigBtn').show();
                     $(item).find('.useSigBtn').show();
                 }).mouseleave(function(){
                     $(item).find('.wrap_sigImg').hide();
                     $(item).find('.deleteSigBtn').hide();
                     $(item).find('.useSigBtn').hide();
                 });
             });

             /* 모달창 어떤방식으로 서명추가할지 선택 영역 */
             $('.createSigSelection').mouseover(function(){
                 $(this).css('background-color', 'rgb(83, 83, 95)');
             }).mouseleave(function(){
                 $(this).css('background-color', '#343a40');
             });

             // 모달창 각각 선택시 각각의 서명 등록창으로 이동
             $('.createSigSelection').each(function(index, item){
                 $(item).click(function(){
                     if($(item).hasClass('mouse')){
                         alert('마우스로');
                         location.href="gotoInsertSign.do";
                     }else{
                         alert('도장으로');
                         location.href="gotoInsertStamp.do";
                     }
                 })
             });
         });
         
         // 날인 삭제하는 함주(에이작스로 저리? 아니면 그냥 이동?)
         function deleteSig(targetBtn){
        	 var isDelete = confirm('해당 날인을 삭제하시겠습니까?');
        	 
        	 if(isDelete){
	        	 var hidden = $(targetBtn).next('input[type=hidden]');
	        	 var sigId = hidden.val();
	        	 
	        	 // 삭제하기에 앞서 프로젝트에서 쓰고있던 날인인지 찾는다.(이 방식은 매우 느림.. 다음엔 db 설계를 잘 해야겠다.)
	        	 var isUsed = false;
	        	 $.ajax({
	        		url:"searchProjectForSigDelete.do",
	        		type:"get",
	        		data:{sigId:sigId},
	        		success:function(data){
	        			if(data=="true"){
	        				isUsed = true;
	        			}
			        	 
	        			if(isUsed){
			        		alert('프로젝트에 사용 중인 날인은 삭제가 불가능 합니다.');
			        		return;
			        	}else{
				        	location.href="deleteSignature.do?id="+sigId;
			        	}
			        	 
	        		},
	        		error:function(error){
	        			alert('error : ' + error)
	        		}
	        	 });
	        	 
        	 }
        	 return;
         }
         
         // 선택한 날인을 주사용 날인으로 바꾸는 함수
         function changeMainSig(targetBtn){
        	 var isChangeMainSig = confirm('해당 날인을 주사용 날인으로 바꾸시겠습니까?');
        	 
        	 if(isChangeMainSig){
	        	 var hidden = $(targetBtn).prev('input[type=hidden]');
	        	 var sigId = hidden.val();
	        	 var currentMainSigId = '${mainSigId}';
	        	 location.href="changeMainSignature.do?id="+sigId+"&cId="+currentMainSigId;
        	 }
        	 return;
         }
         
         // 주사용날인으로 바로 이동하는 함수
         function toCurrentSig(){
        	 $('.currentSigView').prop('href', '#mainSigPosition');
        	 if($('#mainSigPosition').parents('.tab-pane').css('display')=='none'){
        		 if($('#qwe').css('display') == 'none'){
         			$('#qweATag').click();
         		 }else{
         			$('#asdATag').click();
         		 }
	        	 reClickCurrentSigView();
        	 }
         }
         function reClickCurrentSigView(){
        	 $('.currentSigView').click();
         }
         
      	// 마이페이지 사이드 메뉴바 길이맞춰주는 함수(이 함수를 각페이지에 넣어주면 됨. .allWrap부분이 자신의 섹션 영역 선택자)
        $(function(){
	        $('.myPage_sideNav_area').height($('.allWrap').height());
        })
    </script>
</body>

</html>