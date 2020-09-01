<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

	<!--fontAwesome-->
    <script src="https://kit.fontawesome.com/4b6b63d8f6.js" crossorigin="anonymous"></script>

    <!-- 별점 아이콘 css-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    <!--fullCalendar-->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar@5.2.0/main.css">
    <script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.2.0/main.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.2.0/locales-all.js"></script>
    
    <script>



        document.addEventListener('DOMContentLoaded', function () {

            var calendarEl = document.getElementById('calendar');
            var calendar = new FullCalendar.Calendar(calendarEl, {
                initialView: 'dayGridMonth',
                selectable: true,
                unselectAuto: false,
                select: function (info) {

                    $("#startDate").val(info.startStr);

                    var yesterday = new Date(info.end.getTime());
                    yesterday.setDate(info.end.getDate() - 1);

                    var d = new Date(yesterday);
                    var month = "" + (d.getMonth() + 1);
                    var day = "" + d.getDate();
                    var year = "" + d.getFullYear();

                    if (month.length < 2) {
                        month = "0" + month;
                    }

                    if (day.length < 2) {
                        day = "0" + day;
                    }

                    var combine = year + "-" + month + "-" + day
                    console.log(combine);

                    $("#endDate").val(combine);

                    var one_day = 1000 * 60 * 60 * 24;
                    var date1 = info.start.getTime();
                    var date2 = info.end.getTime();

                    var diff = date2 - date1;

                    var result = Math.round(diff / one_day);

                    $("#duration").val(result);


                },
                locale: 'ko',
                dragScroll: true
            });
            calendar.render();
        });

    </script>
    
<title>Insert title here</title>

<style>
       
        /*body 색상*/
        main {
            background-color: #212529;
            color: white;
        }

        /*로그인 상태*/
        #detail_loginNotify {
            border: 1px solid #2793f2
        }

        /*badges*/
        .badge {
            font-size: 1rem;
        }

        /*예상 금액, 예상 기간 등*/
        .planned .card {
            margin-top: 2rem;
            margin-bottom: 2rem;
            background: none;
            border: 1px solid #2793F2;
        }

        .planned .card .card-title {
            margin-bottom: 0;
        }

        .negoNotify>div>div {
            text-align: center;
            background-color: skyblue;
        }

        .summary table tr td {
            padding-right: 2rem;
        }

        .summary table tr td span {
            padding-left: 0.625rem;
            color: #2793F2;
        }

        /*업무 내용*/
        .projectDetail {
            /* border-top: 1px solid white; */

            border: 1px solid #2793F2;
        }

        /*자세히 보기*/
        .jobDescription {
            display: none;
        }

        #showJD:hover {
            color: #2793F2;
        }

        #hideJD {
            display: none;
        }

        #hideJD:hover {
            color: #2793F2;
        }

        .jobDescription_detail>div {
            margin-bottom: 2rem;
        }

        .jobDescription_detail>div>p {
            margin-bottom: 0;
        }

        .techList>span {
            margin-right: 0.0625rem;
        }

        /*필수 항목 별*/
        .fa-star-of-life {
            color: pink;
            position: relative;
            bottom: 0.625rem;
            left: 0.625rem;
            font-size: 0.25rem;
        }

        /*지원양식*/

        h5 {
            border-bottom: 1px solid white;
        }

        .applicationForm {
            border: 1px solid pink;
        }

        #application{
            width: 100%;
        }

        .applicationForm div p {
            font-size: 0.75rem;
            color: gray;
        }

        /*이용요금 계산기*/
        #priceCalculator .modal-title {
            color: black;

        }

        #priceCalculator .modal-body {
            color: black;

        }

        #priceCalculator .modal-body div h6 {
            text-align: left;
        }


        .modal-text {
            font-size: 0.875rem;
            text-align: left;
        }

        #calResult {
            background-color: lightgray;
            border-top: 1px dashed grey;
            margin-top: 2.5rem;
            height: 3rem;
        }

        #receipt .row {
            padding-top: 1rem;
        }

        #receipt .row .col-md-8 {
            padding-right: 0;
        }

        #receipt .row .col-md-4 {
            padding-right: 0;
        }

        /*calendar 관련*/

        #calendarDisplay>label {
            margin-top: 1rem;
        }

        /*지원 내용*/

        #apply_textarea {
            background: none;
            color: white;
            font-size: 0.875rem;
        }


        #textareaAppendix {
            width: 100%;
            background-color: gray;
            font-size: 0.875rem;
            padding-left: 1rem;
            border-bottom-left-radius: 0.5rem;
            border-bottom-right-radius: 0.5rem;
        }

        #textareaAppendix>span {
            float: right;
            margin-right: 0.625rem;
        }

        /*지원 전 질문*/
        
        .applyQuestion i {
            color: #2793F2;
        }
        
        .qna textarea{
        	background: none;
            color: white;
            font-size: 0.875rem;
        }
        
        .qna textarea:focus{
        	background: none;
            color: white;
            font-size: 0.875rem;
        }


        /*포트폴리오 제출*/

        .portfolio {
            text-align: center;
            border: 1px solid #2793F2;
            border-radius: 0.25rem;
            padding-left: 0;
        }

        .portfolio>input {
            left: 1.5rem;
        }


        #potfolioExist_div {
            margin: 1rem;
            text-align: center;
        }

        #potfolioExist_div>p {
            margin-top: 1rem;
            color: white;
        }

        #potfolioNotExist_div {
            margin: 1rem;
            text-align: center;
        }

        #potfolioNotExist_div>p {
            margin-top: 1rem;
            color: white;
        }

        .uploadBox {
            border: dashed 1px grey;
            height: 6rem;
            vertical-align: middle;
            text-align: center;
        }

        .uploadBox i {
            vertical-align: middle;
        }

        /*포트폴리오 업로드 모달*/

        #portfolio_upload_modal .modal-title {
            color: black;
        }

        #portfolio_upload_modal .modal-body {
            color: black;
        }

        #portfolio_upload_modal_main_category>button {
            width: 10rem;
            text-align: left;
        }

        #portfolio_upload_modal_sub_category>button {
            width: 10rem;
            text-align: left;
        }

        #portfolio_upload_modal_list {
            height: 20rem;
            overflow-y: auto;
        }

        .portfolioPreview>img {
            object-fit: cover;
        }


        .portfolioList {
            border: 1px solid grey;
            border-radius: 0.25rem;
            margin-bottom: 1rem;
        }

        .portfolioList>.col-md-7 {
            margin-top: 1rem;
        }

        .portfolioList>.col-md-7>p {
            margin-bottom: 0;
        }

        .portfolioList>.col-md-5 {
            margin-top: 1rem;
            margin-bottom: 1rem;
        }

        .portfolioList>.col-md-7>textarea {
            margin-top: 1rem;
            width: 100%;
            background: none;
            font-size: 0.875rem;
        }

        /*포트폴리오 설명*/
        #portfolio_describe_textarea {
            background: none;
            color: white;
            font-size: 0.875rem;
        }

        #applicationSubmitArea {
            border-top: 1px dashed grey;
        }

        #applicationSubmitArea>div>button {
            margin-top: 1rem;
            margin-left: 0.5rem;
            margin-bottom: 1rem;
        }


        /*이력서 제출*/

        .resume {
            text-align: center;
            border: 1px solid #2793F2;
            border-radius: 0.25rem;
            padding-left: 0;
        }

        .resume>input {
            left: 1.5rem;
        }


        #resumeExist_div {
            margin: 1rem;
            text-align: center;
        }

        #resumeExist_div>p {
            margin-top: 1rem;
            color: white;
        }

        #resumeNotExist_div {
            margin: 1rem;
            text-align: center;
        }

        #resumeNotExist_div>p {
            margin-top: 1rem;
            color: white;
        }

        #resume_upload_detail div p{
            margin-bottom: 0;
        }

        #resume_upload{
           margin-top: 0;
        }

        /*사이드 바 공지사항*/
        #applySideNotice {

            position: fixed;
            margin-left: 1rem;
            width: 20rem;
            border: 1px solid #2793F2;
            border-radius: 0.25rem;
        }

        #applySideNotice>.row>.col-md-12{
            margin-top: 1rem;
            margin-bottom: 1rem;
        }

        #applySideNotice>.row>.col-md-12>i{
            margin-left: 1rem;
            margin-right: 1rem;
            color: #2793F2;
        }

        #applySideNotice>.row>.col-md-12>p{
            margin-left: 1rem;
        }

    </style>
