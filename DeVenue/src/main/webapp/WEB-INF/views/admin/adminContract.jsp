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

<div class="row" style="height:10rem;width:100%;">

</div>

<div class="row">
<div class="col-md-1"></div>
<div class="col-md-10">
<h2>프로젝트 계약 관리</h2>
</div>
<div class="col-md-1"></div>

</div>

<div class="row">

<div class="col-md-1"></div>
<div class="col-md-10">


<table id="table_id" class="display">
    <thead>
        <tr>
            <th>프로젝트 ID</th>
            <th>프로젝트명</th>
            <th>메인카테고리</th>
            <th>상세카테고리</th>
            <th>클라이언트</th>
            <th>생성일</th>
            <th>상세보기</th>
        </tr>
    </thead>
    <tbody>
    	<c:forEach items="${project}" var="p">
        <tr>
            <td class="proId">${p.proId}</td>
            <td>${p.proName}</td>
            <td>
            <c:if test="${p.proMCId eq 'MC1'}">
            	개발
            </c:if>
            <c:if test="${p.proMCId eq 'MC2'}">
            	디자인
            </c:if>
            <c:if test="${p.proMCId eq 'MC3'}">
            	개발+디자인
            </c:if>
            </td>
            <td>
            <c:if test="${p.proDCId eq 'DC1'}">
            	웹
            </c:if>
            <c:if test="${p.proDCId eq 'DC2'}">
            	애플리케이션
            </c:if>
            <c:if test="${p.proDCId eq 'DC3'}">
            	퍼블리싱
            </c:if>
            <c:if test="${p.proDCId eq 'DC4'}">
            	기타
            </c:if>
            </td>
            <td class="clientId">${p.memId}</td>
            <td>${p.proCreateDate}</td>
            <td>
            <button type="button" class="btn btn-primary manage">
  				계약서 관리하기
			</button>
            </td>
        </tr>
        </c:forEach>
     
    </tbody>
</table>

<script>
//모달 채우기

