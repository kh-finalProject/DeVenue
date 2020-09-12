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
        
        .fas{
			margin-right:0;
		}
		.far{
			margin-right:0;
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
        
        /*페이지네이션*/
      #pagination>div{
        margin-top: 1rem;
      }
</style>

<!-- chart -->
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
</head>
<body>
	<jsp:include page="../common/menubar.jsp"/>
	
	<!-- 
		msg의 값이 0일때 : 평가 대상 아님
		msg의 값이 1일때 : 평가 가능한 대상
	-->
	<c:if test="${msg eq 0 }">
		<script>
			$(document).ready(function(){
				alert("평가 대상이 아닙니다.");
			});
		</script>
	</c:if>
	<c:if test="${msg eq 2 }">
		<script>
			$(document).ready(function(){
				$("#cp1").css("display", "none");
        		$("#showMoreComment").css("display","none");
        		$("#moreComment").css("display","");
        		$("#pagination").css("display","");
        		$("#cate").css("display","");
			});
		</script>
	</c:if>
	
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
                        <!-- &emsp;<b>user01(닉네임)</b>&emsp;<a class="badge badge-info">개인</a><br>
                        &emsp;<i class="far fa-address-card"></i>&nbsp;신원인증
                        &emsp;<i class="fas fa-phone-alt"></i>&nbsp;연락처 등록 -->
                        &emsp;<b>${fc.memNick }</b>&emsp;<a class="badge badge-info">${fc.memTypeKind }</a><br>
                        <c:if test="${fc.ideStatus eq 'COMPLETE' }">
                        &emsp;<i class="far fa-address-card"></i>&nbsp;신원인증
                        </c:if>
                        <c:if test="${!empty fc.phone }">
                        &emsp;<i class="fas fa-phone-alt"></i>&nbsp;연락처 등록
                        </c:if>
                    </div>
                    <div class="col-2" style="margin:0 auto; margin-right: 5%;">
                        <button class="btn-lg btn-info" style="float:right;" type="button"  data-toggle="modal" data-target="#exampleModal">신고</button>
                    </div>
					  <!-- 신고 모달 -->
					  <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
					  <div class="modal-dialog">
					    <div class="modal-content modal-xl text-dark">
					      <div class="modal-header">
					        <h5 class="modal-title" id="exampleModalLabel">신고</h5>
					        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
					          <span aria-hidden="true">&times;</span>
					        </button>
					      </div>
					      <div class="modal-body">
					        <form action="clientReport.do" method="post">
					          <div class="form-group">
					            <label for="recipient-name" class="col-form-label">클라이언트</label>
					            <input type="text" class="form-control" id="recipient-name" value="${fc.memNick }" readonly>
					            <input type="hidden" name="reportCid" value="${fc.memId }">
					            <input type="hidden" name="pId" value="${loginUser.memId }">
					          </div>
					          <div class="form-group">
					            <label for="message-text" class="col-form-label">신고 내용</label>
					            <textarea class="form-control" name="reportContent" id="message-text" placeholder="신고 내용을 입력하세요. 허위 사실을 입력할 시 제재를 받으실 수 있습니다."></textarea>
					          </div>
					          <div class="modal-footer">
					        <button type="button" class="btn btn-lg btn-secondary" data-dismiss="modal">취소</button>
					        <button type="submit" class="btn btn-lg btn-primary">신고</button>
					      </div>
					        </form>
					      </div>
					      
					    </div>
					  </div>
					</div>
                </div>
            </div>

        </div>

        <div class="row">
            <div class="col-2 text-white" style="border-right: 1px solid lightgray; font-family: 'Jua', sans-serif;">
                <br>
                <div style="padding-bottom: 5.5%;">
                    <div class="image-container">
                        <c:if test="${!empty fc.profileImg }">
                        <img src="${contextPath }/resources/proImg/${fc.profileImg}" style="object-fit: cover;">
	                    </c:if>
	                    <c:if test="${empty fc.profileImg }">
	                        <img src="${contextPath }/resources/proImg/user1.png" style="object-fit: cover;">
	                    </c:if>
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
                    			<c:param name="pId" value="-1"/>
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
                                                <!-- <p>22개</p>&emsp; -->
                                                <p>${fc.stopProject + fc.ingProject + fc.completeProject }개</p>&emsp;
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
                                                <!-- <p>4.5점</p>&emsp; -->
                                                <p>${fc.avgEagv }점</p>&emsp;
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
                                    <div style="float:right; margin-right: 2%; display:none;" id="cate">
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
	                        <c:forEach var="cp" items="${cp }" varStatus="status"  end="0">
	                        <table id="cp${status.count }"
	                            style="margin-left: 5%; margin-top: 2%; width:90%; border-top:1px solid lightgray; border-bottom: 1px solid lightgray;">
	                            <tr>
	                                <td style="height: 15%;">
	                                    <p>프로젝트명</p>
	                                </td>
	                                <td>
	                                    <!-- <p>finalProject&nbsp;<a class="badge badge-info">WEB</a></p> -->
	                                    <p>${cp.proName }&nbsp;<a class="badge badge-info">${cp.dcType }</a></p>
	                                </td>
	                                <td rowspan="3" style="border-left: 1px solid lightgray">
	                                    <div class="point" style="margin-bottom: 0;"><b>세부 평가</b></div>
	                                    <div class="row">
	                                        <div class="point col-3" style="margin-right: 0;">
	                                            <p>전문성</p>
	                                            <p>적극성</p>
	                                            <p>일정 준수</p>
	                                            <p>의사 소통</p>
	                                            <p>만족도</p>
	                                        </div>
	                                        <div class="point col-2" style="margin-left: 0; margin-right: 0;">
	                                            <!-- <p>4점</p>
	                                            <p>4점</p>
	                                            <p>4점</p>
	                                            <p>4점</p>
	                                            <p>4점</p> -->
	                                            <p>${cp.star1 }점</p>
	                                            <p>${cp.star2 }점</p>
	                                            <p>${cp.star3 }점</p>
	                                            <p>${cp.star4 }점</p>
	                                            <p>${cp.star5 }점</p>
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
	                                                            /* data: [4.0, 4.0, 4.0, 4.0, 4.0] */
	                                                            data: [${cp.star1 },${cp.star2 },${cp.star3 },${cp.star4 },${cp.star5 }]
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
	                                    <!-- <p>4점</p> -->
	                                    <p>${cp.eAgv }점</p>
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
	<!--                                         당시 마르셀리노 감독이 경질될 때 유스 선수들을 중용하지 않는 점이 이유 중 하나로 꼽힌 바 있다. 새롭게 부임한 그라시아 감독 역시
	                                        수뇌부로부터 유스 선수들을 많이 기용하라는 주문을 받은 것로 알려졌다.
	
	                                        이어 페란은 “마르셀리노는 훌륭한 감독이다. 나는 그에게 많은 빚을 졌다”면서 “이강인을 정말 좋아한다. 그 역시 알고 있다. 나와 소브리노가
	                                        이강인에게 많은 도움을 줬다. 이강인은 위대한 선수가 될 것이다. 발렌시아가 나와 같은 실수를 하지 않기를 바란다. 이강인은 매우 힘들고
	                                        외로움을 느꼈기 때문에 사랑과 신뢰가 필요하다”고 덧붙였다.
	
	                                        한편 이강인은 2022년 6월이면 발렌시아와의 계약이 만료된다. 발렌시아는 올해 혹은 내년 이강인이 떠나지 않도록 하기 위해 재계약 제안을 건넨
	                                        것으로 알려졌다. 하지만 다수 스페인 매체들은 “이강인이 출전 기회를 잡고자 이적을 원한다”고 보도 중이다. -->
	                                        ${cp.eContent }
	                                    </p>
	                                    <a id="showMoreComment" href="#" style="float: right;">파트너스 평가  더 보기 ></a>
	                                    					                
						                <script>
						                	$("#showMoreComment").on("click", function(){
						                		$("#cp1").css("display", "none");
						                		$("#showMoreComment").css("display","none");
						                		$("#moreComment").css("display","");
						                		$("#pagination").css("display","");
						                		$("#cate").css("display","");
						                	})
						                </script>
	                                </td>
	                            </tr>
	                        </table>
	                        </c:forEach>
	                        
	                        <!-- 평가 더보기 눌렀을 때 -->
	                        <div id="moreComment" style="display:none;">
	                        <c:forEach var="cp" items="${cp }" varStatus="status">
	                        <table id="cp${status.count }" border="0" style="margin-left: 5%; margin-top: 2%; width:90%; border-top:1px solid lightgray; border-bottom: 1px solid lightgray;">
	                            <tr>
	                                <td style="height: 15%;padding:0px;">
	                                    <p>프로젝트명</p>
	                                </td>
	                                <td style="padding:0px;">
	                                    <p>${cp.proName }&nbsp;<a class="badge badge-info">${cp.dcType }</a></p>
	                                </td>
	                                <td rowspan="3" style="border-left: 1px solid lightgray;padding:0px;">
	                                    <div class="row">
	                                        <div class="col-0" style="margin-right: 0;visibility:hidden;width:0px;">
	                                            <p>전문성</p>
	                                            <p>적극성</p>
	                                            <p>일정 준수</p>
	                                            <p>의사 소통</p>
	                                            <p>만족도</p>
	                                        </div>
	                                        <div class="col-0" style="margin-left: 0; margin-right: 0;visibility:hidden">
	                                            <p>${cp.star1 }점</p>
	                                            <p>${cp.star2 }점</p>
	                                            <p>${cp.star3 }점</p>
	                                            <p>${cp.star4 }점</p>
	                                            <p>${cp.star5 }점</p>
	                                        </div>
	                                        <div id="graphs" class="col-10"  >
	                                            <canvas id="myChart${status.count }"></canvas>
	                                            <script>
	                                                var ctx${status.count} = document.getElementById('myChart${status.count}').getContext('2d');
	                                                
	                                                var myRadarChart = new Chart(ctx${status.count}, {
	                                                    type: 'radar',
	                                                    data: {
	                                                        labels: ['전문성('+${cp.star1}+')', '적극성('+${cp.star2}+")", '일정준수('+${cp.star3}+')', '의사소통('+${cp.star4}+')', '만족도('+${cp.star5}+')'],
	                                                        datasets: [{
	                                                            label: '',
	                                                            scaleOverride: true,
	                                                            strokeColor: "rgba(255,255,255,1)",
	                                                            backgroundColor: 'rgba(23, 162, 184,0.5)',
	                                                            borderColor: 'rgba(23, 162, 184)',
	                                                            /* data: [4.0, 4.0, 4.0, 4.0, 4.0] */
	                                                            data: [${cp.star1 },${cp.star2 },${cp.star3 },${cp.star4 },${cp.star5 }]
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
	                                                            	display : false,
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
	                                <td style="width: 20%; height: 10%;padding:0px;">
	                                    <p>평가 점수</p>
	                                </td>
	                                <td  style="padding:0px;">
	                                    <!-- <p>4점</p> -->
	                                    <p>${cp.eAgv }점</p>
	                                </td>
	                            </tr>
	                            <tr>
	                                <td style="padding:0px;"><div class="point" style="margin-bottom: 0;"><b>세부 평가</b></div></td>
	                                <td style="padding:0px;">
	                                	<div class="row">
	                                        <div class="point col-5" style="margin-right: 0;">
	                                            <p>전문성</p>
	                                            <p>적극성</p>
	                                            <p>일정 준수</p>
	                                            <p>의사 소통</p>
	                                            <p>만족도</p>
	                                        </div>
	                                        <div class="point col-4" style="margin-left: 0; margin-right: 0;">
	                                            <p>${cp.star1 }점</p>
	                                            <p>${cp.star2 }점</p>
	                                            <p>${cp.star3 }점</p>
	                                            <p>${cp.star4 }점</p>
	                                            <p>${cp.star5 }점</p>
	                                        </div>
	                                     </div>
	                                </td>
	                            </tr>
	                            <tr>
	                                <td style="width: 20%;padding:0px;">
	                                    <p>평가 내용</p>
	                                </td>
	                                <td style="padding:0px;" colspan="2"> <p style="margin-top: 1%;">
	                                        ${cp.eContent }
	                                    </p></td>
	                            </tr>
	                        </table>
	                        </c:forEach>
	                        </div>
                    </div>
                </div>
                <section class="mt-5 mb-5" id="pagination" style="display:none;">
	            <div class="row d-flex justify-content-around align-items-center">
	              <!--페이지네이션-->
	              <div class="col-12 col-md-4 text-center">
	                <nav aria-label="Page navigation example">
	                  <ul class="pagination justify-content-center mb-0 text-dark">
	                  	<c:if test="${pi.currentPage eq 1 }">
	                    <li class="page-item"><a class="page-link"><i class="fas fa-chevron-left"></i></a></li>
	                    </c:if>
	                    <c:if test="${pi.currentPage gt 1}">
	                    <c:url var="plistBack" value="cEvalSelect.do">
	                    	<c:param name="page" value="${pi.currentPage-1}"/>
	                    	<c:param name="msg" value="2"/>
	                    	<c:param name="cId" value="${fc.memId }"/>
	                    </c:url>
	                    <li class="page-item"><a class="page-link" href="${plistBack}"><i class="fas fa-chevron-left"></i></a></li>
	                    </c:if>
	                    
	                    <c:forEach begin="${pi.startPage}" end="${pi.endPage}" step="1" var="pn">
	                    <c:if test="${pi.currentPage eq pn}">
	                    <li class="page-item active"><a class="page-link">${pn}</a></li>
	                    </c:if>
	                    <c:if test="${pi.currentPage ne pn}">
	                    <c:url var="plistCheck" value="cEvalSelect.do">
	                    <c:param name="page" value="${pn}"/>
	                    <c:param name="cId" value="${fc.memId }"/>
	                    <c:param name="msg" value="2"/>
	                    </c:url>
	                    <li class="page-item"><a class="page-link" href="${plistCheck}">${pn}</a></li>
	                    </c:if>
	                    </c:forEach>
	                   
	                    <c:if test="${pi.currentPage eq pi.maxPage}">
	                    <li class="page-item"><a class="page-link"><i class="fas fa-chevron-right"></i></a></li>
	                  	</c:if>
	                  	<c:if test="${pi.currentPage lt pi.maxPage}">
	                  	<c:url var="plistFront" value="cEvalSelect.do">
	                    	<c:param name="page" value="${pi.currentPage+1}"/>
	                    	<c:param name="msg" value="2"/>
	                    	<c:param name="cId" value="${fc.memId }"/>
	                    </c:url>
	                    <li class="page-item"><a class="page-link" href="${plistFront}"><i class="fas fa-chevron-right"></i></a></li>
	                  	</c:if>
	                  </ul>
	                </nav>
	              </div>
	            </div>
	
	          </section>
                
            </div>
        </div>

    </div>
	
	<jsp:include page="../common/footer.jsp"/>
</body>
</html>
