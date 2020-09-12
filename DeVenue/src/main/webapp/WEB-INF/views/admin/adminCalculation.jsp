<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.21/css/jquery.dataTables.css">
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/autofill/2.3.5/css/autoFill.dataTables.min.css">
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/buttons/1.6.2/css/buttons.dataTables.min.css">
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/fixedcolumns/3.3.1/css/fixedColumns.dataTables.min.css">
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/responsive/2.2.5/css/responsive.dataTables.min.css">
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/searchpanes/1.1.1/css/searchPanes.dataTables.min.css">
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/scroller/2.0.2/css/scroller.dataTables.min.css">
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/select/1.3.1/css/select.dataTables.min.css">

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

#partnerInfo tr th{
width:5rem;
text-align:center;
}

#partnerInfo tr td{
text-align:center;
}

#partnerInfo input{
color:black;
}

</style>
</head>
<body>
<jsp:include page="../common/adminNavbar.jsp" />

<div class="row" style="height:10rem;width:100%;">

</div>

<div class="row">
<div class="col-md-1"></div>
<div class="col-md-10">
<h2>프로젝트 정산 관리</h2>
</div>
<div class="col-md-1"></div>

</div>

<div class="row">

<div class="col-md-1"></div>
<div class="col-md-10">


<table id="table_id" class="display">
    <thead>
        <tr>
            <th>프로젝트 아이디</th>
            <th>프로젝트명</th>
            <th>상태</th>
            <th>종료일</th>
            <th>예치금</th>
            <th>정산상태</th>
            <th>정산일</th>
            <th>상세보기</th>
        </tr>
    </thead>
    <tbody>
    	<c:forEach items="${project}" var="p">
        <tr>
            <td class="proId">${p.proId}</td>
            <td>${p.proName}</td>
            <td>
            <c:if test="${p.proStaId eq 'PST5'}">
            	완료
            </c:if>
            <c:if test="${p.proStaId eq 'PST6'}">
            	중단
            </c:if>
            </td>    
            <td>${p.proEndDate}</td>
            <td>${p.proPayment}</td>
            <td>
            <c:set var="calStatus" value="false"/>
            <c:forEach items="${cal}" var="ca">
            	<c:if test="${ca.proId eq p.proId}">
            	<c:set var="calStatus" value="true"/>
            	</c:if>
            </c:forEach>
            <c:if test="${calStatus eq 'true'}">
            	정산완료
            </c:if>
            <c:if test="${calStatus eq 'false'}">
            	미정산
            </c:if>
            </td>
            <td>
             <c:forEach items="${cal}" var="ca">
            	<c:if test="${ca.proId eq p.proId}">
            	${ca.payDate}
            	</c:if>
            </c:forEach>
            </td>
            <td>
            <c:if test="${calStatus eq 'false'}">
            	<button type="button" class="btn btn-primary manage">
  					정산하기
				</button>
            </c:if>
            </td>
           
        </tr>
        </c:forEach>
    </tbody>
</table>

