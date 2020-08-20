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
                        <div class="point col-12" style="margin-left:6%;">
                            <h4>클라이언트 평가</h4>
                            <div style="margin-left: 2%;">
                                <table style="width: 30%;">
                                    <tr>
                                        <td>
                                            <div>
                                                <p>계약한 프로젝트 수</p>&emsp;
                                            </div>
                                        </td>
                                        <td>
                                            <div>
                                                <p>22개</p>&emsp;
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <div>
                                                <p>프로젝트 평균 평점</p>&emsp;
                                            </div>
                                        </td>
                                        <td>
                                            <div>
                                                <p>4.5점</p>&emsp;
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="point col-12" style="margin-left:2%;">
                        <table style="width: 95%; vertical-align: middle; text-align: center;">
                            <tr>
                                <td>
                                    <h4>파트너스 평가</h4>
                                </td>
                                <td>
                                    <div style="float:right; margin-right: 2%;">
                                        <div class="d-flex">
                                            <div class="dropdown mr-1">
                                                <button type="button" class="btn btn-light dropdown-toggle"
                                                    id="dropdownMenuOffset" data-toggle="dropdown" aria-haspopup="true"
                                                    aria-expanded="false" data-offset="10,20">
                                                    	전체보기
                                                </button>
                                                <div class="dropdown-menu" aria-labelledby="dropdownMenuOffset">
                                                    <a id="allMenu" class="dropdown-item" href="#">전체보기</a>
                                                    <a id="develop" class="dropdown-item" href="#">개발</a>
                                                    <a id="design" class="dropdown-item" href="#">디자인</a>
                                                </div>
                                            </div>
                                            <div class="btn-group">
                                                <button type="button" class="btn btn-light">세부 카테고리</button>
                                                <button type="button"
                                                    class="btn btn-light dropdown-toggle dropdown-toggle-split"
                                                    id="dropdownMenuReference" data-toggle="dropdown"
                                                    aria-haspopup="true" aria-expanded="false" data-reference="parent">
                                                    <span class="sr-only">Toggle Dropdown</span>
                                                </button>
                                                <div class="dropdown-menu" aria-labelledby="dropdownMenuReference">
                                                    <a class="dropdown-item" href="#">Web</a>
                                                    <a class="dropdown-item" href="#">Application</a>
                                                    <a class="dropdown-item" href="#">Publishing</a>
                                                    <a class="dropdown-item" href="#">기타</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <script>
                                        $("#develop").on("click", function () {
                                            $("#dropdownMenuOffset").text($(this).text());
                                        });

                                        $("#design").on("click", function () {
                                            $("#dropdownMenuOffset").text($(this).text());
                                        })
                                    </script>
                                </td>
                            </tr>
                        </table>
                        <table
                            style="margin-left: 5%; margin-top: 2%; width:90%; border-top:1px solid lightgray; border-bottom: 1px solid lightgray;">
                            <tr>
                                <td style="height: 15%;">
                                    <p>프로젝트명</p>
                                </td>
                                <td>
                                    <p>finalProject&nbsp;<a class="badge badge-info">WEB</a></p>
                                </td>
                                <td rowspan="3" style="border-left: 1px solid lightgray">
                                    <div class="point" style="margin-bottom: 0;"><b>세부 평가</b></div>
                                    <!-- <div style="display: flex;">
                                        <div class="point" style="flex:1; margin-bottom: 0; margin-right: 0;">
                                            <p>전문성</p>
                                            <p>적극성</p>
                                            <p>일정 준수</p>
                                            <p>의사 소통</p>
                                            <p>만족도</p>
                                        </div>
                                        <div class="point" style="flex:1; margin-right: 0;">
                                            <p>4점</p>
                                            <p>4점</p>
                                            <p>4점</p>
                                            <p>4점</p>
                                            <p>4점</p>
                                        </div>
                                        <div id="graphs" class="point" style="flex:1;" style="width: 20%;">
                                            <canvas id="myChart"></canvas>
                                            <script>
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
                                                            data: [4.0, 4.0, 4.0, 4.0, 4.0]
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
                                                                stepSize: 1
                                                            }
                                                        }
                                                    }
                                                });
            
                                            </script>
                                        </div>
                                    </div> -->
                                    <div class="row">
                                        <div class="point col-3" style="margin-right: 0;">
                                            <p>전문성</p>
                                            <p>적극성</p>
                                            <p>일정 준수</p>
                                            <p>의사 소통</p>
                                            <p>만족도</p>
                                        </div>
                                        <div class="point col-2" style="margin-left: 0; margin-right: 0;">
                                            <p>4점</p>
                                            <p>4점</p>
                                            <p>4점</p>
                                            <p>4점</p>
                                            <p>4점</p>
                                        </div>
                                        <div id="graphs" class="col-6">
                                            <canvas id="myChart"></canvas>
                                            <script>
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
                                                            data: [4.0, 4.0, 4.0, 4.0, 4.0]
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
                                                                stepSize: 1
                                                            }
                                                        }
                                                    }
                                                });

                                            </script>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 20%; height: 10%;">
                                    <p>평가 점수</p>
                                </td>
                                <td>
                                    <p>4점</p>
                                </td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td style="width: 20%;">
                                    <p>평가 내용</p>
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td style="width: 20%;" colspan="3">
                                    <p style="margin-top: 1%;">
                                        당시 마르셀리노 감독이 경질될 때 유스 선수들을 중용하지 않는 점이 이유 중 하나로 꼽힌 바 있다. 새롭게 부임한 그라시아 감독 역시
                                        수뇌부로부터 유스 선수들을 많이 기용하라는 주문을 받은 것로 알려졌다.

                                        이어 페란은 “마르셀리노는 훌륭한 감독이다. 나는 그에게 많은 빚을 졌다”면서 “이강인을 정말 좋아한다. 그 역시 알고 있다. 나와 소브리노가
                                        이강인에게 많은 도움을 줬다. 이강인은 위대한 선수가 될 것이다. 발렌시아가 나와 같은 실수를 하지 않기를 바란다. 이강인은 매우 힘들고
                                        외로움을 느꼈기 때문에 사랑과 신뢰가 필요하다”고 덧붙였다.

                                        한편 이강인은 2022년 6월이면 발렌시아와의 계약이 만료된다. 발렌시아는 올해 혹은 내년 이강인이 떠나지 않도록 하기 위해 재계약 제안을 건넨
                                        것으로 알려졌다. 하지만 다수 스페인 매체들은 “이강인이 출전 기회를 잡고자 이적을 원한다”고 보도 중이다.
                                    </p>
                                    <a href="#" style="float: right;">평가 내용 더 보기 ></a>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
        </div>

    </div>
	
	<jsp:include page="../common/footer.jsp"/>
</body>
</html>