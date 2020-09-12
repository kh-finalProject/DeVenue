<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">

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

    <title>accountOption1 - 기본 정보 수정</title>

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
            background-color: #212426;
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

        /* 개인 css----------------------------------------------------------------- */
        /* 버튼 공통양식 - 수정 버튼 */
        .editBtn{
            position: absolute;
            right: 0px;
            z-index: 99;
            height: 35px;
            padding-top: 5px;
            font-size: 14px;
            font-weight: 700;
        }
        /* 버튼 공통양식 - 수정 완료 버튼 */
        .completeEditBtn{
            font-size: 15px;
            font-weight: 700;
            width: 100%;
        }

        /* 기본 정보 수정 */
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


        /* 전체 컨텐츠의 컨텐츠 영역 ---------------------------*/
        .basic_inform_content{
            background-color: #292e33;
            border-radius: 5px;
            border:1px solid gray;
            padding: 30px;
            margin-bottom: 50px;
        }

        /* 컨텐츠 1 - 계정 정보 영역(수정 불가 영역) */
        .account_inform{
            padding: 10px;
            border-bottom: 1px dashed gray;
        }
        /* 계정정보영역 타이틀 영역 */
        .account_inform_title{
            /* background-color: teal; */
            font-weight: 700;
        }
        /* 계정정보영역 타이틀 영역의 문구*/
        .account_inform_title label{
            font-size: 18px;
        }
        /* 계정정보영역 컨텐츠 영역 - 테이블 */
        .account_inform_table{
            margin: auto;
        }
        /* 테이블의 각 td */
        .account_inform_table td{
            padding: 10px;
            font-size: 15px;
        }

        /* 컨텐츠 2 - 기본 정보 영역(수정 가능 영역) */
        .img-thumbnail{
        	border-radius:50% !important;
        	min-height:200px;
        	min-width:200px;
        }
        /* 기본 정보영역 전체 */
        .basic_inform{
            /* background-color: teal; */
            padding: 10px;
            border-bottom: 1px dashed gray;
            margin-top: 10px;
            padding-bottom: 40px;
        }
        /* 기본 정보영역 타이틀 영역(타이틀, 버튼) */
        .basic_inform_content_title{
            font-weight: 700;
            position: relative;
        }
        /* 기본 정보영역 타이틀 영역 문구 */
        .basic_inform_content_title label{
            font-size: 18px;
        }
        /* 기본 정보영역 타이틀 영역 수정 버튼 => 공통양식과 합쳐져서 존재*/
        .basic_inform_content_title .editBtn{

        }
        /* 기본 정보영역 내용 - 테이블 */
        .basic_inform_content_table{
            margin: auto;
            width: 90%;
            border-top:1px solid #212426;
        }
        /* 기본 정보영역 테이블 각 td */
        .basic_inform_content_table td{
            padding: 8px;
        }
        .basic_inform_content_table td:first-of-type{
            text-align: right;
            color:lightgray;
            width:50%;
        }
        /* 기본 정보영역 프사 영역 업로드 버튼*/
        .uploadFileBtn{
            font-size: 12px;
            margin:auto;
            margin-top: 5px;
        }
        /* 파일 업로드 경로 라벨 */
        .basic_inform_content_table .text-center label{
            font-size: 14px;
            margin-left: 5px;
            position: relative;
            top:3px;
        }
        /* 기본 정보 각 타이틀 설정 */
        .basic_inform_content_table tr:not(:first-of-type) td:first-of-type
        {
            font-size: 14px;
            font-weight: 550;
        }
        /* 보더 없애기 */
        .basic_inform_content_table tr:first-of-type td
        {
            border-left:1px solid #292e33;
            border-right:1px solid #292e33;
            border-top: 1px solid #292e33;
        }
        /* 세로 수평이 안맞는 td 조정 */
        .basic_inform_content_table tr:nth-of-type(2) td:first-of-type label 
        ,.basic_inform_content_table tr:nth-of-type(3) td:first-of-type label
        ,.basic_inform_content_table tr:nth-of-type(4) td:first-of-type label
        ,.basic_inform_content_table tr:nth-of-type(5) td:first-of-type label
        ,.basic_inform_content_table tr:nth-of-type(6) td:first-of-type label
        ,.basic_inform_content_table tr:nth-of-type(6) td:first-of-type label
        ,.basic_inform_content_table tr:nth-of-type(6) td:first-of-type label
        {
            margin-bottom: 0px !important;
        }
        /* 기본 정보 타이틀,프로필부분 제외 문구 설정 */
        .basic_inform_content_table tr:not(:first-of-type) td:last-of-type label
        {
            font-size: 13px;
            font-weight: 550;
        }
        /* 기본 정보 갹 박스형 input 태그 설정 */
        .basic_inform_content_table input[type="text"]
        ,.basic_inform_content_table input[type="email"]{
            border: 1px solid lightgray;
            border-radius: 3px;
            text-indent: 10px;
        }
        .basic_inform_content_table input[type="radio"]{
            margin-right: 3px;
        }
        .basic_inform_content_table input[type="radio"] + label{
            margin-right: 10px;
        }
        .basic_inform_content_table input[type="checkbox"]{
            margin-right: 3px;
        }
        /* 각 드롭다운 목록 설정 */
        .basic_inform_content_table select{
            border: 1px solid lightgray;
            border-radius: 3px;
            text-indent: 3px;
            height: 30px;
            font-size: 14px;
        }
        .basic_inform_content_table option{
            border: 1px solid lightgray;
            text-indent: 5px;
            font-size: 12px;
            background-color: oldlace;
        }
        /* 우편번호 검색 버튼 */
        .addSearchBtn{
            padding: 6px;
            padding-left: 10px;
            padding-right: 10px;
            font-size: 12px;
            border:none;
            border-radius: 3px;
            font-weight: 550;
            background-color: #17a2b8;
            color:white;
            position: relative;
            top:-2px;
        }
        /* 기본정보의 수정 완료 버튼 */
        .basic_inform_content_table .completeEditBtn{
            width: 80%;
        }
        /* 정보 미입력 텍스트!!!!!!!!!!!!!!!!!!!!!!!!!! */
        .bHasNoInfo{
            font-size: 12px;
            color:#2793F2;
            position: relative;
            top:-1px;
        }

        /* 연락처 정보 전체 영역 ----------------------------- */
         /* 정보 미입력 텍스트!!!!!!!!!!!!!!!!!!!!!!!!!! */
        .cHasNoInfo{
        	font-size: 12px;
            color:#2793F2;
            position: relative;
            top:-1px;
        }
        .contect_inform{
            padding: 10px;
            border-bottom: 1px dashed gray;
            margin-top: 10px;
            padding-bottom: 40px;
        }
        /* 연락처 정보 타이틀 영역 */
        .contect_title_area{
            font-weight: 700;
            position: relative;
        }
        /* 연락처 정보영역 타이틀 영역 문구 */
        .contect_title_area label{
            font-size: 18px;
        }
         /* 연락처 정보영역 타이틀 영역 수정 버튼 */
        .contect_inform button{
            height: 30px;
            padding-top: 4px;
        }
        /* 연락처 정보 테이블 영역 */
        .context_inform_table{
            margin: auto;
        }
        /* 연락처 정보영역 테이블 각 td */
        .context_inform_table td{
            padding: 8px;
        }
        /* 연락처 정보 서브 타이틀 */
        .context_inform_table td:first-of-type{
            width:100px;
            font-size: 14px;
            font-weight: 550;
            position: relative;
        }
        .context_inform_table td:first-of-type label{
            position: relative;
            top:3px;
        }
        /* 연락처 input 및 select 작은 사이즈 설정 */
        .smallSelect{
            width: 22%;
            height: 25px;
            font-size: 12px;
        }
        /* 연락처 input 및 select 큰 사이즈 설정 */
        .bigSelect{
            width: 180px;
            height: 25px;
            font-size: 12px;
        }
        /* 연락처 내용 뷰 */
        .contectView{
            font-size: 13px;
            font-weight: 550;
            color:white;
        }

        /* 계좌 관리 영역--------------------------------------------- */
        .money_account_inform{
            padding: 10px;
            margin-top: 10px;
            padding-bottom: 30px;
        }
        /* 계좌 관리 타이틀 영역 */
        .money_account_title_area{
            font-weight: 700;
            position: relative;
            margin-bottom: 10px;
        }
        /* 계좌 관리 첫번째 문구 */
        .money_account_title_area label:first-of-type{
            font-size: 18px;
        }
        /* 계좌 관리 영역 버튼 */
        .money_account_title_area button{
            top:-2px;
        }

        /* 게좌 관리 영역 테이블 */
        .money_account_table{
            margin: auto;
        }
        /* 게좌 관리 정보영역 테이블 각 td */
        .money_account_table td{
            padding: 8px;
        }
        /* 게좌 관리 정보 서브 타이틀 */
        .money_account_table td:first-of-type{
            width:100px;
            font-size: 14px;
            font-weight: 550;
            position: relative;
        }
        .money_account_table td:first-of-type label{
            position: relative;
            top:3px;
        }
        /* 게좌 관리 input 및 select 중간쯤되는 사이즈 설정 */
        .middleSelect{
            width: 50%;
            height: 25px;
            font-size: 12px;
        }
        /* 게좌 관리 input 및 select 큰 사이즈 설정 */
        .bigSelect{
            width: 180px;
            height: 25px;
            font-size: 12px;
        }
        /* 게좌 관리 내용 뷰 */
        .accountView{
            font-size: 13px;
            font-weight: 550;
            color:white;
        }
        /* 계좌 정보 미입력 텍스트!!!!!!!!!!!!!!!!!!!!!!!!!! */
        .aHasNoInfo{
            font-size: 12px;
            color:#2793F2;
            position: relative;
            top:-1px;
        }
    </style>

    <script src="https://kit.fontawesome.com/4b6b63d8f6.js" crossorigin="anonymous"></script>

    <!--font-->
    <link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
