<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" type="image/x-icon" href="/imgs/common/logo_img_ori.png">
<link rel="stylesheet" href="/css/login/login.css">
<link rel="stylesheet" href="/css/common/layout.css">
<title>Smartooth 프리미엄 관리자 페이지 :: 로그인</title>
<style type="text/css">
#userPwd{
	font-family: "gothic";
}
</style>
</head>
<body>
  <div class="container">
  	<div class="commonHeight50"></div>
  	<div class="commonHeight20"></div>
  	<div>
  		<div class="jumbotron">
  			<form method="post" id="frm" action="/admin/login.do">
  				<div id="login_logo_background">
  					<img id="logo_img" src="/imgs/login/login_logo_background.png" alt="㈜스마투스코리아 로고" style="width: 35vh;">
  				</div>
  					<div class="commonHeight20"></div>
  				<h3 style="text-align: center; color: white; font-weight: bold;">프리미엄 관리자 페이지</h3>
  					<div class="commonHeight20"></div>
  				<div class="form-group">
  					<input type="text" class="form-control" placeholder="아이디" id="userId" name="userId">
  				</div>
  					<div class="commonHeight10"></div>
  				<div class="form-group">
  					<input type="password" class="form-control" placeholder="비밀번호" id="userPwd"  name="userPwd">
  				</div>
  					<div class="commonHeight15"></div>
<!--   				<div style="text-align: center; vertical-align: middle;"> -->
<!-- 	  				<input type="checkbox" id="loginCheck"> -->
<!-- 	  					<label style="color: #ffffff;" for="loginCheck">아이디 저장하기</label> -->
<!-- 				</div> -->
				<div class="commonHeight5"></div>
				<div class="form-group">
<!-- 					<select name="userType" id="userType" style="height: 35px;"> -->
<!-- 						<option value="TC" selected="selected">선생님</option> -->
<!-- 						<option value="PR">부모님</option> -->
<!-- 						<option value="ST">학 생</option> -->
<!-- 						<option value="MA">관리자</option> -->
<!-- 						<option value="CO">코 디</option> -->
<!-- 					</select> -->
					<input type="button" id="login_btn" style="font-weight: bold;" value="LOGIN" onclick="opSubmit();" class="btn btn-primary form-control" value="로그인">
				</div>
<!--   				<div class="form-group"> -->
<!--   					<input type="button" id="login_btn" value="LOGIN" onclick="opSubmit();" class="btn btn-primary form-control" value="로그인"> -->
<!--   			<input type="button" id="login_btn" value="LOGIN" onclick="handleCookie(); opSubmit();" class="btn btn-primary form-control" value="로그인"> -->
<!--   				</div> -->
  			</form>
  		</div>
  	</div>
  	<div></div>
  </div>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script type="text/javascript">

	$(document).ready(function() {
		
		var message = "${message}";
		// 세션이 끊겼을 때 메시지
		if(message!=null && !message==""){
			alert(message);
		}
		
		var smartoothId = GetCookie("smartoothId");
		if (smartoothId != "" && smartoothId != "undefined"
				&& smartoothId != null) {
			$("#loginChk").prop("checked", true);
			$("#userId").val(smartoothId);
		} else {
			$("#loginChk").prop("checked", false);
		}
		;
		$("#userId").focus();
	});
	
	function opSubmit() { // 해당 암호화를 사용해야할지 여부 확인
		if ($("#userId").val() == "") {
			alert("아이디를 입력해주세요.");
			$("#userId").focus();
			return false;
		}
		if ($("#userPwd").val() == "") {
			alert("비밀번호를 입력해주세요");
			$("#userPwd").focus();
			return false;
		}
	
// 		if ($("#userId").val() != "") {
// 			var encId = opEncrypt($("#userId").val());
// 			$("#encUserId").val(encId);
// 		}
// 		if ($("#userPwd").val() != "") {
// 			var encPwd = opEncrypt($("#userPwd").val());
// 			$("#encUserPwd").val(encPwd);
// 		}
	
// 		$("#userId").prop("disabled", true);
// 		$("#userPwd").prop("disabled", true);
		$("#frm").submit();
	}
	
// 	function handleCookie() {
// 		if ($("#loginChk").is(":checked")) {
			
// 			var userId = $("#userId").val();
// 			SetCookie("smartoothId", userId, 365);
// 		} else {
// 			SetCookie("smartoothId", "", -1);
// 		}
// 	}
	
	function getCookieVal(offset) {
		var endstr = document.cookie.indexOf(";", offset);
		if (endstr == -1)
			endstr = document.cookie.length;
		return unescape(document.cookie.substring(offset, endstr));
	};
	
	function GetCookie(name) {
		var arg = name + "=";
		var alen = arg.length;
		var clen = document.cookie.length;
		var i = 0;
		while (i < clen) {
			var j = i + alen;
			if (document.cookie.substring(i, j) == arg)
				return getCookieVal(j);
			i = document.cookie.indexOf(" ", i) + 1;
			if (i == 0)
				break;
		}
		return null;
	};
	
	function SetCookie(name, value, expires) {
		var argv = SetCookie.arguments;
		var argc = SetCookie.arguments.length;
		var expires = new Date(Date.now() + (expires * 24 * 60 * 60 * 1000));
		var path = "/";
		var domain = $(location).attr("host");
		document.cookie = name
				+ "="
				+ escape(value)
				+ ((expires == null) ? "" : ("; expires=" + expires
						.toGMTString()))
				+ ((path == null) ? "" : ("; path=" + path))
				+ ((domain == null) ? "" : ("; domain=" + domain));
	};
	
	$(".form-control").keydown(function(key) {
		if (key.keyCode == 13) {
			opSubmit();
		}
	});

</script>
</body>
</html>