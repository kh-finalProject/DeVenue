<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.nav {
		width: 780px;
		margin-left: auto;
		margin-right: auto;
	}
	
	.menu {
		display: inline-block;
		background: yellowgreen;
		text-align: center;
		line-height: 50px;
		width: 150px;
		height: 50px;
		margin-left: 20px;
		margin-right: 20px;
		border-radius: 20px;
	}
	
	.menu:hover {
		background: orangered;
		color: white;
		cursor: pointer;
	}
	
	#logo{
		width:120px;
		height:100px;
	}
</style>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
	<c:set var="contextPath"
		value="${pageContext.servletContext.contextPath }" scope="application" />
	<div class="menubar">
		<div>
			<img id="logo" src="${contextPath }/resources/images/DeVenue_logo.jpg">
		</div>
		<div class="nav">
			<div class="menu">
				<a href="home.do">HOME</a>
			</div>
			<div class="menu">
				<a href="#">공지사항</a>
			</div>
			<div class="menu">
				<a href="#">게시판</a>
			</div>
			<div class="menu">
				<a href="#">etc</a>
			</div>
		</div>
	</div>



</body>
</html>