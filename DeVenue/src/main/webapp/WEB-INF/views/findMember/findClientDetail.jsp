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
            margin-left: 7%;
        }
        #firstStar{
			margin-right:0;
		}
		
		.fas{
			margin-right:0;
		}

        /* 이미지 사이즈 맞추기 */
        .image-container{
            width: auto;
            height:15rem;
            overflow: hidden;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .image-container img{
            object-fit: fill;
        }
</style>

<!-- chart -->
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
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
                    <!-- <div class="col-8" style="margin-left:5%;">
                        &emsp;<b>user01(닉네임)</b>&emsp;<a class="badge badge-info">개인</a><br>
                        &emsp;<i class="far fa-address-card"></i>&nbsp;신원인증
                        &emsp;<i class="fas fa-phone-alt"></i>&nbsp;연락처 등록
                    </div> -->
                    <div class="col-8" style="margin-left:5%;">
                        &emsp;<b>${fc.memNick }</b>&emsp;<a class="badge badge-info">${fc.memTypeName }</a><br>
                        <c:if test="${fc.ideStatus eq 'COMPLETE' }">
                        &emsp;<i class="far fa-address-card"></i>&nbsp;신원인증
                        </c:if>
                        <c:if test="${!empty fc.phone }">
                        &emsp;<i class="fas fa-phone-alt"></i>&nbsp;연락처 등록
                        </c:if>
                    </div>
                    <div class="col-2" style="margin:0 auto; margin-right: 5%;">
                        <button class="btn-lg btn-info" style="float:right;" type="button">신고</button>
                        <!-- 신고 만들어야함 -->
                    </div>
                </div>
            </div>

        </div>

        <div class="row">
            <div class="col-2 text-white" style="border-right: 1px solid lightgray; font-family: 'Jua', sans-serif;">
                <br>
                <div style="padding-bottom: 5.5%;">
                    <div class="image-container">
                        <img src="${contextPath }/resources/images/${fc.profileImg}" style="object-fit: cover;">
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
                <div class="userBoard">
                    &emsp;
                    <input type="hidden" value="선택한 회원 ID">

                    <div class="row"
                        style="margin-left:3%; margin-right:3%;border-top: 1px solid lightgray; border-bottom: 1px solid lightgray;">
                        <div class="col-3" style="border-right: 1px solid lightgray;">
                            <div class="point"><b>활동 정보</b></div>
                            <div id="starPoint" class="point" style="text-align: center;">
                                <c:choose>
                                    	<c:when test="${fc.avgEagv == 0 }">
	                                        <i id="firstStar" class="far fa-star"></i>
	                                        <i class="fas fa-star"></i>
	                                        <i class="fas fa-star-half-alt"></i>
	                                        <i class="fas fa-star"></i>
	                                        <i class="fas fa-star-half-alt"></i>
                                        </c:when>
                                        <c:when test="${fc.avgEagv > 0 && fc.avgEagv < 1 }">
	                                        <i id="firstStar" class="fas fa-star-half-alt"></i>
	                                        <i class="far fa-star"></i>
	                                        <i class="far fa-star"></i>
	                                        <i class="far fa-star"></i>
	                                        <i class="far fa-star"></i>
                                        </c:when>
                                        <c:when test="${fc.avgEagv == 1 }">
	                                        <i id="firstStar" class="fas fa-star"></i>
	                                        <i class="far fa-star"></i>
	                                        <i class="far fa-star"></i>
	                                        <i class="far fa-star"></i>
	                                        <i class="far fa-star"></i>
                                        </c:when>
                                        <c:when test="${fc.avgEagv > 1 && fc.avgEagv < 2 }">
	                                        <i id="firstStar" class="fas fa-star"></i>
	                                        <i class="fas fa-star-half-alt"></i>
	                                        <i class="far fa-star"></i>
	                                        <i class="far fa-star"></i>
	                                        <i class="far fa-star"></i>
                                        </c:when>
                                        <c:when test="${fc.avgEagv == 2 }">
                                        	<i id="firstStar" class="fas fa-star"></i>
                                        	<i class="fas fa-star"></i>
                                        	<i class="far fa-star"></i>
	                                        <i class="far fa-star"></i>
	                                        <i class="far fa-star"></i>
                                        </c:when>
                                        <c:when test="${fc.avgEagv > 2 && fc.avgEagv < 3 }">
	                                        <i id="firstStar" class="fas fa-star"></i>
	                                        <i class="fas fa-star"></i>
	                                        <i class="fas fa-star-half-alt"></i>
	                                        <i class="far fa-star"></i>
	                                        <i class="far fa-star"></i>
                                        </c:when>
                                        <c:when test="${fc.avgEagv == 3 }">
                                        	<i id="firstStar" class="fas fa-star"></i>
                                        	<i class="fas fa-star"></i>
                                        	<i class="fas fa-star"></i>
	                                        <i class="far fa-star"></i>
	                                        <i class="far fa-star"></i>
                                        </c:when>
                                        <c:when test="${fc.avgEagv > 3 && fc.avgEagv < 4 }">
	                                        <i id="firstStar" class="fas fa-star"></i>
	                                        <i class="fas fa-star"></i>
	                                        <i class="fas fa-star"></i>
	                                        <i class="fas fa-star-half-alt"></i>
	                                        <i class="far fa-star"></i>
                                        </c:when>
                                        <c:when test="${fc.avgEagv == 4 }">
                                        	<i id="firstStar" class="fas fa-star"></i>
                                        	<i class="fas fa-star"></i>
                                        	<i class="fas fa-star"></i>
	                                        <i class="fas fa-star"></i>
	                                        <i class="far fa-star"></i>
                                        </c:when>
                                        <c:when test="${fc.avgEagv > 4 && fc.avgEagv < 5 }">
	                                        <i id="firstStar" class="fas fa-star"></i>
	                                        <i class="fas fa-star"></i>
	                                        <i class="fas fa-star"></i>
	                                        <i class="fas fa-star"></i>
	                                        <i class="fas fa-star-half-alt"></i>
                                        </c:when>
                                        <c:when test="${fc.avgEagv == 5 }">
                                        	<i id="firstStar" class="fas fa-star"></i>
                                        	<i class="fas fa-star"></i>
                                        	<i class="fas fa-star"></i>
                                        	<i class="fas fa-star"></i>
                                        	<i class="fas fa-star"></i>
										</c:when>
                                    </c:choose>
                            </div>
                            <div style="text-align: center;">
                                <!-- <p>4.5 / 평가 4개</p> -->
                                ${fc.avgEagv } / 평가 ${fc.countEagv }개
                            </div>
                            <div class="point">
                                <b>진행한 프로젝트 수</b>
                                <!-- <b style="float:right">22개</b> -->
                                <b style="float:right">${fc.countProId }개</b>
                            </div>
                            <div class="point" style="margin-right:0;">
                                <b>자주 진행한 프로젝트</b>
                                <!-- <a class="badge badge-info">WEB</a> -->
                                <a class="badge badge-info">${fc.maxDcType }</a>
                            </div>
                        </div>
                        <div class="col-3">
                            <div class="point" style="margin-bottom: 0;"><b>세부 평가</b></div>
                            <div style="display: flex;">
                                <div class="point" style="flex:1; margin-right: 0;">
                                    <p>전문성</p>
                                    <p>적극성</p>
                                    <p>일정 준수</p>
                                    <p>의사 소통</p>
                                    <p>만족도</p>
                                </div>
                                <div class="point" style="flex:1; margin-right: 0;">
                                    <p style="margin-left:65%; width: 100%;">${fc.star1 }점</p>
                                    <p style="margin-left:65%; width: 100%;">${fc.star2 }점</p>
                                    <p style="margin-left:65%; width: 100%;">${fc.star3 }점</p>
                                    <p style="margin-left:65%; width: 100%;">${fc.star4 }점</p>
                                    <p style="margin-left:65%; width: 100%;">${fc.star5 }점</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-3" style="border-right: 1px solid lightgray;">
                            <div id="graphs" class="point" style="flex:1;" style="width: 20%;">
                                <canvas id="myChart"></canvas>
                                <script>
                                	var star1=${fc.star1 };
                                	var star2=${fc.star2 };
                                	var star3=${fc.star3 };
                                	var star4=${fc.star4 };
                                	var star5=${fc.star5 };
                                
                                    var ctx = document.getElementById('myChart').getContext('2d');
                                    var myRadarChart = new Chart(ctx, {
                                        type: 'radar',
                                        data: {
                                            labels: ['전문성', '적극성', '일정준수', '의사소통', '만족도'],
                                            datasets: [{
                                                label: '',
                                                scaleOverride: true,
                                                strokeColor: "rgba(255,255,255,1)",
                                                backgroundColor: 'rgba(23, 162, 184,0.5)',
                                                borderColor: 'rgba(23, 162, 184)',
                                            	/* data: [4.0, 4.0, 4.0, 4.0, 4.0] */
                                                data: [star1, star2, star3, star4, star5]
                                            }]
                                        },
                                        options: {
                                            maintainAspectRatio: false,
                                            legend: {
                                                display: false
                                            },
                                            tooltips: {
                                                callbacks: {
                                                    label: function (tooltipItem) {
                                                        return tooltipItem.yLabel;
                                                    }
                                                }
                                            },
                                            animation: {
                                                duration: 0 // general animation time
                                            },
                                            hover: {
                                                animationDuration: 0 // duration of animations when hovering an item
                                            },
                                            responsiveAnimationDuration: 0, // animation duration after a resize
                                            scale: {
                                                gridLines: {
                                                    color: ['white', 'white', 'white', 'white', 'white']
                                                },
                                                angleLines: {
                                                    display: false,
                                                    color: 'white'
                                                },
                                                ticks: {
                                                    beginAtZero: true,
                                                    min: 0,
                                                    max: 5,
                                                    stepSize: 1,
                                                    display:true
                                                }
                                            }
                                        }
                                    });

                                </script>
                            </div>
                        </div>
                        <div class="col-3">
                            <div class="point"><b>진행한 프로젝트 분류</b></div>
                            <div class="point">
                                <p>WEB</p>
                                <p>APPLICATION</p>
                                <p>PUBLISHING</p>
                                <p>ETC</p>
                                
                            </div>
                        </div>
                    </div>
                </div>

                <div class="userBoard">
                    &emsp;
                    <div class="point" style="margin-top:0; margin-bottom:1%;"><b>자기 소개</b></div>
                    <div style="margin-left:6%; width:80%;">
                        <!-- <p>
                            당시 마르셀리노 감독이 경질될 때 유스 선수들을 중용하지 않는 점이 이유 중 하나로 꼽힌 바 있다. 새롭게 부임한 그라시아 감독 역시 수뇌부로부터 유스 선수들을 많이 기용하라는 주문을 받은 것로 알려졌다.

이어 페란은 “마르셀리노는 훌륭한 감독이다. 나는 그에게 많은 빚을 졌다”면서 “이강인을 정말 좋아한다. 그 역시 알고 있다. 나와 소브리노가 이강인에게 많은 도움을 줬다. 이강인은 위대한 선수가 될 것이다. 발렌시아가 나와 같은 실수를 하지 않기를 바란다. 이강인은 매우 힘들고 외로움을 느꼈기 때문에 사랑과 신뢰가 필요하다”고 덧붙였다.

한편 이강인은 2022년 6월이면 발렌시아와의 계약이 만료된다. 발렌시아는 올해 혹은 내년 이강인이 떠나지 않도록 하기 위해 재계약 제안을 건넨 것으로 알려졌다. 하지만 다수 스페인 매체들은 “이강인이 출전 기회를 잡고자 이적을 원한다”고 보도 중이다.
                        </p> -->
                        <p>${fc.introduction }</p>
                        <a href="#" style="float: right;">자기소개  더 보기 ></a>
                    </div>
                </div>
            </div>
        </div>
    </div>
	
	<jsp:include page="../common/footer.jsp"/>
</body>
</html>