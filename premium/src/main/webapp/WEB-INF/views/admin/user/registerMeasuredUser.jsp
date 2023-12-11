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
<title>㈜스마트코리아 :::  사용자 개발 등록 (유치원)</title>
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

.text-gray-333{
	color: #333333 !important;
}

.mb-4{
	height: 70px;
}

.organList{
	padding-left: 2rem;
    padding-right: 2rem;
    padding-top: 0.8rem;
}

@media screen and (min-height: 935px) and (max-height: 1080px) {
	.gridHeight{
		height: 730px;
	}
}
@media screen and (min-height: 1081px) and (max-height: 1440px){
	.gridHeight{
		height: 1090px;
	}
}

.menu-title{
    margin-left: 20px;
    height: 60px;
    display: flex;
    align-items: center;
    font-weight: bold;
    font-size: 15px;
}

#searchType{
	width: 15%;
    float: left;
    font-size: 14px;
}

#searchData{
	width: 30%;
	float: left;
	margin-left: 10px;
    font-size: 14px;
}

.button{
	width: 100px;
    float: left;
    margin-left: 10px;
    background-color: #333333;
    border-color: #333333;
    font-size: 14px;
}

.top-space{
    display: flex;
    margin-left: 30px;
}

#file{
    width: 400px;
    height: 40px;
}

.form-control{
	text-align: center;
	display: block;
    width: 200px;
    height: calc(1.5em + 0.75rem + 2px);
    padding: 0.375rem 0.75rem;
    font-size: 14px;
    font-weight: bold;
    line-height: 1.5;
    color: #000000;
	text-align: center;
    background-color: #fff;
    background-clip: padding-box;
    border: 1px solid #495057;
    border-radius: 0.35rem;
    transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
}

.form-control::placeholder{
	font-size: 14px;
}

#schoolName{
	text-align: center;
	width: 400px;
}

#departList{
	text-align: center;
	margin-left: 10px;
	font-size: 14px;
	height: 37px;
	width: 250px;
}

#userCount{
	text-align: center;
	margin-left: 10px;
    font-weight: bold;
    width: 250px;
}

.ui-autocomplete {
	font-family: 'NanumSquareR';
	border: none;
	position: relative;
	background-color: #ffffff; 
	list-style:none;
	font-size: 14px;
	margin-bottom: 5px;
	padding-top: 2px;
	border: 1px solid #DDD !important;
	padding-top: 0px !important;
	z-index: 1511;
	line-height: 30px;
	text-align: center;
	width: 220px;
}

.ui-menu-item{
	font-family: 'NanumSquareR';
	margin-left: -30px;
	border-bottom: 1px dotted;
   	border-collapse: collapse;
}

.ui-helper-hidden-accessible{
	font-family: 'NanumSquareR';
	display: none;
}



</style>
</head>
<body id="page-top">
   	<div id="wrapper">
		<jsp:include page="/WEB-INF/views/admin/layout/left.jsp"></jsp:include>
        <div id="content-wrapper" class="d-flex flex-column">
            <div id="content">
			<jsp:include page="/WEB-INF/views/admin/layout/header.jsp"></jsp:include>
				<div class="container-fluid">
                    <div class="row">
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-primary shadow h-100 py-2">
                                <div class="card-body organList">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
												사용자 개별 등록 (유치원)
                                             </div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-users fa-2x text-gray-333"></i>
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
								<form method="post" id="frm">                                
								<div class="menu-title">
									<font color="red">＊</font> 법정대리인 성명 : &nbsp;
									<input type="text" class ="input-control" id="paUserName" name="paUserName">
								</div>
							<div class="commonHeight30"></div>
								<div class="menu-title">해당 부서 피측정자 일괄 등록</div>
								<div class="top-space">
									<input type="text" id="schoolName" name="schoolName" class="form-control" placeholder="기관(학교)를 검색 후 선택하세요."/>
									<select id="departList" name="classCode" class="form-control">
									</select>
									<input type="text" id="userCount" name="userCount" class="form-control" placeholder="부서(반) 인원을 입력하세요."/>
									<button type="submit" class="btn btn-info btn-fill button regist_btn" id="registBatch" value="등록" onclick="">
										등록
									</button>
									<input type="hidden" id="schoolCode" name="schoolCode" value="">
									<input type="hidden" id="departmentName" name="departmentName" value="">
								</div>
							</form>
							</div>
						</div>
					</div>
				</div>
			</div>
			<jsp:include page="/WEB-INF/views/admin/layout/footer.jsp"></jsp:include>
		</div>        
	</div>
