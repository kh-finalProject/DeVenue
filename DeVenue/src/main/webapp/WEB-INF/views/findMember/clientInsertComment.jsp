<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	/* 별점수 */
        hr {
            background-color: lightgray;
        }

        #starPoint b {
            /* margin-right:10%; */
            float: right;
        }

        .point {
            margin-top: 3%;
            margin-bottom: 3%;
            margin-left: 5%;
            margin-right: 10%;
        }

        .point p {
            margin-bottom: 2%;
            margin-left: 2%;
        }

        .point div ul li{
            margin:0;
            margin-top:2%;
        }

        /* 이미지 사이즈 맞추기 */
        .image-container {
            width: auto;
            height: 15rem;
            overflow: hidden;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .image-container img {
            object-fit: fill;
        }

        /* textarea 디자인 */
        .shadow-textarea textarea.form-control::placeholder {
            font-weight: 300;
        }
        .shadow-textarea textarea.form-control {
            padding-left: 0.8rem;
        }

        input[type="radio"]{
            display:none;
        }

        /* 별점 */
        .rating {
            float:left;
        }

        /* :not(:checked) is a filter, so that browsers that don’t support :checked don’t 
        follow these rules. Every browser that supports :checked also supports :not(), so
        it doesn’t make the test unnecessarily selective */
        .rating:not(:checked) > input {
            position:absolute;
        }

        .rating:not(:checked) > label {
            float:right;
            width:1em;
            padding:0 .1em;
            overflow:hidden;
            white-space:nowrap;
            cursor:pointer;
            font-size:200%;
            line-height:1.2;
            color:#ddd;
            text-shadow:1px 1px #bbb, 2px 2px #666, .1em .1em .2em rgba(0,0,0,.5);
        }

        .rating:not(:checked) > label:before {
            content: '★ ';
        }

        .rating > input:checked ~ label {
            color: #f70;
            text-shadow:1px 1px #c60, 2px 2px #940, .1em .1em .2em rgba(0,0,0,.5);
        }

        .rating:not(:checked) > label:hover,
        .rating:not(:checked) > label:hover ~ label {
            color: gold;
            text-shadow:1px 1px goldenrod, 2px 2px #B57340, .1em .1em .2em rgba(0,0,0,.5);
        }

        .rating > input:checked + label:hover,
        .rating > input:checked + label:hover ~ label,
        .rating > input:checked ~ label:hover,
        .rating > input:checked ~ label:hover ~ label,
        .rating > label:hover ~ input:checked ~ label {
            color: #ea0;
            text-shadow:1px 1px goldenrod, 2px 2px #B57340, .1em .1em .2em rgba(0,0,0,.5);
        }

        .rating > label:active {
            position:relative;
            top:2px;
            left:2px;
        }
        
        /* eStar1 */
        #eStar1:not(:checked) > input {
            position:absolute;
        }

        #eStar1:not(:checked) > label {
            float:right;
            width:1em;
            padding:0 .1em;
            overflow:hidden;
            white-space:nowrap;
            cursor:pointer;
            font-size:200%;
            line-height:1.2;
            color:#ddd;
            text-shadow:1px 1px #bbb, 2px 2px #666, .1em .1em .2em rgba(0,0,0,.5);
        }

        #eStar1:not(:checked) > label:before {
            content: '★ ';
        }

        #eStar1 > input:checked ~ label {
            color: #f70;
            text-shadow:1px 1px #c60, 2px 2px #940, .1em .1em .2em rgba(0,0,0,.5);
        }

        #eStar1:not(:checked) > label:hover,
        #eStar1:not(:checked) > label:hover ~ label {
            color: gold;
            text-shadow:1px 1px goldenrod, 2px 2px #B57340, .1em .1em .2em rgba(0,0,0,.5);
        }

        #eStar1 > input:checked + label:hover,
        #eStar1 > input:checked + label:hover ~ label,
        #eStar1 > input:checked ~ label:hover,
        #eStar1 > input:checked ~ label:hover ~ label,
        #eStar1 > label:hover ~ input:checked ~ label {
            color: #ea0;
            text-shadow:1px 1px goldenrod, 2px 2px #B57340, .1em .1em .2em rgba(0,0,0,.5);
        }

        #eStar1 > label:active {
            position:relative;
            top:2px;
            left:2px;
        }
        
        /* eStar2 */
        #eStar2:not(:checked) > input {
            position:absolute;
        }

        #eStar2:not(:checked) > label {
            float:right;
            width:1em;
            padding:0 .1em;
            overflow:hidden;
            white-space:nowrap;
            cursor:pointer;
            font-size:200%;
            line-height:1.2;
            color:#ddd;
            text-shadow:1px 1px #bbb, 2px 2px #666, .1em .1em .2em rgba(0,0,0,.5);
        }

        #eStar2:not(:checked) > label:before {
            content: '★ ';
        }

        #eStar2 > input:checked ~ label {
            color: #f70;
            text-shadow:1px 1px #c60, 2px 2px #940, .1em .1em .2em rgba(0,0,0,.5);
        }

        #eStar2:not(:checked) > label:hover,
        #eStar2:not(:checked) > label:hover ~ label {
            color: gold;
            text-shadow:1px 1px goldenrod, 2px 2px #B57340, .1em .1em .2em rgba(0,0,0,.5);
        }

        #eStar2 > input:checked + label:hover,
        #eStar2 > input:checked + label:hover ~ label,
        #eStar2 > input:checked ~ label:hover,
        #eStar2 > input:checked ~ label:hover ~ label,
        #eStar2 > label:hover ~ input:checked ~ label {
            color: #ea0;
            text-shadow:1px 1px goldenrod, 2px 2px #B57340, .1em .1em .2em rgba(0,0,0,.5);
        }

        #eStar2 > label:active {
            position:relative;
            top:2px;
            left:2px;
        }
        
        /* eStar3 */
        #eStar3:not(:checked) > input {
            position:absolute;
        }

        #eStar3:not(:checked) > label {
            float:right;
            width:1em;
            padding:0 .1em;
            overflow:hidden;
            white-space:nowrap;
            cursor:pointer;
            font-size:200%;
            line-height:1.2;
            color:#ddd;
            text-shadow:1px 1px #bbb, 2px 2px #666, .1em .1em .2em rgba(0,0,0,.5);
        }

        #eStar3:not(:checked) > label:before {
            content: '★ ';
        }

        #eStar3 > input:checked ~ label {
            color: #f70;
            text-shadow:1px 1px #c60, 2px 2px #940, .1em .1em .2em rgba(0,0,0,.5);
        }

        #eStar3:not(:checked) > label:hover,
        #eStar3:not(:che
        cked) > label:hover ~ label {
            color: gold;
            text-shadow:1px 1px goldenrod, 2px 2px #B57340, .1em .1em .2em rgba(0,0,0,.5);
        }

        #eStar3 > input:checked + label:hover,
        #eStar3 > input:checked + label:hover ~ label,
        #eStar3 > input:checked ~ label:hover,
        #eStar3 > input:checked ~ label:hover ~ label,
        #eStar3 > label:hover ~ input:checked ~ label {
            color: #ea0;
            text-shadow:1px 1px goldenrod, 2px 2px #B57340, .1em .1em .2em rgba(0,0,0,.5);
        }

        #eStar3 > label:active {
            position:relative;
            top:2px;
            left:2px;
        }
        
        /* eStar4 */
        #eStar4:not(:checked) > input {
            position:absolute;
        }

        #eStar4:not(:checked) > label {
            float:right;
            width:1em;
            padding:0 .1em;
            overflow:hidden;
            white-space:nowrap;
            cursor:pointer;
            font-size:200%;
            line-height:1.2;
            color:#ddd;
            text-shadow:1px 1px #bbb, 2px 2px #666, .1em .1em .2em rgba(0,0,0,.5);
        }

        #eStar4:not(:checked) > label:before {
            content: '★ ';
        }

        #eStar4 > input:checked ~ label {
            color: #f70;
            text-shadow:1px 1px #c60, 2px 2px #940, .1em .1em .2em rgba(0,0,0,.5);
        }

        #eStar4:not(:checked) > label:hover,
        #eStar4:not(:checked) > label:hover ~ label {
            color: gold;
            text-shadow:1px 1px goldenrod, 2px 2px #B57340, .1em .1em .2em rgba(0,0,0,.5);
        }

        #eStar4 > input:checked + label:hover,
        #eStar4 > input:checked + label:hover ~ label,
        #eStar4 > input:checked ~ label:hover,
        #eStar4 > input:checked ~ label:hover ~ label,
        #eStar4 > label:hover ~ input:checked ~ label {
            color: #ea0;
            text-shadow:1px 1px goldenrod, 2px 2px #B57340, .1em .1em .2em rgba(0,0,0,.5);
        }

        #eStar4 > label:active {
            position:relative;
            top:2px;
            left:2px;
        }
        
        /* eStar5 */
        #eStar5:not(:checked) > input {
            position:absolute;
        }

        #eStar5:not(:checked) > label {
            float:right;
            width:1em;
            padding:0 .1em;
            overflow:hidden;
            white-space:nowrap;
            cursor:pointer;
            font-size:200%;
            line-height:1.2;
            color:#ddd;
            text-shadow:1px 1px #bbb, 2px 2px #666, .1em .1em .2em rgba(0,0,0,.5);
        }

        #eStar5:not(:checked) > label:before {
            content: '★ ';
        }

        #eStar5 > input:checked ~ label {
            color: #f70;
            text-shadow:1px 1px #c60, 2px 2px #940, .1em .1em .2em rgba(0,0,0,.5);
        }

        #eStar5:not(:checked) > label:hover,
        #eStar5:not(:checked) > label:hover ~ label {
            color: gold;
            text-shadow:1px 1px goldenrod, 2px 2px #B57340, .1em .1em .2em rgba(0,0,0,.5);
        }

        #eStar5 > input:checked + label:hover,
        #eStar5 > input:checked + label:hover ~ label,
        #eStar5 > input:checked ~ label:hover,
        #eStar5 > input:checked ~ label:hover ~ label,
        #eStar5 > label:hover ~ input:checked ~ label {
            color: #ea0;
            text-shadow:1px 1px goldenrod, 2px 2px #B57340, .1em .1em .2em rgba(0,0,0,.5);
        }

        #eStar5 > label:active {
            position:relative;
            top:2px;
            left:2px;
        }
