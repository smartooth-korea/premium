<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 개발 치아 측정 값 조회</title>
</head>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	
	$('#submit').click(function(){ 
		var userId = $('#userId').val();
		var toothNo = $('#toothNo').val();
		var toothValue = $('#toothValue').val();
		var measureDt = $('#measureDt').val(); 
		
		$.ajax({
			type:'POST',   //post 방식으로 전송
			url:'/user/selectUserToothMeasureValue.do',   //데이터를 주고받을 파일 주소
			data:JSON.stringify ({
				"userId" : userId
				,"toothNo" : toothNo
				,"toothValue" : toothValue
				,"startDt" : measureDt
				,"endDt" : measureDt
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
		회원 아이디 : <input type="text" id="userId" name="userId"/>
		<br/>
		측정일(ex : 2022-01-01) : <input type="text" id="measureDt" name="measureDt"/>
		<br/>
		측정 치아 : <input type="text" id="toothNo" name="toothNo" value="t04"/>
		측정 값 : <input type="text" id="toothValue" name="toothValue" value=""/>
		<input type="button" id="submit" value="입력"/>
</body>
</html>