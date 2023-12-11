<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="shortcut icon" type="image/x-icon" href="/imgs/common/logo_img_ori.png">
<link rel="stylesheet" href="/css/web/login/login.css">
<link rel="stylesheet" href="/css/common/layout.css">
<title>Smartooth 진단지 모니터링 페이지 :: 로그인</title>
<style type="text/css">

@media (min-width:0px) and (max-width:800px) { /* 399px 이하 */
	.modal.show {
		padding-top: 45%;
	}
}

@media (min-width:801px) {
 	.modal.show {
		padding-top: 350px;
	}
}

.container{
    display: flex;
    align-items: center;
    justify-content: center;
}

.modal {
	top: 0;
    left: 0;
    width: 100%;
    height: 72.9%;
    display: none;
    background-color: rgba(0, 0, 0, 0.7);
}

.modal.show {
	display: flex;
    justify-content: center;
    position: absolute;
}

.modal_body {
    top: 20%;
    left: 40%;
    width: 365px;
    height: 340px;
    padding-top: 30px;
    padding-bottom: 30px;
    text-align: center;
    background-color: rgb(255, 255, 255);
    border-radius: 10px;
    box-shadow: 0 5px 20px 0 rgb(34 36 38 / 90%);
}

h4{
	font-size: 30px;
}

.studentUserList{
	display: flex;
    justify-content: center;
    align-items: center;
    border-radius: 15px;
    font-size: 18px;
    height: 60px;
    margin-bottom: 10px
}

.studentUserList:hover{
	cursor: pointer;
	background-color: #B7D8FF;
	border-radius: 0px;
}

.selectUserInfo{
	font-size: 15px;
}

</style>
</head>
<body>

	<div class="container">
		<form method="post" id="loginFrm" action="/web/statistics/login.do">
			<div id="login_logo_background">
				<img id="logo_img" src="/imgs/login/bg_login.jpg" alt="㈜스마투스코리아 로고">
			</div>
			<div class="commonHeight60"></div>
				<h1>유치원 서비스</h1>
				<h3>치아 모니터링 시스템</h3>
			<div class="commonHeight40"></div>
				<div class="form-group">
					<input type="text" class="input-form" placeholder="아이디" id="userId" name="userId" >
				</div>
			<div class="commonHeight20"></div>
				<div class="form-group">
					<input type="password" class="input-form" placeholder="비밀번호" id="userPwd" name="userPwd" >
				</div>
			<div class="commonHeight40"></div>
				<div class="form-group">
					<input type="button" id="login_btn" style="font-weight: bold;" value="LOGIN" onclick="opSubmit();" class="btn btn-primary form-control" value="로그인">
				</div>
			<input type="hidden" id="urlType" name="urlType" value="${urlType}"/>
			<input type="hidden" id="lang" name="lang" value="${lang}"/>
		</form>
	</div>
<!-- 자녀(피측정자) 선택 모달 -->
<div id="selectModal" class="modal">
	<div class="modal_body">
	<h4>자녀(피측정자) 선택</h4>
		<form method="post" id="selectFrm" action="/web/statistics/diagnosis.do">
			<div id="studentUserInfoList" class="studentUserInfoList">
			</div>
			<input type="hidden" id="studentUserId" name="studentUserId" value="">
		</form>
	</div>
</div>
<!-- <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script> -->
<script type="text/javascript">
	
$(document).ready(function() {
	var updatePwd = "${updatePwd}";
	// 세션이 끊겼을 때 메시지
	if (updatePwd == "Y") {
		alert("비밀번호가 변경되었습니다.");
	}
	$("#userId").focus();
});
	
	// 아이디 및 비밀번호 유효성 검사 후 msg 출력
	var msg = "${msg}";
	if(msg!=null && msg!=""){
		alert(msg);
	}
	
	// 자녀(피측정자) 선택 모달
	var studentUserInfoList = "${studentUserInfoList}";
	const selectModal = document.querySelector('#selectModal');
	if(studentUserInfoList!=null && studentUserInfoList !=""){
		
		selectModal.classList.toggle('show');
		
		var htmlStr = "";
		var arr = new Array();
		
		<c:forEach items="${studentUserInfoList}" var="item">
			arr.push({
				userId:"${item.userId}"
				,userName:"${item.userName}"
				,schoolName:"${item.schoolName}"
				,schoolCode:"${item.schoolCode}"
				,className:"${item.className}"
			});
		</c:forEach>
		
		for(var i=0; i<arr.length; i++){
			// 자녀(피측정자) 계정 정보
			var studentUserId = arr[i].userId;
			var studentUserName = arr[i].userName;
			var schoolName = arr[i].schoolName;
			var className = arr[i].className;
			htmlStr += '<div class="studentUserList" onclick="onSubmit(\''+studentUserId+'\')">'+studentUserName+'&nbsp;<div class="selectUserInfo">('+schoolName+' '+className+')</div></div>';
		}
		// 생성된 div를 추가
		$("#studentUserInfoList").append(htmlStr);
	}
	
	
	// form 전송
	function opSubmit() {
		
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
		
		$("#loginFrm").submit();
		
	}

	
	// form 전송 : 자녀(피측정자) 클릭 시 자녀(피측정자)의 결과지 조회
	function onSubmit(userId){
		$("#studentUserId").val(userId);
		$("#selectFrm").submit();
	}
	
	
	$("#userPwd").keydown(function(key) {
		if (key.keyCode == 13) {
			opSubmit();
		}
	});
	
</script>
</body>
</html>