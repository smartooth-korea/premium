<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>측정자 로그인</title>
</head>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">

$(document).ready(function(){
	$('#underFourteen').click(function(){ 
		$.ajax({
			type:'POST',   //post 방식으로 전송
			url:'/dentist/user/register.do',   //데이터를 주고받을 파일 주소
			data:JSON.stringify ({ //변수에 담긴 데이터를 전송해준다 (JSON 방식)
				"userId" : "1234567890"
				,"userPwd" : "0000"
				,"userName" : "방자(14세미만)"
				,"userBirthday" : "2020-11-11"
				,"userTelNo" : "010-6797-4921"
				,"userSex" : "M"
				,"schoolCode" : "KRDE3113058001"
				,"classCode" : "KRDE311305800101"
				,"paUserName" : "방자 부모"
				,"paUserTelNo" : "010-9898-5559"
			}),
			dataType:'JSON', //데이터 타입 JSON
			contentType : "application/json; charset=UTF-8",
			success : function(data){   //파일 주고받기가 성공했을 경우. data 변수 안에 값을 담아온다.
				$('#message').html(data);  //현재 화면 위 id="message" 영역 안에 data안에 담긴 html 코드를 넣어준다. 
			}
		});
	});
	
	$('#overFourteen').click(function(){ 
		$.ajax({
			type:'POST',   //post 방식으로 전송
			url:'/dentist/user/register.do',   //데이터를 주고받을 파일 주소
			data:JSON.stringify ({ //변수에 담긴 데이터를 전송해준다 (JSON 방식)
				"userId" : "0987654321"
				,"userPwd" : "0000"
				,"userName" : "이몽룡(14세이상)"
				,"userBirthday" : "1988-01-11"
				,"userTelNo" : "010-9937-4921"
				,"userSex" : "M"
				,"schoolCode" : "KRDE3113058001"
				,"classCode" : "KRDE311305800101"
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
		14세<font color="red"><b>미만</b></font> 회원등록 >>> <input type="button" id="underFourteen" value="버튼"/><br/>
		14세이상 회원등록 >>> <input type="button" id="overFourteen" value="버튼"/>
</body>
</html>