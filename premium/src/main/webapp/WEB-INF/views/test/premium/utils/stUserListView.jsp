<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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


<body>
	<div class="jumbotron vertical-center" style="display: flex; align-items: center;">
		<div class="container">
			<div id="login_logo_background">
				<img id="logo_img" src="/imgs/login/login_logo_background.png" alt="㈜스마투스코리아 로고" style="width: 800px;" />
			</div>
			<div class="commonHeight80"></div>
			<h3 style="text-align: center; color: #ffffff; font-weight: bold; font-size: 80px;">마곡14 아이 마당<br/>어린이집<br/>학생 이름 변경</h3>
			<div class="commonHeight80"></div>
			<table style="width: 100%">
				<tbody style="text-align: center;">
					<c:forEach items="${tcList}" var="list">
						<tr>
							<td style="font-size: 80px; color: #ffffff; font-weight: bold; line-height: 150px;" onclick="location.href='/premium/manage/stUserInfoListView.do?userId=${list.userId}'">${list.className}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
        </div>
	</div>
</body>
</html>