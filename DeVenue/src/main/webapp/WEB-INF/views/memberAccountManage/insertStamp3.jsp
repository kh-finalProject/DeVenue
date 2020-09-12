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

    <title>계정관리 - 도장 이미지 업로드3(자르고 업로드)</title>

    <!-- Bootstrap core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom fonts for this template -->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet">
    <link href="vendor/simple-line-icons/css/simple-line-icons.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic" rel="stylesheet"
        type="text/css">

    <!--jQuery-->
    <script src="http://code.jquery.com/jquery-Latest.min.js"></script>

    <!-- Jcrop -->
<!--     <script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script> -->
<!--     <script src="http://jcrop-cdn.tapmodo.com/v2.0.0-RC1/js/Jcrop.js"></script> -->
<!--     <link rel="stylesheet" href="http://jcrop-cdn.tapmodo.com/v2.0.0-RC1/css/Jcrop.css" type="text/css"> -->
	<script src="${pageContext.servletContext.contextPath }/resources/Jcrop/js/jquery.min.js"></script>
	<script src="${pageContext.servletContext.contextPath }/resources/Jcrop/js/jquery.Jcrop.js"></script>
<%-- 	<script src="${pageContext.servletContext.contextPath }/resources/Jcrop/custom/jquery.Jcrop.js"></script> --%>
	<script type="text/javascript">
  jQuery(function($){

    // Create variables (in this scope) to hold the API and image size
    var jcrop_api,
        boundx,
        boundy,

        // Grab some information about the preview pane
        $preview = $('#preview-pane'),
        $pcnt = $('#preview-pane .preview-container'),
        $pimg = $('#preview-pane .preview-container img'),

        xsize = $pcnt.width(),
        ysize = $pcnt.height();
    
    console.log('init',[xsize,ysize]);
    $('#target').Jcrop({
      onChange: updatePreview, 
      onSelect: updatePreview, 
      aspectRatio: 1//가로세로 비율을 정함
    },function(){
      // Use the API to get the real image size
      var bounds = this.getBounds();
      boundx = bounds[0];
      boundy = bounds[1];
      // Store the API in the jcrop_api variable
      jcrop_api = this;

      // Move the preview into the jcrop container for css positioning
      $preview.appendTo(jcrop_api.ui.holder);
    });

    function updatePreview(c)
    {
      if (parseInt(c.w) > 0)
      {
        var rx = xsize / c.w;
        var ry = ysize / c.h;

        $pimg.css({
          width: Math.round(rx * boundx) + 'px',
          height: Math.round(ry * boundy) + 'px',
          marginLeft: '-' + Math.round(rx * c.x) + 'px',
          marginTop: '-' + Math.round(ry * c.y) + 'px'
        });
      }
      $('#x1').val(c.x);
      $('#y1').val(c.y);
      $('#x2').val(c.x2);
      $('#y2').val(c.y2);
      $('#w').val(c.w);
      $('#h').val(c.h);
    };
    
    $('#coords').on('change','input',function(e){
        var x1 = $('#x1').val(),
            x2 = $('#x2').val(),
            y1 = $('#y1').val(),
            y2 = $('#y2').val();
        jcrop_api.setSelect([x1,y1,x2,y2]);
      });
  });
  
  
  
    // Simple event handler, called from onChange and onSelect
    // event handlers, as per the Jcrop invocation above
    function showCoords(c)
    {
      $('#x1').val(c.x);
      $('#y1').val(c.y);
      $('#x2').val(c.x2);
      $('#y2').val(c.y2);
      $('#w').val(c.w);
      $('#h').val(c.h);
    };

    function clearCoords()
    {
      $('#coords input').val('');
    };
