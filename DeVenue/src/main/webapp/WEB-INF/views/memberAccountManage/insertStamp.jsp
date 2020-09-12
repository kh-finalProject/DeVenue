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

    <title>도장 이미지 업로드1</title>

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
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
    <script src="http://jcrop-cdn.tapmodo.com/v2.0.0-RC1/js/Jcrop.js"></script>
    <link rel="stylesheet" href="http://jcrop-cdn.tapmodo.com/v2.0.0-RC1/css/Jcrop.css" type="text/css">


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
                        <li role="presentation" class="step step1 active" style="">
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
                        <li role="presentation" class="step step3 disabled">
                            <div data-toggle="tab" aria-controls="step3" role="tab">
                                <span class="round-tab">3</span>
                                <p>이미지 자르기</p>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
            <!-- 각 단계 -->
            <form action="changeImgColor.do" method="post" enctype="multipart/form-data" id="stampImgUploadForm">
                <!-- 1단계 영역 -파일로부터 이미지 생성하여 흑백으로 변환 -->
                <div class="stamp_upload_area">
                    <div class="alert alert-info" role="alert" style="width: 80%; margin: auto;">
                        <table class="table-sm" border="0"
                            style="margin: 0px; width: auto; background-color: inherit; border-color: #856404; color: inherit;">
                            <thead>
                                <tr>
                                    <th scope="col" colspan="2">
                                        <svg width="1.2em" height="1.2em" style="position: relative; top: -2px;"
                                            viewBox="0 0 16 16" class="bi bi-exclamation-octagon-fill"
                                            fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                            <path fill-rule="evenodd"
                                                d="M11.46.146A.5.5 0 0 0 11.107 0H4.893a.5.5 0 0 0-.353.146L.146 4.54A.5.5 0 0 0 0 4.893v6.214a.5.5 0 0 0 .146.353l4.394 4.394a.5.5 0 0 0 .353.146h6.214a.5.5 0 0 0 .353-.146l4.394-4.394a.5.5 0 0 0 .146-.353V4.893a.5.5 0 0 0-.146-.353L11.46.146zM8 4a.905.905 0 0 0-.9.995l.35 3.507a.552.552 0 0 0 1.1 0l.35-3.507A.905.905 0 0 0 8 4zm.002 6a1 1 0 1 0 0 2 1 1 0 0 0 0-2z" />
                                        </svg>
                                    </th>
                                    <!-- <th scope="col"></th> -->
                                    <th scope="col">[ 서명 이미지 업로드 가이드 ]</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <!-- <td></td> -->
                                    <th scope="row" colspan="2" style="text-align: center;">1.</th>
                                    <td>흰색 배경 및 가운데에 서명이 위치한 이미지를 업로드해주세요.</td>
                                </tr>
                                <tr>
                                    <!-- <td></td> -->
                                    <th scope="row" colspan="2" style="text-align: center;">2.</th>
                                    <td><b>10MB 이하의 이미지 파일(.jpg, .jpeg, .png, .gif 등) 만</b> 업로드할 수 있습니다.</td>
                                </tr>
                                <tr>
                                    <!-- <td></td> -->
                                    <th scope="row" colspan="2" style="text-align: center;">3.</th>
                                    <td><b>올바른 방향의 이미지</b>가 아닐시, 서명이 기울어져 보일 수 있습니다.</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <table border="0" style="width: 80%; margin: auto; margin-top: 30px; margin-bottom: 40px;">
                        <tr>
                            <td style="font-size: 15px; width: 110px;"><span style="color: orange;">*</span> 이미지 첨부</td>
                            <td style="padding-bottom: 0px;">
                                <div class="input-group mb-3" style="max-width: 450px; margin:0px !important;">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text" id="inputGroupFileAddon01"
                                            style="font-size: 14px;">업로드</span>
                                    </div>
                                    <div class="custom-file">
                                        <input type="file" class="custom-file-input" name="stampFile" id="input_file"
                                            aria-describedby="inputGroupFileAddon01">
                                        <label id="fileLabel" class="custom-file-label" for="inputGroupFile01"
                                            style="overflow:hidden; text-overflow: ellipsis; min-width: 100px; white-space: nowrap;">사용할
                                            <b style="margin:0px;padding: 0px;">'서명 이미지'</b>를 첨부해 주세요</label>
                                    </div>
                                </div>
                            </td>
                        </tr>
                    </table>
                    <hr style="border-style: dashed; border-color: gray;">
                    <div style="width: 100%; text-align: right; margin-top: 20px; margin-bottom: 10px;">
                        <!-- 이미지 업로드일 경우 버튼 : 이미지로 변환 후 저장 -->
                        <button onclick="toColorChange();" type="button" class="btn btn-info" style="font-size: 14px;">다음 단계</button>
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
            // 이미지 업로드 될 시 사용자에게 보일 라벨 문구 변환
            $('input[type=file]').change(function () {
                if ($(this).val() != null && $(this).val().length != 0) {
                    $(this).siblings('#fileLabel').text($(this).val());
                } else if ($(this).val() == "") {
                    $(this).val() == null;
                    $(this).siblings('#fileLabel').html("사용할 <b style='margin:0px;padding: 0px;'>'서명 이미지'</b>를 첨부해 주세요");
                }
            })

            // 스텝에 css 설정. 현재단계(active) 속성을 가지고 있는 것을 설정
            $('.step.active .round-tab').css('background-color', '#17a2b8');

            // 기본적으로 1단계 이외는 숨겨주기
            // $('.stamp_controll_area').hide();
            // $('.stamp_cut_area').hide();

            //이미지 콘트라스트 변경
            $('#rangeCont').change(function(){
                alert($(this).val())
                $('#img_preview').css('filter', 'contrast(' + $(this).val() +'%)');
                var opt = { img: $('#img_preview'), w: 200, h: 200 };
                $('#input_file').setPreview(opt, $(this).val());
            })

          // callback function
            var showCoords = function(c)
            {
                $('#x').val(c.x);
                $('#y').val(c.y);
                $('#w').val(c.w);
                $('#h').val(c.h);
            };

            // JCrop 호출
            // $('#img').Jcrop({
            //     setSelect: [0,0,50,50],
            //     onChange: showCoords,
            //     onSelect: showCoords
            // });
            // $ (function () {$('#img'). Jcrop ();});
        })
        
		// 이미지 첨부하여 다음단계 누르면 서버로 이미지를 넘겨서 컬러변환해줌
		function toColorChange(){
        	//업로드 안했으면 submit 혹은 ajax 못가게 리턴
            if($('#input_file').val() == null || $('#input_file').val().length == 0){
                alert('파일을 첨부하셔야 합니다.');
                return;
            }
        	
        	$('#stampImgUploadForm').submit();
        }
		
        // 이미지 첨부단계에서 대비 조정 단계로
        function toContrastFix() {
           
            //ajax로 자바단에서 색변환해주고, (배경은 하얀색으로, 나머진 빨강으로)

            //스텝 변환해주고
            $('.step1').removeClass('active');
            $('.step2').addClass('active');
            //div 전환해주기
            $('.stamp_controll_area').show();
            $('.stamp_upload_area').hide();
            //레인지 클릭해서 콘트라스트 조절
            $('#rangeCont').change();
        }
        // 대비 조정 단계에서 자르기 단계로
        function toCutFix(){
            $('.stamp_controll_area').hide();
            $('.stamp_cut_area').show();
        }
        // 다시 첨부하기
        function reUpload(){
            $('#input_file').val(null);
            $('#input_file').siblings('#fileLabel').html("사용할 <b style='margin:0px;padding: 0px;'>'서명 이미지'</b>를 첨부해 주세요");
            $('#img_preview').prop('src', false);
            $('.step1').addClass('active');
            $('.step2').removeClass('active');
            $('.stamp_controll_area').hide();
            $('.stamp_upload_area').show();
        }
        // 업로드 완료
        function sigUpload(){
            alert();
        }

        // 이미지를 만들어 이미지 뷰에 넣어주기
        // (이미지 업로드하여 흑백으로 변환 후 이미지 태그에 넣어주기)-----------
        $.fn.setPreview = function (opt, contrast) {
            "use strict"
            var defaultOpt = {
                inputFile: $(this),
                img: null,
                w: 200,
                h: 200
            };
            $.extend(defaultOpt, opt);

            var previewImage = function () {
                if (!defaultOpt.inputFile || !defaultOpt.img) return;
                var inputFile = defaultOpt.inputFile.get(0);
                var img = defaultOpt.img.get(0);
                // FileReader 
                if (window.FileReader) {
                    // image 파일만 
                    if (!inputFile.files[0].type.match(/image\//)) return;
                    // preview 
                    try {
                        var reader = new FileReader();
                        reader.onload = function (e) {
                            img.src = e.target.result;
                            img.style.width = defaultOpt.w + 'px';
                            img.style.height = defaultOpt.h + 'px';
                            img.style.display = '';
                        }
                        reader.readAsDataURL(inputFile.files[0]);
                    } catch (e) {
                        // exception... 
                    }
                    // img.filters (MSIE) 
                } else if (img.filters) {
                    inputFile.select();
                    inputFile.blur();
                    var imgSrc = document.selection.createRange().text;
                    img.style.width = defaultOpt.w + 'px';
                    img.style.height = defaultOpt.h + 'px';
                    img.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(enable='true',sizingMethod='scale',src=\"" + imgSrc + "\")";
                    img.style.display = '';

                    // no support 
                } else {
                    // Safari5, ... 
                }
            };
            // onchange 
            $(this).change(function () { previewImage(); });
        };

        $(document).ready(function () {
            var opt = { img: $('#img_preview'), w: 200, h: 200 };
            // $('#img').css('filter', 'grayscale(100%)');
            $('#input_file').setPreview(opt);
        });
		
     	// 마이페이지 사이드 메뉴바 길이맞춰주는 함수(이 함수를 각페이지에 넣어주면 됨. .allWrap부분이 자신의 섹션 영역 선택자)
	    $(function(){
	        $('.myPage_sideNav_area').height($('.allWrap').height());
	    })
    </script>
</body>

</html>