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

    <title>마우스 서명 이미지 업로드</title>

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
        .allWrap {
            background-color: #212426;
            color: white;
            padding: 30px;
            width: 70%;
            margin: auto;
            margin-left:17%;
        }

        /* 오버플로우 처리를 할까말까(귀찮.. 다시 여백조정해야해) */
        .allWrap * {
            /* overflow: hidden !important;
            max-width: 99%;
            white-space: nowrap !important;
            text-overflow: ellipsis !important; */
        }

        /* 테이블 공통 */
        .allWrap table {
            margin: auto;
            margin-top: 15px;
            /* width: 620px; */
        }

        .allWrap table td {
            padding: 8px;
            font-size: 14px;
        }

        .allWrap table td:first-of-type {
            width: 90px;
        }
        .allWrap table td:last-of-type {
            width: 525px;
        }

        /* 버튼 공통 css */
        .allWrap .btn {
            font-size: 12px;
            font-weight: 550;
        }

        /* 전체 타이틀 영역 */
        .MsigUpload_title {
            border-radius: 5px;
            border: 1px solid gray;
            padding: 15px;
            margin-bottom: 15px;
            background-color: #292e33;
        }

        /* 전체 타이틀의 메인 타이틀 */
        .MsigUpload_title div:first-of-type {
            text-indent: 10px;
            font-weight: 550;
            font-size: 18px;
        }

        /* 컨텐츠 영역 전체 */
        .MsigUpload_content {
            border-radius: 5px;
            border: 1px solid gray;
            padding: 25px;
            margin-bottom: 15px;
            background-color: #292e33;
        }

        /* 컨텐츠 영역 타이틀 공통 */
        .MsigUpload_title {
            font-size: 17px;
            font-weight: 550;
            position: relative;
        }

        /* 탭 - 탭선택 부분 */
        .nav-tabs {
            border: none;
            margin-top: 15px;
        }

        .nav-tabs * {
            font-weight: 550;
            color: rgb(56, 56, 65) !important;
            font-size: 14px;
        }

        .tabMenu {
            background-color: rgb(83, 83, 95);
        }

        /* 탭 - 내용부분 */
        .tab-content {
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
        .tab-pane img {
            border: 1px solid #212426;
            border-radius: 1px;
            margin: 5px;
            position: absolute;
            top: -5px;
            left: -5px;
        }

        .sigImgArea {
            display: inline-block;
            position: relative;
            /* background-color: #2793F2; */
            padding: 0px;
            border: none;
            width: 110px;
            height: 110px;
            margin: 15px;
            border-radius: 1px;
        }

        .wrap_sigImg {
            display: inline-block;
            background-color: #212426;
            opacity: 0.8;
            height: 110px;
            width: 110px;
            position: absolute;
            top: 0px;
            left: 0px;
            z-index: 1;
            border-radius: 1px;
        }

        .sigImgArea .deleteSigBtn {
            position: absolute;
            top: 5px;
            right: 5px;
            padding: 5px 8px 5px 8px;
            z-index: 2;
            font-weight: 550;
        }
    </style>

</head>

<body onload="init();">
   	<!-- 메인 메뉴바 -->
   	<jsp:include page="../common/menubar.jsp"/>
   	<!-- sideMenubar -->
	<jsp:include page="../common/sideMenubarAll.jsp"/>
    <!-- 메뉴바 끝----------------------------------------------------------- -->
	<!-- 마이페이지 사이드 메뉴바 -->
	<jsp:include page="../common/pSideMenubar.jsp"/>

    <!-- Section -->
    <div class="allWrap">
        <div class="MsigUpload_title">
            <div class="title_main" style="margin-bottom: 5px;">마우스로 서명 등록</div>
            <a href="gotoSignatureList.do" style="font-size: 13px; margin-left: 10px;">
                <svg width="1em" height="1em" style="position: relative; top:-1px" viewBox="0 0 16 16"
                    class="bi bi-backspace" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                    <path fill-rule="evenodd"
                        d="M6.603 2h7.08a1 1 0 0 1 1 1v10a1 1 0 0 1-1 1h-7.08a1 1 0 0 1-.76-.35L1 8l4.844-5.65A1 1 0 0 1 6.603 2zm7.08-1a2 2 0 0 1 2 2v10a2 2 0 0 1-2 2h-7.08a2 2 0 0 1-1.519-.698L.241 8.65a1 1 0 0 1 0-1.302L5.084 1.7A2 2 0 0 1 6.603 1h7.08z" />
                    <path fill-rule="evenodd"
                        d="M5.83 5.146a.5.5 0 0 0 0 .708l5 5a.5.5 0 0 0 .707-.708l-5-5a.5.5 0 0 0-.708 0z" />
                    <path fill-rule="evenodd"
                        d="M11.537 5.146a.5.5 0 0 1 0 .708l-5 5a.5.5 0 0 1-.708-.708l5-5a.5.5 0 0 1 .707 0z" />
                </svg>
                &nbsp;
                날인 리스트로 돌아가기
            </a>
        </div>
        <div class="MsigUpload_content">
            <form action="" method="">
                <table border="0">
                    <tr>
                        <td style="font-size: 15px;"><span style="color: orange;">*</span> 서명입력</td>
                        <td>
                            <p style="font-size: 14px; margin: 0px;">사용할 서명을 아래의 영역에 마우스로 입력해주세요.</p>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td style="padding-top: 0px;">
                            <p style="font-size: 14px; margin: 0px">
                                서명을 입력 후, [등록 완료] 버튼을 클릭하면 입력한 서명이 날인 방법에 등록됩니다.
                            </p>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td style="padding-bottom: 0px;">
                            <canvas id="drawCanvas" width="200" height="200"
                                style="position: relative; border: 1px solid #000; background-color: white;"></canvas>
                            <button onclick="erase();" type="button" class="btn btn-secondary" style="position: relative; top: -182px; left: 10px;">
                                <svg width="1.1em" height="1.1em" style="position: relative; top: -1.5px;" viewBox="0 0 16 16" class="bi bi-arrow-repeat" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                    <path fill-rule="evenodd" d="M2.854 7.146a.5.5 0 0 0-.708 0l-2 2a.5.5 0 1 0 .708.708L2.5 8.207l1.646 1.647a.5.5 0 0 0 .708-.708l-2-2zm13-1a.5.5 0 0 0-.708 0L13.5 7.793l-1.646-1.647a.5.5 0 0 0-.708.708l2 2a.5.5 0 0 0 .708 0l2-2a.5.5 0 0 0 0-.708z"/>
                                    <path fill-rule="evenodd" d="M8 3a4.995 4.995 0 0 0-4.192 2.273.5.5 0 0 1-.837-.546A6 6 0 0 1 14 8a.5.5 0 0 1-1.001 0 5 5 0 0 0-5-5zM2.5 7.5A.5.5 0 0 1 3 8a5 5 0 0 0 9.192 2.727.5.5 0 1 1 .837.546A6 6 0 0 1 2 8a.5.5 0 0 1 .501-.5z"/>
                                </svg>&nbsp;
                                초기화
                            </button>
                            <!-- <form id="sigSubmitForm" action="accountOption1.html" method="post" enctype="multipart/form-data"> -->
                                <img id="sigImage" style="position: absolute;">
                                <input type="hidden" id="file" name="file">
                            <!-- </form> -->
                        </td>
                    </tr>
                    <tr>
                        <td>
                        </td>
                        <td align="right">
                            <!-- 이미지로 변환 후 저장 -->
                            <button onclick="toDataURL();" type="button" class="btn btn-info" style="font-size: 14px;">등록 완료</button>
                        </td>
                    </tr>
                </table>
            </form>

                <script type="text/javascript">
                    // 캔버스에 그린 서명을 이미지화
                    function toDataURL() {
                        var myImage = document.getElementById('sigImage');
                        myImage.style.visibility = 'hidden';
                        myImage.src = canvas.toDataURL();

                        
                        saveSigImg(canvas.toDataURL());
                    }
                    // 이미지를 백단으로
                    function saveSigImg(dataURL){
                    	var blobBin = atob(dataURL.split(',')[1]);	// base64 데이터 디코딩
                        var array = [];
                        for (var i = 0; i < blobBin.length; i++) {
                            array.push(blobBin.charCodeAt(i));
                        }
                        var file = new Blob([new Uint8Array(array)], {type: 'image/png'});	// Blob 생성
                        var formdata = new FormData();	// formData 생성
                        formdata.append("file", file);	// file data 추가
                    	
                        $.ajax({
	                        type: "POST",
	                        url: "insertSign.do",
	                        processData : false,	// data 파라미터 강제 string 변환 방지!!
	                        contentType : false,	// application/x-www-form-urlencoded; 방지!!
	                        data: formdata,
	                        success:function(data) {
		                        alert(data);
		                        location.href="gotoSignatureList.do";
	                        }
                        });
                    }

                    // 캔버스에 그린 서명을 그릴수 있게 하는 함수들 시작-------------------
                    var canvas, context;
                    function init() {
                        canvas = document.getElementById("drawCanvas");
                        context = canvas.getContext("2d");

                        context.lineWidth = 2; // 선 굵기를 2로 설정
                        context.strokeStyle = "black";

                        // 마우스 리스너 등록. e는 MouseEvent 객체
                        canvas.addEventListener("mousemove", function (e) { move(e) }, false);
                        canvas.addEventListener("mousedown", function (e) { down(e) }, false);
                        canvas.addEventListener("mouseup", function (e) { up(e) }, false);
                        canvas.addEventListener("mouseout", function (e) { out(e) }, false);
                    }

                    var startX = 0, startY = 0; // 드래깅동안, 처음 마우스가 눌러진 좌표
                    var drawing = false;
                    function draw(curX, curY) {
                        context.beginPath();
                        context.moveTo(startX, startY);
                        context.lineTo(curX, curY);
                        context.stroke();
                    }
                    function down(e) {
                        startX = e.offsetX; startY = e.offsetY;
                        drawing = true;
                    }
                    function up(e) { drawing = false; }
                    function move(e) {
                        if (!drawing) return; // 마우스가 눌러지지 않았으면 리턴
                        var curX = e.offsetX, curY = e.offsetY;
                        draw(curX, curY);
                        startX = curX; startY = curY;
                    }
                    function out(e) { drawing = false; }
                    //----------------------------------------------------------------
                    
                    // 잘못 그렸을 때 초기화 함수
                    function erase(){
                        var canvas = document.getElementById("drawCanvas");
                        canvas.getContext("2d").clearRect(0, 0, canvas.width, canvas.height)
                    }
                </script>
        </div>
    </div>
	<!-- 풋터 가져오기  -->
    <jsp:include page="../common/footer.jsp"/>


    <!-- 개인 스크립트 시작 -->
    <script>
	 	// 마이페이지 사이드 메뉴바 길이맞춰주는 함수(이 함수를 각페이지에 넣어주면 됨. .allWrap부분이 자신의 섹션 영역 선택자)
	    $(function(){
	        $('.myPage_sideNav_area').height($('.allWrap').height());
	    })
    </script>
</body>

</html>