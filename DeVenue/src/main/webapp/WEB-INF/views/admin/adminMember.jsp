<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">

<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.10.21/css/jquery.dataTables.css">
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/autofill/2.3.5/css/autoFill.dataTables.min.css">
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/buttons/1.6.2/css/buttons.dataTables.min.css">
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/fixedcolumns/3.3.1/css/fixedColumns.dataTables.min.css">
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/responsive/2.2.5/css/responsive.dataTables.min.css">
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/searchpanes/1.1.1/css/searchPanes.dataTables.min.css">
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/scroller/2.0.2/css/scroller.dataTables.min.css">
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/select/1.3.1/css/select.dataTables.min.css">

<!-- fontawesome icon CDN -->
<script src="https://kit.fontawesome.com/4b6b63d8f6.js"
	crossorigin="anonymous"></script>

<script src="http://code.jquery.com/jquery-Latest.min.js"></script>
<title>정산 관리</title>


<script>
$(document).ready(function() {
    $('#table_id').DataTable();
} );
</script>


<style>
#partnerInfo tr th {
	width: 5rem;
	text-align: center;
}

#partnerInfo tr td {
	text-align: center;
}

#partnerInfo input {
	color: black;
}

/* 회원정보 테이블 */
.adminT {
	text-align: center;
}
</style>
</head>
<body>
	<jsp:include page="../common/adminNavbar.jsp" />

	<div class="row"
		style="height: 10rem; width: 90%; margin-left: 10px; margin-top: 30px;">
		<!-- 섹션 시작 -->
		<h3>회원관리
			<button type="button" class="btn btn-outline-primary">수정</button>
		</h3>
		<table class="table table-striped">
			<thead>
				<tr>
					<th scope="col">회원번호</th>
					<th scope="col">닉네임</th>
					<th scope="col">이메일</th>
					<th scope="col">이름</th>
					<th scope="col">전화번호</th>
					<th scope="col">마케팅수신여부</th>
					<th scope="col">가입날짜</th>
					<th scope="col">수정일</th>
					<th scope="col">신고횟수</th>
					<th scope="col">활동여부</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="mem" items="${memberList }">
				<tr>
					<th>${mem.memId }</th>
					<td>${mem.memNick }</td>
					<td>${mem.memEmail }</td>
					<td>${mem.memName }</td>
					<th>${mem.cellPhone }</th>
					<td>${mem.isAdvertise }</td>
					<td>${mem.memCreateDate }</td>
					<td>${mem.memModifyDate }</td>
					<td>${mem.decCount }</td>
					<td>${mem.memStatus }</td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>

</body>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
<!-- <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script> -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
</html>