</head>

<body>

  	<jsp:include page="../common/menubar.jsp"/>
	<!-- sideMenubar -->
	<jsp:include page="../common/sideMenubarAll.jsp"/>
  	<jsp:include page="../common/pSideMenubar.jsp"/>
    <!-- 메뉴바 끝----------------------------------------------------------- -->

    <!-- Section -->
    <div class="allWrap" >
        <div class="basic_inform_title">
            <h4>기본 정보 수정</h4>
            <p>계정의 기본 정보들을 수정할 수 있습니다.</p>
        </div>
        <div class="basic_inform_content">
            <div class="account_inform">
                <div class="account_inform_title">
                    <label>계정 정보</label>
                </div>
                <table border="0" class="account_inform_table">
                    <tr>
                        <td><label>닉네임</label></td>
                        <td><label>${loginUser.memNick }</label></td>
                    </tr>
                    <tr>
                        <td><label>이메일</label></td>
                        <td><label>${loginUser.memEmail }</label></td>
                    </tr>
                </table>
            </div>
            <div class="basic_inform">
                <div class="basic_inform_content_title">
                    <label>기본 정보</label>
                    <button type="button" class="btn btn-info editBtn" id="basicEditBtn">수정</button>
                </div>
                <form action="basicInfoUpdate.do" method="post" enctype="multipart/form-data" accept-charset="UTF-8
                ">
                    <table class="basic_inform_content_table" border="0" style="border-radius: 5px;">
                        <tr>
                            <td colspan="2">
                                <div class="text-center">
                                	<c:if test="${mbi.proImgName != null}">
	                                    <img id="changeImg" style="margin-bottom:5px;" src="${pageContext.servletContext.contextPath }/resources/proImg/${mbi.proImgName}" class="avatar img-circle img-thumbnail" id="profileImg" alt="avatar" width="200px" height="200px" style="max-width: 100%;">
                                	</c:if>
                                	<c:if test="${mbi.proImgName == null}">
	                                    <img id="changeImg" style="margin-bottom:5px;" src="${pageContext.servletContext.contextPath }/resources/proImg/user7.png" class="avatar img-circle img-thumbnail" id="profileImg" alt="avatar" width="200px" height="200px" style="max-width: 100%;">
	                                    <br>&nbsp;&nbsp;<label class="bHasNoInfo">프로필 사진 등록이 필요합니다!</label>
                                	</c:if>
                                    <br><button type="button" class="btn btn-info uploadFileBtn" onclick="newProfileImg();">Upload Profile</button>
                                    <label class="fileNameLabel"></label>
                                    <input id="profileImg_upload_input" type="file" name="profileImg" class="text-center center-block file-upload" style="visibility: hidden; position: absolute;" accept="image/x-png,image/gif,image/jpeg">
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>회원 형태</label>
                            </td>
                            <td id="clientTypeRow">
                                <select name="mtCode" class="" style="width:130px;">
                                    <option selected disabled>--</option>
                                    <c:forEach var="i" begin="0" end="${memTypes.size()-1 }" step="1">
		                            	<c:if test="${mbi.mtName == memTypes[i].memTypeKind }">
		                            		<c:set var = "isSelected" value="selected"/>
		                                </c:if>
            	                        	<option value="${memTypes[i].memTypeCode }" ${isSelected }>${memTypes[i].memTypeKind }</option>
    		                                <c:set var = "isSelected" value=""/>
                                    </c:forEach>
                                </select>
                                <c:if test="${mbi.mtName != null}">
                                	<label class="basicView">${mbi.mtName }</label>
                                </c:if>
                                <c:if test="${mbi.mtName == null}">
                                	<label class="basicView"></label>
                                </c:if>
                                <label class="bHasNoInfo">정보 미입력</label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>이름</label>
                            </td>
                            <td id="userNameRow">
                                <c:if test="${mbi.memName != null}">
	                                <input type="text" name="name" class="" id="" value="${mbi.memName }" size="13">
                                	<label class="basicView">${mbi.memName }</label>
                                </c:if>
                                <c:if test="${mbi.memName == null}">
                                	<input type="text" name="name" class="" id="" value="" size="13">
                                	<label class="basicView"></label>
                                </c:if>
                                <label class="bHasNoInfo">정보 미입력</label>
                            </td>
                        </tr>
                        <tr>
                            <td>우편번호</td>
                            <td id="post1Row">
                                <c:if test="${mbi.address1 != null}">
	                                <input type="text" name="address1" class="postcodify_postcode5" value="${mbi.address1 }" size="13">
	                                <button type="button" id="postcodify_search_button" class="addSearchBtn">검색</button>
                                	<label class="basicView">${mbi.address1 }</label>
                                </c:if>
                                <c:if test="${mbi.address1 == null}">
	                                <input type="text" name="address1" class="postcodify_postcode5" value="" size="13">
	                                <button type="button" id="postcodify_search_button" class="addSearchBtn">검색</button>
                                	<label class="basicView"></label>
                                </c:if>
                                <label class="bHasNoInfo">정보 미입력</label>
                            </td>
                        </tr>
                        <tr>
                            <td>도로명 주소</td>
                            <td id="post2Row">
                                <c:if test="${mbi.address2 != null}">
	                                <input type="text" name="address2" class="postcodify_address" value="${mbi.address2 }" size="38">
                                	<label class="basicView">${mbi.address2 }</label>
                                </c:if>
                                <c:if test="${mbi.address2 == null}">
	                                <input type="text" name="address2" class="postcodify_address" value="" size="38">
                                	<label class="basicView"></label>
                                </c:if>
                                <label class="bHasNoInfo">정보 미입력</label>
                            </td>
                        </tr>
                        <tr>
                            <td>상세 주소</td>
                            <td id="post3Row">
                                <c:if test="${mbi.address3 != null}">
	                                <input type="text" name="address3" class="" value="${mbi.address3 }" size="38">
                                	<label class="basicView">${mbi.address3 }</label>
                                </c:if>
                                <c:if test="${mbi.address3 == null}">
	                                <input type="text" name="address3" class="" value="" size="38">
                                	<label class="basicView"></label>
                                </c:if>
                                <label class="bHasNoInfo">정보 미입력</label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>세금계산서용 이메일</label>
                            </td>
                            <td id="emailRow">
                                <c:if test="${mbi.taxEmail != null}">
	                                <input type="email" name="email" class="" id="" value="${mbi.taxEmail }" size="38">
	                                <label class="basicView">${mbi.taxEmail }</label>
                                </c:if>
                                <c:if test="${mbi.taxEmail == null}">
	                                <input type="email" name="email" class="" id="" value="" size="38">
                                	<label class="basicView"></label>
                                </c:if>
                                <label class="bHasNoInfo">정보 미입력</label>
                            </td>
                        </tr>
                        <tr align="center" id="bEditCompleteRow">
                            <td colspan="2" align="center" style="text-align: center;">
                                <button type="submit" class="btn btn-success completeEditBtn" id="basicComEditBtn">수정 완료</button>
                            </td>
                        </tr>
                    </table>
                </form>
            </div>
            <hr>
            <div class="contect_inform">
                <div class="contect_title_area" style="position: relative;">
                    <label>연락처 정보</label>
                    <button type="button" class="btn btn-info editBtn" id="contextEditBtn">수정</button>
                </div>
                <form action="updatePhoneInfo.do" method="get">
                    <table border="0" class="context_inform_table">
                        <tr>
                            <td>
                                <label>핸드폰 번호</label>
                            </td>
                            <td id="portablePhoneRow">
                                <c:if test="${mbi.cellPhone != null}">
                                	<c:set var="seper" value=","/>
                                	<c:set var="cellPhoneSplit" value="${fn:split(mbi.cellPhone, seper) }"/>
	                                <select name="cellPhone0" class="smallSelect" id="cellPhoneNationSelect">
	                                    <option selected value="korea">국내</option>
	                                    <option value="overseas">해외</option>
	                                </select>
	                                <select name="cellPhone1" class="smallSelect" id="cellPhoneSelect">
	                                    <option selected value="010">010</option>
	                                    <option value="011">011</option>
	                                    <option value="016">016</option>
	                                    <option value="017">017</option>
	                                    <option value="018">018</option>
	                                    <option value="019">019</option>
	                                </select>
	                                <span>-</span>
	                                <input type="text" name="cellPhone2" class="smallSelect" id="" value="${cellPhoneSplit[2] }" pattern="[0-9]{4}">
	                                <span>-</span>
	                                <input type="text" name="cellPhone3" class="smallSelect" id="" value="${cellPhoneSplit[3] }" pattern="[0-9]{4}">
	                                <label class="contectView">${cellPhoneSplit[1] }-${cellPhoneSplit[2] }-${cellPhoneSplit[3] }</label>
                                </c:if>
                                <c:if test="${mbi.cellPhone == null}">
                        		    <select name="cellPhone0" class="smallSelect">
	                                    <option selected value="korea">국내</option>
	                                    <option value="overseas">해외</option>
	                                </select>
	                                <select name="cellPhone1" class="smallSelect">
	                                    <option selected value="010">010</option>
	                                    <option value="011">011</option>
	                                    <option value="016">016</option>
	                                    <option value="017">017</option>
	                                    <option value="018">018</option>
	                                    <option value="019">019</option>
	                                </select>
	                                <span>-</span>
	                                <input type="text" name="cellPhone2" class="smallSelect" id="" value="" pattern="[0-9]{4}">
	                                <span>-</span>
	                                <input type="text" name="cellPhone3" class="smallSelect" id="" value="" pattern="[0-9]{4}">
                                	<label class="contectView"></label>
                                </c:if>
                                <label class="cHasNoInfo">정보 미입력</label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>전화번호</label>
                            </td>
                            <td id="homePhoneRow">
                                <select name="homePhone1" class="smallSelect" id="phoneSelect">
                                    <option selected value="02">02</option>
                                    <option value="031">031</option>
                                    <option value="032">032</option>
                                    <option value="033">033</option>
                                    <option value="041">041</option>
                                    <option value="042">042</option>
                                    <option value="043">043</option>
                                    <option value="044">044</option>
                                    <option value="051">051</option>
                                    <option value="052">052</option>
                                    <option value="053">053</option>
                                    <option value="054">054</option>
                                    <option value="055">055</option>
                                    <option value="061">061</option>
                                    <option value="062">062</option>
                                    <option value="063">063</option>
                                    <option value="064">064</option>
                                    <option value=" ">해외</option>
                                </select>
                                <span>-</span>
                                <c:if test="${mbi.phone != null}">
                                	<c:set var="seper" value=","/>
                                	<c:set var="exceptLocal" value="${fn:split(mbi.phone, seper) }"/>
	                                <input type="text" name="homePhone2" class="bigSelect" id="" value="${exceptLocal[1] }"  pattern="[0-9]{0,}">
	                                <label class="contectView">${exceptLocal[0] }-${exceptLocal[1] }</label>
                                </c:if>
                                <c:if test="${mbi.phone == null}">
	                                <input type="text" name="homePhone2" class="bigSelect" id="" value=""  pattern="[0-9]{0,}">
                                	<label class="contectView"></label>
                                </c:if>
                                <label class="cHasNoInfo">정보 미입력</label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>팩스 번호</label>
                            </td>
                            <td id="faxPhoneRow">
                                <c:if test="${mbi.faxNo != null}">
	                                <input type="text" name="faxPhone" class="bigSelect" id="" value="${mbi.faxNo }"  pattern="[0-9]{0,}">
	                                <label class="contectView">${mbi.faxNo }</label>
                                </c:if>
                                <c:if test="${mbi.faxNo == null}">
	                                <input type="text" name="faxPhone" class="bigSelect" id="" value=""  pattern="[0-9]{0,}">
                                	<label class="contectView"></label>
                                </c:if>
                                <label class="cHasNoInfo">정보 미입력</label>
                            </td>
                        </tr>
                        <tr id="contectComEditRow">
                            <td colspan="2">
                                <button type="submit" class="btn btn-success completeEditBtn">수정 완료</button>
                            </td>
                        </tr>
                    </table>
                </form>
            </div>
            <hr>
            <div class="money_account_inform">
                <div class="money_account_title_area">
                    <label>계좌 관리</label>
                    <button type="button" class="btn btn-info editBtn" id="accountEditBtn">수정</button>
                    <!-- <br>
                    <label>프로젝트 대금을 지급받을 계좌 정보를 등록해주세요.</label> -->
                    <div class="alert alert-warning" role="alert" style="font-size: 13px; z-index: 99999;margin-top:5px;">
                        <svg width="1.5em" height="1.5em" style="position: relative; top:-2px;" viewBox="0 0 16 16" class="bi bi-exclamation-circle-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                            <path fill-rule="evenodd" d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM8 4a.905.905 0 0 0-.9.995l.35 3.507a.552.552 0 0 0 1.1 0l.35-3.507A.905.905 0 0 0 8 4zm.002 6a1 1 0 1 0 0 2 1 1 0 0 0 0-2z"/>
                        </svg>
                        &nbsp;&nbsp;프로젝트 대금을 지급받을 계좌 정보를 등록해주세요.
                    </div>
                </div>
                <form action="updateInsertAccountInfo.do" method="get">
                    <table border="0" class="money_account_table">
                        <tr>
                            <td>
                                <label>은행명</label>
                            </td>
                            <td id="bankNameRow">
                                <select name="bankName" class="middleSelect">
                                    <option selected disabled>은행 선택</option>
                                    <c:forEach var="i" begin="0" end="${banks.size()-1 }" step="1">
                                    	<c:if test="${mbi.bankName != null && mbi.bankName==banks[i].bankName}">
                                    		<c:set var="isbanked" value="selected"/>
	                                    </c:if>
                                    	<option value="${banks[i].bankId }" ${isbanked }>${banks[i].bankName }</option>
	                                    <c:set var="isbanked" value=""/>
                                    </c:forEach>
                                </select>
                                <c:if test="${mbi.bankName != null}">
                                	<label class="accountView">${mbi.bankName }</label>
                                </c:if>
                                <c:if test="${mbi.bankName == null}">
                                	<label class="accountView"></label>
                                </c:if>
                                <label class="aHasNoInfo">정보 미입력</label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>예금주</label>
                            </td>
                            <td id="accountUserNameRow">
                                <c:if test="${mbi.master != null}">
	                                <input type="text" name="master" class="bigSelect" id="" value="${mbi.master }">
	                                <label class="accountView">${mbi.master }</label>
                                </c:if>
                                <c:if test="${mbi.master == null}">
	                                <input type="text" name="master" class="bigSelect" id="" value="">
                                	<label class="accountView"></label>
                                </c:if>
                                <label class="aHasNoInfo">정보 미입력</label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>계좌번호</label>
                            </td>
                            <td id="accountNumRow">
                                <c:if test="${mbi.accNo != null}">
	                                <input type="number" name="acNum" class="bigSelect" id="" value="${mbi.accNo }">
	                                <label class="accountView">${mbi.accNo }</label>
                                </c:if>
                                <c:if test="${mbi.accNo == null}">
	                                <input type="number" name="acNum" class="bigSelect" id="" value="">
                                	<label class="accountView"></label>
                                </c:if>
                                <label class="aHasNoInfo">정보 미입력</label>
                            </td>
                        </tr>
                        <tr id="aCompBtnRow">
                            <td colspan="2">
                                <button type="submit" class="btn btn-success completeEditBtn">수정 완료</button>
                            </td>
                        </tr>
                    </table>
                </form>
            </div>
        </div>
    </div>
 	<!-- 풋터 가져오기  -->
    <jsp:include page="../common/footer.jsp"/>
	
    

    <!-- 개인 스크립트 -->
    <script>
    	// 존제하는 폰컬럼 데이터를 수정영역으로 옮길때, 셀렉트 부분도 옯겨지게 
	    $('#phoneSelect').find('option').each(function(index, item){
			if($(item).val()=='${exceptLocal[0]}'){
				$(item).prop('selected', 'selected');
				return false;
			}
		});
	 	// 존제하는 셀폰컬럼 데이터를 수정영역으로 옮길때, 셀렉트 부분도 옯겨지게(국내/해외 여부) 
	    $('#cellPhoneNationSelect').find('option').each(function(index, item){
			if($(item).val()=='${cellPhoneSplit[0]}'){
				$(item).prop('selected', 'selected');
				return false;
			}
		});
	 	// 존제하는 셀폰컬럼 데이터를 수정영역으로 옮길때, 셀렉트 부분도 옯겨지게 (휴대폰 맨앞자리)
	    $('#cellPhoneSelect').find('option').each(function(index, item){
			if($(item).val()=='${cellPhoneSplit[1]}'){
				$(item).prop('selected', 'selected');
				return false;
			}
		})
    	// 프로필 미리보기 설정?
    	$('input[name=profileImg]').change(function(){
    		var fileValue = $(this).val().split("\\");
			var originFileName = fileValue[fileValue.length-1];
    	});
	 	
        $(document).ready(function(){
            // 파일 업로드하면 파일경로를 확인할 수 있게
            // 웹단에선 사진이 저장이 안되니 구현하기 힘듬
        })
        $(function(){
            // 파일 업로드하면 파일경로를 확인할 수 있게
            $('#profileImg_upload_input').change(function(){
            });

            // 기본정보 수정버튼 누르면 수정 폼으로 변화
        
            $('.bHasNoInfo').hide();
            $('.uploadFileBtn').hide();
            if($('.fileNameLabel').text()==''){
                $('.fileNameLabel').parent().find('.bHasNoInfo').show();
            }else{
                $('.fileNameLabel').parent().find('.bHasNoInfo').hide();
            }
            $('.fileNameLabel').hide();
            $('#clientTypeRow *').hide();
            $('#userNameRow *').hide();
            $('#genderRow *').hide();
            $('#birthdayRow *').hide();
            $('#post1Row *').hide();
            $('#post2Row *').hide();
            $('#post3Row *').hide();
            $('#emailRow *').hide();
            $('#bEditCompleteRow').hide();
            $('.basicView').show();
            $('.basicView').each(function(index, item){
                if($(item).text() ==''){
                    $(item).hide();   
                    $(item).parent().find('.bHasNoInfo').show();
                }
            });
            $('#basicEditBtn').click(function(){
                if($(this).text() == '수정'){
                    $(this).text('취소');
                    $('.uploadFileBtn').show();
                    $('.fileNameLabel').show();
                    $('#clientTypeRow *').show();
                    $('#userNameRow *').show();
                    $('#genderRow *').show();
                    $('#birthdayRow *').show();
                    $('#post1Row *').show();
                    $('#post2Row *').show();
                    $('#post3Row *').show();
                    $('#emailRow *').show();
                    $('#bEditCompleteRow').show();
                    $('.bHasNoInfo').hide();
                    $('.basicView').hide();
                    $('.img-thumbnail').parent().find('.bHasNoInfo').hide();
                }else{
                    $(this).text('수정');
                    $('.uploadFileBtn').hide();
                    $('.fileNameLabel').hide();
                    $('#clientTypeRow *').hide();
                    $('#userNameRow *').hide();
                    $('#genderRow *').hide();
                    $('#birthdayRow *').hide();
                    $('#post1Row *').hide();
                    $('#post2Row *').hide();
                    $('#post3Row *').hide();
                    $('#emailRow *').hide();
                    $('#bEditCompleteRow').hide();
                    $('.bHasNoInfo').hide();
                    $('.basicView').show();
                    $('.basicView').each(function(index, item){
                        if($(item).text() ==''){
                            $(item).hide();   
                            $(item).parent().find('.bHasNoInfo').show();
                        }
                    });
                    $('.uploadFileBtn').hide();
                    if($('.fileNameLabel').text()==''){
                        $('.fileNameLabel').parent().find('.bHasNoInfo').show();
                    }else{
                        $('.fileNameLabel').parent().find('.bHasNoInfo').hide();
                    }
                }
            })

            // 연락처 정보 수정버튼 누르면 수정 폼으로 처리
            // ####
            $('#portablePhoneRow *').hide();
            $('#homePhoneRow *').hide();
            $('#faxPhoneRow *').hide();
            $('#contectComEditRow').hide();
            $('.cHasNoInfo').hide();
            $('.contectView').show();
            $('.contectView').each(function(index, item){
                if($(item).text() ==''){
                    $(item).hide();   
                    $(item).parent().find('.cHasNoInfo').show();
                }
            });
            $('#contextEditBtn').click(function(){
                if($(this).text() == '수정'){
                    $(this).text('취소');
                    $('#portablePhoneRow *').show();
                    $('#homePhoneRow *').show();
                    $('#faxPhoneRow *').show();
                    $('#contectComEditRow').show();
                    $('.cHasNoInfo').hide();
                    $('.contectView').hide();
                
                }else{
                    $(this).text('수정');
                    $('#portablePhoneRow *').hide();
                    $('#homePhoneRow *').hide();
                    $('#faxPhoneRow *').hide();
                    $('#contectComEditRow').hide();
                    $('.cHasNoInfo').hide();
                    $('.contectView').show();
                    $('.contectView').each(function(index, item){
                        if($(item).text() ==''){
                            $(item).hide();   
                            $(item).parent().find('.cHasNoInfo').show();
                        }
                    });
                }
            });

            // 계좌 관리 수정 폼으로 변환
            $('#accountNumRow *').hide();
            $('#accountUserNameRow *').hide();
            $('#bankNameRow *').hide();
            $('#aCompBtnRow').hide();
            $('.aHasNoInfo').hide();
            $('.accountView').show();
            $('.accountView').each(function(index, item){
                if($(item).text() ==''){
                    $(item).hide();   
                    $(item).parent().find('.aHasNoInfo').show();
                }
            });
            $('#accountEditBtn').click(function(){
                if($(this).text() == '수정'){
                    $(this).text('취소');
                    $('#accountNumRow *').show();
                    $('#accountUserNameRow *').show();
                    $('#bankNameRow *').show();
                    $('#aCompBtnRow').show();
                    $('.aHasNoInfo').hide();
                    $('.accountView').hide();
                
                }else{
                    $(this).text('수정');
                    $('#accountNumRow *').hide();
                    $('#accountUserNameRow *').hide();
                    $('#bankNameRow *').hide();
                    $('#aCompBtnRow').hide();
                    $('.aHasNoInfo').hide();
                    $('.accountView').show();
                    $('.accountView').each(function(index, item){
                        if($(item).text() ==''){
                            $(item).hide();   
                            $(item).parent().find('.aHasNoInfo').show();
                        }
                    });
                }
            });
        });
        
     // 마이페이지 사이드 메뉴바 길이맞춰주는 함수(이 함수를 각페이지에 넣어주면 됨. .allWrap부분이 자신의 섹션 영역 선택자)
     $(function(){
     	$('.myPage_sideNav_area').height($('.allWrap').height());
     })
     
     function newProfileImg(){
    	 $('#profileImg_upload_input').click();
     }
     
     $('#profileImg_upload_input').change(function(e){
    	 var get_file = e.target.files;
    	 
         var image = $('#noneImg');
  
         /* FileReader 객체 생성 */
         var reader = new FileReader();
  
         /* reader 시작시 함수 구현 */
         reader.onload = (function (aImg) {
             console.log(1);
  
             return function (e) {
                 console.log(3);
                 /* base64 인코딩 된 스트링 데이터 */
                 aImg.src = e.target.result
                 $('#changeImg').prop('src', aImg.src);
             }
         })(image)
  
         if(get_file){
             reader.readAsDataURL(get_file[0]);
             console.log(2);
         }
     })
    	 
    </script>
    	<!-- Postcodify를 로딩하자 -->
   <script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
	<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
   <script> $(function() { $("#postcodify_search_button").postcodifyPopUp(); }); </script>
</body>

</html>