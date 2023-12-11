<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메모 업데이트</title>
</head>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	function memoUpdate(str){
		var userId = $('#userId').val();
		var measureDt = $('#measureDt').val(); 
		$.ajax({
			type:'POST',   //post 방식으로 전송
			url:'/premium/user/updateDiagCd.do',   //데이터를 주고받을 파일 주소
			data:JSON.stringify ({ //변수에 담긴 데이터를 전송해준다 (JSON 방식)
			
				"userId" : userId
				,"measureDt" : measureDt
				,"diagCd" : str
				
			}),
			dataType:'JSON', //데이터 타입 JSON
			contentType : "application/json; charset=UTF-8",
			success : function(data){   //파일 주고받기가 성공했을 경우. data 변수 안에 값을 담아온다.
				$('#message').html(data);  //현재 화면 위 id="message" 영역 안에 data안에 담긴 html 코드를 넣어준다. 
			}
		});
	}
</script>
<body>
		회원 아이디 : <input type="text" id="userId" name="userId"/>
		<br/>
		측정일(ex : 2022-01-01) : <input type="text" id="measureDt" name="measureDt"/>
		<br/>
		<input type="button" id="memo" value="A01치태" onclick="memoUpdate('A:01:1')"/>    <br/>
		<input type="button" id="memo" value="A02치석" onclick="memoUpdate('A:02:1')"/>    <br/>
		<input type="button" id="memo" value="A03주의" onclick="memoUpdate('A:03:1')"/>    <br/>
		<input type="button" id="memo" value="A04충치" onclick="memoUpdate('A:04:1')"/>    <br/>
		<input type="button" id="memo" value="A05다발성우식" onclick="memoUpdate('A:05:1')"/>    <br/>
		<input type="button" id="memo" value="A06영구치우식" onclick="memoUpdate('A:06:1')"/>    <br/>
		<input type="button" id="memo" value="A07치아사이긴밀" onclick="memoUpdate('A:07:1')"/>    <br/>
		<input type="button" id="memo" value="A08혼합치열기" onclick="memoUpdate('A:08:1')"/>    <br/>
		<input type="button" id="memo" value="A09치료받은치아" onclick="memoUpdate('A:09:1')"/>    <br/>
		<input type="button" id="memo" value="A10영구치맹출" onclick="memoUpdate('A:10:1')"/>    <br/>
		<input type="button" id="memo" value="A11반대교합" onclick="memoUpdate('A:11:1')"/>    <br/>
		<input type="button" id="memo" value="A12과개교합" onclick="memoUpdate('A:12:1')"/>    <br/>
		<input type="button" id="memo" value="A13개방교합" onclick="memoUpdate('A:13:1')"/>    <br/>
		<input type="button" id="memo" value="A14유치잔존" onclick="memoUpdate('A:14:1')"/>    <br/>
		<input type="button" id="memo" value="A15형태이상" onclick="memoUpdate('A:15:1')"/>    <br/>
		<input type="button" id="memo" value="A16개수이상" onclick="memoUpdate('A:16:1')"/>    <br/>
		<input type="button" id="memo" value="A17변색치" onclick="memoUpdate('A:17:1')"/>    <br/>
		<input type="button" id="memo" value="A18착색치" onclick="memoUpdate('A:18:1')"/>    <br/>
		<input type="button" id="memo" value="A19이갈이" onclick="memoUpdate('A:19:1')"/>    <br/>
		<input type="button" id="memo" value="A20파절" onclick="memoUpdate('A:20:1')"/>    <br/>
		<input type="button" id="memo" value="A21이상없음" onclick="memoUpdate('A:21:1')"/>    <br/>
		<input type="button" id="memo" value="A22두려움" onclick="memoUpdate('A:22:1')"/>    <br/>
		<input type="button" id="memo" value="A23결석" onclick="memoUpdate('A:23:1')"/>    <br/>
		
</body>
</html>


