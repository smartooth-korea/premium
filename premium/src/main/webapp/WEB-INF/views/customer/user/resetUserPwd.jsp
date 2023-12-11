<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" type="image/x-icon" href="/imgs/common/logo_img_ori.png">
<link rel="stylesheet" href="/css/common/layout.css">
<link rel="stylesheet" href="css/common/sub.css">

<title>Smartooth ::: 비밀번호 변경</title>
<style type="text/css">
@charset "UTF-8";
@font-face {
	font-family: 'NanumSquareR';
	src: url(/fonts/NanumSquareR.ttf) format('truetype');
}

	html{
		font-family: 'NanumSquareR';
		background-color: #fff;
	}
	
	body{
		margin : 0px;
	}
	
	.input-form{
	    padding: 0.375rem 0.75rem;
	    border: 1px solid;
	    border-bottom-color: #333333;
	    border-top-color: #ffffff;
	    border-right-color: #ffffff;
	    border-left-color: #ffffff;
	    text-align: center;
	    font-size: 1.1rem;
	    color: #000000;
	    line-height: 1.5;
	    height: 40px;
	}
	
	.form-group{
		text-align: center;
	}
	
	.input-form::placeholder{
		text-align: left;
		color: #A2A2A2;
	}
	
	input#userId{
		font-family: 'NanumSquareR';
	}
	
	#login_btn{
		background-color: #63A8FF;
	    border: 1px solid #63A8FF;
		border-radius: 30px;
		color: #fff;
		font-size: 1rem;
	    height: 60px;
	}
	
	#login_btn:hover{
		cursor: pointer;
	}
	
	#login_logo_background{
		text-align: center;
	}


@media (max-width:480px) {

 	h1{ 
 		font-family: 'NanumSquareR'; 
 		text-align: center; 
 		color: #333333; 
 		font-size: 60px; 
 		font-weight: bold; 
 		margin-bottom: 10px; 
 		margin-top: 10px; 
 	}
 	 
 	.input-form{ 
 	    width: 90%; 
 	} 
	
 	#logo_img{ 
 	    width: 100vw; 
 	} 
	
 	#login_btn{ 
 	    width: 98%; 
         font-size: 20px; 
 	} 
	
 } 
	
@media (min-width:481px) {
	
	h1{
		font-family: 'NanumSquareR';
		text-align: center;
		color: #333333;
		font-size: 55px;
		font-weight: bold;
		margin-bottom: 10px;
		margin-top: 10px;
	}

	.input-form{
        width: 300px;
	}
	
	#logo_img{
	    width: 100vw;
        max-width: 1200px;
	}
		
	#login_btn{
	    width: 400px;
	    font-size: 20px;
	}
}

</style>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script type="text/javascript">

	// input 태그 값 추출
	var strPwd1 = $('#userPwd1').val();
	var strPwd2 = $('#userPwd2').val();
	
	function pwdChk(){
		var userId = $('#userId').val();
		var regExpPw = /^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+]).{8,16}$/;
		var strPwd1 = $('#userPwd1').val();
		var strPwd2 = $('#userPwd2').val();
		if(strPwd1 != strPwd2){
			alert("The passwords entered do not match.");
			return false;
		}else{
			if(!regExpPw.test(strPwd1)){
				//alert("8-16 characters including English/special characters/numbers");
				alert("8-16자 사이의 영어/특수문자/숫자를 포함한 문자를 사용하여 암호를 설정하시기 바랍니다.");
				return false;
			}else{
				$.ajax({
					type:'POST',   //post 방식으로 전송
					url:'/app/user/updateUserPwd.do',   //데이터를 주고받을 파일 주소
					data:JSON.stringify ({
						"userId" : userId
						,"userPwd" : strPwd1
					}),   //위의 변수에 담긴 데이터를 전송해준다.
					dataType:'JSON',   //json 파일 형식으로 값을 담아온다.
					contentType : "application/json; charset=UTF-8",
					success : function(data){   //파일 주고받기가 성공했을 경우. data 변수 안에 값을 담아온다.
						//alert("Your password has been changed."); 
						alert("비밀번호가 변경되었습니다."); 
						// 앱으로 연결하는 SCRIPT 입력
						var visitedAt = (new Date()).getTime(); // 방문 시간
						var userAgent = navigator.userAgent;
						
// 			 			if (userAgent.match(/iPhone/)) {
// 			 				setTimeout(function() {
// 									if ((new Date()).getTime() - visitedAt < 2000) {
// 										location.replace('https://apps.apple.com/app/id1548711244'); // 마켓주소
// 										// location.replace('itms-apps://itunes.apple.com/app/1548711244'); // 커스텀스킴주소
// 									}
// 							}, 700);
// 			 			}else{
			 				window.close();
// 			 			}
			 		
					},
					error:function(request,status,error){
						alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"
								+"\n"
								+"\n"
								+"An 서버 에러가 발생했습니다. 관리자에게 문의해주시기 바랍니다\n"
								+"\n"
								+"\n"+"smartooth.system@gmail.com"
								+"\n"
								+"\n"
								+"\n");
					}
				});
			}
		}
	}
</script>
</head>
<body>
	<div class="container">
		<div id="login_logo_background">
			<img id="logo_img" src="/imgs/login/bg_login.jpg" alt="㈜스마투스코리아 로고">
		</div>
		<div class="commonHeight60"></div>
			<h1>스마투스 비밀번호 변경</h1>
		<div class="commonHeight60"></div>
			<div class="form-group">
				<input type="password" class="input-form" placeholder="비밀번호" id="userPwd1" name="userPwd1">
			</div>
		<div class="commonHeight20"></div>
			<div class="form-group">
				<input type="password" class="input-form" placeholder="비밀번호" id="userPwd2" name="userPwd2" >
			</div>
		<div class="commonHeight40"></div>
			<div class="form-group">
				<input type="button" id="login_btn" style="font-weight: bold;" value="비밀번호 변경" onclick="pwdChk();" class="btn btn-primary form-control" value="로그인">
			</div>
		<input type="hidden" id="userId" name="userId" value="${userId}">
	</div>
	
</body>
</html>