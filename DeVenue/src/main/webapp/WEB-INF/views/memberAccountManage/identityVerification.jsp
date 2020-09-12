<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

    <title>계정관리2 - 신원인증</title>

    <!-- Bootstrap core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom fonts for this template -->
    <!-- <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet">
    <link href="vendor/simple-line-icons/css/simple-line-icons.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic" rel="stylesheet"
        type="text/css"> -->

    <!--jQuery-->
    <script src="http://code.jquery.com/jquery-Latest.min.js"></script>

    <style>
        body {
            /* font-family: 'Lato', 'Helvetica Neue', Helvetica, Arial, sans-serif; */
            /* font-family: 'Jua', sans-serif; */
        }

        h1,
        h2,
        h3,
        h4,
        h5,
        h6 {
            /* font-family: 'Lato', 'Helvetica Neue', Helvetica, Arial, sans-serif; */
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
        /* 전체 컨텐츠의 타이틀 영역 --------------------------*/
        .basic_inform_title{
            /* background-color: #212426; */
            border-radius: 5px;
            border:1px solid gray;
            padding:15px;
            margin-bottom: 15px;
            background-color: #292e33;
        }
        /* 전체 타이틀의 메인 타이틀 */
        .basic_inform_title h4{
            margin-top: 5px;
            text-indent: 10px;
        }
        /* 전체 타이틀의 서브 타이틀 */
        .basic_inform_title p{
            margin-top: 15px;
            font-size: 14px;
            text-indent: 10px;
            color: rgb(189, 189, 189);
        }
        /* 신원 인증 가이드 영역 */
        .identify_guide{
            color: white; padding: 25px; border-radius: 5px; 
            border: 1px solid gray;
            margin-bottom: 15px;
        }
        .identify_guide_title{
            
        }
        .title_text1{
            font-weight: 550;
        }
        .title_text2{
            font-size: 14px; margin-top: 10px;
        }
        .identify_guide_table{
            background-color: #282b2e; margin-top: 10px; color: white !important;
        }
        /* 안내영역 각 td */
        .identify_guide_table td{
            padding: 15px;
        }

        /* 업로드 영역 테이블 */
        .identify_guide_table{
            
        }
        .identify_guide_table td{
            font-size: 12px;
        }
        .mentTitle{
            border-radius: 3px; font-size: 13px; font-weight: 550;
        }
        .memtContent{
            margin-top: 5px;
        }
        .guide_table_2{
            margin-top: 10px; font-size: 12px; background-color: #343a40;
        }
        .guide_table_2{

        }
        .guide_table_2 td:first-of-type{
            border-right: 1px solid rgb(255, 255, 255, 0.5);background-color: #2c2f33;
        }
        .reupload_possible_ment{
            font-size: 12px; color: #2793F2;
        }

        /* 신원인증 진행 상태 표시 영역 ------------- */
        .identify_status_area div{
            font-weight: 500;    
            font-size: 12px;
            text-align: center;
        }
        .alert{

        }
        .identify_status_area svg{
            margin-top: 10px;
            margin-bottom: 20px;
        }
        .alert label{
            font-size: 18px; font-weight: 550;
        }
        /* 신원인증 서류 업로드 영역----------------- */
        .identify_document_upload_area{
            text-align: left; border-radius: 5px; border: 1px solid gray; margin-top: 10px; margin-bottom: 20px; padding: 25px;
            background-color: #292e33;
            margin-top:20px !important;
            margin-bottom:20px !important;
        }
        .upload_title{
            font-weight: 550; font-size: 18px; margin-top:20px !important;
        }
        .iden_upload_table{
            margin:auto; text-align: left; margin-top: 5px;
        }
        .iden_upload_table td{
            padding: 10px;
        }
        .iden_upload_table td:first-of-type{
            font-weight: 550;
            position: relative;
        }
        .iden_upload_table tr td:first-of-type label{
            position: relative;
            top:7px;
        }
        .iden_upload_table tr:nth-of-type(3) td:first-of-type label{
            position: relative;
            top:-20px;
        }
        .iden_upload_table input{
            border-radius: 5px;
            border: none;
            height: 30px;
            text-indent: 5px;
            width: 100%;
        }
        .submitBtn{
            width: 100%; font-weight: 550;
        }
        .upload_detail_ment{
            font-size: 12px; color: #2793F2;
        }
        #inputGroupFileAddon01{
            font-size: 12px;
        }
    </style>