<script>
//모달 채우기
$(document).on("click",".manage",function(){
	
	var proId=$(this).parents("tr").find(".proId").text();
	console.log("행이 클릭, proId"+proId);
	
	var $input=$("<input type='hidden'>").attr("name","proId").attr("id","hiddenPId");
	$input.val(proId);
	$("#calculateForm").append($input);
	
	var $partnerDiv=$("#partnerInfo");
	$partnerDiv.html("");
	
	var $tr1;
	var $th1;
	var $th2;
	var $th3;
	var $th4;
	var $th5;
	var $th6;
	var $th7;
	
	var $tr2;
	var $td1;
	var $td2;
	var $td3;
	var $td4;
	var $td5;
	var $td6;
	var $td7;
	
	var $pay;
	var $incentive;
	var $fine;
	var $tax;
	var $wage;
	
	var memType="";
	var workType="";
	
	var $payment=0;
	var $profit=0;
	var $tax=0;
	
	
	//프로젝트 정보 채우기
	<c:forEach items="${project}" var="p">
	
	if(proId=="${p.proId}"){
		
		$("#proName").text("${p.proName}");
		$("#proPay").text("${p.proPayment}");
		$("#deposit").val("${p.proPayment}");
		
		
		$payment=parseInt("${p.proPayment}");
		console.log("payment"+$payment);
		$profit=$payment*0.05;
		console.log("profit"+$profit);
		$tax=$payment*0.1;
		
		switch("${p.proWTId}"){
		case "WT1":workType="외주";
		break;
		case "WT2":workType="상주";
		break;
		case "WT3":workType="외주+상주";
		break;
		default:workType="외주+상주";
		}
		
		
		$("#workType").text(workType);
		$("#proStartDate").text("${p.proStartDate}");
		$("#proEndDate").text("${p.proEndDate}");
		console.log("forEach안의 p.proId"+"${p.proId}");
		
		
		
	}
	
	
	</c:forEach>
	
	$("#profit").val($profit);
	$("#tax").val($tax);
	$("#expectPay").val($payment-$profit-$tax);
	$("#realPay").val($payment-$tax);
	
	
	
	
	$.ajax({
		url:"getCalculationInfo.do",
		data:{proId:proId},
		dataType:"json",
		success:function(data){
			
			$tr1=$("<tr>").addClass("thead");
			$th1=$("<th>").text("멤버타입");
			$th2=$("<th>").text("이름");
			$th3=$("<th>").text("지급액");
			$th4=$("<th>").text("인센티브");
			$th5=$("<th>").text("패널티");
			$th6=$("<th>").text("세금");
			$th7=$("<th>").text("실지급액");
			
			$tr1.append($th1);
			$tr1.append($th2);
			$tr1.append($th3);
			$tr1.append($th4);
			$tr1.append($th5);
			$tr1.append($th6);
			$tr1.append($th7);
			
			$partnerDiv.append($tr1);
			
			for(var i=0;i<data.length;i++){
				
				$tr2=$("<tr>").addClass("tbody");
				
				switch(data[i].memType){
				case "MT1": memType="개인";
				break;
				case "MT2": memType="법인";
				break;
				case "MT3": memType="팀";
				break;
				case "MT4": memType="개인사업자";
				break;
				case "MT5": memType="법인사업자";
				break;
				case "MT6": memType="기업";
				break;
				default:memType="팀";
				}
				
				$td1=$("<td>").text(memType);
				$td2=$("<td>").text(data[i].memName);
				
				$pay=$("<input type='number'>").addClass("form-control pay");
				$td3=$("<td>");
				$td3.append($pay);
				
				$incentive=$("<input type='number'>").addClass("form-control incentive");
				$td4=$("<td>");
				$td4.append($incentive);
				
				$fine=$("<input type='number'>").addClass("form-control fine");
				$td5=$("<td>");
				$td5.append($fine);
				
				$tax=$("<input type='number'>").addClass("form-control tax");
				$td6=$("<td>");
				$td6.append($tax);
				
				$wage=$("<input type='number'>").addClass("form-control wage");
				$td7=$("<td>");
				$td7.append($wage);
				
				$tr2.append($td1);
				$tr2.append($td2);
				$tr2.append($td3);
				$tr2.append($td4);
				$tr2.append($td5);
				$tr2.append($td6);
				$tr2.append($td7);
				
				$partnerDiv.append($tr2);
			
				
				
				
			}
			
		},
		error:function(request, status, errorData){
            alert("error code: " + request.status + "\n"
                  +"message: " + request.responseText
                  +"error: " + errorData);
         }
	})
	
	
	
	$("#manageCalculation").modal("show");
	
	
	
})


</script>

