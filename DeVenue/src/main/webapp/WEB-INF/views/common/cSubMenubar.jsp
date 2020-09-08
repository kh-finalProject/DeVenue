<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:url var="check" value="check.do"/>
	<!--navigation bar2-->
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<div class="collapse navbar-collapse" id="navbarSub"
			style="margin-left: 3%;">
			<ul class="navbar-nav">
		
						<c:url var="check" value="checkList.do">
						<c:param name="memId" value="${loginUser.memId}"></c:param>
					</c:url>
					<c:url var="recruit" value="recruitProjectList.do">
						<c:param name="memId" value="${loginUser.memId}"></c:param>
					</c:url>
					<c:url var="underway" value="underwayProjectList.do">
						<c:param name="memId" value="${loginUser.memId}"></c:param>
					</c:url>
					<c:url var="end" value="endProjectList.do">
						<c:param name="memId" value="${loginUser.memId}"></c:param>
					</c:url>
					
					
				<li class="nav-item"><a
					class="nav-link ml-4 hvr-underline-from-center" href="${check}">검수 중</a></li>
				<li class="nav-item"><a
					class="nav-link ml-4 hvr-underline-from-center" href="${recruit}">지원자 모집
						중</a></li>
				<li class="nav-item"><a
					class="nav-link ml-4 hvr-underline-from-center" href="${underway}">진행 중인
						프로젝트</a></li>
				<li class="nav-item"><a
					class="nav-link ml-4 hvr-underline-from-center" href="${end}">종료된
						프로젝트</a></li>
			</ul>
			</div>
			</form>
	</nav>
</body>
</html>