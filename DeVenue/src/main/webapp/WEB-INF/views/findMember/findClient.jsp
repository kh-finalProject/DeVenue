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
.far{
	margin-right:0;
}

		/*페이지네이션*/
      #pagination>div{
        margin-top: 1rem;
        align:center;
      }
      
      #profileImg{
      	width:4em;
      	height:4em;
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
                        <select id="clientSelect" class="btn btn-outline-light">
                            <option class="dropdown-item">-----</option>
                            <option id="selectNickname" class="dropdown-item" value="memNick">닉네임</option>
                            <option id="selectProject" class="dropdown-item" value="introduction">내용</option>
                            <!-- 시간남으면 닉네임 + 내용 검색 만들기 -->
                        </select>

                        <!-- </div> -->
                        <input type="search" class="form-control" id="searchText">
                        <div id="searchClient" class="input-group-append">
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
                // 검색하기
               	$("#searchClient").on("click", function(){
               		var content = $("#searchText").val();
               		
               		if($("#clientSelect").val() == "memNick"){
               			location.href="memNickSearch.do?memNick="+content;
               		}else if($("#clientSelect").val() == "introduction"){
               			location.href="introductionSearch.do?introduction="+content;
               		}else{
               			location.href="redirect:clientList.do";
               		}
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
                    &emsp;
                    	정렬 기준 :  &emsp;
                    	<a id="recentDate" href="#">최신 등록 순</a>&emsp;
                    	<a href="#">평점 높은 순</a>&emsp;
                    	<a href="#">평가 많은 순</a>&emsp;
                    	<a href="#">프로젝트 많은 순</a>
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
            
            <script>
	            $("#recentDate").on("click",function(){
					recentClient();	
				})
            
				// 정렬 ajax 시작
            	function recentClient(){
            		$.ajax({
            			url:"recentList.do",
            			data:{status:1},
            			contentType : 'application/json; charset=utf-8',
            			dataType:"json",
            			success:function(data){
            				console.log(data.list[0].avgEagv);
            				
            				
            				$clientBoard=$("#clientBoard");
    						$clientBoard.empty();
    						
    						var $ul = $("<ul style='list-style: none;'>");
        					var $li = $("<li>");
        					var $ul2 = $("<ul style='list-style: none; margin-top: 2%;'>");
        					var $li2 = $("<li>");
        					var $li3 = $("<li>");
        					var $userBoard = $("<div class='userBoard' style='cursor:pointer;'>");
        					var $hidden = $("<input type='hidden'>");
        					var $row = $("<div class='row' style='margin-left:3%; margin-right:3%; border-top: 1px solid lightgray; border-bottom: 1px solid lightgray;'>");
        					var $col8 = $("<div class='col-8'>");
        					var $col4 = $("<div class='col-4'>");
        					var $profile = $("<div style='float:left; margin-left:1%; margin-right:3%; height: 100%; display: flex; align-items: center;'>");
        					var $div = $("<div>");
        					var $div2 = $("<div>");
        					var $noneImg = $("<img id='profileImg' src='${contextPath }/resources/proImg/user1.png'>");
        					var $a = $("<a class='btn btn-info' style='padding:1%;'>");
        					var $memTypeName = $("<a class='badge badge-info'>");
        					var $introduction = $("<li id='introduction' style='line-height:2.4rem; -webkit-box-orient: vertical; word-wrap:break-word;'>");
        					var $br = $("<br>");
        					var $br2 = $("<br>");
        					var $starDiv = $("<div id='starPoint' class='point'>");
        					var $firstFas = $("<i id='firstStar' class='fas fa-star'>");
        					var $firstFar = $("<i id='firstStar' class='far fa-star'>");
        					var $firstFasHarf = $("<i id='firstStar' class='fas fa-star-half-alt'>");
        					var $fas1 = $("<i class='fas fa-star'>");
        					var $fas2 = $("<i class='fas fa-star'>");
        					var $fas3 = $("<i class='fas fa-star'>");
        					var $fas4 = $("<i class='fas fa-star'>");
        					var $far2 = $("<i class='far fa-star'>");
        					var $far3 = $("<i class='far fa-star'>");
        					var $far4 = $("<i class='far fa-star'>");
        					var $far1 = $("<i class='far fa-star'>");
        					var $harf = $("<i class='fas fa-star-half-alt'>");
        					var $hr = $("<hr style='width:90%; margin:0px auto;'>");
        					var $hr2 = $("<hr style='width:90%; margin:0px auto;'>");
        					var $pointDiv = $("<div class='point'>");
        					var $pointDiv2 = $("<div class='point'>");
        					var $b = $("<b>");
        					var $badge = $("<a class='badge badge-info' style='float:right;'>");
        					var $centerPoint = $("<div class='point' align='center'>");
        					var $a2 = $("<a class='btn btn-info' style='padding:1%;'>");
        					var $a3 = $("<a class='btn btn-info' style='padding:1%;'>");
        					
            					for(var i in data.list){
            						
            						
                					if(data.list[i].profileImg != null){
                						$div2.text(data.list[i].profileImg);
                					}else{
                						$div2.append($noneImg);	
                					}
                					$profile.append($div2);
                					$li2.text(data.list[i].memNick);
                					$li3.text(data.list[i].memTypeName);
                					$memTypeName.text(data.list[i].memTypeKind);
                					$li3.append($memTypeName);
                					$introduction.text(data.list[i].introduction);
                					$introduction.append($br);
                					$introduction.append($br2);
                					$ul2.append($li2);
                					$ul2.append($li3);
                					$ul2.append($introduction);
                					$div.append($ul2);
                					$col8.append($profile);
                					$col8.append($div);
                					$row.append($col8);
                					
                					/* switch(data.list[i].avgEagv){
                					case 0 : 
                						
                					} */
                					
                					if(data.list[i].avgEagv == 0){
                						$starDiv.append($firstFar);
                						$starDiv.append($far1);
                						$starDiv.append($far2);
                						$starDiv.append($far3);
                						$starDiv.append($far4);
                					}else if(data.list[i].avgEagv > 0 && data.list[i].avgEagv < 1){
                						$starDiv.append($firstFasHarf);
                						$starDiv.append($far1);
                						$starDiv.append($far2);
                						$starDiv.append($far3);
                						$starDiv.append($far4);
                					}else if(data.list[i].avgEagv == 1){
                						$starDiv.append($firstFas);
                						$starDiv.append($far1);
                						$starDiv.append($far2);
                						$starDiv.append($far3);
                						$starDiv.append($far4);
                					}else if(data.list[i].avgEagv > 1 && data.list[i].avgEagv < 2){
                						$starDiv.append($firstFas);
                						$starDiv.append($harf);
                						$starDiv.append($far1);
                						$starDiv.append($far2);
                						$starDiv.append($far3);
                					}else if(data.list[i].avgEagv == 2){
                						$starDiv.append($firstFas);
                						$starDiv.append($fas1);
                						$starDiv.append($far1);
                						$starDiv.append($far2);
                						$starDiv.append($far3);
                					}else if(data.list[i].avgEagv > 2 && data.list[i].avgEagv < 3){
                						$starDiv.append($firstFas);
                						$starDiv.append($fas1);
                						$starDiv.append($harf);
                						$starDiv.append($far1);
                						$starDiv.append($far2);
                					}else if(data.list[i].avgEagv == 3){
                						$starDiv.append($firstFas);
                						$starDiv.append($fas1);
                						$starDiv.append($fas2);
                						$starDiv.append($far1);
                						$starDiv.append($far2);
                					}else if(data.list[i].avgEagv > 3 && data.list[i].avgEagv < 4){
                						$starDiv.append($firstFas);
                						$starDiv.append($fas1);
                						$starDiv.append($fas2);
                						$starDiv.append($harf);
                						$starDiv.append($far);
                					}else if(data.list[i].avgEagv == 4){
                						$starDiv.append($firstFas);
                						$starDiv.append($fas1);
                						$starDiv.append($fas2);
                						$starDiv.append($fas3);
                						$starDiv.append($far1);
                					}else if(data.list[i].avgEagv > 4 && data.list[i].avgEagv < 5){
                						$starDiv.append($firstFas);
                						$starDiv.append($fas1);
                						$starDiv.append($fas2);
                						$starDiv.append($fas3);
                						$starDiv.append($harf);
                					}else if(data.list[i].avgEagv == 5){
                						$starDiv.append($firstFas);
                						$starDiv.append($fas1);
                						$starDiv.append($fas2);
                						$starDiv.append($fas3);
                						$starDiv.append($fas4);
                					}
                					$starDiv.text(data.list[i].avgEagv+" / 평가 "+data.list[i].countEagv);
                					$col4.append($starDiv);
                					$col4.append($hr);
                					$b.text("자주 진행한 프로젝트");
                					if(data.list[i].maxDcType == "웹"){
                						$badge.text("WEB");
                						$b.append($badge);
                					}else{
                						$badge.text(data.list[i].maxDcType);
                						$b.append($badge);
                					}
                					
                					$pointDiv.append($b);
                					
                					
                					if(data.list[i].ideStatus == "COMPLETE"){
                						$a2.text("신원 인증된 회원");
                						$centerPoint.append($a2);
                					}
                					if(data.list[i].phone != null){
                						$a3.text("연락처 등록");
                						$centerPoint.append($a3);
                					}
                					$col4.append($pointDiv);
                					$col4.append($hr2);
                					$col4.append($centerPoint);
                					$row.append($col4);
                					$li.append($row);
                					$ul.append($li);
                					$userBoard.append($ul);
                					$userBoard.append($hidden);
                					$clientBoard.append($userBoard);
                					
            					}
            			},
            			error:function(request, status, errorData){
		                    alert("error code: " + request.status + "\n"
			                          +"message: " + request.responseText
			                          +"error: " + errorData);
			            }
            		})
            	}
				
                </script>
            
            <div id="clientBoard" class="col-10 text-white" style="font-family: 'Jua', sans-serif;">
           
           <c:if test="${empty msg }"> 
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
                                        <c:if test="${empty b.profileImg }">
                                            <svg width="4em" height="4em" viewBox="0 0 16 16" class="bi bi-person-circle-lg" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                            <path d="M13.468 12.37C12.758 11.226 11.195 10 8 10s-4.757 1.225-5.468 2.37A6.987 6.987 0 0 0 8 15a6.987 6.987 0 0 0 5.468-2.63z"/>
                                            <path fill-rule="evenodd" d="M8 9a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/>
                                            <path fill-rule="evenodd" d="M8 1a7 7 0 1 0 0 14A7 7 0 0 0 8 1zM0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8z"/>
                                            </svg>
                                        </c:if>
                                        <c:if test="${!empty b.profileImg }">
                                        	${b.profileImg }
                                        </c:if>
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
                                            <li id="introduction" style="line-height:2.4rem; -webkit-box-orient: vertical; word-wrap:break-word;">
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
                                        ${b.avgEagv } / 평가 ${b.countEagv }개 
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
                                        <c:choose>
                                        <c:when test="${b.maxDcType eq '웹' }">
                                        	<a class="badge badge-info" style="float:right;">WEB</a>
                                        </c:when>
                                        <c:otherwise>
                                        	<a class="badge badge-info" style="float:right;">${b.maxDcType }</a>
                                        </c:otherwise>
                                        </c:choose>
                                    </div>
                                    <hr style="width:90%; margin:0px auto;">
                                    
                                    <div class="point" align="center">
                                    <c:if test="${b.ideStatus eq 'COMPLETE' }">
                                        <a class="btn btn-info" style="padding:1%;">신원 인증된 회원</a>&nbsp;
                                    </c:if>
                                    <c:if test="${!empty b.phone }">    
                                        <a class="btn btn-info" style="padding:1%;">연락처 등록</a>
                                    </c:if>
                                    </div>
                                </div>
                            </div>
                        </li>
                    </ul>
                </div>
			</c:forEach>
			
                
                <section class="mt-5 mb-5" id="pagination">

            <div class="row d-flex justify-content-around align-items-center">

              <!--페이지네이션-->
              <div class="col-12 col-md-4 text-center">
                <nav aria-label="Page navigation example">
                  <ul class="pagination justify-content-center mb-0 text-dark">
                  	<c:if test="${pi.currentPage eq 1 }">
                    <li class="page-item"><a class="page-link"><i class="fas fa-chevron-left"></i></a></li>
                    </c:if>
                    <c:if test="${pi.currentPage gt 1}">
                    <c:url var="plistBack" value="clientList.do">
                    	<c:param name="page" value="${pi.currentPage-1}"/>
                    </c:url>
                    <li class="page-item"><a class="page-link" href="${plistBack}"><i class="fas fa-chevron-left"></i></a></li>
                    </c:if>
                    
                    <c:forEach begin="${pi.startPage}" end="${pi.endPage}" step="1" var="pn">
                    <c:if test="${pi.currentPage eq pn}">
                    <li class="page-item active"><a class="page-link">${pn}</a></li>
                    </c:if>
                    <c:if test="${pi.currentPage ne pn}">
                    <c:url var="plistCheck" value="clientList.do">
                    <c:param name="page" value="${pn}"/>
                    </c:url>
                    <li class="page-item"><a class="page-link" href="${plistCheck}">${pn}</a></li>
                    </c:if>
                    </c:forEach>
                   
                    <c:if test="${pi.currentPage eq pi.maxPage}">
                    <li class="page-item"><a class="page-link"><i class="fas fa-chevron-right"></i></a></li>
                  	</c:if>
                  	<c:if test="${pi.currentPage lt pi.maxPage}">
                  	<c:url var="plistFront" value="clientList.do">
                    	<c:param name="page" value="${pi.currentPage+1}"/>
                    </c:url>
                    <li class="page-item"><a class="page-link" href="${plistFront}"><i class="fas fa-chevron-right"></i></a></li>
                  	</c:if>
                  </ul>
                </nav>
              </div>
            </div>

          </section>
          </c:if>
			<c:if test="${!empty msg }">
				<p style="margin-top:5%; margin-left:40%;">${msg }</p>
			</c:if>
            </div>

        </div>

    </div>
			
	<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>