<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html class="no-js" lang="ko">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>디베뉴 관리자 채팅관리3 - 채팅봇 관리 뷰 페이지</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
    <!-- <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script> -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    

  <!-- summernote CSS : 텍스트 필드 플러그인 css !!!!!!!!!!!!!!!!!!!
		============================================ -->
  <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/css/summernote/summernote.css">
  
	<!-- include summernote css/js-->
<!-- 	<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.2/summernote.css" rel="stylesheet"> -->
<!-- 	<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.2/summernote.js"></script> -->
    <!-- 개인적인 css 시작 -->
    <style>
        /* 채팅 설정 영역 --------------------------------------------------------------------------*/
        /* 전체 컨텐트 랩 */
        .content_chatbot_wrap{
            width: 100%;
            height:100%;
            padding: 25px;
            padding-top: 50px;
            /* background-color: lightslategrey; */
        }   
        /* 타이틀 설정 */
        .chatbot_title{
            font-size: 22px;
            font-weight: 550;
            color: rgb(10,10,10);
            margin-bottom: 25px;
        }
        /* 내용 영역 */
        .content_chatbot{
            width:90%;
            align-items: center;
        }
        
        /* 테이블 */
        .table{
            background-color: rgb(240, 239, 239);
            width:100% !important;
            margin: auto;
        }

        /* 테이블 td 넓이 조정*/
        .table thead tr th:first-of-type{
            width: 60px;
        }
        .table thead tr th:nth-of-type(2){
            width: 30%;
        }
        .table thead tr th:last-of-type{
            width: 10%;
        }

        /* 번호 td */
        .askRow th:first-of-type{
            padding-top:15px;
        }

        /* 테이블 번호 영역*/
        .table tr:first-of-type, .askRow{
            text-align: center;
        }

        
        /* 테이블 안 input 태그  */
        .table input{
            border:none;
            background: none;
            width: 100%;
            text-align: center;
            outline: none;
            /* font-weight: 550; */
            font-size: 15px;
            max-width: 100%;
            white-space: nowrap;
            text-overflow: ellipsis;
            margin-top:7px;
        }

        /* 답변 내용 타이틀 */
        .table .answer_title{
            font-weight: 600; 
            color:rgb(82, 81, 81);
            border: 1px solid lightgray;
            border-radius: 3px;
            padding: 7px 7px 7px 7px;
            margin-bottom: 10px;
            position: relative;
            background-color: rgb(240, 239, 239);
        }

        .table .answer_title span{
            display: inline-block;
            width:84%;
        }
        
        /* 답변 행 */
        .table .answerRow{
            background-color: white;
        }

        /* 답변 제출 버튼 */
        .submitBtn{
            position: relative;
            width: 15%;
        }

        /* 오픈(수정) 버튼 */
        .editBtn{
            width: 100% !important;
        }

        /* 페이지네이션 영역 랩 */
        #paginationArea_wrap{
            text-align: center; 
            /* background-color: white;  */
            width: 90%;
        }
        /* 페이지네이션 영역 */
        #paginationArea{
            display: inline-block;
        }
        /* 추가/삭제 버튼 */
        .insert_wrap{
            text-align: right;
	        margin-bottom: 5px;
        }
        .insertBtn{
           border: 1px solid lightgray !important;
        }
    </style>
</head>

