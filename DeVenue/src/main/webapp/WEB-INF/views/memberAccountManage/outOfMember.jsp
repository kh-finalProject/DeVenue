<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

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

    <title>계정관리4 - 회원 탈퇴</title>

    <!-- Bootstrap core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom fonts for this template -->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet">
    <link href="vendor/simple-line-icons/css/simple-line-icons.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic" rel="stylesheet"
        type="text/css">

    <!--jQuery-->
    <script src="http://code.jquery.com/jquery-Latest.min.js"></script>

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
        }
        .allWrap table td{
            padding: 8px;
            font-size: 14px;
        }
        /* 버튼 공통 css */
        .btns{
            width: 49%;
            font-size: 14px;
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

        /* 컨텐츠 영역 타이틀 공통 */
        .content_title{
            font-size: 17px;
            font-weight: 550;
        }
        .content_title + p{
            font-size: 13px;
            text-indent: 5px;
            color: rgb(189, 189, 189);
            margin-bottom: 0px;
        }

        /* 보안로그인 + 비번 변경까지 전체 */
        .outOfMember_content{
            border-radius: 5px;
            border:1px solid gray;
            padding:15px;
            margin-bottom: 15px;
            background-color: #292e33;
        }
    </style>

</head>

<body>
	<!-- 메인 메뉴바 -->
   	<jsp:include page="../common/menubar.jsp"/>
    <!-- 메뉴바 끝----------------------------------------------------------- -->
	<!-- 마이페이지 사이드 메뉴바 -->
	<jsp:include page="../common/pSideMenubar.jsp"/>
    <!-- Section -->
    <div class="allWrap">
        <div class="password_change_title">
            <div>회원 탈퇴</div>
            <div>회원 탈퇴를 신청할 수 있습니다.</div>
        </div>
        <div class="outOfMember_content">
                <div class="login_for_passwordChange">
                    <label class="content_title">보안 로그인</label>
                    <p>개인정보 보호를 위하여 회원님의 비밀번호를 다시 한번 확인합니다.</p>
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
                                <input type="password" name="password" class="scurityloginPwdInput" id="scurityloginPwdInput" required>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <button type="submit" class="btn btn-info loginBtn btns" id="scurityloginBtn">로그인</button>
                            </td>
                        </tr>
                    </table>
                </div>
            <!-- 보안 로그인 후 인증이 완료되었다, 정말 탈퇴할거냐고 물음 -->
            <form action="decideOut.do" method="post" id="outOfMemForm" onsubmit="return askOneMore();" style="display:none;">
            	<input type="hidden" id="memIdHidden" name="memId" value="${loginUser.memId }">
                <div class="alert alert-info" role="alert" style="position: relative;">
                    <svg width="1.5em" height="1.5em" style="position: relative; top:-2px;  margin-right: 10px;" viewBox="0 0 16 16" class="bi bi-exclamation-circle-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                        <path fill-rule="evenodd" d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM8 4a.905.905 0 0 0-.9.995l.35 3.507a.552.552 0 0 0 1.1 0l.35-3.507A.905.905 0 0 0 8 4zm.002 6a1 1 0 1 0 0 2 1 1 0 0 0 0-2z"/>
                    </svg>
                    <span style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis; max-width: 300px;">인증이 정상적으로 처리되었습니다. 탈퇴하시겠습니까?</span>
                    <button type="submit" class="btn btn-secondary" id="outOfMemberBtn" style="position: absolute; right: 60px; top: 8px; font-size: 13px;">Y</button>
                    <button type="button" class="btn btn-info" id="goToBackBtn" style="position: absolute; right: 10px; top: 8px; font-size: 13px;">N</button>
                </div>
            </form>
        </div>
    </div>
	<!-- 풋터 가져오기  -->
    <jsp:include page="../common/footer.jsp"/>
    
	<script>
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
				
	//				var regexp = /^[a-zA-Z0-9]{8,32}$/;
	//				v = $('#scurityloginPwdInput').val();
	//				if( !regexp.test(v) ) {
	//					alert("8자에서 32자 사이의 문자를 입력해주세요.");
	//					return;
	//				}
				
				$.ajax({
					url:"securityLogin.do",
					type:"post",
					data:{password:password},
					success:function(data){
						alert(data);
						// 보안로그인 성공
						if(data=="true"){
							$('#outOfMemForm').css('display', 'block');
							$('.login_for_passwordChange').css('display', 'none');
							$('#scurityloginPwdInput').val('');
							$('#scurityloginPwdInput').focus();
						// 보안로그인 실패
						}else{
							alert('로그인에 실패하셨습니다.');
							$('#outOfMemForm').css('display', 'none');
							$('.login_for_passwordChange').css('display', 'block');
						}
					},
					error:function(error){
						alert('error : ' + error);
					}
				});
			});
			
			// 보안로그인 후 탈퇴 여부 아니오 버튼
			$('#goToBackBtn').click(function(){
				$('#outOfMemForm').css('display', 'none');
				$('.login_for_passwordChange').css('display', 'block');
				$('#scurityloginPwdInput').val('');
				$('#scurityloginPwdInput').focus();
			});
			
		})
		
		// 회원 탈퇴 버튼 누를 시 한번 더 물어보는 함수
		function askOneMore(){
			var isOut = confirm("탈퇴한 계정은 복구할 수 없습니다. 탈퇴하시지 않으시겠습니까?");
			
			if(isOut){
				return false;
			}
		}
	</script>
</body>

</html>