<!-- 정산 관리 모달 -->
<div class="modal fade" id="manageCalculation" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="staticBackdropLabel">계약서 관리</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <form action="uploadCalculation.do" id="calculateForm" onsubmit="return validate();">
      <div class="modal-body">
       
      
       <div class="row project mt-4 mb-4">
       <h5 class="ml-3">프로젝트 요약 정보</h5>
       <div class="col-md-12" style="border-top:1px dashed black;">
       <div class="row project mt-3">
       <div class="col-md-1"></div>
       <div class="col-md-10">
       <p><label>이름:</label><span id="proName">정유진</span></p>
       <p> <label>금액:</label><span id="proPay">DEVENUE</span></p>
       <p> <label>근무형태:</label><span id="workType">DEVENUE</span></p>
       <p><label>시작일:</label><span id="proStartDate">수지</span></p>
       <p><label>종료일:</label><span id="proEndDate">02-000-0000</span></p>
       </div>
       <div class="col-md-1"></div>
       </div>
       </div>
       
       </div>
              
       
       <div class="row partners mt-4 mb-4">
       <h5 class="ml-3">매칭 파트너스</h5>
       
       
       
       <div id="partnerDiv" class="col-md-12" style="border-top:1px dashed black;overflow-x: scroll;">
       
       <div class="row partner">
       <table class="table table-dark" style="width:100%;" id="partnerInfo">
       <tr class="thead">
       <th>멤버타입</th>
       <th>이름</th>
       <th>지급액</th>
       <th>인센티브</th>
       <th>패널티</th>
       <th>세금</th>
       <th>실지급액</th>
       </tr>
       <tr class="tbody">
       <td></td>
       <td></td>
       <td></td>
       <td></td>
       <td></td>
       <td></td>
       </tr>
       
       </table>
       
       
       </div>
       
       </div>
      
       </div>
       
       
       <div class="row document mt-4 mb-4">
       <h5 class="ml-3">정산 내역</h5>
       <div class="col-md-12 result" style="border-top:1px dashed black;">
       
       <div class="row upload mt-3">
       <div class="col-md-1"></div>
        <div class="col-md-3">
        <p>클라이언트 입금액</p>
       </div>
       <div class="col-md-7">
		<input class="form-control" type="text" readonly name="deposit" id="deposit">
	  </div>
       
       <div class="col-md-1"></div>
       </div>
       
       <div class="row upload mt-3">
       <div class="col-md-1"></div>
        <div class="col-md-3">
        <p>파트너스 인건비</p>
       </div>
       <div class="col-md-7">
       <input class="form-control" type="text" readonly name="expectPay" id="expectPay" style="width:100%">
       </div>
       <div class="col-md-1"></div>
       </div>
       
       <div class="row upload mt-3">
       <div class="col-md-1"></div>
        <div class="col-md-3">
        <p>DeVenue 수수료</p>
       </div>
       <div class="col-md-7">
       <input class="form-control" type="text" readonly name="incentive" id="profit" style="width:100%">
       </div>
       <div class="col-md-1"></div>
       </div>
       
       <div class="row upload mt-3">
       <div class="col-md-1"></div>
        <div class="col-md-3">
        <p>세금</p>
       </div>
       <div class="col-md-7">
       <input class="form-control" type="text" readonly name="tax" id="tax" style="width:100%">
       </div>
       <div class="col-md-1"></div>
       </div>
       
       <div class="row upload mt-3">
       <div class="col-md-1"></div>
        <div class="col-md-3">
        <p>정산 총액</p>
       </div>
       <div class="col-md-7">
       <input class="form-control" type="text" readonly name="realPay" id="realPay" style="width:100%">
       </div>
       <div class="col-md-1"></div>
       </div>
       
       </div>
       
       </div>
       
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button id="uploadResult" type="submit" class="btn btn-primary">정산하기</button>
        
      </div>
      </form>
    </div>
  </div>
</div>

</div>

<script>
	
//파트너스 지급액 입력 시, 
$(document).ready(function(){
	
	$(".tbody").click(function(){
		
		alert("클릭");
		
	
	})
	
	
})


function validate(){
	
	
	
	return true;
}


</script>


<div class="col-md-1"></div>
</div>



<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>


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