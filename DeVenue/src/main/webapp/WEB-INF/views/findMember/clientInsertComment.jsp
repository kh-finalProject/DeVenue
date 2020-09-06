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
                    </c:url>
                    <c:url var="cEvalInsert" value="cEvalInsert.do">
                    	<c:param name="cId" value="${fc.memId }"/>
                    	<c:param name="pId" value="${loginUser.memId }"/>
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
                <form>
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
                                                <div class="dropdown-menu" style="max-height: 400%; overflow-y: auto;">
                                                    <a id="mini" class="dropdown-item">miniProject</a>
                                                    <a id="semi" class="dropdown-item">semiProject</a>
                                                    <a id="final" class="dropdown-item">finalProject</a>
                                                </div>
                                            </div>

                                            <script>
                                                $(function () {
                                                    $("#mini").on("click", function () {
                                                        $("#projectName").text($(this).text());
                                                    });

                                                    $("#semi").on("click", function () {
                                                        $("#projectName").text($(this).text());
                                                    });

                                                    $("#final").on("click", function () {
                                                        $("#projectName").text($(this).text());
                                                    });
                                                });
                                            </script>
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
                                                <input type="radio" id="star5" name="rating" value="5" /><label for="star5" title="good!">5 stars</label>
                                                <input type="radio" id="star4" name="rating" value="4" /><label for="star4" title="Pretty good">4 stars</label>
                                                <input type="radio" id="star3" name="rating" value="3" /><label for="star3" title="so so">3 stars</label>
                                                <input type="radio" id="star2" name="rating" value="2" /><label for="star2" title="not bad">2 stars</label>
                                                <input type="radio" id="star1" name="rating" value="1" /><label for="star1" title="bad">1 star</label>
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
                                    <textarea style="margin-left: 15%;" class="form-control z-depth-1" id="ratingContent" rows="3" placeholder="클라이언트를 평가해주세요..."></textarea>
                                  </div>
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
                                    <fieldset class="rating">
                                        <input type="radio" id="star5" name="pro" value="5" /><label for="star5" title="good!">5 stars</label>
                                        <input type="radio" id="star4" name="pro" value="4" /><label for="star4" title="Pretty good">4 stars</label>
                                        <input type="radio" id="star3" name="pro" value="3" /><label for="star3" title="so so">3 stars</label>
                                        <input type="radio" id="star2" name="pro" value="2" /><label for="star2" title="not bad">2 stars</label>
                                        <input type="radio" id="star1" name="pro" value="1" /><label for="star1" title="bad">1 star</label>
                                    </fieldset>
                                </td>
                            </tr>
                            <tr>
                                <td style="width:40%;">
                                    <p>적극성</p>
                                </td>
                                <td>
                                    <fieldset class="rating">
                                        <input type="radio" id="star5" name="rating" value="5" /><label for="star5" title="good!">5 stars</label>
                                        <input type="radio" id="star4" name="rating" value="4" /><label for="star4" title="Pretty good">4 stars</label>
                                        <input type="radio" id="star3" name="rating" value="3" /><label for="star3" title="so so">3 stars</label>
                                        <input type="radio" id="star2" name="rating" value="2" /><label for="star2" title="not bad">2 stars</label>
                                        <input type="radio" id="star1" name="rating" value="1" /><label for="star1" title="bad">1 star</label>
                                    </fieldset>
                                </td>
                            </tr>
                            <tr>
                                <td style="width:40%;">
                                    <p>일정준수</p>
                                </td>
                                <td>
                                    <fieldset class="rating">
                                        <input type="radio" id="star5" name="rating" value="5" /><label for="star5" title="good!">5 stars</label>
                                        <input type="radio" id="star4" name="rating" value="4" /><label for="star4" title="Pretty good">4 stars</label>
                                        <input type="radio" id="star3" name="rating" value="3" /><label for="star3" title="so so">3 stars</label>
                                        <input type="radio" id="star2" name="rating" value="2" /><label for="star2" title="not bad">2 stars</label>
                                        <input type="radio" id="star1" name="rating" value="1" /><label for="star1" title="bad">1 star</label>
                                    </fieldset>
                                </td>
                            </tr>
                            <tr>
                                <td style="width:40%;">
                                    <p>의사소통</p>
                                </td>
                                <td>
                                    <fieldset class="rating">
                                        <input type="radio" id="star5" name="rating" value="5" /><label for="star5" title="good!">5 stars</label>
                                        <input type="radio" id="star4" name="rating" value="4" /><label for="star4" title="Pretty good">4 stars</label>
                                        <input type="radio" id="star3" name="rating" value="3" /><label for="star3" title="so so">3 stars</label>
                                        <input type="radio" id="star2" name="rating" value="2" /><label for="star2" title="not bad">2 stars</label>
                                        <input type="radio" id="star1" name="rating" value="1" /><label for="star1" title="bad">1 star</label>
                                    </fieldset>
                                </td>
                            </tr>
                            <tr>
                                <td style="width:40%;">
                                    <p>만족도</p>
                                </td>
                                <td>
                                    <fieldset class="rating">
                                        <input type="radio" id="star5" name="rating" value="5" /><label for="star5" title="good!">5 stars</label>
                                        <input type="radio" id="star4" name="rating" value="4" /><label for="star4" title="Pretty good">4 stars</label>
                                        <input type="radio" id="star3" name="rating" value="3" /><label for="star3" title="so so">3 stars</label>
                                        <input type="radio" id="star2" name="rating" value="2" /><label for="star2" title="not bad">2 stars</label>
                                        <input type="radio" id="star1" name="rating" value="1" /><label for="star1" title="bad">1 star</label>
                                    </fieldset>
                                </td>
                            </tr>

                        </table>

                        <div style="float:right; margin-right: 8%; margin-top:2%; margin-bottom: 5%;">
                            <button class="btn btn-light" type="button">취소하기</button>&nbsp;
                            <button class="btn btn-info">등록하기</button>
                        </div>
                    </div>
                </div>  
            </form>
            </div>
        </div>
    </div>
	
	<jsp:include page="../common/footer.jsp"/>
</body>
</html>