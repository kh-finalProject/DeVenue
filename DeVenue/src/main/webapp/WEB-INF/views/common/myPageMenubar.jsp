<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<style>
		/* 서브메뉴바 */
        .aTag{
	      background-color: #242424;
	      border: none;
	      color: white;
	    }
</style>

<body>
	<div class="col-2 text-white"
		style="border-right: 1px solid lightgray; font-family: 'Jua', sans-serif;">
		<br>
		<div style="border-bottom: 1px solid lightgray; padding-bottom: 5.5%;">
			<c:if test="${loginUser.userType eq 'UT3'}">
				<span>클라이언트</span>
			</c:if>
			<c:if test="${loginUser.userType eq 'UT4'}">
				<span>파트너스</span>
			</c:if>
		</div>
		<!-- 이미지 들어갈 공간 -->
		<br>
		<div class="partnes-img"
			style="width: 90%; height: 150px; margin: auto;">
			<!-- 클라이언트시 이미지 -->
			<c:if test="${loginUser.userType eq 'UT3'}">
				<img src="${contextPath }/resources/images/client.png" style="width: 100%; height: 100%; border-radius: 50px 50px 50px 50px;">
			</c:if>
			<!-- 파트너스 이미지 -->
			<c:if test="${loginUser.userType eq 'UT4'}">
				<img src="${contextPath }/resources/images/partners.png" style="width: 100%; height: 100%; border-radius: 50px 50px 50px 50px;">
			</c:if>
		</div>
		<!-- 닉네임 -->
		<div class="partnes-nickname"
			style="width: 100%; height: 20px; font-size: 20px; margin: auto; text-align: center;">
			<span>${loginUser.memNick }</span>
		</div>
		<br>
		<div style="padding-bottom: 5.5%;">
			<div>
				<p id="infoMenu">
					정보 관리<i style="float: right; margin-right: 5%;"
						class="fas fa-angle-down"></i>
				</p>
				<div id="subInfoMenu" style="display: none; margin-left: 5%;">
					<P id="myPageDetail">
						<a href="profile.do">전체보기</a>		
					</P>
					<p id="partnesInfo">
					<!-- 에러가난다 왜 null 값이 넘어가지??? -->
						<%-- <a href="partInfo.do">파트너스 정보</a>
						<script type="text/javascript">
							$("#partnesInfo a").on("click",function(){
								$.ajax({
									url:"test.do",
									data:{profileId:${profile.profileId }},
									success:function(data){
										
									},error:function(request, status, errorData){
										alert("error code: " + request.status + "\n"
												+"message: " + request.responseText
												+"error: " + errorData);
									}
								})
							})
						</script> --%>
						<form method="GET" action="partInfo.do">
							<input type="hidden" name="profileId" value="${profile.profileId }">
							<button class="aTag">파트너스정보</button>
						</form>
					</p>
					<p id="pPR">
						<a href="PR.do">자기소개</a>
					</p>
					<p id="pPortfolio">
						<a href="portfolioAll.do">포트폴리오</a>
					</p>
					<p id="pSkill">
						<a href="skill.do">보유기술</a>
					</p>
					<p id="pCareer">
						<a href="career.do">경력</a>
					</p>
					<p id="pLicense">
						<a href="academic.do">학력</a>
					</p>
					<p id="pStack">
						<a href="certificate.do">자격증</a>
					</p>
					<p id="pProjectHistory">
						<a href="PH.do">프로젝트 히스토리</a>
					</p>
				</div>
				<p id="accountMenu">
					계정 관리<i style="float: right; margin-right: 5%;"
						class="fas fa-angle-down"></i>
				</p>
				<div id="subAccountMenu" style="display: none; margin-left: 5%;">
					<p id="clientComment">기본 정보 수정</p>
					<p id="insertCComment">신원 인증</p>
					<p id="insertCComment">날인 방법 관리</p>
					<p id="insertCComment">비밀번호 변경</p>
					<p id="insertCComment">회원 탈퇴</p>
				</div>
				<p id="pEvaluate">내게 온 제안</p>
			</div>
			<script>
				$("#infoMenu").click(function() {

					$("#subInfoMenu").toggle();
				});

				$("#accountMenu").click(function() {

					$("#subAccountMenu").toggle();
				});

				$("#partnesInfo").on("click", function() {
					location.href = "myPage/partInfo.jsp";
				}).on("mouseenter", function() {

				});

				$("#pPR").on("click", function() {
					location.href = "/Self-introduction";
				});

				$("#projectHistory").on("click", function() {
					location.href = "projectHistory.html";
				});

				$("#clientComment").on("click", function() {
					location.href = "clientComment.html";
				});

				$("#insertCComment").on("click", function() {
					location.href = "insertCComment.html";
				});
			</script>

		</div>
</body>
</html>