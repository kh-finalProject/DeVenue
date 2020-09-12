<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.21/css/jquery.dataTables.css">
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/autofill/2.3.5/css/autoFill.dataTables.min.css">
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/buttons/1.6.2/css/buttons.dataTables.min.css">
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/fixedcolumns/3.3.1/css/fixedColumns.dataTables.min.css">
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/responsive/2.2.5/css/responsive.dataTables.min.css">
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/searchpanes/1.1.1/css/searchPanes.dataTables.min.css">
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/scroller/2.0.2/css/scroller.dataTables.min.css">
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/select/1.3.1/css/select.dataTables.min.css">

<script src="http://code.jquery.com/jquery-Latest.min.js"></script>
<title>Insert title here</title>


<script>
$(document).ready(function() {
    $('#table_id').DataTable();
} );
</script>
  
</head>
<body>
<jsp:include page="../common/adminNavbar.jsp" />

<div class="row" style="height:300px;width:100%;"></div>

<div class="row">

<div class="col-md-1"></div>
<div class="col-md-10">


<table id="table_id" class="display">
    <thead>
        <tr>
            <th>파트너스</th>
            <th>프로젝트명</th>
            <th>예치금</th>
            <th>예상지불금액</th>
            <th>실제지불금액</th>
            <th>세금</th>
            <th>인센티브</th>
            <th>정산상태</th>
            <th>정산일</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>Row 1 Data 1</td>
            <td>Row 1 Data 2</td>
            <td>Row 1 Data 1</td>
            <td>Row 1 Data 2</td>
            <td>Row 1 Data 1</td>
            <td>Row 1 Data 2</td>
            <td>Row 1 Data 2</td>
            <td>Row 1 Data 1</td>
            <td>Row 1 Data 2</td>
        </tr>
       <tr>
            <td>Row 1 Data 1</td>
            <td>Row 1 Data 2</td>
            <td>Row 1 Data 1</td>
            <td>Row 1 Data 2</td>
            <td>Row 1 Data 1</td>
            <td>Row 1 Data 2</td>
            <td>Row 1 Data 2</td>
            <td>Row 1 Data 1</td>
            <td>Row 1 Data 2</td>
        </tr>
       <tr>
            <td>Row 1 Data 1</td>
            <td>Row 1 Data 2</td>
            <td>Row 1 Data 1</td>
            <td>Row 1 Data 2</td>
            <td>Row 1 Data 1</td>
            <td>Row 1 Data 2</td>
            <td>Row 1 Data 2</td>
            <td>Row 1 Data 1</td>
            <td>Row 1 Data 2</td>
        </tr>
    </tbody>
</table>





</div>
<div class="col-md-1"></div>

</div>






<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.js"></script>
<script type="https://cdn.datatables.net/buttons/1.6.2/js/dataTables.buttons.min.js"></script>
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/autofill/2.3.5/js/dataTables.autoFill.min.js"></script>
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/fixedcolumns/3.3.1/js/dataTables.fixedColumns.min.js"></script>
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/responsive/2.2.5/js/dataTables.responsive.min.js"></script>
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/searchpanes/1.1.1/js/dataTables.searchPanes.min.js"></script>
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/scroller/2.0.2/js/dataTables.scroller.min.js"></script>
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/select/1.3.1/js/dataTables.select.min.js"></script>


</body>
</html>