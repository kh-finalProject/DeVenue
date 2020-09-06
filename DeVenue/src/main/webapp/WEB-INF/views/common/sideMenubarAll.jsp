<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${!empty sessionScope.loginUser }">
	
		<!-- 관리자 계정 경우 -->
		<c:if test="${loginUser.userType eq 'UT1' || loginUser.userType eq 'UT2'}">
			<!-- 관리자 일경우는 버튼으로 다른대로 이동하나??? -->
		</c:if>
		
		<!-- 클라이언트 계정 로그인 -->
		<c:if test="${loginUser.userType eq 'UT3'}">
			<jsp:include page="../common/cSubMenubar.jsp" />
		</c:if>
		
		<!-- 파트너스 계정 로그인 -->
		<c:if test="${loginUser.userType eq 'UT4'}">
			<jsp:include page="../common/pSubMenubar.jsp" />
		</c:if>
		
	</c:if>
</body>
</html>