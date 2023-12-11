<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학생 추가</title>
<link rel="shortcut icon" type="image/x-icon" href="/imgs/common/logo_img_ori.png">
<link rel="stylesheet" href="css/bootstrap.resetpassword.css">
<link rel="stylesheet" href="css/common/sub.css">
<style type="text/css">
body{
	font-family: AppleSDGothicNeoR;
	background-color: #333333;
}

</style>
</head>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
    $('#submit').click(function(){ 
    	var userId = $('#userId').val();
    	var userName = $('#userName').val();
    	var userBirthday = $('#userBirthday').val();
    	var userTelNo = $('#userTelNo').val();
    	var teacherId = $('#teacherId').val();
    	var userId = $('#userId').val();
    	
    	userId =  userId.toLowerCase();
    	
    	$.ajax({
			type:'POST',   //post 방식으로 전송
			url:'/test/studentRegist.do',   //데이터를 주고받을 파일 주소
			data:JSON.stringify ({ //변수에 담긴 데이터를 전송해준다 (JSON 방식)
				"userId" : userId
				,"userPwd" : "smartooth509#"
				,"userType" : "ST"
				,"userName" : userName
				,"userBirthday" : userBirthday
				,"userCountry" : "KR"
				,"userState" : ""
				,"userAddress" : "서울시 강서구 마곡동"
				,"userTelNo" : userTelNo
				,"teethStatus" : "100|100|100|100|100|100|100|100|100|100|100|100|100|100|100|100|100|100|100|100|100|100|100|100|100|100|100|100|100|100|100|100"
				,"teacherId" : teacherId
				,"schoolType" : "KG"
				
			}),
			dataType:'JSON', //데이터 타입 JSON
			contentType : "application/json; charset=UTF-8",
			success : function(data){   //파일 주고받기가 성공했을 경우. data 변수 안에 값을 담아온다.
				$('#message').html(data);  //현재 화면 위 id="message" 영역 안에 data안에 담긴 html 코드를 넣어준다. 
			}
		});
    });
});
</script>
<body>
	<div class="jumbotron vertical-center" style="min-height: 70vh; display: flex; align-items: center;">
		<div class="container">
			<div id="login_logo_background">
				<img id="logo_img" src="/imgs/login/login_logo_background.png" alt="㈜스마투스코리아 로고" style="width: 800px;" />
			</div>
			<div class="commonHeight80"></div>
			<h3 style="text-align: center; color: #ffffff; font-weight: bold;">마곡14 아이 마당 어린이집 학생 회원 추가</h3>
			<div class="commonHeight80"></div>
	        <div class="form-group">
		        <div style="font-size: 40px; color: #ffffff; font-weight: bold; display: inline-block;">학생 아이디 : &nbsp;</div><input type="text" id="userId" name="userId" class="form-control" value="st" style="line-height: 1; width:40%;"/><br/>
		        <span style="font-size: 30px; color: red; font-weight: bold; display: inline-block;">아이디는 st93번 부터 생성해주시기 바랍니다</span>
	        </div>
	        <div class="commonHeight20"></div>
	        <div class="form-group">
		        <div style="font-size: 40px; color: #ffffff; font-weight: bold; display: inline-block;" >학생 이름 : &nbsp;</div><input type="text" id="userName" name="userName" class="form-control" style="line-height: 1; width:40%;"/>
	        </div>
	        <div class="commonHeight20"></div>
	        <div class="form-group">
	        	<div style="font-size: 40px; color: #ffffff; font-weight: bold; display: inline-block;">학생 생일(예 2022-08-24) : &nbsp;</div> <input type="text" id="userBirthday" name="userBirthday" class="form-control" style="line-height: 1; width:40%;"/><br/>
	        </div>
	        <div class="commonHeight20"></div>
	        <div class="form-group">
	        	<div style="font-size: 40px; color: #ffffff; font-weight: bold; display: inline-block;">학생 전화 번호 : &nbsp;</div> <input type="text" id="userTelNo" name="userTelNo" class="form-control" value="010-"  style="line-height: 1; width:40%;"/><br/>
	        </div>
	        <div class="commonHeight20"></div>
	        <div class="form-group">
		       <div style="font-size: 40px; color: #ffffff; font-weight: bold; display: inline-block;">학생 반 : &nbsp;</div>
					<select id="teacherId" style="width: 300px; height: 70px; font-size: 30px; text-align: center;">
			        	<option value="" selected>반 선택</option>
			        	<option value="tc04">씨앗반</option>
			        	<option value="tc05">새싹반</option>
			        	<option value="tc06">풀잎반</option>
			        	<option value="tc07">꽃잎반</option>
			        	<option value="tc08">열매반</option>
			        </select>
	        <div class="commonHeight20"></div>
	        </div>
	        <div class="form-group">
			      	<input type="button" id="submit" class="form-control" value="등록" style="width: 250px;"/>
			</div>
        </div>
	</div>
</body>
</html>