$(document).on("click",".manage",function(){
	
	var proId=$(this).parents("tr").find(".proId").text();
	var clientId=$(this).parents("tr").find(".clientId").text();
	console.log(proId);
	
	var $partnerDiv=$("#partnerDiv");
	$partnerDiv.html("");
	
	var $row;
	var $col1;
	var $col2;
	var $col3;
	
	var $nameP;
	var $nameLabel;
	var $nameSpan;
	
	var $comP;
	var $comLabel;
	var $comSpa;
	
	var $addressP;
	var $addressLabel;
	var $addressSpan;
	
	var $phoneP;
	var $phoneLabel;
	var $phoneSpan;
	
	var $sigP;
	var $sigA;
	
	
	
	//프로젝트 아이디로 client정보와 partner 정보를 가져오자
	
	$.ajax({
		url:"getMemberInfo.do",
		data:{proId:proId,clientId:clientId},
		dataType:"json",
		success:function(data){
			
			<c:forEach items="${project}" var="p">
			
			if(proId=="${p.proId}"){
				
				$("#proName").text("${p.proName}");
				$("#proPay").text("${p.proPayment}");
				$("#proDuration").text("${p.proDuration}");
				$("#proSummary").text("${p.proSummary}");
				$("#proStart").text("${p.proStartDate}");
				$("#hiddenPId").val(proId);
				
				if("${p.proContract}"!=''){
					$("#downloadDoc").attr("href","/DeVenue/resources/contract/${p.proContract}").attr("download","/DeVenue/resources/contract/${p.proContract}");
					$("#uploadDiv").css("display","none");
					$("#downloadDiv").css("display","block");
					$("#uploadDocBtn").css("display","none");
				}else{
					$("#downloadDiv").css("display","none");
					$("#uploadDiv").css("display","block");
					$("#uploadDocBtn").css("display","block");
					
				}
				
				
			}
			
			
			</c:forEach>
			
			$("#clientName").text(data.client.memName);
			$("#clientType").text(data.client.memType);
			$("#clientCompany").text(data.client.memTypeName);
			$("#clientLocation").text(data.client.address1+data.client.address2+data.client.address3);
			$("#clientPhone").text(data.client.cellPhone);
			$("#clientSignature").attr("href","/DeVenue/resources/sigImg/"+data.proSign.renameFileName).attr("download","/DeVenue/resources/sigImg/"+data.proSign.renameFileName);
			
			
			for(var i=0;i<data.partners.length;i++){
				
				$row=$("<div>").addClass("row partnerInfo mt-3");
				$col1=$("<div>").addClass("col-md-1");
				$col2=$("<div>").addClass("col-md-10");
				$col3=$("<div>").addClass("col-md-1");
				
				$nameP=$("<p>");
				$nameLabel=$("<label>").text("이름:");
				$nameSpan=$("<span>");
				$nameSpan.text(data.partners[i].memName);
				
				$nameP.append($nameLabel);
				$nameP.append($nameSpan);
				
				$comP=$("<p>");
				$comLabel=$("<label>").text("소속:");
				$comSpan=$("<span>");
				$comSpan.text(data.partners[i].memTypeName);
				
				$comP.append($comLabel);
				$comP.append($comSpan);
				
				$addressP=$("<p>");
				$addressLabel=$("<label>").text("주소:");
				$addressSpan=$("<span>");
				$addressSpan.text(data.partners[i].address1+data.partners[i].address2+data.partners[i].address3);
				
				$addressP.append($addressLabel);
				$addressP.append($addressSpan);
				
				$phoneP=$("<p>");
				$phoneLabel=$("<label>").text("연락처:");
				$phoneSpan=$("<span>");
				$phoneSpan.text(data.partners[i].phone);
				
				$phoneP.append($phoneLabel);
				$phoneP.append($phoneSpan);
				
				$sigP=$("<p>");
				$sigA=$("<a>").text("날인 다운로드");
				
				for(var j=0;j<data.sign.length;j++){
					
					if(data.partners[i].memId==data.sign[j].memId){
						
						$sigA.attr("href","/DeVenue/resources/sigImg/"+data.sign[j].renameFileName).attr("download","/DeVenue/resources/sigImg/"+data.sign[j].renameFileName);
					}
					
				}
				
				$sigP.append($sigA);
				
				$col2.append($nameP);
				$col2.append($comP);
				$col2.append($addressP);
				$col2.append($phoneP);
				$col2.append($sigP);
				
				$row.append($col1);
				$row.append($col2);
				$row.append($col3);
				
				$partnerDiv.append($row);
				
			}
			
			
		},
		error:function(request, status, errorData){
            alert("error code: " + request.status + "\n"
                  +"message: " + request.responseText
                  +"error: " + errorData);
         } 
	})
	
	
	$('#manageContract').modal('show')
	
})

</script>


