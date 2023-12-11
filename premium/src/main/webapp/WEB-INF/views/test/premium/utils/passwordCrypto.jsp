<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 인코딩/디코딩</title>
</head>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$('#submit').click(function(){
		var userPwd = $('#userPwd').val();
		$.ajax({
			type:'POST',   //post 방식으로 전송
			url:'/premium/utils/passwordCrypto.do',   //데이터를 주고받을 파일 주소
			data:JSON.stringify ({ //변수에 담긴 데이터를 전송해준다 (JSON 방식)
			
				"userPwd" : userPwd
				
			}),
			dataType:'JSON', //데이터 타입 JSON
			contentType : "application/json; charset=UTF-8",
			success : function(data){   //파일 주고받기가 성공했을 경우. data 변수 안에 값을 담아온다.
				$('#originalPwd').val(data.originalPwd);
				$('#encodePwd').val(data.encodePwd);
				$('#decodePwd').val(data.decodePwd);
			}
		});
	});
});
</script>
<body>
		<input type="text" id="userPwd" name="userPwd"/> 비밀번호 인코딩/디코딩 → <input type="button" id="submit" value="버튼"/>
		<input type="text" id="originalPwd" name="originalPwd" style="width:200px;"/>
		<input type="text" id="encodePwd" name="encodePwd" style="width:200px;"/>
		<input type="text" id="decodePwd" name="decodePwd" style="width:200px;"/>
</body>
</html>