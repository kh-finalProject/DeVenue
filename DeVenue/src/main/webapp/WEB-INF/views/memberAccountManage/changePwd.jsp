<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="ko">

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
        integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">


    <!--responsive meta tag-->
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <title>계정관리3 - 비밀번호 변경</title>
    <!--jQuery-->
    <script src="http://code.jquery.com/jquery-Latest.min.js"></script>

    <!-- Bootstrap core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom fonts for this template -->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet">
    <link href="vendor/simple-line-icons/css/simple-line-icons.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic" rel="stylesheet"
        type="text/css">


    <style>
        body {
            font-family: 'Lato', 'Helvetica Neue', Helvetica, Arial, sans-serif;
            /* font-family: 'Jua', sans-serif; */
        }

        h1,
        h2,
        h3,
        h4,
        h5,
        h6 {
            font-family: 'Lato', 'Helvetica Neue', Helvetica, Arial, sans-serif;
            font-weight: 700;
        }

        /* 개별 css---------------------------------------------------------------- */
        /* 전체 컨텐츠 영역(Section) 랩 */
        .allWrap{
            background-color: #212426;
            color: white;
            padding: 30px;
            width: 70%;
            margin: auto;
            margin-left:17%;
        }
        /* 오버플로우 처리를 할까말까(귀찮.. 다시 여백조정해야해) */
        .allWrap *{
            /* overflow: hidden !important;
            max-width: 99%;
            white-space: nowrap !important;
            text-overflow: ellipsis !important; */
        }
        /* 테이블 공통 */
        .allWrap table{
            margin: auto;
            margin-top: 15px;
        }
        .allWrap table td{
            padding: 8px;
            font-size: 14px;
        }
        /* 버튼 공통 css */
        .btns{
            width: 49%;
            font-size: 13px;
            font-weight: 550;
            height: 35px;
            padding-top: 5px;
        }
        /* 로그인/비번변경 공통 css */
        .login_for_passwordChange{
            margin: 10px;
            margin-bottom: 30px;
        }
        /* 로그인 버튼 설정 */
        .loginBtn{
            width: 100%;
        }
        /* 취소 버튼 설정 */
        .returnBtn{
            position: relative;
            left: 0px;
        }
        /* 변경 완료 버튼 설정 */
        .pwdChangeBtn{
            position: relative;
            right: 0px;
        }

        /* 전체 타이틀 영역 */
        .password_change_title{
            border-radius: 5px;
            border:1px solid gray;
            padding:15px;
            margin-bottom: 15px;
            background-color: #292e33;
        }
        /* 전체 타이틀의 메인 타이틀 */
        .password_change_title div:first-of-type{
            text-indent: 10px;
            font-weight: 550;
            font-size: 18px;
        }
        /* 전체 타이틀의 서브 타이틀 */
        .password_change_title div:last-of-type{
            margin-top: 10px;
            font-size: 14px;
            text-indent: 10px;
            color: rgb(189, 189, 189);
        }

        /* 보안로그인 + 비번 변경까지 전체 */
        .password_change_content{
            border-radius: 5px;
            border:1px solid gray;
            padding:25px;
            margin-bottom: 15px;
            background-color: #292e33;
        }

        /* 컨텐츠 영역 타이틀 공통 */
        .content_title{
            font-size: 17px;
            font-weight: 550;
            margin-top: 10px;
        }

        /* 비번 변경 가이드의 타이틀 */
        .alert{
            font-size: 12px;
        }
        .alert label{
            font-size: 15px;
            font-weight: 550;
        }

        /* 비번 변경 영역의 테이블 */
        .pwdChange_table{
            padding-bottom: 0px;
        }
        .pwdChange_table td{
            padding: 0px !important;
        }
        .pwdChange_table label{
            font-size: 12px; color: #2793F2;
        }
        .pwdChange_table input{
            width: 250px;
        }
    </style>

</head>

