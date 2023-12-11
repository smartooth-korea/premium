<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="author" content="㈜스마트코리아" />
<meta name="description" content="Smartooth" />
<title>㈜스마트코리아 :: 버그리포트</title>
<!-- favicon ico 에러 -->
<link rel="shortcut icon" type="image/x-icon" href="/imgs/common/logo_img_ori.png">
<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
<link rel="stylesheet" href="css/common/sb-admin-2.css">
<link rel="stylesheet" type="text/css" href="css/jquery/jquery-ui.css" />
<link rel="stylesheet" href="css/jquery/jqgrid/ui.jqgrid.css">
<link rel="stylesheet" href="/css/common/layout.css">
<!-- jQuery --> 
<script type="text/javascript" src="js/jquery/jquery.js"></script>
<script type="text/javascript" src="js/jquery/jquery-ui.js"></script>
<!-- jqGrid -->
<script type="text/javascript" src="js/jquery/jqgrid/i18n/grid.locale-kr.js"></script>
<script type="text/javascript" src="js/jquery/jqgrid/minified/jquery.jqGrid.min.js"></script>
<!-- Element Css -->
<style type="text/css">
.body-title{
	padding-left: 2rem;
	padding-right: 2rem;
	padding-top: 0.8rem;
}

.mb-4 {
	height: 70px;
}



@media screen and (min-height: 935px) and (max-height: 1080px) {
	.gridHeight{
		height: 730px;
		display: flex;
    	align-items: center;
	}
}
@media screen and (min-height: 1081px) and (max-height: 1440px){
	.gridHeight{
		display: flex;
    	align-items: center;
		height: 1070px;
	}
}

.ui-datepicker-trigger {
	margin-left: 5px;
	width: 20px;
}

.button{
	width: 10%;
    float: left;
    margin-left: 10px;
    background-color: #333333;
    border-color: #333333;
    font-size: 14px;
}

.right-space{
    padding-top: 20px;
    padding-left: 20px;
}

#frm{
    display: flex;
    justify-content: center;
	width: 100%;
}

.table{
	text-align: center;
	margin-top: 2%;
	margin-bottom: 0;
	width: 97%;
}

th.th-left{
	background-color: #333333;
	font-weight: bold;
    padding: 0.75rem;
	color: #ffffff;
	width: 10%;	
	height: 35px;
}

td.td-left{
	vertical-align: middle;
    text-align: center;
    padding: 0.75rem;
    height: 45px;
	width: 30%;
}

th.th-right{
	background-color: #333333;
	font-weight: bold;
	padding: 0.75rem;
	color: #ffffff;
	width: 10%;	
	height: 35px;
}

td.td-right{
	vertical-align: middle;
    text-align: center;
    padding: 0px;
    height: 45px;
	width: 30%;
}


th.th-title{
    background-color: #333333;
    padding: 0.75rem;
    vertical-align: middle;
    width: 10%;
    height: 35px;
    color: #ffffff;
    font-weight: bold;
}

th.th-url{
    background-color: #333333;
    padding: 0.75rem;
    vertical-align: middle;
    width: 10%;
    height: 35px;
    color: #ffffff;
    font-weight: bold;
}

td.td-title{
    padding: 0.5rem;
    text-align: center;
}


.boardType{
	padding: 0px;
    vertical-align: middle;
}

td.searchDt {

}

select#boardType{
	border: 0px solid;
	font-size: 15px;
}

.hasDatepicker {
	text-align: center;
	width: 120px;
	border-radius: 5px;
	border: 1px solid #717171;
	height: 33px;
	font-size: 15px;
}

input.input-text{
    border: 0px;
    padding-left: 10px;
    text-align: left;
    width: 100%;
    height: 20px;
    font-size: 15px;
}

input.input-text:focus{
	border: 1px solid #0083cb;
}

td.content{
	text-align: left;
	vertical-align: baseline;
	/* padding: 0px; */
	padding: 10px;
    height: 500px;
    text-align: left;
}

th.th-content{
    padding: 0.75rem;
	background-color: #333333;
    vertical-align: middle;
    font-weight: bold;
    color: #ffffff;
    width: 10%;
    height: 35px;
}


.td-boardRgstDt{
	font-size: 12px;
}


.form-control{
	margin-right: 10px;
	width: 95%;
}


textarea{
    padding: 10px;
    border: 0px solid;
    outline: none;
	width: 100%;
    height: 100%;
    resize: none;
}

textarea:focus{
	border: 1px solid #0083cb;
}

input:focus{
    border-color: #0083cb;
    outline: none;
}
</style>
<!-- Element Css end -->
</head>
<body id="page-top">
<!-- Page Wrapper -->
   	<div id="wrapper">
		<jsp:include page="/WEB-INF/views/admin/layout/left2.jsp"></jsp:include>
<!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">
<!-- Body-->
            <div id="content">
<!-- Top menu -->
			<jsp:include page="/WEB-INF/views/admin/layout/header2.jsp"></jsp:include>
<!-- Contents -->
				<div class="container-fluid">
<!-- Title Row -->
                    <div class="row">
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-primary shadow h-100 py-2">
                                <div class="card-body body-title">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
												공지사항 수정
                                             </div>
                                        </div>
                                        <div class="col-auto">
                                             <i class="fas fa-fw fa-bug"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
<!-- Content Row -->
                    <div class="row">
						<div class="col-xl-12">
                            <div class="card shadow mb-4 gridHeight">
