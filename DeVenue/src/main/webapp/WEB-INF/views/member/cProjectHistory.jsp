<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	/* 별점수 */
	.fas{
		margin-right:0;
	}
	
	#firstStar{
		margin-right:0;
	}
	
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
</style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp" />
	<jsp:include page="../common/cSubMenubar.jsp" />

	<div class="container">
		<div class="row text-white" style="border-bottom: 1px solid lightgray;">
			<div class="col-2" style="padding: 3%; font-size: 150%; font-family: 'Jua', sans-serif;">
				마이페이지
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
				<h4 style="margin-left: 3%; padding-bottom: 1%; width: 85%; border-bottom: 1px solid lightgray;">
					프로젝트 히스토리
				</h4>
			</div>
		</div>
		<div class="row">
			<div class="col-2" style="border-right: 1px solid lightgray;"></div>
		</div>
		
		<div class="row">
			<div class="col-2 text-white" style="border-right: 1px solid lightgray; font-family: 'Jua', sans-serif;">
				<br>
				<div style="padding-bottom: 5.5%;">
					<div>
						<p id="infoMenu">
							정보 관리
							<i style="float: right; margin-right: 5%;" class="fas fa-angle-down"></i>
						</p>
						<div id="subInfoMenu" style="display: none; margin-left: 5%;">
							<p id="clientInfo">클라이언트 정보</p>
							<p id="projectHistory">프로젝트 히스토리</p>
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
						<p>결제 관리</p>
						<p id="clientEvaluate">내게 온 제안</p>
					</div>
					<script>
				            $("#infoMenu").click(function () {
				
				              $("#subInfoMenu").toggle();
				            });
				
				            $("#accountMenu").click(function () {
				
				              $("#subAccountMenu").toggle();
				            });
				
				            $("#clientInfo").on("click", function () {
				              location.href = "../findUser/findClientDetail.html";
				            }).on("mouseenter", function () {
				
				            });
				
				            $("#projectHistory").on("click", function () {
				              location.href = "projectHistory.html";
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

					<div class="row" style="margin-left: 3%; margin-right: 3%; border-bottom: 1px solid lightgray;">
						<div class="point col-10" style="margin-left: 2%; margin-top: 0; display: flex; padding: 0;">
							<div style="margin-top: 1%; flex: 1;">
								<table style="width: 70%;">
									<tr>
										<td>
											<div>
												<p>등록한 프로젝트 수</p>
												&emsp;
											</div>
										</td>
										<td>
											<div style="text-align: right;">
												<p>50개</p>
												&emsp;
											</div>
										</td>
									</tr>
									<tr style="height: 10%;">
										<td style="height: 10%;">
											<p>계약한 프로젝트 수</p>
										</td>
										<td style="height: 10%;">
											<div style="text-align: right;">
												<p>22개</p>
											</div>
										</td>
									</tr>
									<tr>
										<td>
											<div style="margin-left: 7%; margin-bottom: 3%;">
												계약률<br> 진행중인 프로젝트<br> 완료한 프로젝트
											</div>
										</td>
										<td>
											<div style="float: right;">
												&nbsp;100%<br> &emsp;10개<br> &emsp;12개
											</div>
										</td>
									</tr>
									<tr style="border-top: 1px dashed lightgray;">
										<td>
											<div style="margin-top: 5%;">
												<p>누적 완료 금액</p>
												&emsp;
											</div>
										</td>
										<td>
											<div style="margin-top: 5%; text-align: right;">
												<p>1,000,000원</p>
												&emsp;
											</div>
										</td>
									</tr>
								</table>
							</div>
							<div style="margin-top: 1%; flex: 1;">
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


	<jsp:include page="../common/footer.jsp" />
</body>
</html>