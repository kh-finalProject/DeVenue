<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
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
	<jsp:include page="../common/cSubMenubar.jsp" />

	<div class="container">
		<div class="row text-white"
			style="border-bottom: 1px solid lightgray;">
			<div class="col-2" style="padding:3%; font-size: 150%; font-family: 'Jua', sans-serif;">
		      <c:url var="clientProfile" value="clientProfile.do">
		      	<c:param name="cId" value="${loginUser.memId }"/>
		      </c:url>
		      
		        <p href="${clientProfile }">마이페이지</p>
		      </div>
		</div>

		<div class="row">
			<jsp:include page="../common/pSideMenubar.jsp"/>
			<div class="col-10 text-white" style="font-family: 'Jua', sans-serif; margin-left:20%;">
				<br>
				<div class="row">
					<div class="col-5" style="margin-left: 5%; padding-right: 0;">
						<table>
							<tr>
								<td>
									<div class="image-profile">
									<c:if test="${!empty ph.proImg }">
										<img src="${contextPath }/resources/proImg/${ph.proImg}" style="object-fit: cover; width: 100px;">
									</c:if>
									<c:if test="${empty ph.proImg }">
										<img src="${contextPath }/resources/proImg/user1.png" style="object-fit: cover; width: 100px;">
									</c:if>
									</div>
								</td>
								<td>&emsp;&emsp;</td>
								<td>
									<!-- user01(닉네임)&emsp;
									<a class="badge badge-info">개인</a><br>
									<p>user01@google.com</p>
									<i class="far fa-address-card"></i>&nbsp;신원인증
									&emsp;<i class="fas fa-phone-alt"></i>연락처등록<br> -->
									
									${loginUser.memNick }&emsp;
									<a class="badge badge-info">${ph.memTypeKind}</a><br>
									<p>${loginUser.memEmail }</p>
									<c:if test="${ph.ideStatus eq 'COMPLETE' }">
			                        <i class="far fa-address-card"></i>&nbsp;신원인증
			                        </c:if>
			                        <c:if test="${!empty ph.phone }">
			                        &emsp;<i class="fas fa-phone-alt"></i>연락처등록<br>
			                        </c:if>
								</td>
							</tr>
							<tr>
								<td><br>등록한 프로젝트</td>
								<td></td>
								<td style="text-align:right;"><br>${ph.addProject }</td>
							</tr>
							<tr>
								<td><br>계약한 프로젝트</td>
								<td></td>
								<td style="text-align:right;"><br>${ph.stopProject+ph.ingProject }</td>
							</tr>
						</table>

					</div>
					
					<div class="col-6">
						<p>
							내게 온 제안
							<button id="suggestProject" class="btn-info" type="button" style="float: right; border-radius: 0.3rem; margin-bottom: 1%;">+ 더보기</button>
						</p>
						<table border="1px solid lightgray;" style="width: 100%; text-align: center;">
							<thead>
							<c:if test="${!suggest.isEmpty() }">
								<tr>
									<th>닉네임</th>
									<th>파트너스 직종</th>
									<th>파트너스 형태</th>
									<th>경력</th>
									<th>대상 프로젝트</th>
								</tr>
							</c:if>
							<c:if test="${suggest.isEmpty() }">
								<tr>
									<td>내게 온 제안이 없습니다.</td>
								</tr>
							</c:if>
							</thead>
							<tbody>
							<c:forEach var="s" items="${suggest }" begin="0" end="4" varStatus="status">
								<tr>
									<td>${s.memNick }</td>
									<td>${s.mcType }</td>
									<td>${s.memTypeKind }</td>
									<td>
										<c:choose>
											<c:when test="${s.career >= 1 && s.career <= 36  }">
												신입
											</c:when>
											<c:when test="${s.career >= 37 && s.career <= 60  }">
												3년 이상
											</c:when>
											<c:when test="${s.career >= 61 && s.career <= 120  }">
												5년 이상
											</c:when>
											<c:when test="${s.career >= 121 }">
												10년 이상
											</c:when>
										</c:choose>
									</td>
									<td>${s.proName }</td>
								</tr>
							</c:forEach>
								<!-- <tr>
									<td>p02</td>
									<td>웹 디자이너</td>
									<td>팀</td>
									<td>5년 이상</td>
									<td>finalProject</td>
								</tr>
								<tr>
									<td>p03</td>
									<td>개발자</td>
									<td>법인 사업자</td>
									<td>3년 이상</td>
									<td>mini 유지보수</td>
								</tr>
								<tr>
									<td>p04</td>
									<td>개발자</td>
									<td>개인</td>
									<td>신입</td>
									<td>위시켓</td>
								</tr>
								<tr>
									<td>p05</td>
									<td>개발자</td>
									<td>개인</td>
									<td>신입</td>
									<td>위시켓</td>
								</tr> -->
							</tbody>
						</table>
					</div>
				</div>

				<div class="userBoard">
					&emsp;
					<input type="hidden" value="선택한 회원 ID">

					<div class="row" style="margin-left: 3%; margin-right: 3%; padding-bottom: 3%; border-top: 1px solid lightgray; border-bottom: 1px solid lightgray;">
						<div class="col-12">
							<div style="margin-left: 1%; margin-bottom: 2%; margin-top: 2%; width: 100%;">
								<b>진행중인 프로젝트</b>
								<button id="ingProject" class="btn-info" type="button" style="float: right; border-radius: 0.3rem;">+ 더보기</button>
								<c:url var="recruit" value="recruitProjectList.do">
									<c:param name="memId" value="${loginUser.memId}"></c:param>
								</c:url>
								<c:url var="underway" value="underwayProjectList.do">
									<c:param name="memId" value="${loginUser.memId}"></c:param>
								</c:url>
								<script>
									$("#ingProject").on("click",function(){
										location.href="${underway}";
									})
									$("#suggestProject").on("click",function(){
										location.href="${recruit}";
									})
								</script>
							</div>
							<div style="margin-left: 3%;">
								<table border="1px solid white" style="text-align: center; width: 100%;">
									<tr>
									<c:if test="${!process.isEmpty() }">
										<th>프로젝트 명</th>
										<th>카테고리/분류</th>
										<th>예상 예산</th>
										<th>시작일</th>
										<th>예상 마감일</th>
										<th>참여 파트너스 수</th>
									</c:if>
									<c:if test="${process.isEmpty() }">
										<td>진헹 중인 프로젝트가 없습니다.</td>
									</c:if>
									</tr>
									<c:forEach var="p" items="${process }" begin="0" end="4" varStatus="status"> 
										<tr>
										<td>${p.proName }</td>
										<td>
											<a class="badge badge-info">${p.mcType }</a>
											&nbsp;/
											<a class="badge badge-info">${p.dcType }</a>
										</td>
										<td><fmt:formatNumber value="${p.proPayment }" type="number" groupingUsed="true"/>원</td>
										<td>${p.proStartDate }</td>
										<td>${p.proEndDate }</td>
										<c:forEach var="cp" items="${cp }" begin="${status.index }" end="${status.index }">
										<td>${cp.countPartners }명</td>
										</c:forEach>
									</tr>
									</c:forEach>
									<!-- <tr>
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
											<a class="badge badge-info">개인</a>
											&nbsp;/
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
	
	<jsp:include page="../common/footer.jsp" />
</body>
</html>