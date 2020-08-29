<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

        .point div ul li {
            margin: 0;
            margin-top: 2%;
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
        
        .fas{
        	margin-right: 0;
        }
        #firstStar{
        	margin-right:0;
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
                        &emsp;<b>user01(닉네임)</b>&emsp;<a class="badge badge-info">개인</a><br>
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
                        <p id="clientInfo">클라이언트 정보</p>
                        <p id="projectHistory">프로젝트 히스토리</p>
                        <p id="clientEvaluate">평가<i style="float: right; margin-right: 5%;"
                                class="fas fa-angle-down"></i></p>
                        <div id="subClientEva" style="display:none; margin-left: 5%;">
                            <p id="clientComment">평가 조회</p>
                            <p id="insertCComment">평가 등록</p>
                        </div>
                    </div>
                    <script>
                        $("#clientInfo").on("click", function () {
                            location.href = "findClientDetail.html";
                        }).on("mouseenter", function () {

                        });

                        $("#projectHistory").on("click", function () {
                            location.href = "projectHistory.html";
                        });

                        $("#clientEvaluate").click(function () {

                            $("#subClientEva").toggle();
                        });

                        $("#clientComment").on("click", function () {
                            location.href = "clientComment.html";
                        });

                        $("#insertCComment").on("click", function () {
                            location.href = "insertCComment.html";
                        });
                    </script>

                </div>
            </div>
            <div class="col-10 text-white" style="font-family: 'Jua', sans-serif;">
                <div class="userBoard">
                    &emsp;
                    <input type="hidden" value="선택한 회원 ID">

                    <div class="row"
                        style="margin-left:3%; margin-right:3%;border-top: 1px solid lightgray; border-bottom: 1px solid lightgray;">
                        <h4 style="margin-left: 3%; margin-top: 2%; padding-bottom: 1%; width:85%; border-bottom: 1px dashed lightgray;">프로젝트 히스토리</h4>
                        <div class="point col-10" style="margin-left:2%; margin-top: 0; display: flex; padding:0;">
                            <div style="margin-top: 1%; flex:1;">
                                <table style="width: 70%;">
                                    <tr>
                                        <td>
                                            <div>
                                                <p>등록한 프로젝트 수</p>&emsp;
                                            </div>
                                        </td>
                                        <td>
                                            <div style="text-align: right;">
                                                <p>50개</p>&emsp;
                                            </div>
                                        </td>
                                    </tr>
                                    <tr style="height: 10%;">
                                        <td style="height: 10%;"><p>계약한 프로젝트 수</p>
                                        </td>
                                        <td style="height: 10%;">
                                            <div style="text-align: right;">
                                                <p>22개</p>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <div style="margin-left: 6%; margin-bottom: 3%;">
                                                계약률<br>
                                                진행중인 프로젝트<br>
                                                완료한 프로젝트
                                            </div>
                                        </td>
                                        <td>
                                            <div style="float: right;">
                                                100%<br>
                                                10개<br>
                                                12개
                                            </div>
                                        </td>
                                    </tr>
                                    <tr style="border-top:1px dashed lightgray;">
                                        <td>
                                            <div style="margin-top: 5%;">
                                                <p>누적 완료 금액</p>&emsp;
                                            </div>
                                        </td>
                                        <td>
                                            <div style="margin-top: 5%; text-align: right;">
                                                <p>1,000,000원</p>&emsp;
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <div style="margin-top: 1%; flex:1;">
                                <table style="width: 100%;">
									<tr>
										<td colspan="2"><b>평균 평점</b></td>
										<td style="text-align: center;">
											<i id="firstStar" class="far fa-star"></i>
											<i class="fas fa-star"></i>
											<i class="fas fa-star-half-alt"></i>
											<i class="fas fa-star"></i>
											<i class="fas fa-star-half-alt"></i>
										</td>
										<td style="text-align: center;"><b>4.5 / 평가 4개</b></td>
									</tr>
									<tr><td>&nbsp;</td></tr>
									<tr>
										<td colspan="2">전문성</td>
										<td style="text-align: center;">
											<i id="firstStar" class="far fa-star"></i>
											<i class="fas fa-star"></i>
											<i class="fas fa-star-half-alt"></i>
											<i class="fas fa-star"></i>
											<i class="fas fa-star-half-alt"></i>
										</td>
										<td style="text-align: center;">4.5</td>
									</tr>
									<tr>
										<td colspan="2">적극성</td>
										<td style="text-align: center;">
											<i id="firstStar" class="far fa-star"></i>
											<i class="fas fa-star"></i>
											<i class="fas fa-star-half-alt"></i>
											<i class="fas fa-star"></i>
											<i class="fas fa-star-half-alt"></i>
										</td>
										<td style="text-align: center;">4.5</td>
									</tr>
									<tr>
										<td colspan="2">일정 준수</td>
										<td style="text-align: center;">
											<i id="firstStar" class="far fa-star"></i>
											<i class="fas fa-star"></i>
											<i class="fas fa-star-half-alt"></i>
											<i class="fas fa-star"></i>
											<i class="fas fa-star-half-alt"></i>
										</td>
										<td style="text-align: center;">4.5</td>
									</tr>
									<tr>
										<td colspan="2">의사 소통</td>
										<td style="text-align: center;">
											<i id="firstStar" class="far fa-star"></i>
											<i class="fas fa-star"></i>
											<i class="fas fa-star-half-alt"></i>
											<i class="fas fa-star"></i>
											<i class="fas fa-star-half-alt"></i>
										</td>
										<td style="text-align: center;">4.5</td>
									</tr>
									<tr>
										<td colspan="2">만족도</td>
										<td style="text-align: center;">
											<i id="firstStar" class="far fa-star"></i>
											<i class="fas fa-star"></i>
											<i class="fas fa-star-half-alt"></i>
											<i class="fas fa-star"></i>
											<i class="fas fa-star-half-alt"></i>
										</td>
										<td style="text-align: center;">4.5</td>
									</tr>
								</table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
	
	<jsp:include page="../common/footer.jsp"/>
</body>
</html>