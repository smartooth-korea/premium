<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>충기 갯수 업데이트</title>
</head>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">

$(document).ready(function(){
	
	$('#submitNormal').click(function(){
		var userId = $('#userId').val();
		var measureDt = $('#measureDt').val(); 
		$.ajax({
			type:'POST',   //post 방식으로 전송
			url:'/premium/utils/updateCavityCntNormal.do',   //데이터를 주고받을 파일 주소
			data:JSON.stringify ({ //변수에 담긴 데이터를 전송해준다 (JSON 방식)
			
				"userId" : userId
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
	
	$('#submitKids').click(function(){
		var userId = $('#userId').val();
		var measureDt = $('#measureDt').val(); 
		$.ajax({
			type:'POST',   //post 방식으로 전송
			url:'/premium/utils/updateCavityCntKids.do',   //데이터를 주고받을 파일 주소
			data:JSON.stringify ({ //변수에 담긴 데이터를 전송해준다 (JSON 방식)
			
				"userId" : userId
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
		<input type="button" id="submitNormal" value="성인 충치 개수 업데이트"/>
		<input type="button" id="submitKids" value="학생 충치 개수 업데이트"/>
		
</body>
</html>