</head>

<body>
  	<jsp:include page="../common/menubar.jsp"/>
	<!-- sideMenubar -->
	<jsp:include page="../common/sideMenubarAll.jsp"/>
  	<jsp:include page="../common/pSideMenubar.jsp"/>
    <!-- 메뉴바 끝----------------------------------------------------------- -->

    <!-- Section -->
    <div class="allWrap">
        <div class="basic_inform_title">
            <h4>신원 인증</h4>
            <p>안전한 프로젝트 계약을 위해 신분증(사업자등록증)을 통한 신원 확인이 필요합니다.</p>
        </div>
        <div class="identify_guide">
            <div class="identify_guide_title">
                <div class="title_text1">[ 신원 인증 가이드 ]</div>
                <div class="title_text2">등록한 신원 인증 서류는 <a href="#">개인정보 처리방침</a>에 의해 관리됩니다.</div>
            </div>
            <table class="table identify_guide_table" border="0">
                <tbody>
                    <tr>
                        <th scope="row" class="table1Num">&nbsp;1</th>
                        <td >
                            <div class="mentTitle">신원 인증 서류 등록</div>
                            <div class="memtContent">프로젝트의 계약을 위해, <b>신원 인증 서류 등록이 꼭 필요합니다.</b></div>
                            <div>신원 인증 서류는 계약서 작성 시에 이용됩니다.</div>
                            <table class="guide_table_2" border="1">
                                <tr>
                                    <td>법인사업자, 개인사업자</td>
                                    <td>사업자등록증</td>
                                </tr>
                                <tr>
                                    <td>개인, 팀</td>
                                    <td>주민등록증 또는 운전면허증 앞뒷면</td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row">&nbsp;2</th>
                        <td>
                            <div>신원 인증 중</div>
                            <div>
                            신원 인증에는 <b style="color: #2793F2;">최대 24시간</b>이 소요됩니다.
                            신원 인증 서류에 문제가 있을 경우에는 위시켓 팀에서 이메일로 연락을 드립니다.
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row">&nbsp;3</th>
                        <td style="font-size: 12px;">
                            <div class="mentTitle">신원 인증 완료</div>
                            <div class="memtContent">
                            신원 인증이 완료되면 계약을 체결할 수 있으며, 완료 여부는 문자메시지와 이메일로 알려드립니다.
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"></th>
                        <td class="reupload_possible_ment">
                            ※&nbsp;주소지 변경이나 개명으로 세부 정보가 변경된 경우,
                            신원 인증 서류를 갱신하여 세부 정보를 수정할 수 있습니다
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="identify_document_upload_area" style="text-align: center; margin-top: 10px; font-size: 14px;">
	        <div class="identify_status_area">
	        	<c:if test="${iden.ideStatus eq 'BEFORE'}">
	            <!-- 신원인증 전인 경우 -->
	            <div class="alert alert-info basic_area" role="alert">
	                <svg width="1.5em" height="1.5em" style="position: relative; top:-2px;" viewBox="0 0 16 16" class="bi bi-exclamation-circle-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
	                    <path fill-rule="evenodd" d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM8 4a.905.905 0 0 0-.9.995l.35 3.507a.552.552 0 0 0 1.1 0l.35-3.507A.905.905 0 0 0 8 4zm.002 6a1 1 0 1 0 0 2 1 1 0 0 0 0-2z"/>
	                </svg>
	                <label>신원 인증 필요</label>
	                <br>하단의 사항을 기재 후, 가이드에 따른 서류를 업로드 해 주세요.
	            </div>
	        	</c:if>
	        	<c:if test="${iden.ideStatus eq 'ING'}">
	            <!-- 신원인증 진행중인 경우 나타남 -->
	            <div class="alert alert-info ing_area" role="alert">
	                <svg width="10em" height="10em" viewBox="0 0 16 16" class="bi bi-alarm" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
	                    <path fill-rule="evenodd" d="M8 15A6 6 0 1 0 8 3a6 6 0 0 0 0 12zm0 1A7 7 0 1 0 8 2a7 7 0 0 0 0 14z"/>
	                    <path fill-rule="evenodd" d="M8 4.5a.5.5 0 0 1 .5.5v4a.5.5 0 0 1-.053.224l-1.5 3a.5.5 0 1 1-.894-.448L7.5 8.882V5a.5.5 0 0 1 .5-.5z"/>
	                    <path d="M.86 5.387A2.5 2.5 0 1 1 4.387 1.86 8.035 8.035 0 0 0 .86 5.387zM11.613 1.86a2.5 2.5 0 1 1 3.527 3.527 8.035 8.035 0 0 0-3.527-3.527z"/>
	                    <path fill-rule="evenodd" d="M11.646 14.146a.5.5 0 0 1 .708 0l1 1a.5.5 0 0 1-.708.708l-1-1a.5.5 0 0 1 0-.708zm-7.292 0a.5.5 0 0 0-.708 0l-1 1a.5.5 0 0 0 .708.708l1-1a.5.5 0 0 0 0-.708zM5.5.5A.5.5 0 0 1 6 0h4a.5.5 0 0 1 0 1H6a.5.5 0 0 1-.5-.5z"/>
	                    <path d="M7 1h2v2H7V1z"/>
	                </svg><br>
	                <label>검수 중</label>
	                <br>디베뉴에서 신원 정보를 검수 중 입니다.
	                <br>최대 24시간이 소요 될 수 있으며, 미적합 시 재 인증 요청 연락을 드립니다
	                <br><button type="button" class="btn btn-info reUpBtn" id="reUploadIngBtn" style="margin-top:10px;">다시 등록하기</button>
	            </div>
	        	</c:if>
	        	<c:if test="${iden.ideStatus eq 'RE'}">
	            <!-- 신원인증 수락을 못받으면 나타남 -->
	            <div class="alert alert-warning reupload_area" role="alert">
	                <svg width="10em" height="10em" viewBox="0 0 16 16" class="bi bi-exclamation-diamond" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
	                    <path fill-rule="evenodd" d="M6.95.435c.58-.58 1.52-.58 2.1 0l6.515 6.516c.58.58.58 1.519 0 2.098L9.05 15.565c-.58.58-1.519.58-2.098 0L.435 9.05a1.482 1.482 0 0 1 0-2.098L6.95.435zm1.4.7a.495.495 0 0 0-.7 0L1.134 7.65a.495.495 0 0 0 0 .7l6.516 6.516a.495.495 0 0 0 .7 0l6.516-6.516a.495.495 0 0 0 0-.7L8.35 1.134z"/>
	                    <path d="M7.002 11a1 1 0 1 1 2 0 1 1 0 0 1-2 0zM7.1 4.995a.905.905 0 1 1 1.8 0l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 4.995z"/>
	                </svg><br>
	                <label>신원 인증 서류 재등록</label>
	                <div>신원 인증 서류를 재등록해주세요.</div>
	                <div>등록한 신원 인증 서류에 문제가 있어 신원 인증이 완료되지 않았습니다.</div>
	                <div>신원 인증 서류를 다시 등록해주세요.</div>
	            </div>
	        	</c:if>
	        	<c:if test="${iden.ideStatus eq 'COMPLETE'}">
	            <!-- 신원인증 완료된 경우 나타남 -->
	            <div class="alert alert-success success_area" role="alert">
	                <svg width="10em" height="10em" viewBox="0 0 16 16" class="bi bi-emoji-laughing" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
	                    <path fill-rule="evenodd" d="M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
	                    <path fill-rule="evenodd" d="M12.331 9.5a1 1 0 0 1 0 1A4.998 4.998 0 0 1 8 13a4.998 4.998 0 0 1-4.33-2.5A1 1 0 0 1 4.535 9h6.93a1 1 0 0 1 .866.5z"/>
	                    <path d="M7 6.5c0 .828-.448 0-1 0s-1 .828-1 0S5.448 5 6 5s1 .672 1 1.5zm4 0c0 .828-.448 0-1 0s-1 .828-1 0S9.448 5 10 5s1 .672 1 1.5z"/>
	                </svg><br>
	                <label>신원 인증 완료</label>
	                <br>*&nbsp;인증 갱신을 원하시면 다시 신청 해 주세요.
	                <br><button type="button" class="btn btn-success reUpBtn" id="reUploadConpleteBtn" style="margin-top:5px;">다시 등록하기</button>
	            </div>
	        	</c:if>
	        </div>
            <!-- 업로드 공간 -->
            <c:if test="${iden.ideStatus != 'ING' && iden.ideStatus != 'COMPLETE'}">
            <div class="upload_area">
                <label class="upload_title">신원 인증 서류 업로드</label>
                <form action="insertIden.do" method="post" enctype="multipart/form-data">
                    <table class="iden_upload_table" border="0">
                        <tr>
                            <td>
                                <label>성명</label>
                            </td>
                            <td>
                                <input type="text" name="idenName" class="idenName" id="idenNameInput" value="" required>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>주소지</label>
                            </td>
                            <td>
                                <input type="text" name="idenAddress" class="idenAdress" id="idenAdressInput" value="" required>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>* 신원 인증 서류 이미지</label>
                            </td>
                            <td>
                                <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                    <span class="input-group-text" id="inputGroupFileAddon01">업로드</span>
                                    </div>
                                    <div class="custom-file">
                                    <input type="file" class="custom-file-input" name="idenFile" id="inputGroupFile01" aria-describedby="inputGroupFileAddon01" required>
                                    <label class="custom-file-label" for="inputGroupFile01">Choose file</label>
                                    </div>
                                </div>
                                <div class="upload_detail_ment">※&nbsp;주민등록증 또는 운전면허증의 앞뒷면을 모두 등록해주세요.</div>
                                <div  class="upload_detail_ment">※&nbsp;이미지 파일(.jpg, .jpeg, .png, .gif 등)만 등록할 수 있습니다.</div>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <button type="submit" class="btn btn-success submitBtn">등록 완료</button>
                            </td>
                        </tr>
                    </table>
                </form>
            </div>
            </c:if>
        </div>
    </div>
	
	<!-- 풋터 가져오기  -->
    <jsp:include page="../common/footer.jsp"/>
    
    <script>
        $('.custom-file-input').change(function(){
            $('.custom-file-label').text($('.custom-file-input').val());
        });
        
        // 검수 중, 등록 완료의 경우에 등록 화면이 없는데, 재등록 버튼으로 기존 정보를 없애고 다시할 수 있게 함
        $('.reUpBtn').click(function(){
        	// 의사 재확인
        	var isReset = confirm('기존 등록정보를 삭제하고 재 등록 하시겠습니까?');
        	
        	if(isReset){
	        	// db에 접속해서 기존 정보를 지우고 검수 전 상태로 돌리고, 화면의 입력값을 지운다.(이건 submit 하면 알아서 될듯)
	        	location.href="resetIden.do?memId=${loginUser.memId}";
        	}
        });
        
    </script>
</body>

</html>