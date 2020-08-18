<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	hr {
		background-color: lightgray;
	}
	
	/* 이미지 사이즈 맞추기 */
	.image-profile {
		width: auto;
		height: 5rem;
		overflow: hidden;
		display: flex;
		align-items: center;
		justify-content: center;
		margin-top: 10%;
	}
	
	.image-profile img {
		object-fit: fill;
	}
</style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp" />
	<jsp:include page="../common/pSubMenubar.jsp" />

	<div class="container">
		<div class="row text-white"	style="border-bottom: 1px solid lightgray;">
			<div class="col-2" style="padding: 3%; font-size: 150%; font-family: 'Jua', sans-serif;">마이페이지</div>
		</div>

		<div class="row">
			<div class="col-2 text-white" style="border-right: 1px solid lightgray; font-family: 'Jua', sans-serif;">
				<br>
				<div style="border-bottom: 1px solid lightgray; padding-bottom: 5.5%;">
					파트너스
				</div>
				<br>
				<div style="padding-bottom: 5.5%;">
					<div>
						<p id="infoMenu">
							정보 관리
							<i style="float: right; margin-right: 5%;" class="fas fa-angle-down"></i>
						</p>
						<div id="subInfoMenu" style="display: none; margin-left: 5%;">
							<p id="clientInfo">파트너스 정보</p>
							<p id="pPrfile">프로필</p>
							<p id="pPR">자기소개</p>
							<p id="pPortfolio">포트폴리오</p>
							<p id="pSkill">보유기술</p>
							<p id="pCareer">경력</p>
							<p id="pLicense">학력ㆍ자격증</p>
							<p id="pProjectHistory">프로젝트 히스토리</p>
						</div>
						<p id="accountMenu">
							계정 관리
							<i style="float: right; margin-right: 5%;" class="fas fa-angle-down"></i>
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

						$("#clientInfo")
								.on("click", function() {
									location.href = "../findUser/findClientDetail.html";
								}).on("mouseenter", function() {

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
			</div>
			<div class="col-10 text-white"
				style="font-family: 'Jua', sans-serif;">
				<br>
				<div class="row">
					<div class="col-5" style="margin-left: 5%; padding-right: 0;">
						<table>
							<tr>
								<td>
									<div class="image-profile">
										<img src="${contextPath }/resources/images/showcase.jpg" style="object-fit: cover; width: 100px;">
									</div>
								</td>
								<td>&emsp;&emsp;</td>
								<td>
									partner01(닉네임)&emsp;
									<a class="badge badge-info">개인</a>
									<br>
									<p>partner01@google.com</p>
									<i class="far fa-address-card"></i>
									&nbsp;신원인증&emsp;
									<i class="fas fa-phone-alt"></i>연락처등록<br>
								</td>
							</tr>
							<tr>
								<td><br>지원한 프로젝트</td>
								<td></td>
								<td style="padding-left: 25%"><br>22</td>
							</tr>
							<tr>
								<td><br>계약한 프로젝트</td>
								<td></td>
								<td style="padding-left: 25%"><br>10</td>
							</tr>
						</table>
					</div>
					<div class="col-6">
						<p>
							내게 온 제안
							<button class="btn-info" type="button" style="float: right; border-radius: 0.3rem; margin-right: 20%; margin-bottom: 1%;">+ 더보기</button>
						</p>
						<table border="1px solid lightgray;" style="width: 80%; text-align: center;">
							<thead>
								<tr>
									<th>닉네임</th>
									<th>클라이언트 형태</th>
									<th>평가 점수</th>
									<th>대상 프로젝트</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>user01</td>
									<td>개인</td>
									<td>4.5</td>
									<td>위시켓</td>
								</tr>
								<tr>
									<td>p02</td>
									<td>기업</td>
									<td>4.5</td>
									<td>finalProject</td>
								</tr>
								<tr>
									<td>p03</td>
									<td>개인</td>
									<td>4.5</td>
									<td>mini 유지보수</td>
								</tr>
								<tr>
									<td>p04</td>
									<td>기업</td>
									<td>4.5</td>
									<td>위시켓</td>
								</tr>
								<tr>
									<td>p05</td>
									<td>개인</td>
									<td>4.5</td>
									<td>위시켓</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				<div class="userBoard">
					&emsp; <input type="hidden" value="선택한 회원 ID">
					<div class="row" style="margin-left: 3%; margin-right: 3%; padding-bottom: 3%; border-top: 1px solid lightgray; border-bottom: 1px solid lightgray;">
						<div class="col-12">
							<div style="margin-left: 1%; margin-bottom: 2%; margin-top: 2%; width: 80%;">
								<b>진행중인 프로젝트</b>
								<button class="btn-info" type="button" style="float: right; border-radius: 0.3rem;">+ 더보기</button>
							</div>
							<div style="margin-left: 3%;">
								<table border="1px solid white"	style="text-align: center; width: 80%;">
									<tr>
										<th>프로젝트 명</th>
										<th>카테고리/분류</th>
										<th>예상 예산</th>
										<th>시작일</th>
										<th>예상 마감일</th>
										<th>참여 파트너스 수</th>
									</tr>
									<tr>
										<td>miniProject 유지보수</td>
										<td>
											<a class="badge badge-info">개인</a>
											&nbsp;/
											<a class="badge badge-info">WEB</a>
										</td>
										<td>1,000,000원</td>
										<td>2020-02-02</td>
										<td>2020-04-02</td>
										<td>4명</td>
									</tr>
									<tr>
										<td>semiProject</td>
										<td>
											<a class="badge badge-info">기업</a>
											&nbsp;/
											<a class="badge badge-info">WEB</a>
										</td>
										<td>1,000,000원</td>
										<td>2020-03-03</td>
										<td>2020-04-04</td>
										<td>5명</td>
									</tr>
									<tr>
										<td>finalProject</td>
										<td>
											<a class="badge badge-info">기업</a>
											&nbsp;/
											<a class="badge badge-info">WEB</a>
										</td>
										<td>1,000,000원</td>
										<td>2020-04-04</td>
										<td>2020-05-01</td>
										<td>5명</td>
									</tr>
									<tr>
										<td>KH Book Project</td>
										<td>
											<a class="badge badge-info">개인</a>&nbsp;/
											<a class="badge badge-info">워드프레스</a>
										</td>
										<td>1,000,000원</td>
										<td>2020-07-07</td>
										<td>2020-09-14</td>
										<td>2명</td>
									</tr>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<jsp:include page="../common/footer.jsp" />
</body>
</html>