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

#firstStar{
	margin-right:0;
}

.fas{
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
            <div class="col-10" style="padding:3%; ">
                <div style="float:right; margin-right: 2%;">
                    <div class="input-group">
                        <select class="btn btn-outline-light">
                            <option class="dropdown-item">-----</option>
                            <option id="selectNickname" class="dropdown-item">닉네임</option>
                            <option id="selectProject" class="dropdown-item">프로젝트</option>
                        </select>

                        <!-- </div> -->
                        <input type="search" class="form-control">
                        <div class="input-group-append">
                            <button class="input-group-text btn btn-info">
                                <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-search"
                                    fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                    <path fill-rule="evenodd"
                                        d="M10.442 10.442a1 1 0 0 1 1.415 0l3.85 3.85a1 1 0 0 1-1.414 1.415l-3.85-3.85a1 1 0 0 1 0-1.415z" />
                                    <path fill-rule="evenodd"
                                        d="M6.5 12a5.5 5.5 0 1 0 0-11 5.5 5.5 0 0 0 0 11zM13 6.5a6.5 6.5 0 1 1-13 0 6.5 6.5 0 0 1 13 0z" />
                                </svg>
                            </button>
                        </div>
                    </div>
                </div>
            </div>
            <script>
                $(function () {
                    $("#selectNickname").on("click", function () {
                        $("#clientSelect").text($(this).text());
                    });

                    $("#selectProject").on("click", function () {
                        $("#clientSelect").text($(this).text());
                    })
                })

            </script>
        </div>


        <div class="row">
            <div class="col-2 text-white" style="border-right: 1px solid lightgray; font-family: 'Jua', sans-serif;">
                <br>
                <div style="border-bottom: 1px solid lightgray; padding-bottom: 5.5%;">
                    클라이언트 필터
                </div>
            </div>
            <div class="col-10 text-white" style="font-family: 'Jua', sans-serif;">
                <br>
                <div style="border-bottom: 1px solid lightgray; padding-bottom: 1%;">
                    &emsp;정렬 기준 :  &emsp;<a href="#">최신 등록 순</a>&emsp;<a href="#">평점 높은 순</a>&emsp;<a href="#">평가 많은 순</a>&emsp;<a href="#">프로젝트 많은 순</a>
                </div>
            </div>

        </div>

        <div class="row">
            <div class="col-2 text-white" style="border-right: 1px solid lightgray; font-family: 'Jua', sans-serif;">
                <br>
                <div style="padding-bottom: 5.5%;">
                    <div>
                        클라이언트 형태
                        <br>
                        <div style="margin-top:2%; margin-left: 5%;">
                            <label name="clientType"><input type="checkbox" name="clientType">&nbsp;개인</label>
                            <br>
                            <label name="clientType"><input type="checkbox" name="clientType">&nbsp;기업</label>
                        </div>
                    </div>
                    <br>
                    <div>
                        검증된 클라이언트
                        <br>
                        <div style="margin-top:2%; margin-left: 5%;">
                            <label name="clientVertify"><input type="checkbox" name="clientVertify">&nbsp;평가 우수</label>
                            <br>
                            <label name="clientVertify"><input type="checkbox" name="clientVertify">&nbsp;인증 완료</label>
                        </div>
                    </div>
                    <br>
                    <div>
                        클라이언트 지역
                        <br>
                        <div class="btn-group dropright" style="margin-top:2%; margin-left: 5%;">
                            <button id="clientPlace" class="btn btn-outline-light dropdown-toggle" type="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">전체 선택</button>
                            <div class="dropdown-menu" style="max-height: 400%; overflow-y: auto;">
                                <a id="korea" class="dropdown-item">전체 선택</a>
                                <a id="seoul" class="dropdown-item">서울특별시</a>
                                <a id="busan" class="dropdown-item">부산광역시</a>
                                <a id="incheon" class="dropdown-item">인천광역시</a>
                                <a id="gwangju" class="dropdown-item">광주광역시</a>
                                <a id="daejeon" class="dropdown-item">대전광역시</a>
                                <a id="ulsan" class="dropdown-item">울산광역시</a>
                                <a id="sejong" class="dropdown-item">세종특별자치시</a>
                                <a id="gyeonggi" class="dropdown-item">경기도</a>
                                <a id="gamja" class="dropdown-item">강원도</a>
                                <a id="chungbuk" class="dropdown-item">충청북도</a>
                                <a id="chungnam" class="dropdown-item">충청남도</a>
                                <a id="jeonbuk" class="dropdown-item">전라북도</a>
                                <a id="jeonnam" class="dropdown-item">전라남도</a>
                                <a id="gyeongbuk" class="dropdown-item">경상북도</a>
                                <a id="gyeongnam" class="dropdown-item">경상남도</a>
                                <a id="jeju" class="dropdown-item">제주특별자치도</a>
                            </div>
                        </div>
                        <script>
                            $(function () {
                                $("#seoul").on("click", function () {
                                    $("#clientPlace").text($(this).text());
                                });

                                $("#busan").on("click", function () {
                                    $("#clientPlace").text($(this).text());
                                });
                                $("#incheon").on("click", function () {
                                    $("#clientPlace").text($(this).text());
                                });

                                $("#gwangju").on("click", function () {
                                    $("#clientPlace").text($(this).text());
                                });
                                $("#daejeon").on("click", function () {
                                    $("#clientPlace").text($(this).text());
                                });

                                $("#ulsan").on("click", function () {
                                    $("#clientPlace").text($(this).text());
                                });
                                $("#sejong").on("click", function () {
                                    $("#clientPlace").text($(this).text());
                                });

                                $("#gyeonggi").on("click", function () {
                                    $("#clientPlace").text($(this).text());
                                });
                                $("#gamja").on("click", function () {
                                    $("#clientPlace").text($(this).text());
                                });

                                $("#chungbuk").on("click", function () {
                                    $("#clientPlace").text($(this).text());
                                });
                                $("#chungnam").on("click", function () {
                                    $("#clientPlace").text($(this).text());
                                });

                                $("#jeonbuk").on("click", function () {
                                    $("#clientPlace").text($(this).text());
                                });
                                $("#jeonnam").on("click", function () {
                                    $("#clientPlace").text($(this).text());
                                });

                                $("#gyeongbuk").on("click", function () {
                                    $("#clientPlace").text($(this).text());
                                });
                                $("#gyeongnam").on("click", function () {
                                    $("#clientPlace").text($(this).text());
                                });

                                $("#jeju").on("click", function () {
                                    $("#clientPlace").text($(this).text());
                                });
                            })
                        </script>

                    </div>
                </div>
            </div>
            <div class="col-10 text-white" style="font-family: 'Jua', sans-serif;">
            
           <c:forEach var="b" items="${list }"> 
                    <!-- 클릭이벤트 넣어야함 -->
                    <c:url var="cDetail" value="cDetail.do">
                    	<c:param name="cId" value="${b.memId }"/>
                    	<%-- <c:param name="page" value="${pi.currentPage }"/> --%>
                    </c:url>
                <div class="userBoard" onclick="location.href='${cDetail }'" style="cursor:pointer;">
                    &emsp;
                    <input type="hidden" value="${b.memId }">
                    
                    
                    <ul style="list-style: none;">
                        <li>
                            <div class="row" style="margin-left:3%; margin-right:3%;border-top: 1px solid lightgray; border-bottom: 1px solid lightgray;">
                                <div class="col-8">
                                    <div style="float:left; margin-left:1%; margin-right:3%; height: 100%; display: flex; align-items: center;" >
                                        <div>
                                            <svg width="4em" height="4em" viewBox="0 0 16 16" class="bi bi-person-circle-lg" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                            <path d="M13.468 12.37C12.758 11.226 11.195 10 8 10s-4.757 1.225-5.468 2.37A6.987 6.987 0 0 0 8 15a6.987 6.987 0 0 0 5.468-2.63z"/>
                                            <path fill-rule="evenodd" d="M8 9a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/>
                                            <path fill-rule="evenodd" d="M8 1a7 7 0 1 0 0 14A7 7 0 0 0 8 1zM0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8z"/>
                                            </svg>
                                        </div>
                                    </div>
                                    <div>
                                        <ul style="list-style: none; margin-top: 2%;">
                                            <li>
                                                <!-- qwer01(닉네임) -->
                                                ${b.memNick }
                                            </li>
                                            <li>
                                                <!-- kh_Bclass(소속)&emsp; -->
                                                ${b.memTypeName }
                                                <!-- <a class="badge badge-info">개인</a> -->
                                                <a class="badge badge-info">${b.memTypeKind }</a>
                                            </li>
                                            <li>
                                                <!-- 예아! 호우! 예예예~
                                                싹쓰리 인더 하우스
                                                커커커커커몬! 싹!쓰리!투 렛츠고!

                                                나 다시 또 설레어
                                                이렇게 너를 만나서
                                                함께 하고 있는 지금 이 공기가

                                                다시는 널 볼 순 없을 거라고
                                                추억일 뿐이라
                                                서랍 속에 꼭 넣어뒀는데

                                                흐르는 시간 속에서
                                                너와 내 기억은
                                                점점 희미해져만 가
                                                끝난 줄 알았 -->
                                                ${b.introduction }
                                                <br><br>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="col-4">
                                    <div id="starPoint" class="point">
                                    <c:choose>
                                    	<c:when test="${b.avgEagv == 0 }">
	                                        <i id="firstStar" class="far fa-star"></i>
	                                        <i class="fas fa-star"></i>
	                                        <i class="fas fa-star-half-alt"></i>
	                                        <i class="fas fa-star"></i>
	                                        <i class="fas fa-star-half-alt"></i>
                                        </c:when>
                                        <c:when test="${b.avgEagv > 0 && b.avgEagv < 1 }">
	                                        <i id="firstStar" class="fas fa-star-half-alt"></i>
	                                        <i class="far fa-star"></i>
	                                        <i class="far fa-star"></i>
	                                        <i class="far fa-star"></i>
	                                        <i class="far fa-star"></i>
                                        </c:when>
                                        <c:when test="${b.avgEagv == 1 }">
	                                        <i id="firstStar" class="fas fa-star"></i>
	                                        <i class="far fa-star"></i>
	                                        <i class="far fa-star"></i>
	                                        <i class="far fa-star"></i>
	                                        <i class="far fa-star"></i>
                                        </c:when>
                                        <c:when test="${b.avgEagv > 1 && b.avgEagv < 2 }">
	                                        <i id="firstStar" class="fas fa-star"></i>
	                                        <i class="fas fa-star-half-alt"></i>
	                                        <i class="far fa-star"></i>
	                                        <i class="far fa-star"></i>
	                                        <i class="far fa-star"></i>
                                        </c:when>
                                        <c:when test="${b.avgEagv == 2 }">
                                        	<i id="firstStar" class="fas fa-star"></i>
                                        	<i class="fas fa-star"></i>
                                        	<i class="far fa-star"></i>
	                                        <i class="far fa-star"></i>
	                                        <i class="far fa-star"></i>
                                        </c:when>
                                        <c:when test="${b.avgEagv > 2 && b.avgEagv < 3 }">
	                                        <i id="firstStar" class="fas fa-star"></i>
	                                        <i class="fas fa-star"></i>
	                                        <i class="fas fa-star-half-alt"></i>
	                                        <i class="far fa-star"></i>
	                                        <i class="far fa-star"></i>
                                        </c:when>
                                        <c:when test="${b.avgEagv == 3 }">
                                        	<i id="firstStar" class="fas fa-star"></i>
                                        	<i class="fas fa-star"></i>
                                        	<i class="fas fa-star"></i>
	                                        <i class="far fa-star"></i>
	                                        <i class="far fa-star"></i>
                                        </c:when>
                                        <c:when test="${b.avgEagv > 3 && b.avgEagv < 4 }">
	                                        <i id="firstStar" class="fas fa-star"></i>
	                                        <i class="fas fa-star"></i>
	                                        <i class="fas fa-star"></i>
	                                        <i class="fas fa-star-half-alt"></i>
	                                        <i class="far fa-star"></i>
                                        </c:when>
                                        <c:when test="${b.avgEagv == 4 }">
                                        	<i id="firstStar" class="fas fa-star"></i>
                                        	<i class="fas fa-star"></i>
                                        	<i class="fas fa-star"></i>
	                                        <i class="fas fa-star"></i>
	                                        <i class="far fa-star"></i>
                                        </c:when>
                                        <c:when test="${b.avgEagv > 4 && b.avgEagv < 5 }">
	                                        <i id="firstStar" class="fas fa-star"></i>
	                                        <i class="fas fa-star"></i>
	                                        <i class="fas fa-star"></i>
	                                        <i class="fas fa-star"></i>
	                                        <i class="fas fa-star-half-alt"></i>
                                        </c:when>
                                        <c:when test="${b.avgEagv == 5 }">
                                        	<i id="firstStar" class="fas fa-star"></i>
                                        	<i class="fas fa-star"></i>
                                        	<i class="fas fa-star"></i>
                                        	<i class="fas fa-star"></i>
                                        	<i class="fas fa-star"></i>
										</c:when>
                                    </c:choose>
                                        <!-- <b>4.5 / 평가 4개</b>  -->
                                        <b>${b.avgEagv } / 평가 ${b.countEagv }개</b> 
                                    </div>
                                    <hr style="width:90%; margin:0px auto;">
                                    <div class="point">
                                        <b>진행한 프로젝트 수</b>
                                        <!-- <b style="float:right">22개</b> -->
                                        <b style="float:right">${b.countProId }개</b>
                                    </div>
                                    <div class="point">
                                        <b>자주 진행한 프로젝트</b>
                                        <!-- <a class="badge badge-info" style="float:right;">WEB</a> -->
                                        <a class="badge badge-info" style="float:right;">${b.maxDcType }</a>
                                    </div>
                                    <hr style="width:90%; margin:0px auto;">
                                    
                                    <div class="point" align="center">
                                    <c:if test="${b.ideStatus eq 'COMPLETE' }">
                                        <a class="badge badge-info" style="padding:1%;">신원 인증된 회원</a>&nbsp;
                                    </c:if>
                                    <c:if test="${!empty b.phone }">    
                                        <a class="badge badge-info" style="padding:1%;">연락처 등록</a>
                                    </c:if>
                                    </div>
                                </div>
                            </div>
                        </li>
                    </ul>
                </div>
			</c:forEach>

                <div class="userBoard">
                    &emsp;
                    <input type="hidden" value="선택한 회원 ID">
                    <ul style="list-style: none;">
                        <li>
                            <div class="row" style="margin-left:3%; margin-right:3%;border-top: 1px solid lightgray; border-bottom: 1px solid lightgray;">
                                <div class="col-8">
                                    <div style="float:left; margin-left:1%; margin-right:3%; height: 100%; display: flex; align-items: center;" >
                                        <div>
                                            <svg width="4em" height="4em" viewBox="0 0 16 16" class="bi bi-person-circle-lg" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                            <path d="M13.468 12.37C12.758 11.226 11.195 10 8 10s-4.757 1.225-5.468 2.37A6.987 6.987 0 0 0 8 15a6.987 6.987 0 0 0 5.468-2.63z"/>
                                            <path fill-rule="evenodd" d="M8 9a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/>
                                            <path fill-rule="evenodd" d="M8 1a7 7 0 1 0 0 14A7 7 0 0 0 8 1zM0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8z"/>
                                            </svg>
                                        </div>
                                    </div>
                                    <div>
                                        <ul style="list-style: none; margin-top: 2%;">
                                            <li>
                                                qwer01(닉네임)
                                            </li>
                                            <li>
                                                kh_Bclass(소속)&emsp;
                                                <a class="badge badge-info">개인</a>
                                            </li>
                                            <li>
                                                예아! 호우! 예예예~
                                                싹쓰리 인더 하우스
                                                커커커커커몬! 싹!쓰리!투 렛츠고!

                                                나 다시 또 설레어
                                                이렇게 너를 만나서
                                                함께 하고 있는 지금 이 공기가

                                                다시는 널 볼 순 없을 거라고
                                                추억일 뿐이라
                                                서랍 속에 꼭 넣어뒀는데

                                                흐르는 시간 속에서
                                                너와 내 기억은
                                                점점 희미해져만 가
                                                끝난 줄 알았
                                                <br><br>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="col-4">
                                    <div id="starPoint" class="point">
                                        <i id="firstStar" class="far fa-star"></i>
                                        <i class="fas fa-star"></i>
                                        <i class="fas fa-star-half-alt"></i>
                                        <i class="fas fa-star"></i>
                                        <i class="fas fa-star-half-alt"></i>
                                        
                                        <b>4.5 / 평가 4개</b> 
                                    </div>
                                    <hr style="width:90%; margin:0px auto;">
                                    <div class="point">
                                        <b>진행한 프로젝트 수</b>
                                        <b style="float:right">22개</b>
                                    </div>
                                    <div class="point">
                                        <b>자주 진행한 프로젝트</b>
                                        <a class="badge badge-info" style="float:right;">WEB</a>
                                    </div>
                                    <hr style="width:90%; margin:0px auto;">
                                    <div class="point" align="center">
                                        <a class="btn btn-info" style="padding:1%;">신원 인증된 회원</a>&nbsp;
                                        <a class="btn btn-info" style="padding:1%;">연락처 등록</a>
                                    </div>
                                </div>
                            </div>
                        </li>
                    </ul>
                </div>

                <div class="userBoard">
                    &emsp;
                    <input type="hidden" value="선택한 회원 ID">
                    <ul style="list-style: none;">
                        <li>
                            <div class="row" style="margin-left:3%; margin-right:3%;border-top: 1px solid lightgray; border-bottom: 1px solid lightgray;">
                                <div class="col-8">
                                    <div style="float:left; margin-left:1%; margin-right:3%; height: 100%; display: flex; align-items: center;" >
                                        <div>
                                            <svg width="4em" height="4em" viewBox="0 0 16 16" class="bi bi-person-circle-lg" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                            <path d="M13.468 12.37C12.758 11.226 11.195 10 8 10s-4.757 1.225-5.468 2.37A6.987 6.987 0 0 0 8 15a6.987 6.987 0 0 0 5.468-2.63z"/>
                                            <path fill-rule="evenodd" d="M8 9a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/>
                                            <path fill-rule="evenodd" d="M8 1a7 7 0 1 0 0 14A7 7 0 0 0 8 1zM0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8z"/>
                                            </svg>
                                        </div>
                                    </div>
                                    <div>
                                        <ul style="list-style: none; margin-top: 2%;">
                                            <li>
                                                qwer01(닉네임)
                                            </li>
                                            <li>
                                                kh_Bclass(소속)&emsp;
                                                <a class="badge badge-info">개인</a>
                                            </li>
                                            <li>
                                                예아! 호우! 예예예~
                                                싹쓰리 인더 하우스
                                                커커커커커몬! 싹!쓰리!투 렛츠고!

                                                나 다시 또 설레어
                                                이렇게 너를 만나서
                                                함께 하고 있는 지금 이 공기가

                                                다시는 널 볼 순 없을 거라고
                                                추억일 뿐이라
                                                서랍 속에 꼭 넣어뒀는데

                                                흐르는 시간 속에서
                                                너와 내 기억은
                                                점점 희미해져만 가
                                                끝난 줄 알았
                                                <br><br>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="col-4">
                                    <div id="starPoint" class="point">
                                        <i id="firstStar" class="far fa-star"></i>
                                        <i class="fas fa-star"></i>
                                        <i class="fas fa-star-half-alt"></i>
                                        <i class="fas fa-star"></i>
                                        <i class="fas fa-star-half-alt"></i>
                                        
                                        <b>4.5 / 평가 4개</b> 
                                    </div>
                                    <hr style="width:90%; margin:0px auto;">
                                    <div class="point">
                                        <b>진행한 프로젝트 수</b>
                                        <b style="float:right">22개</b>
                                    </div>
                                    <div class="point">
                                        <b>자주 진행한 프로젝트</b>
                                        <a class="badge badge-info" style="float:right;">WEB</a>
                                    </div>
                                    <hr style="width:90%; margin:0px auto;">
                                    <div class="point" align="center">
                                        <a class="btn btn-info" style="padding:1%;">신원 인증된 회원</a>&nbsp;
                                        <a class="btn btn-info" style="padding:1%;">연락처 등록</a>
                                    </div>
                                </div>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>

        </div>

    </div>
			
	<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>