<script type="text/javascript">

//기관 이름 검색
$('#schoolName').autocomplete({
	source : function(request, response) { //source: 입력시 보일 목록
	     $.ajax({
	           url : "/admin/organ/ajaxSelectOrganList.do"   
	         , type : "POST"
	         , dataType: "JSON"
	         , data : {value: request.term}	// 검색 키워드
	         , success : function(data){ 	// 성공
	             response(
	                 $.map(data.organList, function(item) {
	                	 
	                	 var seq = item.SEQ;
	                	 var schoolCode = item.SCHOOL_CODE;
	                	 var schoolName = item.SCHOOL_NAME;
	                	 var organAddress = item.ORGAN_ADDRESS;
	                	 
	                     return {
								label : schoolName + '\n\n('+organAddress+')'     	// 목록에 표시되는 값
								,value : schoolName		// 선택 시 input창에 표시되는 값
								,idx : seq // index
								,schoolCode : schoolCode // 넘겨줄 값을 여기에 넣으면 됨
	                     };
	                 })
	             );    //response
	         }
	         ,error : function(){ //실패
	             alert("관리자에게 문의해주세요.");
	         }
	         
	     });
	}
	,minLength : 1
	,focus: function (event, ui) {
        return false;
    },
    select: function (event, ui) {
		$('#schoolCode').attr("value", ui.item.schoolCode);
		$.ajax({
			url : "/organ/ajaxSelectDepartmentList.do",
			type : "POST",
			dataType : "JSON",
			data : {
				"schoolCode" : ui.item.schoolCode
			} // 검색 키워드
			,
			success : function(data) { // 성공
				// 기존에 목록이 있을 경우 select의 하위 자식 element 삭제
				$("#departList").empty();
				var departList = data.departList;
				$("#departList").append("<option value='' selected='selected'>부서(반)을 선택해주세요</option>");
				for(var i=0; i<departList.length; i++){
					$("#departList").append("<option value='"+departList[i].CLASS_CODE+"'>"+departList[i].CLASS_NAME+"</option>");
				}
			},
			error : function() { //실패
				alert("관리자에게 문의해주세요.");
			}
		});
	},
	delay : 300
});


$("#registExcel").click(function(){

	// 숫자 정규식
	var regExp = /[^0-9]/g;
	var userCount = $("#userCount").val();
	
	if($("#file").val() == ""){
		alert("파일을 첨부해주세요.");
		$("#schoolName").focus();
		return false;
	}

	var departList = document.getElementById("departList");
	var departmentCd = departList.options[departList.selectedIndex].value;
	var departmentName = departList.options[departList.selectedIndex].text;	
	
	$('#departmentName').attr("value", departmentName);
	
	if(departmentCd =="" || departmentCd == null){
		alert("기관의 부서를 선택해주세요.");
		$("#departList").focus();
		return false;
	}
	
	if(userCount == "" || userCount == null){
		alert("등록할 인원의 수를 입력해주세요.");
		$("#userCount").focus();
		return false;
	}
	if(regExp.test(userCount)){
		alert("숫자만 입력이 가능합니다.")
		obj.value = obj.value.substring(0, obj.value.length -1);
	}
	
});



$("#registBatch").click(function(){

	// 숫자 정규식
	var regExp = /[^0-9]/g;
	var userCount = $("#userCount").val();
	
	if($("#schoolName").val() == ""){
		alert("인원을 등록 할 기관을 입력해주세요.");
		$("#schoolName").focus();
		return false;
	}

	var departList = document.getElementById("departList");
	var departmentCd = departList.options[departList.selectedIndex].value;
	var departmentName = departList.options[departList.selectedIndex].text;	
	
	$('#departmentName').attr("value", departmentName);
	
	if(departmentCd =="" || departmentCd == null){
		alert("기관의 부서를 선택해주세요.");
		$("#departList").focus();
		return false;
	}
	
	if(userCount == "" || userCount == null){
		alert("등록할 인원의 수를 입력해주세요.");
		$("#userCount").focus();
		return false;
	}
	if(regExp.test(userCount)){
		alert("숫자만 입력이 가능합니다.")
		obj.value = obj.value.substring(0, obj.value.length -1);
	}
	
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