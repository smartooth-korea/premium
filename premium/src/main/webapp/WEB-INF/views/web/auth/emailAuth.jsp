<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="shortcut icon" type="image/x-icon" href="/imgs/common/logo_img_ori.png">
<link rel="stylesheet" href="/css/login/login.css">
<link rel="stylesheet" href="/css/common/layout.css">
<!-- <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"> -->
<title>Smartooth 진단지 모니터링 페이지 :: 이메일 인증</title>
<style type="text/css">

	.email-group{
		display: flex;
		justify-content: center;
	}
	
	.email-input{
	    display: flex;
   	    width: 48%;
	}
	
	.emailAuth_btn{
	    font-weight: bold;
	    display: flex;
	    margin-left: 10px;
	    width: 30%;
    	font-size: 13px;
    	justify-content: center;
	}
	
</style>
</head>
<body>
	<div class="container">
		<form method="post" id="emailAuthForm" action="/web/user/passwordChage.do">
			<div id="login_logo_background">
				<img id="logo_img" src="/imgs/login/login_logo_background.png" alt="㈜스마투스코리아 로고" style="width: 35vh;">
			</div>
			<div class="commonHeight10"></div>
				<h3 style="text-align: center; color: white; font-weight: bold;">비밀번호 변경</h3>
				<div class="commonHeight10"></div>
				<div class="form-group">
					<input type="text" class="form-control" placeholder="이메일" id="email" name="email" maxlength="100">
				</div>
			<div class="commonHeight10"></div>
				<div class="form-group email-group">
					<input type="text" class="form-control email-input" placeholder="인증번호" id="authKey" name="authKey" maxlength="6" readonly="readonly">
					<input type="button" id="emailAuth_btn" class="btn btn-primary form-control emailAuth_btn" style="font-weight: bold; display:block" value="인증번호전송">
					<input type="button" id="emailAuth_confirm_btn" class="btn btn-primary form-control emailAuth_btn" style="font-weight: bold; display:none" value="인증번호요청">
				</div>
			<div class="commonHeight10"></div>
				<div class="form-group password-group">
					<input type="password" class="form-control password-input" placeholder="비밀번호" id="userPwd1" name="userPwd" style="display:none; font-family: auto;">
					<div class="commonHeight10"></div>
					<input type="password" class="form-control password-input" placeholder="비밀번호 확인" id="userPwd2" name="userPwd" style="display:none; font-family: auto;">
				</div>
			<div class="commonHeight10"></div>
				<div class="form-group">
					<input type="button" id="chagePwd_btn" style="font-weight: bold;" value="비밀변호 변경" class="btn btn-primary form-control" onclick="opSubmit();">
				</div>
			<input type="hidden" id="userId" name="userId" value="">
		</form>
	</div>