<body>
<!-- 관리자 메뉴바 포함 -->
<jsp:include page="../common/adminNavbar.jsp" />
 <!-- 여기서부터 콘텐츠 시작하면 됨 -->
 <div class="content_chatbot_wrap">
     <label class="chatbot_title">챗봇 데이터 관리</label>
     <!-- 챗봇 데이터 생성란 전체 -->
     <div class="content_chatbot">
         <div class="insert_wrap">
             <button type="button" id="insertBtn" class="btn btn-light insertBtn insertDeleteBtns">New</button>
         </div>
         <table class="table" border="0">
             <thead class="thead-dark">
                 <tr>
                     <th scope="col" style="text-align: center !important;">번호</th>
                     <th scope="col" style="text-align: center !important;">키워드</th>
                     <th scope="col" style="text-align: center !important;">질문 예시</th>
                     <th scope="col" colspan="3"></th>
                 </tr>
             </thead>
             <tbody id="chatdataTableTbody">
             	<c:set var="countS" value="0"/>
             	<fmt:formatNumber type="number" value="${countS }" var="count"/>
             	<c:if test="${! empty chatBotDatas }">
             		<c:forEach var="i" begin="0" end="${chatBotDatas.size()-1 }" step="1">
		                 	 <c:set var="count" value="${count + 1 }"/>
		                     <tr class="askRow">
		                         <th scope="row" style="text-align: center;">${count }</th>
		                         <td>
		                             <input type="text" class="chatbot_keyword" name="keyword" 
		                             value="${chatBotDatas[i].askKeyword }" readonly>
		                         </td>
		                         <td colspan="2">
		                             <input type="text" class="chatbot_keyword" name="ask" 
		                             value="${chatBotDatas[i].askTitle }" readonly>
		                         </td>
		                         <td>
		                             <button type="button" class="btn btn-dark editBtn">Open</button>
		                         </td>
		                         <td>
		                         	<input type="hidden" value="${chatBotDatas[i].askId }">
		                             <button type="button" class="btn btn-dark insertDeleteBtns deleteDataBtn">Delete</button>
		                         </td>
		                     </tr>
		                     <tr class="answerRow">
		                         <td></td>
		                         <td colspan="5">
		                             <div class="answer_title">
		                                 <span>답변 내용</span>
		                                 <button type="button" class="btn btn-dark submitBtn updateBtn">Submit</button>
		                             </div>
		    			             <form action="updateChatBotData.do" method="get" class="updateForm">
					                 	<input type="hidden" name="keyword">
					                    <input type="hidden" name="title">
					                    <input type="hidden" name="answer">
					                    <input type="hidden" value="${chatBotDatas[i].askId }" name="askId">
			                             <input type="hidden" name="answerSummer">
			                             <!-- 파일은 file이라는 name으로 자동으로 넘어감 -->
			                             <div class="summernote">${chatBotDatas[i].askContent }</div>
					                 </form>
		                         </td>
		                     </tr>
                 </c:forEach>
				</c:if>
				<c:if test="${empty chatBotDatas }">
					<tr class="askRow">
                         <td colspan="6">
                         	조회된 챗봇 데이터가 없습니다.
                         </td>
                     </tr>
				</c:if>
             </tbody>
         </table>
     </div>
      <!-- 페이지네이션 -->
      <div id="paginationArea_wrap">
          <nav id="paginationArea" aria-label="Page navigation example">
              <ul class="pagination">
                  <li class="page-item">
                  <a class="page-link" href="#" aria-label="Previous">
                      <span aria-hidden="true">&laquo;</span>
                  </a>
                  </li>
                  <li class="page-item"><a class="page-link" href="#">1</a></li>
                  <li class="page-item"><a class="page-link" href="#">2</a></li>
                  <li class="page-item"><a class="page-link" href="#">3</a></li>
                  <li class="page-item">
                  <a class="page-link" href="#" aria-label="Next">
                      <span aria-hidden="true">&raquo;</span>
                  </a>
                  </li>
              </ul>
          </nav>
      </div>
 </div>
   <!-- 숨겨놓은 삽입용 summernote -->
   <div id="hideSummernoteDiv" style="display: none;">
       <form action="insertChatbotData.do" method="get" onsubmit="return insertChatBotData()">
           <div class="summernote" id="summernote">

           </div>
           <input type="hidden" name="answer" id="insertSummernote">
           <input type="hidden" name="keyword" id="insertKeyword2">
           <input type="hidden" name="title" id="insertTitle2">
           <input type="submit" id="insertSubmitBtn2" style="visibility: hidden; height: 1px;">
       </form>
   </div>

    <!-- summernote JS : 텍스트 필드 플러그인 js !!!!!!!!!!!!!!!!!!!1
		============================================ -->
    <script src="${pageContext.servletContext.contextPath}/resources/js/summernote/summernote.min.js"></script>
    <script src="${pageContext.servletContext.contextPath}/resources/js/summernote/summernote-active.js"></script>

    <!-- 개인 스크립트 -->
    <script>
        $(function(){
            var _ = jQuery.noConflict();
            //테이블 툴팁 숨기기
            _('[class^=popover], .arrow, [class^=note-popover]').hide();

            //답변 부분 와리가리
            _('.answerRow').hide();
            _('.editBtn').on('click', function(){
                var nextRow = _(this).parent().parent().next();
                if(nextRow.css('display')=='none'){
                    _(this).text('Close')
                    _(this).parent().siblings().children('[name=keyword]').prop('readonly', false).css({'border':'0.5px solid gray', "border-radius":"3px", 'padding':'5px', 'color':'gray'})
                    _(this).parent().siblings().children('[name=ask]').prop('readonly', false).css({'border':'0.5px solid gray', "border-radius":"3px", 'padding':'5px', 'color':'gray'})
                }else{
                    _(this).text('Open')
                    _(this).parent().siblings().children('[name=keyword]').prop('readonly', false).css({'border':'none', 'padding':'0px', 'color':'black'})
                    _(this).parent().siblings().children('[name=ask]').prop('readonly', false).css({'border':'none', 'padding':'0px', 'color':'black'})
                }
                nextRow.toggle(100);
            })

        })

        // summernote의 내용을 제출하기위해서 값을 옮김