</script>
<%-- <link rel="stylesheet" href="${pageContext.servletContext.contextPath }/resources/Jcrop/demos/demo_files/main.css" type="text/css" /> --%>
<link rel="stylesheet" href="${pageContext.servletContext.contextPath }/resources/Jcrop/demos/demo_files/demos.css" type="text/css" />
<link rel="stylesheet" href="${pageContext.servletContext.contextPath }/resources/Jcrop/css/jquery.Jcrop.css" type="text/css" />

    <style>
    	/* 잘려진 이미지 미리보기 영역 css */
		.jcrop-holder #preview-pane {
		  display: block;
		  position: relative;
		  z-index: 2000;
		  top: 77px;
 		  right: -270px;
		  padding: 6px;
		  border: 1px solid #212426;
		  background-color: #212426;
		  width: 177px;
		  height: 177px;
		  
		  -webkit-border-radius: 3px;
		  -moz-border-radius: 3px;
		  border-radius: 3px;
		
		  -webkit-box-shadow: 1px 1px 5px 2px rgba(0, 0, 0, 0.2);
		  -moz-box-shadow: 1px 1px 5px 2px rgba(0, 0, 0, 0.2);
		  box-shadow: 1px 1px 5px 2px rgba(0, 0, 0, 0.2);
		}
		
		/* 미리보기 영역 사이즈 설정 */
		#preview-pane .preview-container {
		  width: 165px;
		  height: 165px;
		  overflow: hidden;
		}
    	/* --------------------------------------------------------------------- */
    
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
            position: relative;
            margin-left:17%;
        }

        /* 오버플로우 처리를 할까말까(귀찮.. 다시 여백조정해야해) */
        .allWrap * {
            box-sizing: border-box;
            /* overflow: hidden !important;
            max-width: 99%;
            white-space: nowrap !important;
            text-overflow: ellipsis !important; */
        }

        /* 작은 테이블 공통 */
        .allWrap .table-sm {
            margin: auto;
            margin-top: 15px;
            /* width: 620px; */
        }

        .allWrap .table-sm td {
            /* padding: 8px; */
            font-size: 14px;
            padding: 0px;
        }

        .allWrap .table-sm th {
            padding: 0px;
        }

        .allWrap .table-sm thead tr:first-of-type th {
            padding: 8px;
        }

        .allWrap .table-sm td:first-of-type {
            width: 90px;
        }

        .allWrap .table-sm td:last-of-type {
            width: 525px;
        }

        /* 버튼 공통 css */
        .allWrap .btn {
            font-size: 12px;
            font-weight: 550;
        }

        /* 전체 타이틀 영역 */
        .SsigUpload_title {
            border-radius: 5px;
            border: 1px solid gray;
            padding: 15px;
            margin-bottom: 15px;
            background-color: #292e33;
        }

        /* 전체 타이틀의 메인 타이틀 */
        .SsigUpload_title div:first-of-type {
            text-indent: 10px;
            font-weight: 550;
            font-size: 18px;
        }

        /* 컨텐츠 영역 전체 */
        .SsigUpload_content {
            border-radius: 5px;
            border: 1px solid gray;
            padding: 25px;
            margin-bottom: 15px;
            background-color: #292e33;
        }

        /* 컨텐츠 영역 타이틀 공통 */
        .SsigUpload_title {
            font-size: 17px;
            font-weight: 550;
            position: relative;
        }

        .stamp_upload_area {}


        /* 프로세스 관련 style -----------------*/
        .allWrap .wizard {
            margin-top: 50px;
            margin-bottom: 50px;
        }

        .allWrap .wizard>div.wizard-inner {
            position: relative;
            text-align: center;
        }

        .allWrap .nav-tabs {
            border-bottom: none !important;
        }

        /* 가로선 */
        .allWrap .connecting-line {
            height: 2px;
            background: #e0e0e0;
            position: absolute;
            width: 65%;
            margin: 0 auto;
            left: 0;
            right: 0;
            /* top: 10px; */
            z-index: 1;
        }

        /* 각 스텝 숫자와 문자 */
        .allWrap .step {
            position: relative;
            width: 100px;
            margin: 0 auto;
            left: 0px;
            top: 24px;
        }

        .allWrap .step p {
            margin-top: 5px;
            font-size: 14px;
        }


        /* 각 동그리 */
        .allWrap span.round-tab {
            width: 35px;
            height: 35px;
            display: inline-block;
            border-radius: 50%;
            background: #212529;
            z-index: 2;
            position: absolute;
            top: -40px;
            left: 30px;
            font-size: 16px !important;
            color: white !important;
            font-weight: 700;
            border: 2px solid #ddd;
            line-height: 30px;
        }

        /* 프로세스 style 끝 ------------------*/
        /* 레인지 css */
        input[type=range] {
            width: 200px;
            height: 30px;
        }
    </style>