<!-- 계약서 관리 모달 -->
<div class="modal fade" id="manageContract" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="staticBackdropLabel">계약서 관리</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
       
      
       <div class="row project mt-4 mb-4">
       <h5 class="ml-3">프로젝트 요약 정보</h5>
       <div class="col-md-12" style="border-top:1px dashed black;">
       <div class="row project mt-3">
       <div class="col-md-1"></div>
       <div class="col-md-10">
       <p><label>이름:</label><span id="proName">정유진</span></p>
       <p> <label>금액:</label><span id="proPay">DEVENUE</span></p>
       <p><label>예상기간:</label><span id="proDuration">수지</span></p>
       <p><label>요약:</label><span id="proSummary">02-000-0000</span></p>
       <p><label>예상시작일:</label><span id="proStart">02-000-0000</span></p>
       </div>
       <div class="col-md-1"></div>
       </div>
       </div>
       
       </div>
       
       
       <div class="row client mt-4 mb-4">
       <h5 class="ml-3">클라이언트</h5>
       <div class="col-md-12" style="border-top:1px dashed black;">
       <div class="row clientInfo mt-3">
       
       <div class="col-md-1"></div>
       <div class="col-md-10">
       <p><label>이름:</label><span id="clientName">정유진</span></p>
       <p><label>멤버타입:</label><span id="clientType">DEVENUE</span></p>
       <p><label>소속:</label><span id="clientCompany">DEVENUE</span></p>
       <p><label>주소:</label><span id="clientLocation">수지</span></p>
       <p><label>연락처:</label><span id="clientPhone">02-000-0000</span></p>
       </div>
       <div class="col-md-1"></div>
      
       </div>
       
       
       <div class="row signature">
       <div class="col-md-1"></div>
        <div class="col-md-10">
        <p><a id="clientSignature">날인 다운로드</a></p>
        </div>
         <div class="col-md-1"></div>
       </div>
       
       </div>
       
       </div>
       
       
       <div class="row partners mt-4 mb-4">
       <h5 class="ml-3">파트너스</h5>
       <div id="partnerDiv" class="col-md-12 partner" style="border-top:1px dashed black;">
       
       <div class="row partnerInfo mt-3">
       <div class="col-md-1"></div>
       <div class="col-md-10">
       <p><label>이름:</label><span>정유진</span></p>
       <p> <label>소속:</label><span>DEVENUE</span></p>
       <p><label>주소:</label><span>수지</span></p>
       <p><label>연락처:</label><span>02-000-0000</span></p>
       <p><a>날인 다운로드</a></p>
       </div>
       <div class="col-md-1"></div>
       </div>
       
       </div>
       
       </div>
       
       
       <div class="row document mt-4 mb-4">
       <h5 class="ml-3">계약서 업로드</h5>
       <div class="col-md-12 document" style="border-top:1px dashed black;">
       <div class="row upload mt-3">
       <div class="col-md-1"></div>
        <div class="col-md-10">
        
        <div class="input-group mb-3">
		  <div class="custom-file" id="uploadDiv">
		    <input type="file" class="custom-file-input" id="contractDocUpload">
		    <label class="custom-file-label" for="contractDocUpload" id="fileLabel">Choose file</label>
		  </div>
		</div>
       </div>
       
       
        
        </div>
         <div class="col-md-1"></div>
       
       
       <div class="row download mt-3">
       
       <div class="col-md-1"></div>
       <div class="col-md-10" id="downloadDiv">
       <p><a id="downloadDoc">계약서 다운로드</a></p>
       <p>계약서 수정 필요시 신규 프로젝트 생성 및 계약자와의 조정이 필요합니다.</p>
       </div>
       <div class="col-md-1"></div>
       </div>
       
       </div>
       
       </div>
       
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button id="uploadDocBtn" type="button" class="btn btn-primary">계약서 업로드</button>
        <input type="hidden" id="hiddenPId">
      </div>
    </div>
  </div>
</div>


       
<script>

$(document).on("change","#contractDocUpload",function(){
	
	var files=$(this)[0].files[0];
	var name=files.name;
	$("#fileLabel").text(name);
	
	
})


$(document).on("click","#uploadDocBtn",function(){
	
										//계약서를 업로드하자
	 									 var fd=new FormData();
                                         var files=$("#contractDocUpload")[0].files[0];
                                         
                                         if(files==null){
                                        	 alert("파일을 업로드 해주세요.");
                                        	 return;
                                         }
                                         
                                         
                                         var proId=$("#hiddenPId").val();
                                         
                                        
                                        
                                         fd.append("file",files);
                                         fd.append("proId",proId);
                                         
                                        
                                         $.ajax({
                                         	url:"uploadContractDoc.do",
                                         	type:"post",
                                         	data:fd,
                                         	contentType:false,
                                         	processData:false,
                                         	success:function(data){
                                         		
                                         		alert("계약서 업로드 완료!");
                                         	
                                         	},
                                         	error:function(request, status, errorData){
                                                alert("error code: " + request.status + "\n"
                                                      +"message: " + request.responseText
                                                      +"error: " + errorData);
                                             } 
                                         	
                                         	
                                         })
                                         
	
	
	
	
});



</script>       
       
       
     




</div>
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