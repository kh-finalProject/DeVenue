<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
				<li class="nav-item"><a
					class="nav-link ml-4 hvr-underline-from-center" href="check.do">검수 중</a></li>
				<li class="nav-item"><a
					class="nav-link ml-4 hvr-underline-from-center" href="recruitProjectList.do">지원자 모집
						중</a></li>
				<li class="nav-item"><a
					class="nav-link ml-4 hvr-underline-from-center" href="underwayProjectList.do">진행 중인
						프로젝트</a></li>
				<li class="nav-item"><a
					class="nav-link ml-4 hvr-underline-from-center" href="endProjectList.do">종료된
						프로젝트</a></li>
			</ul>
	</nav>
</body>
</html>