<!-- Board Row -->
								<form id="frm" name="frm" method="POST" action="/admin/board/updateNotice.do">
									<table class="table table-bordered">
										<tr>
											<th class="th-left">번호</th>
											<td class="td-left">
												${boardInfo.boardSeq}
											</td>
											<th class="th-right">분류</th>
											<td class="td-right boardType">
												<select name="boardType" id="boardType">
													<option value="공지사항" <c:if test="${boardInfo.boardType eq '공지사항'}">selected</c:if>>공지사항</option>
													<option value="이벤트" <c:if test="${boardInfo.boardType eq '이벤트'}">selected</c:if>>이벤트</option>
												</select>
											</td>
										</tr>
										<tr>
											<th class="th-left">작성자</th>
											<td class="td-left">${userInfo.userName}(${userInfo.userId})</td>
											<th class="th-right">기간</th>
											<td class="td-right searchDt">
												<input type="text" id="boardEventStartDt" name="boardEventStartDt" placeholder="시작일" value="${boardInfo.boardEventStartDt}"/>
													~
												<input type="text" id="boardEventEndDt" name="boardEventEndDt" placeholder="종료일" value="${boardInfo.boardEventEndDt}"/>
											</td>
										</tr>	
										<tr>
											<th class="th-title">제목</th>
											<td colspan="3">
												<input type="text" id="boardTitle" name="boardTitle" class="input-text" placeholder="제목" value="${boardInfo.boardTitle}"/>
											</td>
										</tr>
										<tr>
											<th class="th-url">팝업 이미지 URL 주소</th>
											<td colspan="3">
												<input type="text" id="boardPreviewImgUrl" name="boardPreviewImgUrl" class="input-text" placeholder="팝업 이미지 URL 주소" value="${boardInfo.boardPreviewImgUrl}"/>
											</td>
										</tr>				
										<tr>
											<th class="th-url">본문 이미지 URL 주소</th>
											<td colspan="3">
												<input type="text" id="boardImgUrl" name="boardImgUrl" class="input-text" placeholder="본문 이미지 URL 주소" value="${boardInfo.boardImgUrl}"/>
											</td>
										</tr>				
										<tr>
											<th class="th-content">내용</th>
											<td class="content" colspan="3">
												<textarea rows="1" cols="1" id="boardContent" name="boardContent" placeholder="내용을 입력해주세요.">${boardInfo.boardContent}</textarea>
											</td>
										</tr>		
									</table>
										<input type="hidden" name="userId" value="${boardInfo.userId}" />
										<input type="hidden" name="boardSeq" value="${boardInfo.boardSeq}" />
								</form>
								<div class="commonHeight20"></div>
<!-- CRUD -->
								<div class="buttons">
									<button type="button" id="submit" class="btn btn-primary">수정</button>
								</div>
                           	</div>
						</div>
					</div>
				</div>
			</div>   
			<input type="hidden" id="input_userId" name="input_userId" value="${userInfo.userId}" />     
<!-- Footer menu -->
			<jsp:include page="/WEB-INF/views/admin/layout/footer.jsp"></jsp:include>
		</div>
	</div>
	
<script type="text/javascript">

$(document).ready(function(){
		
	$("#boardTitle").focus();
	
	// 게시글 등록 버튼 클릭
  	$('#submit').click(function(){
  		
	  	if ($("#boardTitle").val() == "") {
			alert("제목을 입력해주세요.");
			$("#boardTitle").focus();
			return false;
		}
	  	if ($("#boardContent").val() == "") {
			alert("내용을 입력해주세요.");
			$("#boardContent").focus();
			return false;
		}
  		
	  	$("#frm").submit();
	  	
	  	setTimeout(function() {
			console.log('complite');
			alert("수정되었습니다.");
	  	}, 1000);
	  	
  	});
	
	
  	$(function() {
		//모든 datepicker에 대한 공통 옵션 설정
		$.datepicker.setDefaults({
			dateFormat : 'yy-mm-dd' //Input Display Format 변경
			,showOtherMonths : true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
			,showMonthAfterYear : true //년도 먼저 나오고, 뒤에 월 표시
			,changeYear : true //콤보박스에서 년 선택 가능
			,changeMonth : true //콤보박스에서 월 선택 가능                
			,showOn : "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
			,buttonImage : "/imgs/icon/calendar.png" //버튼 이미지 경로
			,buttonImageOnly : true //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
			,buttonText : "날짜 선택" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트                
			,yearSuffix : "년" //달력의 년도 부분 뒤에 붙는 텍스트
			,monthNamesShort : [ '1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12' ] //달력의 월 부분 텍스트
			,monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월' ] //달력의 월 부분 Tooltip 텍스트
			,dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ] //달력의 요일 부분 텍스트
			,dayNames : [ '일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일' ] //달력의 요일 부분 Tooltip 텍스트
		});
		//input을 datepicker로 선언
		$("#boardEventStartDt").datepicker();
		$("#boardEventEndDt").datepicker();

	});
	
});
	
	
</script>
<!-- Bootstrap core JavaScript-->
<script src="vendor/bootstrap/js/bootstrap.bundle.js"></script>
<!-- Core plugin JavaScript-->
<script src="vendor/jquery-easing/jquery.easing.js"></script>
<!-- Custom scripts for all pages-->
<script src="js/common/sb-admin-2.js"></script>
<!-- Page level plugins -->
<script src="vendor/chart.js/Chart.js"></script>
<!-- Page level custom scripts -->
<!-- <script src="js/demo/chart-area-demo.js"></script> -->
<!-- <script src="js/demo/chart-pie-demo.js"></script> -->
<!-- 공통적으로 사용하는 method (common.js)  -->
<script src="js/common.js"></script>
</body>
</html>