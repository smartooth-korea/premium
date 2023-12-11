<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원의 치아 측정 값 입력</title>
</head>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$('#submit').click(function(){ 
		$.ajax({
			type:'POST',   //post 방식으로 전송
			url:'/app/user/insertUserMeasureValue.do',   //데이터를 주고받을 파일 주소
			data:JSON.stringify ({
				
				"userId" : "st03@gmail.com"
				/* ,"userNo" : "KG-0001" */
					,"t01" : "12"
					,"t02" : "9"
					,"t03" : "4"
					,"t04" : "3"
					,"t05" : "18"
					,"t06" : "8"
					,"t07" : "17"
					,"t08" : "11"
					,"t09" : "5"
					,"t10" : "15"
					,"t11" : "12"
					,"t12" : "6"
					,"t13" : "16"
					,"t14" : "18"
					,"t15" : "17"
					,"t16" : "7"
					,"t17" : "8"
					,"t18" : "4"
					,"t19" : "3"
					,"t20" : "3"
					,"t21" : "10"
					,"t22" : "14"
					,"t23" : "33"
					,"t24" : "30"
					,"t25" : "18"
					,"t26" : "11"
					,"t27" : "10"
					,"t28" : "22"
					,"t29" : "10"
					,"t30" : "8"
					,"t31" : "6"
					,"t32" : "2"
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
		회원의 치아 측정 값 입력 >>> <input type="button" id="submit" value="버튼"/>
</body>
</html>