<body>
	<!-- 메인 메뉴바 -->
   	<jsp:include page="../common/menubar.jsp"/>
	<!-- sideMenubar -->
	<jsp:include page="../common/sideMenubarAll.jsp"/>
    <!-- 메뉴바 끝----------------------------------------------------------- -->
	<!-- 마이페이지 사이드 메뉴바 -->
	<jsp:include page="../common/pSideMenubar.jsp"/>
    <!-- Section -->
    <div class="allWrap">
        <div class="password_change_title">
            <div>비밀번호 변경</div>
            <div>개인정보 보호를 위해 주기적으로 비밀번호를 변경해주세요.</div>
        </div>
        <div class="password_change_content">
            <div class="alert alert-info basic_area" role="alert">
                <svg width="1.2em" height="1.2em" style="position: relative; top:-2.5px" viewBox="0 0 16 16" class="bi bi-exclamation-circle-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                    <path fill-rule="evenodd" d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM8 4a.905.905 0 0 0-.9.995l.35 3.507a.552.552 0 0 0 1.1 0l.35-3.507A.905.905 0 0 0 8 4zm.002 6a1 1 0 1 0 0 2 1 1 0 0 0 0-2z"/>
                </svg>&nbsp;&nbsp;
                <label>[ 비밀번호 변경 가이드 ]</label>
                <br>
                다른 사이트에서 사용하지 않는 고유한 비밀번호를 사용하시고, 주기적으로 변경해주세요.
            </div>
            <form action="#" method="post" id="securityLoginForm">
                <div class="login_for_passwordChange">
                    <label class="content_title">보안 로그인</label>
                    <br>
                    <table border="0">
                        <tr>
                            <td>이메일</td>
                            <td>
                                ${loginUser.memEmail }
                            </td>
                        </tr>
                        <tr>
                            <td>비밀번호</td>
                            <td>
                                <input type="password" name="password" class="password" id="scurityloginPwdInput" required/>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <button type="button" class="btn btn-info loginBtn btns" id="scurityloginBtn">로그인</button>
                            </td>
                        </tr>
                    </table>
                </div>
            </form>
            <!-- 보안 로그인 후 비빌번호 변경 화면 -->
            <form action="updatePwd.do" method="post" id="changePwdForm" style="display: none;" onsubmit="return beforeUpdatePwdSubmit();">
                <div class="login_for_passwordChange">
                    <label class="content_title">비밀번호 변경</label>
                    <br>
                    <table class="pwdChange_table" border="0">
                        <tr>
                            <td align="right">새 비밀번호&nbsp;&nbsp;</td>
                            <td colspan="2">
                                <input type="password" name="password1" class="password" id="password1Input" required/>
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td>
                                <label>비밀번호는 8자 이상 32자 이하로 입력해 주세요.</label>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">새 비밀번호 확인&nbsp;&nbsp;</td>
                            <td>
                                <input type="password" name="password2" class="password" id="password2Input" required/>
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td >
                                <label>동일한 비밀번호를 입력해 주세요.</label>
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td>
                                <button type="button" class="btn btn-secondary returnBtn btns" id="returnBtn">취소</button>
                                <button type="submit" class="btn btn-info pwdChangeBtn btns">변경 완료</button>
                            </td>
                        </tr>
                    </table>
                </div>
            </form>
        </div>
    </div>
	<!-- 풋터 가져오기  -->
    <jsp:include page="../common/footer.jsp"/>
   
	<script>
		// !!정규표현식은 상의해서 8자~32자 이하의 아무 문자로 하자
		// 호준이가 세션 수정하면 보안로그인부분 나도 호준이랑 똑같이 암호화해서 만들자(지금은 그냥 세션에서 뽑고있음)
		
		$(function(){
			// 보안로그인하러 ajax 사용하여 서버갔다오자
			$('#scurityloginBtn').click(function(){
				var password = $('#scurityloginPwdInput').val();
				
				// 빈값만 못넣게
				if(password.trim().length < 1){
					alert('입력된 비밀번호가 없습니다.');
					$('#scurityloginPwdInput').val('');
					$('#scurityloginPwdInput').focus();
					return;
				}
				
// 				var regexp = /^[a-zA-Z0-9]{8,32}$/;
// 				v = $('#scurityloginPwdInput').val();
// 				if( !regexp.test(v) ) {
// 					alert("8자에서 32자 사이의 문자를 입력해주세요.");
// 					return;
// 				}
				
				$.ajax({
					url:"securityLogin.do",
					type:"post",
					data:{password:password},
					success:function(data){
						// 보안로그인 성공
						if(data=="true"){
							alert('확인되었습니다.');
							$('#changePwdForm').css('display', 'block');
							$('#securityLoginForm').css('display', 'none');
							$('#scurityloginPwdInput').val('');
							$('#scurityloginPwdInput').focus();
						// 보안로그인 실패
						}else{
							alert('로그인에 실패하셨습니다.');
							$('#changePwdForm').css('display', 'none');
							$('#securityLoginForm').css('display', 'block');
						}
					},
					error:function(error){
						alert('error : ' + error);
					}
				});
			});
		})
		
		// 비밀번호 변경 서브밋 제한 함수
		// 얘도 역시 정규표현식 일단 안함, 
		// 두 항목이 비었는지 일치하는지, 기존 비밀번호와 같지는 않은지 검사(전부 그냥 약식으로)
		function beforeUpdatePwdSubmit(){
			var pwd1 = $('#password1Input').val();
			var pwd2 = $('#password2Input').val();
			
			if(pwd1.trim().length<1||pwd2.trim().length<1){
				alert('모든 항목을 입력하셔야 합니다.')
				return false;
			}
			
			var regexp = /^[a-zA-Z0-9]{8,32}$/;
			v = pwd2
			if( !regexp.test(v) ) {
				alert("8자에서 32자 사이의 문자를 입력해주세요.");
				return false;
			}
			
			if(pwd1 != pwd2){
				alert('비밀번호가 일치하지 않습니다.');
				return false;
			}
			
			if(pwd2 == '${loginUser.memPwd}'){
				alert('기존의 비밀번호는 사용하실 수 없습니다.');
				return false;
			}
			
			alert('비밀번호를 변경합니다.')
			return true;
		}
		
		// 변경 취소 버튼
		$('#returnBtn').click(function(){
			var isReturn = confirm('변경을 취소하시겠습니까?');
			if(isReturn){
				alert('변경을 취소합니다.')
				$('#changePwdForm').css('display', 'none');
				$('#securityLoginForm').css('display', 'block');
				$('#scurityloginPwdInput').val('');
				$('#scurityloginPwdInput').focus();
			}
		})
	</script>
        
      
</body>

</html>