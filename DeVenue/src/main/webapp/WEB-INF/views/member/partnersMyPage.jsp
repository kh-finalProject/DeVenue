<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
					<jsp:include page="../common/pSideMenubar.jsp"/>
				
				<div class="col-10 text-white"
				style="font-family: 'Jua', sans-serif; margin-left:20%;">
				<br>
				<div class="row">
					<div class="col-5" style="margin-left: 5%; padding-right: 0;">
						<table>
							<tr>
								<td>
									<div class="image-profile">
									<c:if test="${empty info.proImg }">
										<img src="${contextPath }/resources/images/showcase.jpg" style="object-fit: cover; width: 100px;">
									</c:if>
									<c:if test="${!empty info.proImg }">
										<img src="${contextPath }/resources/proImg/${info.proImg }" style="object-fit: cover; width: 100px;">
									</c:if>
									</div>
								</td>
								<td>&emsp;&emsp;</td>
								<td>
									<!-- partner01(닉네임)&emsp;
									<a class="badge badge-info">개인</a>
									<br>
									<p>partner01@google.com</p>
									<i class="far fa-address-card"></i>
									&nbsp;신원인증&emsp;
									<i class="fas fa-phone-alt"></i>연락처등록<br> -->
									${info.memNick }&emsp;
									<a class="badge badge-info">${info.memTypeKind }</a>
									<br>
									<p>${info.email }</p>
									<c:if test="${info.iStatus == 'COMPLETE' }">
									<i class="far fa-address-card"></i>
									&nbsp;신원인증&emsp;
									</c:if>
									<c:if test="${!empty info.phone || !empty info.cellPhone }">
									<i class="fas fa-phone-alt"></i>연락처등록<br>
									</c:if>
								</td>
							</tr>
							<tr>
								<td><br>지원한 프로젝트</td>
								<td></td>
								<!-- <td style="padding-left: 25%"><br>22</td> -->
								<td style="padding-left: 25%"><br>${apply.size() }</td>
							</tr>
							<tr>
								<td><br>계약한 프로젝트</td>
								<td></td>
								<td style="padding-left: 25%"><br>${contract.size() }</td>
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
								<c:if test="${!suggest.isEmpty() }">
								<tr>
									<th>닉네임</th>
									<th>클라이언트 형태</th>
									<th>평가 점수</th>
									<th>대상 프로젝트</th>
								</tr>
								</c:if>
								<c:if test="${suggest.isEmpty() }">
								<tr>
									<th>내게 온 제안이 없습니다.</th>
									
								</tr>
								</c:if>
							</thead>
							<tbody>
							<c:forEach var="s" items="${suggest }" end="4">
								<tr>
									<td>${s.memNick }</td>
									<td>${s.memTypeKind }</td>
									<td>${s.eAgv }</td>
									<td>${s.proName }</td>
								</tr>
							</c:forEach>
								<!-- <tr>
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
								</tr> -->
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
								<c:if test="${!process.isEmpty() }">
									<tr>
										<th>프로젝트 명</th>
										<th>카테고리/분류</th>
										<th>예상 예산</th>
										<th>시작일</th>
										<th>예상 마감일</th>
										<th>참여 파트너스 수</th>
									</tr>
								</c:if>
									<c:if test="${process.isEmpty() }">
									<tr>
										<td>진행 중인 프로젝트가 없습니다</td>
									</tr>
									</c:if>
									<c:if test="${!process.isEmpty() }">
									<c:forEach var="p" items="${process }" end="4">
									<tr>
										<td>${p.proName }</td>
										<td>
											<a class="badge badge-info">${p.mcType }</a>
											&nbsp;/
											<a class="badge badge-info">${p.dcType }</a>
										</td>
										<td><fmt:formatNumber value="${p.proPayment }" type="number" groupingUsed="true"/>원</td>
										<td>${p.proStartDate }</td>
										<td>${p.endDate }</td>
										<td>${p.countPartners }명</td>
									</tr>
									</c:forEach>
									</c:if>
									<!-- <tr>
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
									</tr> -->
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>