//         function moveSummerValtoHidden(targetForm){
//             var hidden =  targetForm.find('input[type=hidden]');
//             console.log(hidden)
//             var sHTML = $(hidden).next().summernote('code');
//             hidden.val(sHTML)
//            	alert(hidden.val());
//         };

        $(function(){
            $(document).on('click', '#insertBtn',function(){
                $('#insertBtn').hide();

                $('#chatdataTableTbody').append('<tr class="askRow"><th scope="row" style="text-align:center;">+</th><td><input type="text" id="insertKeyword" class="chatbot_keyword" name="keyword" placeholder="키워드를 입력하세요"></td><td colspan="2"><input type="text" id="insertTitle" class="chatbot_keyword" name="ask" placeholder="타이틀을 입력하세요"></td><td></td><td><button type="button" class="btn btn-dark insertDeleteBtns cancelBtn">Cancel</button></td></tr><tr class="answerRow"><td></td><td colspan="5"><div class="answer_title"><span>답변 내용</span><button type="button" id="insertSubmitBtn" class="btn btn-dark submitBtn">Submit</button></div><input type="hidden" id="appendSummernote"></td></tr>');
                
                // $('#summernote').css('width', '100%').css('height', '100px').css('border-radius', '3px').css('border', '1px solid lightgray').css('resize', 'none');
                $('#hideSummernoteDiv').insertAfter($('#appendSummernote'));
                $('#hideSummernoteDiv').show();

                alert();
                
                $('.cancelBtn').on('click', function(){
                    $('#hideSummernoteDiv').insertAfter($('.all-content-wrapper'));
                    $('#hideSummernoteDiv').hide();

                    var row1 = $(this).parent().parent();
                    var row2 = $(this).parent().parent().next();
                    row1.remove();
                    row2.remove();
                    $('#insertBtn').show();
                })
                
	            $('#insertSubmitBtn').click(function(){
	                var keyword = $('#insertKeyword').val();
	                var title = $('#insertTitle').val();
	                var answer = $('#summernote').summernote('code');
	                $('#insertSummernote').val(answer);
	                $('#insertKeyword2').val(keyword);
	                $('#insertTitle2').val(title);
	                $('#insertSubmitBtn2').click();
	                console.log(hidden.val());
	            })
            })
             $('#insertSubmitBtn').click(function(){
	                var keyword = $('#insertKeyword').val();
	                var title = $('#insertTitle').val();
	                var answer = $('#summernote').summernote('code');
	                $('#insertSummernote').val(answer);
	                $('#insertKeyword2').val(keyword);
	                $('#insertTitle2').val(title);
	                $('#insertSubmitBtn2').click();
	                console.log(hidden.val());
	            })
        })
  
        // 챗봇 데이터 인서트 모든값 채우게 하기
 		function insertChatBotData(targetForm){
        	var a = $('#insertSummernote').val()
            var k = $('#insertKeyword2').val()
            var t = $('#insertTitle2').val()
            if(a.trim().length < 1 ||k.trim().length < 1 ||t.trim().length < 1){
            	alert('모든 항목을 입력하셔야 합니다.');
            	return;
            }
        }
        
        
        // 챗봇 데이터 업데이트
        $('.updateBtn').click(function(item){
        	console.log(item.target)
            console.log($(item.target).parent().next()[0])
            console.log($(item.target).parent().next().find('input[name=keyword]')[0])
            console.log($(item.target).parent().next().find('input[name=title]')[0])
            console.log($(item.target).parent().next().find('input[name=answer]')[0])
            
            console.log($(item.target).parent().parent().find('input[name=answer]')[0])
            console.log($(item.target).parent().parent().parent().prev().find('input[name=keyword]')[0])
            console.log($(item.target).parent().parent().parent().prev().find('input[name=ask]')[0])
            // 폼태그로 값을 옮기자..
            // 해당 폼태그
            var targetForm = $(item.target).parent().next()[0];
        	// 값을 제출할 폼태그 안 인풋 태그들
			var titleInput = $(item.target).parent().next().find('input[name=keyword]')[0];
			var keyInput = $(item.target).parent().next().find('input[name=title]')[0];
			var ansInput = $(item.target).parent().next().find('input[name=answer]')[0];
			var aIdInput = $(item.target).parent().next().find('input[name=askId]')[0];
        	// 값을 가지고 있는 인풋태그들
        	var titleHaveInput = $(item.target).parent().parent().parent().prev().find('input[name=keyword]')[0];
			var keyHaveInput = $(item.target).parent().parent().parent().prev().find('input[name=ask]')[0];
			var ansHaveInput = $(item.target).parent().next().find('input[name=answerSummer]')[0];
        	
			// 서머노트용 인풋태그에 값을 옮겨준다.
// 			var hidden =  ansHaveInput;
            var hidden =  $('[name=answerSummer]');
            hidden.each(function (index, item) {
                var sHTML = $($(item).next()).summernote('code');
                $(item).val(sHTML)
                alert($(item).val());
            });
            
			// 값을 가지고 있는 인풋태그 값을 제출할 폼태그에 옮긴다.
			$(titleInput).val($(titleHaveInput).val());
			$(keyInput).val($(keyHaveInput).val());
			$(ansInput).val($(ansHaveInput).val());
			
			// 값이 입력됐는지 여부를 확인하고 하나라도 없으면 리턴한다.
			if($(titleInput).val().trim()==''||$(keyInput).val().trim()==''
				|| $(ansInput).val().trim()=='' || $(aIdInput).val().length<1){
				alert('모든 값을 입력해야합니다.');
				return;
			}
			
			var askObj = {
					"keyword":$(titleInput).val(),
					"title":$(keyInput).val(),
					"answer":$(ansInput).val(),
					"askId":$(aIdInput).val()
			}
			// 값이 있으면 해당 폼태그를 서브밋한다.
            $(targetForm).submit();
        });
      
        // 챗봇 데이터 딜리트
         $('.deleteDataBtn').click(function(item){
            console.log(item.target)
            console.log($(item.target).prev()[0])
        	
            var askId = $(item.target).prev()[0].value;
			
            location.href="deleteChatBotData.do?askId="+askId;
        });
    </script>
</body>
    <script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
</html>