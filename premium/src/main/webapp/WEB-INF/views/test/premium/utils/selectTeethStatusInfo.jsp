<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>치아 상태 정보 조회</title>
</head>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$('#submit').click(function(){
		var teethStatus = $('#teethStatus').val();
		$.ajax({
			type:'POST',   //post 방식으로 전송
			url:'/premium/utils/selectTeethStatusInfo.do',   //데이터를 주고받을 파일 주소
			data:JSON.stringify ({ //변수에 담긴 데이터를 전송해준다 (JSON 방식)
			
				"teethStatus" : teethStatus
				
			}),
			dataType:'JSON', //데이터 타입 JSON
			contentType : "application/json; charset=UTF-8",
			success : function(data){   //파일 주고받기가 성공했을 경우. data 변수 안에 값을 담아온다.
				$('#treatedToothNoStr').val(data.treatedToothNoStr);
				$('#loosingToothNoStr').val(data.loosingToothNoStr);
			}
		});
	});
});
</script>
<body>
		<input type="text" id="teethStatus" name="teethStatus" style="width:825px; height: 25px;"/> <input type="button" id="submit" value="계산"/>
		<br/>
		<br/>
		치료받은치아 : <input type="text" id="treatedToothNoStr" name="treatedToothNoStr" style="width:300px; height: 25px;"/>
		<br/>
		<br/>
		빠진치아 : <input type="text" id="loosingToothNoStr" name="loosingToothNoStr" style="width:300px; height: 25px;"/>
</body>
</html>