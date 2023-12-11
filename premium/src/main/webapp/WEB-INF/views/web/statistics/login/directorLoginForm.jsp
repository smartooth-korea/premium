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
<!-- <link rel="stylesheet" href="/css/login/login.css"> -->
<link rel="stylesheet" href="/css/common/layout.css">
<!-- <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"> -->
<title>Smartooth 진단지 모니터링 페이지 :: 로그인</title>
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
	
	.ui-autocomplete {
	    border: none;
	    position: relative;
	    background-color: #ffffff;
	    list-style: none;
	    font-size: 16px;
	    margin-bottom: 5px;
	    padding-top: 2px;
	    border: 1px solid #DDD !important;
	    padding-top: 0px !important;
	    z-index: 1511;
	    line-height: 45px;
	    border-radius: 20px;
	    text-align: center;
	    width: 275px
	}
	
	.ui-menu-item{
		margin-left: -30px;
		border-bottom: 1px dotted;
    	border-collapse: collapse;
	}
	
	.ui-helper-hidden-accessible{
		display: none;
	}

	h1{
		font-family: 'NanumSquareR';
		text-align: center;
		color: #333333;
		font-size: 40px;
		font-weight: bold;
		margin-bottom: 10px;
		margin-top: 10px;
	}
	
	h3{
		font-family: 'NanumSquareR';
	    text-align: center;
	    color: #333333;
	    font-size: 25px;
	    font-weight: 100;
	    margin-bottom: 10px;
	    margin-top: 10px;
	}
	
	.search_bar{
	    font-family: 'NanumSquareR';
	    background-color: #F2F2F2;
		border-radius: 20px;
	    text-align: center;
	    color: #333333;
	    border: 0px solid;
	    padding: 0.375rem 0.75rem;
	    border: 1px solid;
	    border-top-color: #ffffff;
	    border-left-color: #ffffff;
	    border-right-color: #ffffff;
	    border-bottom-color: #fff;
	    font-size: 1.1rem;
	    line-height: 1.5;
	    height: 40px;
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
	
	.search_bar::placeholder{
		color: #333333;
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
	
	#logo_img{
	    width: 100vw;
	    max-width: 800px;
	}	
	
	
	
@media (min-width:400px) { /* 400px 이상 */
	.search_bar{
	    width: 375px;
	}
	
	.input-form{
	    width: 375px;
	}
	
	#login_btn{
	    width: 400px;
	}
}

@media (min-width:0px) and (max-width:399px) { /* 399px 이하 */
	.search_bar{
	    width: 90%;
	}
	
	.input-form{
	    width: 90%;
	}
	
	#login_btn{
	    width: 98%;
	}
	h1{
		font-size: 35px;
	}
	h3{
		font-size: 20px;
	}
}
	
</style>
</head>

<body>
	<div class="container">
		<form method="post" id="loginFrm" action="/web/statistics/director/login.do">
			<div id="login_logo_background">
				<img id="logo_img" src="/imgs/login/bg_login.jpg" alt="㈜스마투스코리아 로고">
			</div>
			<div class="commonHeight60"></div>
				<h1>유치원 기관장용</h1>
				<h3>치아 모니터링 시스템</h3>
			<div class="commonHeight40"></div>
				<div class="form-group">
					<i class="fas fa-search"></i>
					<input type="text" class="search_bar" placeholder="유치원명" id="schoolName" name="schoolName" >
				</div>			
				<!-- <div class="form-group">
					<input type="text" class="input-form" placeholder="아이디" id="userId" name="userId" >
				</div> -->
			<div class="commonHeight10"></div>
				<div class="form-group">
					<input type="password" class="input-form" placeholder="비밀번호" id="userPwd" name="userPwd" style="border-radius: 20px; border: 1px solid #333333;">
				</div>
			<div class="commonHeight40"></div>
				<div class="form-group">
					<input type="button" id="login_btn" style="font-weight: bold;" value="LOGIN" onclick="opSubmit();" class="btn btn-primary form-control" value="로그인">
				</div>
			<input type="hidden" id="schoolCode" name="schoolCode" value="">
			<input type="hidden" id="urlType" name="urlType" value="${urlType}"/>
			<input type="hidden" id="lang" name="lang" value="${lang}"/>
		</form>
	</div>
<!-- <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script> -->
<script type="text/javascript">

	var selectedSchoolCode = "";

	$(document).ready(function() {
		
		var updatePwd = "${updatePwd}";
		// 세션이 끊겼을 때 메시지
		if (updatePwd == "Y") {
			alert("비밀번호가 변경되었습니다.");
		}
		$("#userId").focus();
		
	});

	// form 전송
	function opSubmit() {
		
// 		if ($("#userId").val() == "") {
// 			alert("아이디를 입력해주세요.");
// 			$("#userId").focus();
// 			return false;
// 		}
		if ($("#userPwd").val() == "") {
			alert("비밀번호를 입력해주세요");
			$("#userPwd").focus();
			return false;
		}
		if ($("#schoolName").val() == "") {
			alert("유치원을 선택해주세요");
			$("#schoolName").focus();
			return false;
		}
		
		$("#loginFrm").submit();
		
	}

	$("#userPwd").keydown(function(key) {
		if (key.keyCode == 13) {
			opSubmit();
		}
	});
	
	
	$('#schoolName').autocomplete({
		source : function(request, response) { //source: 입력시 보일 목록
		     $.ajax({
				//url : "/organ/ajaxSelectOrganList.do"   
		        url : "/organ/ajaxSelectSchoolList.do"   
		        ,type : "POST"
		        ,dataType: "JSON"
		        ,data : {value: request.term}	// 검색 키워드
		        ,success : function(data){ 	// 성공
					response(
						$.map(data.organList, function(item) {
		                	var seq = item.SEQ;
		                	var schoolCode = item.SCHOOL_CODE;
		                	var schoolName = item.SCHOOL_NAME;
		                	var organAddress = item.ORGAN_ADDRESS;
		                    return { 
								label : schoolName + '\n\n('+organAddress+')'     	// 목록에 표시되는 값
								,value : schoolName		// 선택 시 input창에 표시되는 값
								,idx : seq // index
								,schoolCode : schoolCode // 넘겨줄 값을 여기에 넣으면 됨
							};
						})
					);    //response
		         }
		         ,error : function(){ //실패
		             alert("관리자에게 문의해주세요.");
		         }
		     });
		}
		,minLength : 1
		,focus: function (event, ui) {
	        return false;
	    },
	    select: function (event, ui) {
	    	$('#schoolCode').attr("value", ui.item.schoolCode);
	    },
	    delay: 300
	});
	
		
	
</script>
</body>
</html>