<!-- <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script> -->
<script type="text/javascript">

	var selectedSchoolCode = "";
	var userId = '${sessionScope.userId}';
	var schoolCode = '${sessionScope.schoolCode}';
	
	var interval = null;

	$(document).ready(function() {
		var message = "${message}";
		// 세션이 끊겼을 때 메시지
		if (message != null && !message == "") {
			alert(message);
		}
		$("#email").focus();
	});


	// 메일로 인증번호 보내는 aJax
	$('#emailAuth_btn').click(function(){
		
		if ($("#email").val() == "") {
			alert("이메일을 입력해주세요");
			$("#mail").focus();
			return false;
		}
		
		var email = $("#email").val();
		
		// 이메일 정규식 (이메일 검증)
		var regExp = new RegExp('[a-z0-9]+@[a-z]+\.[a-z]{2,3}');
		if(!regExp.test(email)){
			alert("이메일 형식이 잘못 되었습니다.");
			$("#mail").focus();
			return false;
		}
		
		$.ajax({
			type:'POST',   //post 방식으로 전송
			url:'/web/auth/emailAuth.do',   //데이터를 주고받을 파일 주소
			data:JSON.stringify ({ //변수에 담긴 데이터를 전송해준다 (JSON 방식)
				"email" : email
			}),
			dataType:'JSON', //데이터 타입 JSON
			contentType : "application/json; charset=UTF-8",
			success : function(data){   //파일 주고받기가 성공했을 경우. data 변수 안에 값을 담아온다.
				alert("요청하신 이메일 계정으로 인증 메일을 발송하였습니다. \n이메일을 확인해주세요.");
				$("#emailAuth_confirm_btn").show();	
				$("#emailAuth_btn").hide();	
				// 인증번호 입력칸 readonly해제
				$('#authKey').attr('readonly', false);
				// diagnosis 일괄 계산 (진단지 통계 계산)
				/* $.ajax({
					type:'POST',   
					url:'/web/statistics/diagnosisBatch.do',   
					success : function(data){
						console.log("Diagnosis batch success");
					}, error:function(request,status,error){
						console.log("Diagnosis batch failed");
					}
				}); */
				
			}, error:function(request,status,error){
				alert(error);
 			}
		});
		
		
		var time = 180; // 기준 시간 작성
		var min = ""; // 분
		var sec = ""; // 초
		
		interval = setInterval(function(){
				//parseInt() : 정수를 반환
				min = parseInt(time/60); // 몫을 계산
				sec = time%60; // 나머지 계산
				$('#emailAuth_confirm_btn').val("확인(" + min+":"+sec+")");
				time--;
				if(time < 0){
					// 인증번호 보내는 버튼 활성화
					clearInterval(x);
					$("#emailAuth_btn").show();	
					//$('#emailAuth_confirm_btn').val("인증번호요청");
					$("#emailAuth_confirm_btn").hide();
				}
		}, 1000)
	});
		
	
	
	// 인증 클릭 시 인증 번호 확인
	$('#emailAuth_confirm_btn').click(function(){
		
		if ($("#email").val() == "") {
			alert("이메일을 입력하세요.");
			$("#email").focus();
			return false;
		}
		
		// 인증번호
		var authKey = $("#authKey").val();
		
		$.ajax({
			type:'POST',   //post 방식으로 전송
			url:'/web/auth/isAuthKeyMatch.do',   //데이터를 주고받을 파일 주소
			data:JSON.stringify ({ //변수에 담긴 데이터를 전송해준다 (JSON 방식)
				"userId" : userId
				,"authKey" : authKey
			}),
			dataType:'JSON', //데이터 타입 JSON
			contentType : "application/json; charset=UTF-8",
			success : function(data){   //파일 주고받기가 성공했을 경우. data 변수 안에 값을 담아온다.
				
				if(data.code == '000'){
					alert("인증이 확인 되었습니다. 비밀번호를 변경해주세요.");
					clearInterval(interval);
					$('#emailAuth_confirm_btn').val("인증 완료");
					$('#emailAuth_confirm_btn').attr("disabled", true);
					$("#emailAuth_confirm_btn").css("background","#333333");
					$('#authKey').attr("disabled", true);
					$("#authKey").css("background","#333333");
					$("#userPwd1").show();	
					$("#userPwd2").show();	
				}else{
					alert("인증번호가 잘못되었습니다. 인증 메일 재발송 후 인증해주시기 바랍니다.");
					$("#emailAuth_confirm_btn").hide();	
					$("#emailAuth_btn").show();	
					$("#authKey").val("");
				}
			
// 				// graph 일괄 계산
// 				$.ajax({
// 					type:'POST',   
// 					url:'/web/statistics/graphBatch.do',   
// 					success : function(data){
// 						console.log("Diagnosis batch 작업 완료");
// 					}, error:function(request,status,error){
// 						console.log("Diagnosis batch 작업 실패");
// 					}
// 				});
				
			}
		});
	});
		
	// 인증 후 비밀번호 변경
	function opSubmit(){
	
		var isAuth = "T"; 
		
		if($("#authKey").val() == ""){
			alert("인증이 완료되지 않았습니다.");
			isAuth = "F";
		}
		
		if(isAuth == "T"){
			if ($("#userPwd1").val() == "") {
				alert("비밀번호를 입력해주세요.");
				$("#userPwd1").focus();
				return false;
			}
			if ($("#userPwd2").val() == "") {
				alert("비밀번호를 입력해주세요.");
				$("#userPwd2").focus();
				return false;
			}
		
			var userPwd1 = $("#userPwd1").val();
			var userPwd2 = $("#userPwd2").val();
			
			// 비밀번호 정규식
			var regExp = /^(?=.*[a-zA-Z])(?=.*[0-9]).{8,25}$/;
			if(!regExp.test(userPwd1)){
				alert("영문, 숫자 조합으로 8-20자리 입력해주세요.");
				return false;
			}
			if(!regExp.test(userPwd2)){
				alert("영문, 숫자 조합으로 8-20자리 입력해주세요.");
				return false;
			}
	
			if(userPwd1 != userPwd2){
				alert("비밀번호가 일치하지 않습니다.");
			}
			
			// 비밀번호 변경
			$("#userId").val(userId);
			$("#emailAuthForm").submit();
		}
		
	}

	$("#userPwd2").keydown(function(key) {
		if (key.keyCode == 13) {
			opSubmit();
		}
	});
		
	
</script>
</body>
</html>