</head>
 <script type="text/javascript">
	 window.history.forward();
	 function noBack(){window.history.forward();}
</script>

<body onload="noBack();" onpageshow="if(event.persisted) noBack();" onunload="">
	<!-- 메인 메뉴바 -->
   	<jsp:include page="../common/menubar.jsp"/>
 	<!-- sideMenubar -->
	<jsp:include page="../common/sideMenubarAll.jsp"/>
    <!-- 메뉴바 끝----------------------------------------------------------- -->
	<!-- 마이페이지 사이드 메뉴바 -->
	<jsp:include page="../common/pSideMenubar.jsp"/>

    <!-- Section -->
    <div class="allWrap">
        <div class="SsigUpload_title">
            <div class="title_main" style="margin-bottom: 5px;">도장 이미지 등록</div>
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
        <div class="SsigUpload_content">
            <!-- 타이틀 -->
            <label style="font-weight: 550; font-size: 17px;">이미지 업로드</label>
            <hr style="border-style: dashed; border-color: gray;">
            <!-- 스텝퍼 영역 -->
            <div class="wizard">
                <div class="wizard-inner" style="">
                    <div class="connecting-line"></div>
                    <ul class="nav nav-tabs" role="tablist" style="">
                        <li role="presentation" class="step step1 disabled" style="">
                            <div data-toggle="tab" aria-controls="step1" role="tab" aria-expanded="true">
                                <span class="round-tab">1</span>
                                <p>이미지 첨부</p>
                            </div>
                        </li>
                        <li role="presentation" class="step step2 disabled">

                            <div data-toggle="tab" aria-controls="step2" role="tab" aria-expanded="false">
                                <span class="round-tab">2</span>
                                <p>대비 조정</p>
                            </div>
                        </li>
                        <li role="presentation" class="step step3 active">
                            <div data-toggle="tab" aria-controls="step3" role="tab">
                                <span class="round-tab">3</span>
                                <p>이미지 자르기</p>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
            <!-- 각 단계 -->
            <form action="cutImgAndUpload.do" method="get" id="coords" class="coords" onsubmit="return sigCutSubmit();" >
            	<input type="hidden" name="renameFileName" value="${renameFileName }">
                <!-- 3단계 영역 - 이미지 자르기 및 업로드 -->
                <div class="stamp_cut_area">
                    <table border="0" style="width: 80%; margin: auto; margin-top: 30px; margin-bottom: 40px; font-size: 14px;">
                    <tr>
                        <td style="font-size: 15px; width: 110px;"><span style="color: orange;">*</span> 잘라내기</td>
                        <td style="padding-bottom: 0px;">
                            서명이 위치한 곳을 드래그하거나 핸들을 움직여 잘라낼 영역을 지정해주세요.<br><span style="color: orange;">*</span>새로 고침시 새로 파일을 업로드 하셔야 합니다.
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            [업로드 완료] 버튼을 클릭하면 지정한 영역에 따라 잘려진 이미지로 업로드가 완료됩니다.
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td style="padding-top: 8px;">
                            <div class="alert alert-info" role="alert" style="margin: auto; font-size: 12px;">
                                <svg width="1.2em" height="1.2em" style="position: relative; top: -2px;"
                                    viewBox="0 0 16 16" class="bi bi-exclamation-octagon-fill" fill="currentColor"
                                    xmlns="http://www.w3.org/2000/svg">
                                    <path fill-rule="evenodd"
                                        d="M11.46.146A.5.5 0 0 0 11.107 0H4.893a.5.5 0 0 0-.353.146L.146 4.54A.5.5 0 0 0 0 4.893v6.214a.5.5 0 0 0 .146.353l4.394 4.394a.5.5 0 0 0 .353.146h6.214a.5.5 0 0 0 .353-.146l4.394-4.394a.5.5 0 0 0 .146-.353V4.893a.5.5 0 0 0-.146-.353L11.46.146zM8 4a.905.905 0 0 0-.9.995l.35 3.507a.552.552 0 0 0 1.1 0l.35-3.507A.905.905 0 0 0 8 4zm.002 6a1 1 0 1 0 0 2 1 1 0 0 0 0-2z" />
                                </svg>&nbsp;
                                서명이 올바른 방향으로 표시되지 않는다면, 올바른 방향으로 이미지를 회전하여 다시 첨부해주세요.
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td style="padding-top: 10px; padding-bottom: 0px !important; display: flex;">
                            <!-- 받은 이미지 -->
                            <img src="${pageContext.servletContext.contextPath }/resources/sigImg/${renameFileName}" id="target" alt="[Jcrop Example]" width="250px" height="250px"/>
                            <button type="button" class="btn btn-secondary" style="margin-left:10px;  height: 35px !important; min-width: 110px;" onclick="reUpload();">다시 첨부하기</button>
                            <!-- 잘려진 영역 미리보기 -->
							<div id="preview-pane">
							   <div class="preview-container">
							      <img src="${pageContext.servletContext.contextPath }/resources/sigImg/${renameFileName}" class="jcrop-preview" alt="Preview" />
							   </div>
							</div>
                        </td>
                    </tr>
                    <tr>
                    	<td></td>
                    	<td>
                    		<div class="inline-labels">
							    <label>X1 <input type="text" size="4" id="x1" name="x1" /></label>
							    <label>Y1 <input type="text" size="4" id="y1" name="y1" /></label>
							    <label>X2 <input type="text" size="4" id="x2" name="x2" /></label>
							    <label>Y2 <input type="text" size="4" id="y2" name="y2" /></label>
							    <label>W <input type="text" size="4" id="w" name="w" /></label>
							    <label>H <input type="text" size="4" id="h" name="h" /></label>
						    </div>
                    	</td>
                    </tr>
                </table>
                <hr style="border-style: dashed; border-color: gray;">
                <div style="width: 100%; text-align: right; margin-top: 20px; margin-bottom: 10px;">
                    <!-- 대비 조정 버튼 : 이미지로 변환 후 저장 -->
                    <button type="submit" class="btn btn-info" style="font-size: 14px;">업로드 완료</button>
                </div>
                </div>
            </form>
        </div>
    </div>
	<!-- 풋터 가져오기  -->
    <jsp:include page="../common/footer.jsp"/>

    <!-- 개인 스크립트 시작 -->
    <script>
        $(function () {
            // 스텝에 css 설정. 현재단계(active) 속성을 가지고 있는 것을 설정
            $('.step.active .round-tab').css('background-color', '#17a2b8');
        })
        
        // 뒤로가기 막기(다른방법 더 추가하자)
        
    	// 다시 첨부하기(리네임가지고 서버단가서 해당하는 이름 이미지 파일 지워주고 도장업로드 첫단계로 돌아간다.)
        function reUpload(){
            var renameFileName = '${renameFileName}';
            
            location.href="reUploadStampImg.do?renameFileName="+renameFileName;
        }
    	
    	// 업로드 완료버튼 클릭시 => 자르기를 하지 않았을 경우도 고려해야 겠군
        function sigCutSubmit(){
    		if($('#x1').val().trim()==''){
    			var isNotCut = confirm('이미지를 그대로 업로드 하시겠습니까?');    			
    			if(!isNotCut){
	            	return false;
	            }
    		}else{
	            var isCut = confirm('미리보기 화면의 이미지가 업로드됩니다. 계속하시겠습니까?');
	            if(!isCut){
	            	return false;
	            }
    		}
        }
    	
    	// 새로고침 막기
    	function doNotReload(){
		if( (event.ctrlKey == true && (event.keyCode == 78 || event.keyCode == 82)) //ctrl+N , ctrl+R
		|| (event.keyCode == 116) // function F5
		{
		event.keyCode = 0;
		event.cancelBubble = true;
		event.returnValue = false;
		}
		}
		document.onkeydown = doNotReload;
        
     	// 마이페이지 사이드 메뉴바 길이맞춰주는 함수(이 함수를 각페이지에 넣어주면 됨. .allWrap부분이 자신의 섹션 영역 선택자)
	    $(function(){
	        $('.myPage_sideNav_area').height($('.allWrap').height());
	    })
    </script>
</body>

</html>