</head>
<body>
<jsp:include page="../../common/menubar.jsp"></jsp:include>

<!--project detial 시작-->

    <!--project detial 시작-->

    <main>
        <div class="container-fluid">

            <!--Grid row 시작-->
            <div class="row mt-5">

                <div class="col-md-2 mb-4" style="text-align: center;">
                    
                </div>

                <!--Grid column 프로젝트 디테일 시작-->
                <div class="col-md-6 mb-4" style="width: 100%;height: 100%;">

                    <!--모집상태, 등록일자-->
                    <div class="row">

                        <div class="col-md-6">
                            <c:choose>
                       		<c:when test="${detail.project.proRecruit eq 'Y'}">
                       		<span class="badge badge-secondary">모집중</span>
                       		</c:when>
                       		<c:when test="${detail.project.proRecruit eq 'N'}">
                       		<span class="badge badge-success">모집마감</span>
                       		</c:when>
               				</c:choose>
               				
               				<jsp:useBean id="today" class="java.util.Date"/>
                       
			                <jsp:useBean id="aweekAgo" class="java.util.Date"/>
			                <jsp:setProperty property="time" name="aweekAgo" value="${today.time-(1000*60*60*24*7)}"/>
			                <fmt:formatDate value="${today}" pattern="yyyyMMdd" var="now"/>
			                <fmt:formatDate value="${aweekAgo}" pattern="yyyyMMdd" var="ago"/>
			                <fmt:formatDate value="${detail.project.proCreateDate}" pattern="yyyyMMdd" var="cdate"/>
			                       
			                <c:if test="${cdate eq now}">
			                    <span class="badge badge-info">TODAY</span>
			                </c:if>
			                <c:if test="${cdate lt now}">
			                   <c:if test="${cdate gt ago}">
			                    <span class="badge badge-info">NEW</span>
			                   </c:if>
			                </c:if>  
               				
                        </div>
                        <div class="col-md-6">
                            <div class="float-right">
                                <label class="text-muted">등록일자:</label>
                                <label class="text-muted">${detail.project.proCreateDate}</label>
                            </div>
                        </div>
                    </div>
                    <!--모집상태, 등록일자 끝-->

                    <!--프로젝트명 시작-->
                    <div class="row mt-3">
                        <div class="col-md-12">
                            <h4>${detail.project.proName}</h4>
                        </div>
                    </div>
                    <!--프로젝트명 끝-->

                    <!--카테고리 시작-->
                    <div class="row mt-3">
                        <div class="col-md-12">
                            <table>
                                <tr>
                                    <td><span class="badge badge-info">${detail.pList.workType}</span></td>
                                    <td style="border-right: 1px dashed white;"><label
                                            class="mt-2 ml-2 mr-2">${detail.pList.mCategory}</label></td>
                                    <td><label class="mt-2 ml-2">${detail.pList.dCategory}</label></td>
                                </tr>
                            </table>
                        </div>
                    </div>
                    <!--카테고리 끝-->

                    <!--예상금액/예상기간/지원자수-->
                    <div class="row mt-3 planned" style="border-top:1px solid white">

                        <div class="col-md-4">
                            <div class="card">
                                <div class="card-body">
                                    <p class="card-title float-left"><i class="fas fa-won-sign mr-2"></i>예상금액</p>
                                    <p class="card-text float-right"><strong><fmt:setLocale value="ko"/><fmt:formatNumber value="${detail.project.proPayment}" type="currency"/></strong>원</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="card">
                                <div class="card-body">
                                    <p class="card-title float-left"> <i class="far fa-clock mr-2"></i>예상기간</p>
                                    <p class="card-text float-right"><strong>${detail.project.proDuration}</strong>일</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="card">
                                <div class="card-body">
                                    <p class="card-title float-left"><i class="far fa-user mr-2"></i>지원자 수</p>
                                    <p class="card-text float-right"><strong>${detail.pList.applyNum}</strong>명</p>
                                </div>
                            </div>
                        </div>

                    </div>

                    <div class="row negoNotify">
                        <div class="col-md-12">
                            <div>
                                <label class="mt-2">
                                    <i class="fas fa-exclamation-circle"></i>
                                    금액과 기간 조율이 가능한 프로젝트입니다.
                                </label>
                            </div>
                        </div>
                    </div>
                    <!--예상금액/예상기간/지원자수 끝-->

                    <!--모집 세부 내용-->
                    <div class="row mt-3 summary">
                        <div class="col-md-12">
                            <table>
                                <tr>
                                    <td>모집마감일</td>
                                    <td>${detail.project.proREndDate}
                                        <span>*마감<strong>
                                        <fmt:parseNumber value="${(detail.project.proREndDate.time-today.time)/(1000*60*60*24)+1}" integerOnly="true"/>
                                        </strong>일 전</span>
                                    </td>
                                </tr>
                                <tr>
                                    <td>예상시작일</td>
                                    <td>${detail.project.proStartDate}</td>
                                </tr>
                                <tr>
                                    <td>진행분류</td>
                                    <c:choose>
			                        	<c:when test="${detail.project.proMaintain eq 'Y'}">
			                        		<td>운영 중인 서비스의 리뉴얼 또는 유지보수를 하려 합니다.</td>
			                        	</c:when>
			                        	<c:when test="${detail.project.proMaintain eq 'N'}">
			                        		<td>새로운 서비스를 신규 개발 하려 합니다.</td>
			                        	</c:when>
			                        </c:choose>
                                </tr>
                                <tr>
                                    <td>기획상태</td>
                                    <td><fmt:formatNumber type="percent" value="${detail.project.proPlanDetail/5}" maxIntegerDigits="3"/>
                                        <c:choose>
				                        	<c:when test="${detail.project.proPlanDetail lt 2}">
				                        		<span>*요구사항 정의서,제안 요청서</span>
				                        	</c:when>
				                        	<c:when test="${detail.project.proPlanDetail lt 4}">
				                        		<span>*요구사항 정의서,제안 요청서,메뉴 구조도</span>
				                        	</c:when>
				                        	<c:otherwise>
				                        		<span>*요구사항 정의서,제안 요청서,메뉴 구조도,화면 설계서</span>
				                        	</c:otherwise>
				                        </c:choose>
                                    </td>
                                </tr>
                                <tr>
                                    <td>매니징경험</td>
                                     <c:choose>
			                        	<c:when test="${detail.project.proManage eq 1}">
			                        		<td>프로젝트 매니징 경험 있음</td>
			                        	</c:when>
			                        	<c:when test="${detail.project.proManage eq 2}">
			                        		<td>프로젝트 매니징 경험 없음</td>
			                        	</c:when>
			                        	<c:otherwise>
			                        		<td></td>
			                        	</c:otherwise>
			                        </c:choose>
                                </tr>
                                <tr>
                                    <td>인력상황</td>
                                   <c:choose>
			                        	<c:when test="${detail.project.proHelp eq 1}">
			                        		<td>IT 프로젝트 경험 있는 인력 있음
			                           			 <span>*협력 가능 인력(개발자)</span>
			                       			 </td>
			                        	</c:when>
			                        	<c:when test="${detail.project.proHelp eq 2}">
			                        		<td>IT 프로젝트 경험 있는 인력 없음
			                           			 <span>*추후 투입 가능</span>
			                       			 </td>
			                        	</c:when>
			                        	<c:otherwise>
			                        		<td>IT 프로젝트 경험 있는 인력 없음
			                           			 <span>*추후 투입 가능</span>
			                       			</td>
			                        	</c:otherwise>
			                        </c:choose>
                                </tr>
                            </table>
                        </div>

                    </div>
                    <!--모집 세부 내용 끝-->
                    <div class="row">
                        <div class="col-md-12 mt-5">
                            <a id="showJD">자세히 보기</a>
                            <a id="hideJD">줄이기</a>
                        </div>
                    </div>

                    <script>
                        $("#showJD").click(function () {

                            $(".jobDescription").css("display", "block");
                            $(this).css("display", "none");
                            $("#hideJD").css("display", "block");
                        })

                        $("#hideJD").click(function () {
                            $(".jobDescription").css("display", "none");
                            $(this).css("display", "none");
                            $("#showJD").css("display", "block");
                        })
                    </script>


                    <!--업무 내용 시작-->
                    <div class="row mt-5 projectDetail jobDescription" style="display:none;">
                        <div class="mt-2 col-md-12">
                            <h5>업무 내용</h5>

                            <!--업무 내용 디테일 시작-->
                            <div class="mt-4 jobDescription_detail">
                                <!--프로젝트 개요-->
                                <div>
                                    <label class="text-muted">프로젝트 개요:</label>
                                    <p>${detail.project.proSummary}</p>
                                </div>

                                <!--프로젝트 우선순위-->
                                <div>
                                    <label class="text-muted">프로젝트 우선순위:</label>
                                    <c:choose>
				                    <c:when test="${detail.project.proPriority eq 1}">
				                    	 <p>프로젝트의 빠른 진행이 가장 중요합니다.</p>
				                    </c:when>
				                    <c:when test="${detail.project.proPriority eq 2}">
				                    	 <p>프로젝트의 완성도가 가장 중요합니다.</p>
				                    </c:when>
				                    <c:when test="${detail.project.proPriority eq 3}">
				                    	 <p>프로젝트의 금액 절감이 가장 중요합니다.</p>
				                    </c:when>
				                    <c:when test="${detail.project.proPriority eq 4}">
				                    	 <p>프로젝트의 기간 준수가 가장 중요합니다.</p>
				                    </c:when>
				                    <c:otherwise>
				                    	 <p>협의 가능</p>
				                    </c:otherwise>
				                    </c:choose>
                                </div>

                                <!--프로젝트 계약방식-->
                                <div>
                                    <label class="text-muted">계약방식:</label>
                                    <p>프로젝트 완료조건 계약(기간 베이스 아닙니다.)</p>
                                    <p>체제비 별도 지원 가능(금액은 협의)</p>
                                </div>

                                <!--현재 준비 상황-->
                                <div>
                                    <label class="text-muted">현재 준비 상황:</label>
                                    <div class="project_plan_progress" style="width: 20rem;">
                                        <div class="progress mt-1">
                                             <c:choose>
					                        <c:when test="${detail.project.proPlanDetail eq 1}">
					                        	 <div class="progress-bar bg-info" role="progressbar" style="width: 20%" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">
					                            	20%
					                          	</div>
					                        </c:when>
					                        <c:when test="${detail.project.proPlanDetail eq 2}">
					                        	 <div class="progress-bar bg-info" role="progressbar" style="width: 40%" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100">
					                            	40%
					                          	</div>
					                        </c:when>
					                        <c:when test="${detail.project.proPlanDetail eq 3}">
					                        	 <div class="progress-bar bg-info" role="progressbar" style="width: 60%" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100">
					                            	60%
					                          	</div>
					                        </c:when>
					                        <c:when test="${detail.project.proPlanDetail eq 4}">
					                        	 <div class="progress-bar bg-info" role="progressbar" style="width: 80%" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100">
					                            	80%
					                          	</div>
					                        </c:when>
					                        <c:when test="${detail.project.proPlanDetail eq 5}">
					                        	 <div class="progress-bar bg-info" role="progressbar" style="width: 98%" aria-valuenow="98" aria-valuemin="0" aria-valuemax="100">
					                            	98%
					                          	</div>
					                        </c:when>
					                        </c:choose>
                                        </div>
                                        <c:choose>
				                        	<c:when test="${detail.project.proPlanDetail eq 1}">
				                        		<p>아이디어만 있습니다.</p>
				                        	</c:when>
				                        	<c:when test="${detail.project.proPlanDetail eq 2}">
				                        		<p>필요한 내용들만 간단히 정리해 두었습니다.</p>
				                        	</c:when>
				                        	<c:when test="${detail.project.proPlanDetail eq 3}">
				                        		<p>필요한 내용들만 간단히 정리해 두었습니다.</p>
				                        	</c:when>
				                        	<c:when test="${detail.project.proPlanDetail eq 4}">
				                        		<p>상세한 기획 문서가 존재합니다.</p>
				                        	</c:when>
				                        	<c:when test="${detail.project.proPlanDetail eq 5}">
				                        		<p>상세한 기획 문서가 존재합니다.</p>
				                        	</c:when>
				                        </c:choose>
                                        <div id="downloadDocument">
                                            <a href="${contextPath}/resources/projectUpload/${detail.project.proPlanPaper}" download="${detail.project.proPlanRePaper}">프로젝트 관련 문서 다운로드</a>
                                        </div>
                                    </div>
                                </div>

                                <!--필요요소-->
                                <div>
                                    <label class="text-muted">필요 요소:</label>
                                    <p>${detail.project.proNeeds}</p>
                                </div>

                                <!--개발환경/언어/방식-->
                                <div>
                                    <label class="text-muted">개발환경/언어/방식:</label>
                                    <p>${detail.project.proResource}</p>
                                </div>

                                <!--작업분량-->
                                <div>
                                    <label class="text-muted">작업분량:</label>
                                    <p>중급 개발자 기준 32M/M (내부 산정 결과)</p>
                                </div>

                                <!--수행사 팀 인력 구성-->
                                <div>
                                    <label class="text-muted">수행사 팀 인력 구성:</label>
                                    <p>수행사 PL1,개발 7</p>
                                </div>

                                <!--자사 투입 인력-->
                                <div>
                                    <label class="text-muted">자사 투입 인력:</label>
                                    <p>PM 2,PL 1</p>
                                </div>

                                <!--주요기능List/주요화면List/메뉴구성/요구사항등-->
                                <div>
                                    <label class="text-muted">주요 기능List/주요 화면List/메뉴 구성/요구 사항 등:</label>
                                    <p>${detail.project.proNeedsDetail}</p>
                                </div>

                                <!--관련기술-->
                                <div>
                                    <h6 style="color: #2793F2;">관련 기술</h6>
                                    <div class="techList">
                                        <c:forEach items="${detail.pList.techName}" var="tech">
				                    		<span class="badge badge-pill badge-secondary">${tech.tName}</span>
				                    	</c:forEach>
                                    </div>
                                </div>


                            </div>
                            <!--업무내용 detail 끝-->

                        </div>

                    </div>

                    <!--업무 내용 끝-->


                    <!--모집 요건 시작-->
                    <div class="row mt-5 projectDetail requirement">
                        <div class="mt-2 col-md-12">
                            <h5>모집 요건</h5>

                            <!--모집요건-->
                            <div class="mt-3">
                                <p><i class="fas fa-check mr-2" style="color: #2793F2;"></i><strong>
                                <c:choose>
				                	<c:when test="${detail.project.proTypeCode eq 'MT1'}">
				                		개인
				                	</c:when>
				                	<c:when test="${detail.project.proTypeCode eq 'MT2'}">
				                		법인
				                	</c:when>
				                	<c:when test="${detail.project.proTypeCode eq 'MT3'}">
				                		팀
				                	</c:when>
				                	<c:when test="${detail.project.proTypeCode eq 'MT4'}">
				                		개인사업자
				                	</c:when>
				                	<c:when test="${detail.project.proTypeCode eq 'MT5'}">
				                		법인사업자
				                	</c:when>
				                	<c:when test="${detail.project.proTypeCode eq 'MT6'}">
				                		기업
				                	</c:when>
				                	<c:otherwise>
				                		상관없음
				                	</c:otherwise>
				                </c:choose>
                                </strong></p>
                                <p><i class="fas fa-plus mr-2"></i><label>
                                <c:choose>
			                		<c:when test="${detail.project.proFuturePlan eq 1}">
			                			향후 유지보수, 고도화를 위한 아웃소싱 계획이 있습니다.
			                		</c:when>
			                		<c:when test="${detail.project.proFuturePlan eq 2}">
			                			향후 유지보수, 고도화를 위한 아웃소싱 계획이 없습니다.
			                		</c:when>
			                		<c:otherwise>
			                			협의 가능
			                		</c:otherwise>
			                	</c:choose>
                                </label></p>
                            </div>

                        </div>
                    </div>
                    <!--모집 요건 끝-->

                    <!--지원 전 질문 시작-->
                    <div class="row mt-5 projectDetail clientQuestion">
                        <div class="mt-2 col-md-12">
                            <h5>지원 전 질문</h5>
                            <p>지원서 작성 시 클라이언트의 질문에 답변해주세요.</p>

                            <!--질문 목록-->
                            <div class="mt-3 qestionList">
                                <c:forEach items="${detail.question}" var="q">
			                	<i class="fas fa-question float-left mr-2 mt-1" style="color: #2793F2;"></i><p>${q.proAQContent}</p>
			                	</c:forEach>
                            </div>

                        </div>
                    </div>
                    <!--지원 전 질문 끝-->


                    <!--지원 양식 시작-->
                    <div class="row mt-5 applicationForm">
                        <form id="application">
                            <div class="mt-4 col-md-12">
                                <h5>지원 금액<i class="fas fa-star-of-life"></i></h5>
                                <p>실제 진행이 가능한 금액을 제안해주세요.</p>

                                <!--지원 금액 시작-->
                                <div class="nego price">
                                    <div class="input-group mb-3">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text" id="basic-addon1"><i
                                                    class="fas fa-won-sign"></i></span>
                                        </div>
                                        <input id="nego_price_input" type="text" class="form-control"
                                            placeholder="금액을 입력하세요." aria-label="Username"
                                            aria-describedby="basic-addon1">
                                        <button type="button" class="btn btn-outline-info ml-3" data-toggle="modal"
                                            data-target="#priceCalculator">이용요금 계산기</button>
                                    </div>
                                    <p style="color: pink;"><i class="fas fa-exclamation-triangle mr-2"></i>DEVENUE
                                        	이용요금은 5% 입니다.</p>
                                </div>
                                <!--지원 금액 시작-->

                                <!--이용 요금 계산기 시작-->
                                <div class="modal fade" id="priceCalculator" tabindex="-1" role="dialog"
                                    aria-labelledby="exampleModalLabel" aria-hidden="true">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="exampleModalLabel">이용요금 계산기</h5>
                                                <button type="button" class="close" data-dismiss="modal"
                                                    aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <div class="modal-body">
                                                <div class="row">
                                                    <div class="col-md-5" style="border-right: 1px dashed grey;">
                                                        <div class="row mt-3">
                                                            <div class="col-md-12" style="text-align: center;">
                                                                <h6>파트너 형태</h6>
                                                                <div class="btn-group mt-2 mb-2" role="group"
                                                                    aria-label="Basic example">
                                                                    <button id="partnerType_unauthorized" type="button"
                                                                        class="btn btn-outline-info modal-text active">개인,팀</button>
                                                                    <button id="partnerType_authorized" type="button"
                                                                        class="btn btn-outline-info modal-text">사업자</button>
                                                                </div>
                                                                <p class="modal-text">파트너 형태에 따라<br>수령 금액이 달라집니다.</p>
                                                            </div>

                                                            <div class="col-md-12">
                                                                <h6>지원금액</h6>
                                                                <div class="input-group mt-2">
                                                                    <div class="input-group-prepend">
                                                                        <span class="input-group-text"
                                                                            id="basic-addon1"><i
                                                                                class="fas fa-won-sign"></i></span>
                                                                    </div>
                                                                    <input id="nego_modal_price_input" type="text"
                                                                        class="form-control" placeholder="금액 입력"
                                                                        aria-label="Username"
                                                                        aria-describedby="basic-addon1">
                                                                    <p>DEVENUE 이용 요금을 포함한 금액을 입력 </p>
                                                                </div>
                                                            </div>

                                                            <div class="col-md-12 mt-2">
                                                                <button type="button" id="calculateBtn"
                                                                    class="btn btn-outline-info btn-block">계산하기</button>
                                                            </div>
                                                        </div>

                                                    </div>


                                                    <div class="col-md-7" style="background-color: powderblue;"
                                                        id="receipt">
                                                        <h6 class="mt-3"><strong>이용 요금 계산 결과</strong></h6>
                                                        <div class="row">
                                                            <div class="col-md-8 mr-auto modal-text">프로젝트 지원 금액</div>
                                                            <div class="col-md-4 ml-auto modal-text"><label
                                                                    id="nego_receipt_price">10000</label>원</div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-md-8 mr-auto modal-text">DEVENUE 이용요금(5%)
                                                            </div>
                                                            <div class="col-md-4 ml-auto modal-text"><label
                                                                    id="nego_receipt_fare">10000</label>원</div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-md-8 mr-auto modal-text">이용요금 제외 금액</div>
                                                            <div class="col-md-4 ml-auto modal-text"><label
                                                                    id="nego_receipt_deduct">10000</label>원</div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-md-8 mr-auto modal-text"
                                                                id="nego_receipt_tax_title">세금</div>
                                                            <div class="col-md-4 ml-auto modal-text"><label
                                                                    id="nego_receipt_tax_value">10000</label>원</div>
                                                        </div>
                                                        <div class="row" id="calResult">
                                                            <div class="col-md-8 mr-auto">
                                                                <h6>파트너 수령 금액</h6>
                                                            </div>
                                                            <div class="col-md-4 ml-auto">
                                                                <div class="modal-text" id="calResultCost">10000원</div>
                                                            </div>

                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary" data-dismiss="modal"
                                                    id="closeCalculator">닫기</button>
                                                <button type="button" class="btn btn-info" id="typeResultCost">지원금액
                                                    	입력하기</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!--이용 요금 계산기 끝-->
                                <script>
                                    //이용 요금 계산기 스크립트

                                    var isAuthorized = false;

                                    $("#partnerType_unauthorized").click(function () {
                                        $("#partnerType_unauthorized").addClass("active");
                                        $("#partnerType_authorized").removeClass("active");
                                        $("#nego_receipt_tax_title").text("원천징수(3.3%)");

                                        isAuthorized = false;

                                    })

                                    $("#partnerType_authorized").click(function () {
                                        $("#partnerType_unauthorized").removeClass("active");
                                        $("#partnerType_authorized").addClass("active");
                                        $("#nego_receipt_tax_title").text("부가가치세(10%)");

                                        isAuthorized = true;
                                    })

                                    $("#calculateBtn").click(function () {


                                        console.log(isAuthorized);


                                        var price = $("#nego_modal_price_input").val();
                                        console.log("price?:" + price);

                                        if (price == "") {
                                            $("#nego_receipt_price").text(0);
                                        } else {
                                            $("#nego_receipt_price").text(price);
                                        }

                                        var fare = price * 0.05;
                                        var deduct = price - fare;


                                        if (!isAuthorized) {

                                            var tax = deduct * 0.033;

                                            $("#nego_receipt_fare").text(fare);
                                            $("#nego_receipt_deduct").text(deduct);
                                            $("#nego_receipt_tax_value").text(tax);

                                            var result = deduct - tax;

                                            $("#calResultCost").text(result + "원");

                                        } else {

                                            var tax = deduct * 0.1;

                                            $("#nego_receipt_fare").text(fare);
                                            $("#nego_receipt_deduct").text(deduct);
                                            $("#nego_receipt_tax_value").text(tax);

                                            var result = deduct + tax;

                                            $("#calResultCost").text(result + "원");

                                        }


                                    })

                                    $("#typeResultCost").click(function () {

                                        var resultCost = $("#nego_modal_price_input").val();
                                        $("#nego_price_input").val(resultCost);
                                        $("#closeCalculator").trigger("click");

                                    })

                                </script>
                            </div>

                            <!--지원 기간 시작-->
                            <div class="mt-5 col-md-12">
                                <h5>지원 기간<i class="fas fa-star-of-life"></i></h5>
                                <p>실제 진행이 가능한 기간을 제안해주세요.</p>
                                <div id="calendar"></div>
                                <div id="calendarDisplay">
                                    <label>시작일</label><input id="startDate" type="date" class="form-control">
                                    <label>종료일</label><input id="endDate" type="date" class="form-control">
                                    <label>기간</label><input id="duration" type="text" class="form-control">
                                </div>
                                <script>
                                    $("#startDate").change(function () {


                                        var one_day = 1000 * 60 * 60 * 24;
                                        var date1 = new Date($("#startDate").val()).getTime();
                                        var date2 = new Date($("#endDate").val()).getTime();

                                        var diff = date2 - date1;

                                        var result = Math.round(diff / one_day);

                                        $("#duration").val(result + 1);

                                    })

                                    $("#endDate").change(function () {

                                        var one_day = 1000 * 60 * 60 * 24;
                                        var date1 = new Date($("#startDate").val()).getTime();
                                        var date2 = new Date($("#endDate").val()).getTime();

                                        var diff = date2 - date1;

                                        var result = Math.round(diff / one_day);

                                        $("#duration").val(result + 1);

                                    })
                                </script>


                            </div>
                            <!--지원 기간 끝-->

                            <!--지원 내용 시작-->
                            <div class="mt-5 col-md-12" style="width: 100%;height: 10rem;">
                                <h5>지원 내용<i class="fas fa-star-of-life"></i></h5>
                                <p style="color: pink;"><i class="fas fa-exclamation-triangle mr-2"></i>
                                    	이메일, 전화번호 등을 게시해 직거래를 유도하는 경우 서비스 이용에 제재를 받을 수 있습니다.</p>
                                <div>
                                    <textarea id="apply_textarea" rows="10" class="form-control"
                                        style="width: 100%;"></textarea>
                                    <div id="textareaAppendix">'지원 내용이 파트너님의 첫인상에 큰 영향을 미칩니다."
                                        <span id="apply_textCount"><strong>0</strong>자</span>
                                    </div>
                                </div>
                            </div>
                            <script>
                                $("#apply_textarea").keyup(function () {
                                    var length = $(this).val().length;
                                    $("#apply_textCount").children("strong").text(length);
                                })
                            </script>

                            <br clear="both">

                            <!--지원 내용 끝-->

                            <!--지원 전 질문 시작-->
                            <div class="mt-5 mb-5 col-md-12 qna" style="width:100%;">
                                <h5>지원 전 질문<i class="fas fa-star-of-life"></i></h5>
                                <p>프로젝트 지원자를 대상으로 클라이언트가 직접 작성한 질문입니다.<br>
                                   	 파트너 선정 시 지원서와 함께 답변 내용을 검토합니다.</p>

                                <c:forEach items="${detail.question}" var="q">
                                <div class="mt-4 applyQuestion">
				                	<i class="fas fa-question float-left mt-1" style="color: #2793F2;"></i>
				                	<p>${q.proAQContent}</p>
				                </div>
				                	
				                <div class="applyAnswer">
                                    <textarea id="${q.proAQId}" maxlength="10" rows="3" class="form-control apply_answer_textarea" style="width: 100%;"></textarea>
                                    <p class="float-left apply_answer_warning">500자 이내로 작성해주세요.</p>
                                    <label class="float-right apply_answer_count"><span>0</span>/500</label>
                                </div>
								<br both="clear">
				                </c:forEach>

                            </div>
                            <script>
                                //글자 수 제한
                                $(".apply_answer_textarea").keyup(function () {
                                    var length = $(this).val().length;
                                    $(this).parent().find(".apply_answer_count").children("span").text(length);
                 					var warning=$(this).parent().find(".apply_answer_warning")

                                    if (length >= 500) {
                                        $(this).css("background", "yellow")
                                        warning.text("500자를 초과하였습니다.").css("color", "red");
                                    }

                                    if (length < 500) {
                                        $(this).css("background", "none")
                                        warning.text("500자 이내로 작성해주세요.").css("color", "gray");
                                    }
                                })

                            </script>
                            <!--지원 전 질문 끝-->

                            <!--포트폴리오 제출-->
                            <div class="mt-5 mb-5 col-md-12" style="width:100%;">
                                <h5>관련 포트폴리오<i class="fas fa-star-of-life"></i></h5>
                                <p>지원하려는 프로젝트와 관련된 포트폴리오를 선택하거나 설명을 입력해주세요.<br>
                                    	관련 포트폴리오를 첨부하시면, 클라이언트가 수락할 확률이 60% 높아집니다.</p>

                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-check portfolio">
                                            <input class="form-check-input" type="radio" name="relatedDoc"
                                                id="portfolioExist" value="exist">
                                            <label class="form-check-label" for="portfolioExist"
                                                id="portfolioExist_label">
                                                <div id="potfolioExist_div">
                                                    <i class="far fa-file-powerpoint fa-3x"></i>
                                                    <p>관련 포트폴리오가 있습니다.</p>
                                                </div>
                                            </label>

                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-check portfolio">
                                            <input class="form-check-input" type="radio" name="relatedDoc"
                                                id="portfolioNotExist" value="notExist">
                                            <label class="form-check-label" for="portfolioNotExist"
                                                id="portfolioNotExist_label">
                                                <div id="potfolioNotExist_div">
                                                    <i class="far fa-file-excel fa-3x"></i>
                                                    <p>관련 포트폴리오가 없습니다.</p>
                                                </div>
                                            </label>
                                        </div>
                                    </div>
                                </div>

                                <!--포트폴리오 존재 시, 업로드 디테일 시작-->
                                <div class="row mt-5" id="portfolio_upload_detail" style="display:none;">
                                    <div class="col-md-12">

                                        <h6>관련 포트폴리오 선택</h6>
                                        <div class="row mt-3" id="portfolio_upload">
                                            <div class="col-md-4">
                                                <div class="uploadBox">
                                                    <table style="width: 100%; height: 100%;">
                                                        <tr>
                                                            <td class="align-middle">
                                                                <i class="fas fa-plus fa-2x"></i>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="uploadBox">
                                                    <table style="width: 100%; height: 100%;">
                                                        <tr>
                                                            <td class="align-middle">
                                                                <i class="fas fa-plus fa-2x"></i>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="uploadBox">
                                                    <table style="width: 100%; height: 100%;">
                                                        <tr>
                                                            <td class="align-middle">
                                                                <i class="fas fa-plus fa-2x"></i>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row mt-3">
                                            <div class="col-md-12">
                                                <button type="button" class="btn btn-outline-info btn-block"
                                                    id="openUpload" data-toggle="modal"
                                                    data-target="#portfolio_upload_modal">포트폴리오 선택</button>
                                            </div>
                                        </div>
                                        <div class="row mt-5">
                                            <div class="col-md-12">
                                                <h6>관련 포트폴리오 설명</h6>
                                                <div>
                                                    <textarea id="portfolio_describe_textarea" class="form-control"
                                                        rows="10" maxlength="2000"></textarea>
                                                    <p class="float-left" id="portfolio_describe_warning">2000자 이내로
                                                        													작성해주세요.</p>
                                                    <label class="float-right"
                                                        id="portfolio_describe_count"><span>0</span>/2000</label>
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                                <script>

                                    $("#portfolio_describe_textarea").keyup(function () {
                                        var length = $(this).val().length;
                                        $("#portfolio_describe_count").children('span').text(length);

                                        if (length >= 2000) {
                                            $("#portfolio_describe_textarea").css("background", "yellow")
                                            $("#portfolio_describe_warning").text("2000자를 초과하였습니다.").css("color", "red");
                                        }

                                        if (length < 2000) {
                                            $("#portfolio_describe_textarea").css("background", "none")
                                            $("#portfolio_describe_warning").text("2000자 이내로 작성해주세요.").css("color", "gray");
                                        }
                                    })

                                </script>
                                <!--포트폴리오 존재 시, 업로드 디테일 끝-->

                                <!--포트폴리오 업로드 모달-->
                                <div class="modal fade" id="portfolio_upload_modal" tabindex="-1" role="dialog"
                                    aria-labelledby="exampleModalLabel" aria-hidden="true">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="portfolio_upload_modal_count">관련 포트폴리오
                                                    														선택(<span>0</span>/3)</h5>
                                                <button type="button" class="close" data-dismiss="modal"
                                                    aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <div class="modal-body">

                                                <div class="row">
                                                    <div class="col-md-12">
                                                        <div class="btn-group"
                                                            id="portfolio_upload_modal_main_category">
                                                            <button id="portfolio_main_category_btn"
                                                                class="btn btn-secondary btn-sm dropdown-toggle"
                                                                type="button" data-toggle="dropdown"
                                                                aria-haspopup="true" aria-expanded="false">
                                                                		대표 카테고리
                                                            </button>
                                                            <div class="dropdown-menu">
                                                                <a class="dropdown-item">전체</a>
                                                                <a class="dropdown-item">개발</a>
                                                                <a class="dropdown-item">디자인</a>
                                                            </div>
                                                        </div>

                                                        <div class="btn-group" id="portfolio_upload_modal_sub_category">
                                                            <button id="portfolio_sub_category_btn"
                                                                class="btn btn-secondary btn-sm dropdown-toggle"
                                                                type="button" data-toggle="dropdown"
                                                                aria-haspopup="true" aria-expanded="false">
                                                              			  세부 카테고리
                                                            </button>
                                                            <div class="dropdown-menu">
                                                                <a class="dropdown-item">웹</a>
                                                                <a class="dropdown-item">앱</a>
                                                                <a class="dropdown-item">퍼블리싱</a>
                                                                <a class="dropdown-item">기타</a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                                <!--포트폴리오 리스트 시작-->
                                                <div class="row mt-3" id="portfolio_upload_modal_list">
                                                    <div class="col-md-12">
                                                        <div class="row">
                                                            <div class="col-md-12">

                                                                <div class="row portfolioList">
                                                                    <div class="col-md-7">

                                                                        <div class="custom-control custom-checkbox">
                                                                            <input type="checkbox"
                                                                                class="custom-control-input"
                                                                                id="check1">
                                                                            <label class="custom-control-label"
                                                                                for="check1">차량동작센서 이용 안전 관리
                                                                                				애플리케이션</label>
                                                                        </div>
                                                                        <textarea class="form-control" readonly>
                                                               				 포트폴리오 설명
                                                            			</textarea>
                                                                        <p>참여기간<span>2018년 03월~2018년09월</span></p>
                                                                        <p>참여율<span>100</span>%</p>
                                                                    </div>
                                                                    <div class="col-md-5">
                                                                        <div class="portfolioPreview"
                                                                            style="width:100%;height:10rem;background-color: lightpink;">
                                                                            <img src="${contextPath}/resources/images/teamProject.jpg"
                                                                                style="width: 100%;height:100%;" />
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                                <div class="row portfolioList">
                                                                    <div class="col-md-7">

                                                                        <div class="custom-control custom-checkbox">
                                                                            <input type="checkbox"
                                                                                class="custom-control-input"
                                                                                id="check2">
                                                                            <label class="custom-control-label"
                                                                                for="check2">차량동작센서 이용 안전 관리
                                                                                				애플리케이션</label>
                                                                        </div>
                                                                        <textarea class="form-control"
                                                                            style="width: 100%;background:none;"
                                                                            readonly>
                                                                			포트폴리오 설명
                                                            			</textarea>
                                                                        <p>참여기간<span>2018년 03월~2018년09월</span></p>
                                                                        <p>참여율<span>100</span>%</p>
                                                                    </div>
                                                                    <div class="col-md-5">
                                                                        <div class="portfolioPreview"
                                                                            style="width:100%;height:10rem;background-color: lightpink;">
                                                                            <img src="${contextPath}/resources/images/teamProject.jpg"
                                                                                style="width: 100%;height:100%;" />
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                                <div class="row portfolioList">
                                                                    <div class="col-md-7">

                                                                        <div class="custom-control custom-checkbox">
                                                                            <input type="checkbox"
                                                                                class="custom-control-input"
                                                                                id="check3">
                                                                            <label class="custom-control-label"
                                                                                for="check3">차량동작센서 이용 안전 관리
                                                                                				애플리케이션</label>
                                                                        </div>
                                                                        <textarea class="form-control"
                                                                            style="width: 100%;background:none;"
                                                                            readonly>
                                                                			포트폴리오 설명
                                                            			</textarea>
                                                                        <p>참여기간<span>2018년 03월~2018년09월</span></p>
                                                                        <p>참여율<span>100</span>%</p>
                                                                    </div>
                                                                    <div class="col-md-5">
                                                                        <div class="portfolioPreview"
                                                                            style="width:100%;height:10rem;background-color: lightpink;">
                                                                            <img src="${contextPath}/resources/images/teamProject.jpg"
                                                                                style="width: 100%;height:100%;" />
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                                <div class="row portfolioList">
                                                                    <div class="col-md-7">

                                                                        <div class="custom-control custom-checkbox">
                                                                            <input type="checkbox"
                                                                                class="custom-control-input"
                                                                                id="check4">
                                                                            <label class="custom-control-label"
                                                                                for="check3">차량동작센서 이용 안전 관리
                                                                               							 애플리케이션</label>
                                                                        </div>
                                                                        <textarea class="form-control"
                                                                            style="width: 100%;background:none;"
                                                                            readonly>
                                                                			포트폴리오 설명
                                                            			</textarea>
                                                                        <p>참여기간<span>2018년 03월~2018년09월</span></p>
                                                                        <p>참여율<span>100</span>%</p>
                                                                    </div>
                                                                    <div class="col-md-5">
                                                                        <div class="portfolioPreview"
                                                                            style="width:100%;height:10rem;background-color: lightpink;">
                                                                            <img src="${contextPath}/resources/images/teamProject.jpg"
                                                                                style="width: 100%;height:100%;" />
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                            </div>
                                                        </div>
                                                    </div>

                                                </div>
                                                <script>
                                                    $(".portfolioList").click(function () {

                                                        var check = $(this).children().eq(0).children().children("input");

                                                        var allCheck = $(this).parent().children().children().children().children("input");
                                                        console.log(allCheck);
                                                        var count = 0;

                                                        if (check.prop("checked")) {
                                                            check.prop("checked", false);
                                                        } else {
                                                            check.prop("checked", true);
                                                        }

                                                        for (var i = 0; i < allCheck.length; i++) {

                                                            if (allCheck[i].checked) {
                                                                count++
                                                            }
                                                        }

                                                        if (count > 3) {
                                                            alert("포트폴리오는 3개까지 업로드할 수 있습니다.");
                                                            check.prop("checked", false);

                                                        }


                                                        $("#portfolio_upload_modal_count").children("span").text(count);

                                                    })

                                                </script>
                                                <!--포트폴리오 리스트 끝-->

                                            </div>
                                            <div class="modal-footer">
                                                <p class="mr-auto">등록한 포트폴리오 중 선택이 가능하며, <a href="#">[프로필 정보 관리]</a>에서 추가 가능합니다.</p>
                                                <button type="button" class="btn btn-secondary btn-block"
                                                    data-dismiss="modal">닫기</button>
                                                <button type="button" class="btn btn-info btn-block">선택완료</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <script>
                                    //카테고리 변경 시 
                                    $("#portfolio_upload_modal_main_category").children().children().click(function () {
                                        $(this).parent().parent().children().eq(0).text($(this).text());
                                    })

                                    $("#portfolio_upload_modal_sub_category").children().children().click(function () {
                                        $(this).parent().parent().children().eq(0).text($(this).text());
                                    })
                                </script>
                                <!-- 포트폴리오 업로드 모달 끝-->

                            </div>
                            <script>

                                //업로드 박스 클릭시 모달 오픈
                                $(".uploadBox").click(function () {
                                    $("#openUpload").trigger("click");
                                })

                                //관련 포트폴리오 있음 체크 시 업로드 div 보이게 하기
                                $(".portfolio").click(function () {


                                    if ($("#portfolioExist").prop("checked")) {
                                        $("#portfolio_upload_detail").css("display", "block");
                                    }else{
                                        $("#portfolio_upload_detail").css("display", "none");
                                    }
                                })


                                //업로드 박스 hover 효과
                                $(".uploadBox").mouseenter(function () {

                                    $(this).css("border", "#2793F2 dashed 1px")
                                    $(this).children().css("color", "#2793F2");
                                })

                                $(".uploadBox").mouseleave(function () {
                                    $(this).css("border", "grey 1px dashed");
                                    $(this).children().css("color", "white");
                                })

                            </script>
                            <!--포트폴리오 제출 끝-->



                            <!--이력서 제출-->
                            <div class="mt-5 mb-5 col-md-12" style="width:100%;">
                                <h5>이력서(경력기술서)<i class="fas fa-star-of-life"></i></h5>
                                <p>이력서(경력기술서)를 첨부하시면, 클라이언트가 수락할 확률이 60% 높아집니다.</p>

                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-check resume">
                                            <input class="form-check-input" type="radio" name="relatedResume"
                                                id="resumeExist" value="exist">
                                            <label class="form-check-label" for="resumeExist"
                                                id="resumeExist_label">
                                                <div id="resumeExist_div">
                                                    <i class="far fa-file-powerpoint fa-3x"></i>
                                                    <p>이력서(경력기술서)제출하기</p>
                                                </div>
                                            </label>

                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-check resume">
                                            <input class="form-check-input" type="radio" name="relatedResume"
                                                id="resumeNotExist" value="notExist">
                                            <label class="form-check-label" for="resumeNotExist"
                                                id="resumeNotExist_label">
                                                <div id="resumeNotExist_div">
                                                    <i class="far fa-file-excel fa-3x"></i>
                                                    <p>제출하지 않기</p>
                                                </div>
                                            </label>
                                        </div>
                                    </div>
                                </div>

                                <!--이력서 존재 시, 업로드 디테일 시작-->
                                <div class="row mt-5" id="resume_upload_detail" style="display:none;">
                                    <div class="col-md-12">

                                        <p><i class="fas fa-check mr-2"></i>개인 정보가 포함된 문서를 클라이언트가 확인하게 됩니다.</p>
                                        <p><i class="fas fa-check mr-2"></i>문서 파일만 추가 가능 합니다.</p>

                                        <div class="row mt-4" id="resume_upload">
                                            <div class="col-md-12">

                                                <div class="input-group">
                                                    <div class="custom-file">
                                                      <input type="file" class="custom-file-input" id="resumeUpload" aria-describedby="inputGroupFileAddon04">
                                                      <label class="custom-file-label" for="resumeUpload">이력서 선택</label>
                                                    </div>
                                                </div>
                                                <p>.pdf,.dock,.doc,.hwp 파일만 업로드 되며, 최대 40MB까지 가능합니다.<label>5</label>MB/40MB</p>
                                                
                                            </div>
                                            
                                            
                                        </div>
                                       
                                       

                                    </div>
                                </div>
                            </div>
                            <script>
                                //관련 이력서 있음 체크 시 업로드 div 보이게 하기
                                $(".resume").click(function () {


                                if ($("#resumeExist").prop("checked")) {
                                    $("#resume_upload_detail").css("display", "block");
                                }else{
                                    $("#resume_upload_detail").css("display", "none");
                                }
                                })

                                //이력서 업로드 시, 
                                $("#resumeUpload").change(function(){
                                    var file=$(this).val();
                                    alert(file);      

                                    $(this).parent().children().eq(1).text(file);
                                })
                            </script>
                            <!--이력서 업로드 끝-->

                            <!--지원하기 버튼-->
                            <div id="applicationSubmitArea" class="mt-5 mb-5 col-md-12" style="width:100%;">
                                <div class="float-right">
                                    <button class="btn btn-secondary" type="button" id="applyCancelBtn">취소</button>
                                    <button class="btn btn-info" type="button" id="applySubmitBtn">지원하기</button>
                                </div>
                            </div>

                        </form>
                    </div>
                    <script>
                        $("#applyCancelBtn").click(function(){
                            confirm("작성중인 지원서를 임시 저장 하시겠습니까?");
                        })
                    </script>
                    <!--지원 양식 끝-->

                </div>
                <!-- 프로젝트 디테일 column 끝-->

                <!--Grid column 사이드바 시작-->
                <div class="col-md-2 mb-4" style="width: 100%;">
                    <div id="applySideNotice">
                        <div class="row">
                            <div class="col-md-12">
                                <i class="fas fa-exclamation-circle"></i><label>지원 금액과 지원 기간</label>
                                <p>
                                    금액과 기간은 변동이 가능합니다. <br>
                                    분석하신 업무 범위를 토대로<br> 
                                    합리적인 금액과 기간을 제안해주세요.
                                </p>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <i class="fas fa-exclamation-circle"></i><label>주의사항</label>
                                <p>
                                    프로젝트와 무관한 포트폴리오의 <br>
                                    단순 나열, 과도한 홍보글은 지원서의 <br>
                                    신뢰를 떨어뜨릴 수 있습니다.
                                </p>
                            </div>
                        </div>
                    </div>

                </div>
                <!--Grid column 사이드바 끝-->


                <div class="col-md-2 mb-4" style="text-align: center;">
                    
                </div>

            </div>
            <!--row 끝 왼/중/오-->


        </div>
        <!--컨테이너 끝-->


    </main>
    <!--Main layout-->

<jsp:include page="../../common/footer.jsp"></jsp:include>
</body>
</html>