</style>

</head>
<body>
	<jsp:include page="../common/menubar.jsp"/>
	
	<div class="container">
        <div class="row text-white" style="border-bottom: 1px solid lightgray;">
            <div class="col-2" style="padding:3%; font-size: 150%; font-family: 'Jua', sans-serif;">
                회원찾기
            </div>
        </div>

        <div class="row">
            <div class="col-2 text-white" style="border-right: 1px solid lightgray; font-family: 'Jua', sans-serif;">
                <br>
                <div style="border-bottom: 1px solid lightgray; padding-bottom: 5.5%;">
                    클라이언트
                </div>
            </div>
            <div class="col-10 text-white" style="font-family: 'Jua', sans-serif;">
                <br>
                <div class="row">
                    <div class="col-8" style="margin-left:5%;">
                        &emsp;<b>user01(닉네임)</b>&emsp;<a class="badge badge-info"
                            style="">개인</a><br>
                        &emsp;<i class="far fa-address-card"></i>&nbsp;신원인증
                        &emsp;<i class="fas fa-phone-alt"></i>&nbsp;연락처 등록
                    </div>
                    <div class="col-2" style="margin:0 auto; margin-right: 5%;">
                        <button class="btn-lg btn-info" style="float:right;" type="button">신고</button>
                    </div>
                </div>
            </div>

        </div>

        <div class="row">
            <div class="col-2 text-white" style="border-right: 1px solid lightgray; font-family: 'Jua', sans-serif;">
                <br>
                <div style="padding-bottom: 5.5%;">
                    <div class="image-container">
                        <img src="${contextPath }/resources/images/showcase.jpg" style="object-fit: cover;">
                    </div>
                    <hr style=" margin:0px auto; margin-top:5%; margin-bottom:10%;">
                    <div>
                        <p id="clientInfo" style="cursor:pointer;">클라이언트 정보</p>
                        <p id="projectHistory" style="cursor:pointer;">프로젝트 히스토리</p>
                        
                        <p id="clientEvaluate" style="cursor:pointer;">평가<i style="float: right; margin-right: 5%;" class="fas fa-angle-down"></i></p>
                        <div id="subClientEva" style="display:none; margin-left: 5%;">
                            <p id="clientComment" style="cursor:pointer;">평가 조회</p>
                            <p id="insertCComment" style="cursor:pointer;">평가 등록</p>
                        </div>
                    </div>
                    <c:url var="cDetail" value="cDetail.do">
                    	<c:param name="cId" value="${fc.memId }"/>
                    	<%-- <c:param name="page" value="${pi.currentPage }"/> --%>
                    </c:url>
                    <c:url var="cProjectHistory" value="cProjectHistory.do">
                    	<c:param name="cId" value="${fc.memId }"/>
                    </c:url>
                    <c:url var="cEvalSelect" value="cEvalSelect.do">
                    	<c:param name="cId" value="${fc.memId }"/>
                    	<c:param name="msg" value="1"/>
                    </c:url>
                    <c:url var="cEvalInsert" value="cEvalInsert.do">
                    	<c:param name="cId" value="${fc.memId }"/>
                    	<c:choose>
                    		<c:when test="${!empty loginUser }">
	                    		<c:param name="pId" value="${loginUser.memId }"/>
                    		</c:when>
                    		<c:otherwise>
                    			<c:param name="pId" value="0"/>
                    		</c:otherwise>
                    	</c:choose>
                    </c:url>
                    <script>
                        $("#clientInfo").on("click", function(){
                            location.href="${cDetail }";
                        }).on("mouseenter", function(){
                            
                        });

                        $("#projectHistory").on("click", function(){
                            location.href="${cProjectHistory }";
                        });

                        $("#clientEvaluate").click(function() {
                            $("#subClientEva").toggle();
                        });

                        $("#clientComment").on("click", function(){
                            location.href="${cEvalSelect }";
                        });

                        $("#insertCComment").on("click", function(){
                            location.href="${cEvalInsert }";
                        });
                    </script>
                </div>
            </div>
            <div class="col-10 text-white" style="font-family: 'Jua', sans-serif;">
                <form id="insertForm" name="insertForm" action="cEvalInsert2.do" method="post">
                <div class="userBoard">
                    &emsp;
                    <input type="hidden" value="선택한 회원 ID">

                    <div class="row"
                        style="margin-left:3%; margin-right:3%;border-top: 1px solid lightgray; border-bottom: 1px solid lightgray;">
                        <div class="point col-12" style="margin-left:2%;">
                            <h4>클라이언트 평가</h4>
                            <div>
                                <table>
                                    <tr>
                                        <td style="width:40%;">
                                            <div style="margin-top:25%; margin-left: 25%;">
                                                <p>프로젝트</p>&emsp;
                                            </div>
                                        </td>
                                        <td>
                                            <div class="btn-group dropdown" style="margin-top:2%; margin-left: 25%;">
                                                <button id="projectName" class="btn btn-outline-light dropdown-toggle" type="button"
                                                    data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">&emsp;&emsp;&emsp;&emsp;&emsp;</button>
                                                <div id="projectList" class="dropdown-menu" style="max-height: 400%; overflow-y: auto;">
                                                    <!-- <a id="mini" class="dropdown-item">miniProject</a>
                                                    <a id="semi" class="dropdown-item">semiProject</a>
                                                    <a id="final" class="dropdown-item">finalProject</a> -->
                                                    
                                                    <c:forEach var="pList" items="${epList }" varStatus="status">
                                                    	<a id="pro${status.index }" class="dropdown-item">${pList.proName }</a>
                                                    	<input id="proId${status.count }" name="proId" type="hidden" value="${pList.proId }">
                                                    
                                                    	<script>
                                                    		var proId=${pList.proId};
                                                    		
                                                    		$(function(){
                                                    			$("#pro${status.index}").on("click", function () {
                                                    				$("#projectName").text($(this).text());
                                                    				console.log(${pList.proId});
                                                    			})
                                                    		})
                                                    	</script>
                                                    </c:forEach>
                                                </div>
                                            </div>
                                        </td> 
                                    </tr>
                                    <tr>
                                        <td style="width:40%;">
                                            <div style="margin-top:25%; margin-left: 25%;">
                                                <p>평가 점수</p>&emsp;
                                            </div>
                                        </td>
                                        <td>
                                            <fieldset class="rating">
                                                <input type="radio" id="star5" name="eAgv" value="5" /><label for="star5" title="good!">5 stars</label>
                                                <input type="radio" id="star4" name="eAgv" value="4" /><label for="star4" title="Pretty good">4 stars</label>
                                                <input type="radio" id="star3" name="eAgv" value="3" /><label for="star3" title="so so">3 stars</label>
                                                <input type="radio" id="star2" name="eAgv" value="2" /><label for="star2" title="not bad">2 stars</label>
                                                <input type="radio" id="star1" name="eAgv" value="1" /><label for="star1" title="bad">1 star</label>
                                            </fieldset>
                                        </td>
                                        <script>
                                            // 별점 스크립트
                                        </script>
                                    </tr>
                                </table>
                            </div>
                            <div style="width:90%; margin-left: 2%;">
                                <div class="form-group shadow-textarea" style="width:60%;">
                                    <label for="ratingContent" style="margin-left: 3%;">평가 내용</label>
                                    <textarea style="margin-left: 15%;" class="form-control z-depth-1" id="ratingContent" name="eContent" rows="3" placeholder="클라이언트를 평가해주세요..."></textarea>
                                    <br>
                                    <span style="color:#aaa; margin-left: 15%;" id="counter">(0 / 최대 200자)</span>
                                  </div>
                                  <script>
                                  $("#ratingContent").keyup(function (e){
                                	    var content = $(this).val();
                                	    $('#counter').html("("+content.length+" / 최대 200자)");    //글자수 실시간 카운팅

                                	    if (content.length > 200){
                                	        alert("최대 200자까지 입력 가능합니다.");
                                	        $(this).val(content.substring(0, 200));
                                	        $('#counter').html("(200 / 최대 200자)");
                                	    }
                                	});
                                  </script>
                            </div>
                        </div>
                    </div>
                    <div class="point col-12" style="margin-left:2%;">
                        <h4 style="margin-left: 3%;">세부 평가</h4>
                        <table style="margin-left: 6%;">
                            <tr>
                                <td>
                                    <p>전문성</p>
                                </td>
                                <td>
                                    <fieldset id="eStar1">
                                        <input type="radio" id="eStar15" name="eStarOne" value="5" /><label for="eStar15" title="good!">5 stars</label>
                                        <input type="radio" id="eStar14" name="eStarOne" value="4" /><label for="eStar14" title="Pretty good">4 stars</label>
                                        <input type="radio" id="eStar13" name="eStarOne" value="3" /><label for="eStar13" title="so so">3 stars</label>
                                        <input type="radio" id="eStar12" name="eStarOne" value="2" /><label for="eStar12" title="not bad">2 stars</label>
                                        <input type="radio" id="eStar11" name="eStarOne" value="1" /><label for="eStar11" title="bad">1 star</label>
                                    </fieldset>
                                </td>
                            </tr>
                            <tr>
                                <td style="width:40%;">
                                    <p>적극성</p>
                                </td>
                                <td>
                                    <fieldset id="eStar2">
                                        <input type="radio" id="eStar25" name="eStarTwo" value="5" /><label for="eStar25" title="good!">5 stars</label>
                                        <input type="radio" id="eStar24" name="eStarTwo" value="4" /><label for="eStar24" title="Pretty good">4 stars</label>
                                        <input type="radio" id="eStar23" name="eStarTwo" value="3" /><label for="eStar23" title="so so">3 stars</label>
                                        <input type="radio" id="eStar22" name="eStarTwo" value="2" /><label for="eStar22" title="not bad">2 stars</label>
                                        <input type="radio" id="eStar21" name="eStarTwo" value="1" /><label for="eStar21" title="bad">1 star</label>
                                    </fieldset>
                                </td>
                            </tr>
                            <tr>
                                <td style="width:40%;">
                                    <p>일정준수</p>
                                </td>
                                <td>
                                    <fieldset id="eStar3">
                                        <input type="radio" id="eStar35" name="eStarThree" value="5" /><label for="eStar35" title="good!">5 stars</label>
                                        <input type="radio" id="eStar34" name="eStarThree" value="4" /><label for="eStar34" title="Pretty good">4 stars</label>
                                        <input type="radio" id="eStar33" name="eStarThree" value="3" /><label for="eStar33" title="so so">3 stars</label>
                                        <input type="radio" id="eStar32" name="eStarThree" value="2" /><label for="eStar32" title="not bad">2 stars</label>
                                        <input type="radio" id="eStar31" name="eStarThree" value="1" /><label for="eStar31" title="bad">1 star</label>
                                    </fieldset>
                                </td>
                            </tr>
                            <tr>
                                <td style="width:40%;">
                                    <p>의사소통</p>
                                </td>
                                <td>
                                    <fieldset id="eStar4">
                                        <input type="radio" id="eStar45" name="eStarFour" value="5" /><label for="eStar45" title="good!">5 stars</label>
                                        <input type="radio" id="eStar44" name="eStarFour" value="4" /><label for="eStar44" title="Pretty good">4 stars</label>
                                        <input type="radio" id="eStar43" name="eStarFour" value="3" /><label for="eStar43" title="so so">3 stars</label>
                                        <input type="radio" id="eStar42" name="eStarFour" value="2" /><label for="eStar42" title="not bad">2 stars</label>
                                        <input type="radio" id="eStar41" name="eStarFour" value="1" /><label for="eStar41" title="bad">1 star</label>
                                    </fieldset>
                                </td>
                            </tr>
                            <tr>
                                <td style="width:40%;">
                                    <p>만족도</p>
                                </td>
                                <td>
                                    <fieldset id="eStar5">
                                        <input type="radio" id="eStar55" name="eStarFive" value="5" /><label for="eStar55" title="good!">5 stars</label>
                                        <input type="radio" id="eStar54" name="eStarFive" value="4" /><label for="eStar54" title="Pretty good">4 stars</label>
                                        <input type="radio" id="eStar53" name="eStarFive" value="3" /><label for="eStar53" title="so so">3 stars</label>
                                        <input type="radio" id="eStar52" name="eStarFive" value="2" /><label for="eStar52" title="not bad">2 stars</label>
                                        <input type="radio" id="eStar51" name="eStarFive" value="1" /><label for="eStar51" title="bad">1 star</label>
                                    </fieldset>
                                </td>
                            </tr>
                        </table>
                        
                        
                        <%-- <input type="hidden" id="evalProId" value="">
                        <input type="hidden" id="evalContent" value="">
                        <input type="hidden" id="evalEagv" value="">
                        <input type="hidden" id="evalStar1" value="">
                        <input type="hidden" id="evalStar2" value="">
                        <input type="hidden" id="evalStar3" value="">
                        <input type="hidden" id="evalStar4" value="">
                        <input type="hidden" id="evalStar5" value="">
                        
                        <c:url var="cEvalInsert" value="cEvalInsert2.do">
                        	<c:param name="cId" value="${cId }"/>
                        	<c:param name="pId" value="${loginUser.memId }"/>
                        	<c:param name="proId" value=""/>
                        	<c:param name="eAgv" value=""/>
                        	<c:param name="content" value=""/>
                        	<c:param name="star1" value=""/>
                        	<c:param name="star2" value=""/>
                        	<c:param name="star3" value=""/>
                        	<c:param name="star4" value=""/>
                        	<c:param name="star5" value=""/>
                        </c:url> --%>
                        
                        <div style="float:right; margin-right: 8%; margin-top:2%; margin-bottom: 5%;">
                            <button class="btn btn-light" type="button">취소하기</button>&nbsp;
                            <button id="insertBtn" class="btn btn-info" type="button">등록하기</button>
                        </div>
                        <script>
                        	$("#insertBtn").on("click", function () {
                        		var form=document.insertForm;
                        		
                        		var eAgv=null;
                        		var star1=null;
                        		var star2=null;
                        		var star3=null;
                        		var star4=null;
                        		var star5=null;
                        		
                        		var find=false;		// 체크되어있는 라디오버튼을 찾았는지 구분하는 변수
                        		
                        		eAgv=form.eAgv;
                        		star1=form.eStarOne;
                        		star2=form.eStarTwo;
                        		star3=form.eStarThree;
                        		star4=form.eStarFour;
                        		star5=form.eStarFive;
                        		
                        		var eAgvVal=0;
                        		var star1Val=0;
                        		var star2Val=0;
                        		var star3Val=0;
                        		var star4Val=0;
                        		var star5Val=0;
                        		
                        		

                        		// 평가점수 value값 구하기
                        		var eAgvSize=eAgv.length;	// 라디오 버튼 수
                        		console.log("eAgvSize : "+eAgvSize);
                        		
                        		for(var i=0; i<eAgvSize; i++){
                        			if(eAgv[i].checked==true) {		// 체크되어있는 라디오 버튼을 찾았을 경우
                        				find=true;					// 찾았다는걸로 변환
                        			}
                        			
                        			if(find==false){
                        				eAgvVal=eAgv[i].value - 1;
                        				console.log(eAgvVal);
                        				break;
                        			}else if(eAgv[i].value==5){
                        				eAgvVal=5;
                        				console.log(eAgvVal);
                        				break;
                        			}
                        			find=false;
                        		}
                        		
                        		// 전문성 점수 value
                        		var star1Size=star1.length;	// 라디오 버튼 수
                        		console.log("star1Size : "+star1Size);
                        		
                        		for(var i=0; i<star1Size; i++){
                        			if(star1[i].checked==true) {		// 체크되어있는 라디오 버튼을 찾았을 경우
                        				find=true;					// 찾았다는걸로 변환
                        			}
                        			
                        			if(find==false){
                        				star1Val=star1[i].value - 1;
                        				console.log(star1Val);
                        				break;
                        			}else if(star1[i].value==5){
                        				star1Val=5;
                        				console.log(star1Val);
                        				break;
                        			}
                        			find=false;
                        		}
                        		
                        		// 적극성 점수 value
                        		var star2Size=star2.length;
                        		console.log("star2Size : "+star2Size);
                        		
                        		for(var i=0; i<star2Size; i++){
                        			if(star2[i].checked==true) {		// 체크되어있는 라디오 버튼을 찾았을 경우
                        				find=true;					// 찾았다는걸로 변환
                        			}
                        			
                        			if(find==false){
                        				star2Val=star2[i].value - 1;
                        				console.log(star2Val);
                        				break;
                        			}else if(star2[i].value==5){
                        				star2Val=5;
                        				console.log(star2Val);
                        				break;
                        			}
                        			find=false;
                        		}
                        		
                        		// 의사소통 점수 value
                        		var star3Size=star3.length;
                        		console.log("star3Size : "+star3Size);
                        		
                        		for(var i=0; i<star3Size; i++){
                        			if(star3[i].checked==true) {		// 체크되어있는 라디오 버튼을 찾았을 경우
                        				find=true;					// 찾았다는걸로 변환
                        			}
                        			
                        			if(find==false){
                        				star3Val=star3[i].value - 1;
                        				console.log(star3Val);
                        				break;
                        			}else if(star3[i].value==5){
                        				star3Val=5;
                        				console.log(star3Val);
                        				break;
                        			}
                        			find=false;
                        		}
                        		
                        		// 일정준수 점수 value
                        		var star4Size=star4.length;
                        		console.log("star4Size : "+star4Size);
                        		
                        		for(var i=0; i<star4Size; i++){
                        			if(star4[i].checked==true) {		// 체크되어있는 라디오 버튼을 찾았을 경우
                        				find=true;					// 찾았다는걸로 변환
                        			}
                        			
                        			if(find==false){
                        				star4Val=star4[i].value - 1;
                        				console.log(star4Val);
                        				break;
                        			}else if(star4[i].value==5){
                        				star4Val=5;
                        				console.log(star4Val);
                        				break;
                        			}
                        			find=false;
                        		}
                        		
                        		// 만족도 점수 value
                        		var star5Size=star5.length;
                        		console.log("star5Size : "+star5Size);
                        		
                        		for(var i=0; i<star5Size; i++){
                        			if(star5[i].checked==true) {		// 체크되어있는 라디오 버튼을 찾았을 경우
                        				find=true;					// 찾았다는걸로 변환
                        			}
                        			
                        			if(find==false){
                        				star5Val=star5[i].value - 1;
                        				console.log(star5Val);
                        				break;
                        			}else if(star5[i].value==5){
                        				star5Val=5;
                        				console.log(star5Val);
                        				break;
                        			}
                        			find=false;
                        		}
                        		
                        		var url="cEvalInsert2.do?cId="+${cId}+"&pId="+${loginUser.memId}+"&proId="
                        				+proId+"&eAgv="+eAgvVal+"&star1="+star1Val+"&star2="+star2Val
                        				+"&star3="+star3Val+"&star4="+star4Val+"&star5="+star5Val;
                        		console.log(url);
                        	})
                        </script>
                        
                        
                    </div>
                </div>  
            </form>
            </div>
        </div>
    </div>
	
	<jsp:include page="../common/footer.jsp"/>
</body>
</html>