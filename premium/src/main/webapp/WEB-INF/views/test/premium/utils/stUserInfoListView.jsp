<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학생 추가</title>
<link rel="shortcut icon" type="image/x-icon" href="/imgs/common/logo_img_ori.png">
<style type="text/css">
body{
	font-family: AppleSDGothicNeoR;
	background-color: #333333;
	height: 1750px;
	overflow-x:hidden;
	overflow-x:hidden;
}
</style>
</head>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	
    $('.changeBtn').click(function(){
    	
    	var teacherId = '${userId}';
    	
		var userId = "";
		var userName = "";
    	
    	var userId0 = $('#userId0').val();
    	var userId1 = $('#userId1').val();
    	var userId2 = $('#userId2').val();
    	var userId3 = $('#userId3').val();
    	var userId4= $('#userId4').val();
    	
    	var userName0 = $('#userName0').val();
    	var userName1 = $('#userName1').val();
    	var userName2 = $('#userName2').val();
    	var userName3 = $('#userName3').val();
    	var userName4 = $('#userName4').val();
    	
    	
    	if(!userName0 == null || !userName0 == ""){
    		userId = userId0;
    		userName = userName0;
    	}else if(!userName1 == null || !userName1== ""){
    		userId = userId1;
    		userName = userName1;
    	}else if(!userName2 == null || !userName2 == ""){
    		userId = userId2;
    		userName = userName2;
    	}else if(!userName3 == null || !userName3 == ""){
    		userId = userId3;
    		userName = userName3;
    	}else if(!userName4 == null || !userName4 == ""){
    		userId = userId4;
    		userName = userName4;
    	}
    	
    	
    	if(userName == null || userName == ""){
    		alert("변경하고자 하는 계정의 이름을 입력해주세요.");
    		return;
    	}
    	
    	
    	if(!confirm("이름을 수정하시겠습니까?")){
    		return;
    		
    	}else{
	    	$.ajax({
				type:'POST',   //post 방식으로 전송
				url:'/premium/manage/stUserUpdateName.do',   //데이터를 주고받을 파일 주소
				data:JSON.stringify ({ //변수에 담긴 데이터를 전송해준다 (JSON 방식)
					"userId" : userId
					,"userName" : userName
				}),
				dataType:'JSON', //데이터 타입 JSON
				contentType : "application/json; charset=UTF-8",
				success : function(data){   //파일 주고받기가 성공했을 경우. data 변수 안에 값을 담아온다.
					location.href="/test/studentInfo?userId="+teacherId;
				},
				error:function(request,status,error){
					location.href="/test/studentInfo?userId="+teacherId;
				}
			});
    	}
    });
});
</script>


<body>
	<div style="text-align: center;">
		<div class="container">
		<div style="height: 80px;"></div>
			<div id="login_logo_background">
				<img id="logo_img" src="/imgs/login/login_logo_background.png" alt="㈜스마투스코리아 로고" style="width: 800px;" />
			</div>
			<div style="height: 80px;"></div>
			<div style="text-align: center; color: #ffffff; font-weight: bold; font-size: 70px;">마곡14 아이마당 어린이집<br/>학생 이름 변경</div>
			<div style="height: 50px;"></div>
			<div style="text-align: center; color: #ffffff; font-weight: bold; font-size: 90px;">
				<c:set var="userId" value="${userId}" />
				<c:if test="${userId eq 'tc04'}">
				   씨앗반
				</c:if>
				<c:if test="${userId eq 'tc05'}">
				    새싹반
				</c:if>
				<c:if test="${userId eq 'tc06'}">
				    풀잎반
				</c:if>
				<c:if test="${userId eq 'tc07'}">
				    꽃잎반
				</c:if>
				<c:if test="${userId eq 'tc08'}">
				    열매반
				</c:if>
			</div>
			<div style="height: 50px;"></div>
			<table style="width: 100%">
				<tbody style="text-align: center;">
					<c:forEach items="${stList}" var="list" varStatus="status">
						<tr>
							<td id="submit" style="font-size: 60px;color: #ffffff;font-weight: bold;line-height: 150px;">${list.userName}</td>
							<td style="width: 70%;">
					        	<input type="hidden" id="userId${status.index}" name="userId" value="${list.userId}" >
					        	
					        	<input type="text" id="userName${status.index}" name="userName" style="line-height: 1; width:50%; height: 80px; font-size: 50px; text-align: center;"/>&nbsp;&nbsp;
					        	
					        	<input type="button" id="changeBtn" class="changeBtn" value="변경" style="width: 40%; height: 80px; font-size: 50px;"/>
					        	
					        </td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
        </div>
	</div>
	<div style="height: 40px;"></div>
	<div style="text-align: center;">
		<input type="button" value="반 선택 하러가기" style="width: 40%; height: 80px; font-size: 40px;" onclick="location.href='/test/studentList'"/>
	</div>
</body>
</html>