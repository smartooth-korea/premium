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

.table th, .table td {
    vertical-align: middle;
    text-align: center;
	padding: 0px;
	height: 45px;
	width: 80px;
}

.table th{
	background-color: #333333;
	font-weight: bold;
	padding: 0;
	width: 23px;	
	color: #ffffff;
	height: 35px;
	
}


input#boardTitle{
	border: 0px;
	padding-left: 10px;
	text-align: left;
	width: 100%;
	height: 44px;
}

input#boardTitle:focus{
	border: 1px solid #0083cb;
}

.td-boardTitle:hover{
    cursor: pointer;
}

.td-boardRgstDt{
	font-size: 12px;
}

td.content{
	padding: 0px;
	text-align: left;
	vertical-align: baseline;
	height: 300px;
    text-align: left;
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

.td-textReadOnly{
	vertical-align: middle;
	padding-left: 15px;
}

.td-boardRequestStatus{
	padding: 0px;
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
                                <div class="card-body appVersionLogList">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
												버그리포트 작성
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
								<form id="frm" name="frm" method="POST" action="/admin/board/insertBugReport.do">
									<table class="table table-bordered">
										<tr>
											<th>번호</th>
											<td class="td-textReadOnly">
												${boardSeq}
											</td>
											<th>요청 상태</th>
											<td class="td-boardRequestStatus">
												<select name="boardRequestStatus" id="boardRequestStatus">
													<option value="N">일반</option>
													<option value="E">긴급</option>
												</select>
											</td>
										</tr>
										<tr>
											<th>작성자</th>
											<td class="td-textReadOnly">${userInfo.userName}(${userInfo.userId})</td>
											<th>진행 상황</th>
											<td class="td-textReadOnly">
												<select name="boardType" id="boardType" style="text-align: center;">
													<option value="버그" style="text-align: center;">버그</option>
													<option value="요청" style="text-align: center;">요청</option>
												</select>
											</td>
										</tr>	
										<tr>
											<th>제목</th>
											<td colspan="3">
												<input type="text" id="boardTitle" name="boardTitle" placeholder="제목"/>
											</td>
										</tr>		
										<tr>
											<th>내용</th>
											<td class="content" colspan="3">
												<textarea rows="1" cols="1" id="boardContent" name="boardContent" placeholder="내용을 입력해주세요."></textarea>
											</td>
										</tr>		
									</table>
								<input type="hidden" id="userId" name="userId" value="${userInfo.userId}" />     
								<input type="hidden" id="userName" name="userName" value="${userInfo.userName}" />     
								<input type="hidden" id="boardSeq" name="boardSeq" value="${boardSeq}" />
								</form>
								<div class="commonHeight20"></div>
<!-- CRUD -->
								<div class="buttons">
									<button type="button" id="submit" class="btn btn-primary">등록</button>
								</div>
                           	</div>
						</div>
					</div>
				</div>
			</div>   
<!-- Footer menu -->
			<jsp:include page="/WEB-INF/views/admin/layout/footer.jsp"></jsp:include>
		</div>
	</div>
	
<script type="text/javascript">

$(document).ready(function(){
	
	// input 태그 포커스
	$('#boardTitle').focus();
  	
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
			alert("등록이 완료되었습니다.");
	  	}, 1000);
	  	
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