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
<title>㈜스마트코리아 - 유치원 피측정자 조회</title>
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

.modal {
  /* position: absolute; */
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	display: none;
	background-color: rgba(0, 0, 0, 0.4);
}

.modal.show {
  	display: flex;
    justify-content: center;
    align-items: center;
}

.modal_body {
    /* position: absolute; */
    top: 20%;
    left: 40%;
    width: 500px;
    height: 480px;
    padding: 30px;
    text-align: center;
    background-color: rgb(255, 255, 255);
    border-radius: 10px;
    box-shadow: 0 2px 3px 0 rgb(34 36 38 / 15%);
}



/**Modal 안의 div**/
.wrap-div{
	display: flex;
    justify-content: center;
    align-items: center;
    margin-bottom: 10px;
}

.div-td-left{
   display: flex;
    align-items: center;
}

.div-td-right{
	display: flex;
	align-items: center;
}


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
	width: 10%;
    float: left;
    margin-left: 10px;
    background-color: #333333;
    border-color: #333333;
    font-size: 14px;
}

.chkBtn{
    color: #fff;
    background-color: #318CDD;
    border-color: #318CDD;
    border: 0px;
    border-radius: 5px;
    height: 30px;
    width: 70px;
    margin-left: 5px;
}

.right-space{
    padding-top: 20px;
    padding-left: 20px;
}
/* jqGrid 가로스크롤 비활성화  */
.ui-jqgrid .ui-jqgrid-bdiv {position: relative; margin: 0; padding:0; overflow: auto; text-align:left;overflow-x: hidden;}

.input-control{
    display: block;
    text-align: center;
    font-size: 15px;
    font-weight: 400;
    line-height: 1.5;
    color: #000000;
    background-color: #ffffff;
    background-clip: padding-box;
    border: 1px solid #495057;
    border-radius: 0.35rem;
    transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
    height: 30px;
}

.userId{
	width: 100%;
}

.userName{
	width: 150px;
}

.telNo{
    width: 75px;
}

.userType{
    text-align: center;
	font-size: 15px;
}

.userType{
    text-align: center;
	font-size: 15px;
}

.ui-autocomplete {
	border: none;
	position: relative;
	background-color: #ffffff; 
	list-style:none;
	font-size: 14px;
	margin-bottom: 5px;
	padding-top: 2px;
	border: 1px solid #DDD !important;
	padding-top: 0px !important;
	line-height: 30px;
	text-align: center;
	width: 290px;
}

.ui-menu-item{
	margin-left: -30px;
	border-bottom: 1px dotted;
   	border-collapse: collapse;
}

.ui-front{
	z-index: 9999;
}

.ui-helper-hidden-accessible{
	display: none;
}

#schoolName{
	width : 290px; 
}

/* datepicker 설정 */
input[type="date"] {
    background: url(/imgs/icon/icon-calendar.png) no-repeat;
    background-size: 20px 20px;
    height: 35px;
    width: 130px;
    padding-left: 15px;
    padding-right: 10px;
    border: 1px solid #333333;
    border-radius: 5px;
}

input[type="date"]::-webkit-clear-button,
input[type="date"]::-webkit-inner-spin-button{ display: none;}
input[type="date"]::-webkit-calendar-picker-indicator{
	position: absolute;
	left: 0;
	top: 0;
	background: transparent;
	color: transparent;
	border: 0px;
	width: 100%;
	height: 100%;
	cursor: pointer;
}

input[type="date"]::before {
	content: attr(data-placeholder);
	width: 100%
}

input[type="date"]:valid::before{
	display: none;
}

</style>
<!-- Element Css end -->
<!-- ${userInfo.userType} -->

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
                    <div class="row">

                        <!-- Earnings (Monthly) Card Example -->
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-primary shadow h-100 py-2">
                                <div class="card-body organList">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
												유치원 피측정자 조회
                                            </div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-user fa-2x text-gray-333"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Content Row -->
                    <div class="row">
<!-- jqGrid -->
<!--<div class="col-xl-8 col-lg-7"> -->
						<div class="col-xl-12">
                            <div class="card shadow mb-4 gridHeight">
                                <!-- Card Header - Dropdown -->
                                <div>
<!--                                		<div class="left-space"></div> -->
									<div class="right-space">
									    <select class="form-control " id="searchType">
									      	<option value="userId" selected>사용자 아이디</option>
									        <option value="userName">사용자 이름</option>
									        <option value="schoolName">기관명</option>
<!-- 									        <option value="SIGUNGU_NM">지역(시군구)</option> -->
<!-- 									        <option value="EUPMYEONDONG_NM">지역(읍면동)</option> -->
									    </select>
									    <input type ="text" id="searchData" class ="form-control">
									    <button class="btn btn-info btn-fill button" id="search" value="검색" onclick="onSubmit()">
									      검색
									    </button>
									</div>
									</div>
                                <!-- Card Body -->
                                <div class="card-body">
                                    <div class="grid-area">
                                        <table id="grid"></table>
										<div id="pager"></div>
                                    </div>
<%-- <c:if test="${userInfo.userType eq 'SU'}"> --%>
<!--                                     <div class="regist"> -->
<!-- 	                                    <button class="btn btn-info btn-fill button" id="regist" value="등록" style="margin:0px; margin-top: 12px;" onclick=""> -->
<!-- 	                                    	등록 -->
<!-- 	                                    </button> -->
<!--                                     </div> -->
<!--                                     <div class="delete"> -->
<!-- 	                                    <button class="btn btn-info btn-fill button" id="delete" value="삭제" style="margin:0px; margin-top: 12px; margin-left: 20px;" onclick="deleteRow()"> -->
<!-- 	                                    	삭제 -->
<!-- 	                                    </button> -->
<!--                                     </div> -->
<%-- </c:if>  --%>
<!-- 등록 모달 : Modal -->
<!-- <div id="insertModal" class="modal"> -->
<!-- 	<div class="modal_body"> -->
<!-- 	<h4>피측정자 및 법정대리인 등록</h4> -->
<!-- 	<div style="height:30px;"></div> -->
<!-- 		<form method="post" id="frm"> -->
<!-- 				<div class="wrap-div"> -->
<!-- 					<div class="div-td-left"> -->
<!-- 						<font color="red">＊</font> -->
<!-- 						법정대리인 성명 : &nbsp; -->
<!-- 					</div> -->
<!-- 					<div class="div-td-right"> -->
<!-- 						<input type="text" class ="input-control" id="paUserName" name="paUserName"> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 				<div class="wrap-div"> -->
<!-- 					<div class="div-td-left"> -->
<!-- 					<font color="red">＊</font> -->
<!-- 						법정대리인 연락처 : &nbsp; -->
<!-- 					</div> -->
<!-- 					<div class="div-td-right"> -->
<!-- 						<select class="input-control telNo" id="paUserTelNo1" name="paUserTelNo1"> -->
<!-- 							<option value="010" selected="selected">010</option> -->
<!-- 							<option value="011">011</option> -->
<!-- 							<option value="016">016</option> -->
<!-- 							<option value="017">017</option> -->
<!-- 							<option value="018">018</option> -->
<!-- 							<option value="019">019</option> -->
<!-- 						</select>&nbsp;-&nbsp; -->
<!-- 						<input type="text" class ="input-control telNo" id="paUserTelNo2" name="paUserTelNo2" onkeyup="isNumeric(this)" onkeydown="isNumeric(this)" maxlength="4">&nbsp;-&nbsp; -->
<!-- 						<input type="text" class ="input-control telNo" id="paUserTelNo3" name="paUserTelNo3" onkeyup="isNumeric(this)" onkeydown="isNumeric(this)" maxlength="4"> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 				<div class="wrap-div"> -->
<!-- 					<div class="div-td-left"> -->
<!-- 						<font color="red">＊</font> -->
<!-- 						기관(학교)  : &nbsp; -->
<!-- 					</div> -->
<!-- 					<div class="div-td-right"> -->
<!-- 						<input type="text" id="schoolName" name="schoolName" class ="input-control"> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 				<div class="wrap-div"> -->
<!-- 					<div class="div-td-left"> -->
<!-- 						<font color="red">＊</font> -->
<!-- 						부서(반) : &nbsp; -->
<!-- 					</div> -->
<!-- 					<div class="div-td-right"> -->
<!-- 						<select id="departList" name="classCode" class="input-control"> -->
<!-- 							<option selected='selected'>부서(반)을 선택해주세요</option> -->
<!-- 						</select> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 				<div class="wrap-div"> -->
<!-- 					<div class="div-td-left"> -->
<!-- 						<font color="red">＊</font> -->
<!-- 						자녀 성명 : &nbsp; -->
<!-- 					</div> -->
<!-- 					<div class="div-td-right"> -->
<!-- 						<input type ="text" id="stUserName" name="stUserName" class="input-control">  -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 				<div class="wrap-div"> -->
<!-- 					<div class="div-td-left"> -->
<!-- 						<font color="red">＊</font> -->
<!-- 						자녀 생년월일 : &nbsp; -->
<!-- 					</div> -->
<!-- 					<div class="div-td-right"> -->
<!-- 						<input type="date" id="userBirthday" name="userBirthday" class="input-control" data-placeholder="날짜 선택"> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 				<div class="wrap-div"> -->
<!-- 					<div class="div-td-left"> -->
<!-- 					<font color="red">＊</font> -->
<!-- 						자녀 성별 : &nbsp; -->
<!-- 					</div> -->
<!-- 					<div class="div-td-right"> -->
<!-- 						<select id="stUserSex" name="stUserSex" class="input-control"> -->
<!-- 							<option selected='selected'>성별을 선택해주세요</option> -->
<!-- 							<option value="M">남</option> -->
<!-- 							<option value="F">여</option> -->
<!-- 						</select> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 				<div style="height:30px;"></div> -->
<!-- 				<div> -->
<!-- 					<input type="button" id="regist" onclick="opSubmit();" class="btn btn-info btn-fill" value="등록"> -->
<!-- 				</div> -->
<!-- 		</form> -->
<!-- 	</div> -->
<!-- </div> -->
<!-- <!-- 수정 모달 : Modal --> 
<!-- <div id="editModal" class="modal"> -->
<!-- 	<div class="modal_body"> -->
<!-- 	<h4>사용자 등록</h4> -->
<!-- 	<div style="height:20px;"></div> -->
<!-- 		<form method="post" id="frm"> -->
<!-- 				<div class="wrap-div"> -->
<!-- 					<div class="div-td-left"> -->
<!-- 						기&nbsp;&nbsp;&nbsp;&nbsp;관&nbsp;&nbsp;&nbsp;&nbsp;명&nbsp;&nbsp;&nbsp;: -->
<!-- 					</div> -->
<!-- 					<input hidden="hidden" /> -->
<!-- 					<div class="div-td-right"> -->
<!-- 						<input id="schoolName" name="schoolName" type="text" style="text-align: center;" placeholder="입력해주세요."> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 				<div class="wrap-div"> -->
<!-- 					<div class="div-td-left"> -->
<!-- 						기 관 종 류&nbsp;&nbsp;&nbsp;&nbsp;: -->
<!-- 					</div> -->
<!-- 					<div class="div-td-right"> -->
<!-- 						<select id="schoolType" name="schoolType" class=" "> -->
<!-- 							옵션 값을 조회 이 페이지 들어오기전에 가져와야한다. 그 후 셀렉트 박스에서 값이 선택되면 ajax로 나머지 지역 읍면동을 만들어준다 -->
<!-- 							<option value="">선택해주세요</option> -->
<!-- 							<option value="KG">어린이집, 유치원</option> -->
<!-- 							<option value="EL">초등학교</option> -->
<!-- 							<option value="MD">중학교</option> -->
<!-- 							<option value="HI">고등학교</option> -->
<!-- 							<option value="DE">치과</option> -->
<!-- 						</select> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 				<div class="wrap-div"> -->
<!-- 					<div class="div-td-left"> -->
<!-- 						지역(시도)&nbsp;&nbsp;&nbsp;&nbsp;: -->
<!-- 					</div> -->
<!-- 					<div class="div-td-right"> -->
<!-- 						<select id="sido" name="sido" class="" onchange="changeSidoInfo()"> -->
<!-- 							<option value="">선택해주세요</option> -->
<%-- 							<c:forEach var="sidoList" items="${sidoList}"> --%>
<%-- 								<option value="${sidoList.sidoCd}">${sidoList.sidoNm}</option> --%>
<%-- 							</c:forEach> --%>
<!-- 						</select> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 				<div class="wrap-div"> -->
<!-- 					<div class="div-td-left">지역(시군구)&nbsp;&nbsp;&nbsp;&nbsp;:</div> -->
<!-- 					<div class="div-td-right"> -->
<!-- 						<select id="sigungu" name="sigungu" class="" onchange="changeSigunguInfo()"> -->
<!-- 							<option value="">선택해주세요</option> -->
<!-- 						</select> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 				<div class="wrap-div"> -->
<!-- 					<div class="div-td-left"> -->
<!-- 						지역(읍면동)&nbsp;&nbsp;&nbsp;&nbsp;: -->
<!-- 					</div> -->
<!-- 					<div class="div-td-right"> -->
<!-- 						<select id="eupmyeondong" name="eupmyeondong" class=""> -->
<!-- 							<option value="">선택해주세요</option> -->
<!-- 						</select> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 				<div class="wrap-div"> -->
<!-- 					<div class="div-td-left"> -->
<!-- 						자 문 치 과&nbsp;&nbsp;&nbsp;&nbsp;: -->
<!-- 					</div> -->
<!-- 					<div class="div-td-right"> -->
<!-- 						<input id="dentistName" name="dentistName" type="text" style="text-align: center;" placeholder="입력해주세요."> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 				<div class="wrap-div"> -->
<!-- 					<div class="div-td-left"> -->
<!-- 						자문치과 전화번호&nbsp;&nbsp;&nbsp;&nbsp;: -->
<!-- 					</div> -->
<!-- 					<div class="div-td-right"> -->
<!-- 						<input id="dentistNum" name="dentistNum" type="text" style="text-align: center;" placeholder="입력해주세요."> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 				<div style="height:10px;"></div> -->
<!-- 				<div> -->
<!-- 					<input type="button" id="regist" onclick="opSubmit();" -->
<!-- 						class="btn btn-info btn-fill" value="등록"> -->
<!-- 				</div> -->
<!-- 		</form> -->
<!-- 	</div> -->
<!-- </div> -->

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
	var userId = "${userId}";
	
	$(window).on('resize.jqGrid', function (){
		
		var jqGridHeight = parseInt($(".gridHeight").height());
		var jqGirdWidth = parseInt($(".grid-area").width());
		
		console.log("jqGirdWidth >>> " + jqGirdWidth);
		// jqGrid 반응형으로 사이즈 조정하는 function
		jQuery("#grid").jqGrid( 'setGridWidth', jqGirdWidth);
		
		// jqGrid 행 갯수 변경
		if(jqGridHeight > 1080){
			jQuery("#grid").jqGrid( 'setGridHeight', ($(".gridHeight").height()-218));
			jQuery("#grid").setGridParam({rowNum:25});	
		}else {
			jQuery("#grid").jqGrid( 'setGridHeight', 528);
			jQuery("#grid").setGridParam({rowNum:15});
		}
		// jqGrid 새로고침
		jQuery("#grid").trigger("reloadGrid");
	});
	
	var colNameArray = 
		[
			'기관(학교)명'
			,'부서(반)명'
			,'이름'
			,'아이디'
			,'구분'
			,'성별'
			,'생년월일'
			,'연락처'
			,'시도'
			,'시군구'
			,'읍면동'
			
		];

	$("#grid").jqGrid({
		url : "/admin/user/ajaxSelectUserList",
		datatype : "json",
		styleUI: 'Foundation',
		contentType: "application/json; charset=utf-8",
		colNames : colNameArray,
		colModel: [
						{
							name:'schoolName',
							index:'schoolName',
							width:'15%',
							align:"center",
						}
						,{
							name:'className',
							index:'className',
							width:'8%',
							align:"center",
						}
						,{
							name:'userName',
							index:'userName',
							width:'7%',
							align:"center",
						}
						,{
							name:'userId',
							index:'userId',
							width:'14%',
							align:'center',
						}
						,{
							name:'userType',
							index:'userType',
							width:'6%',
							align:'center',
						}
						,{
							name:'userSex',
							index:'userSex',
							width:'4%',
							align:'center',
						}
						,{
							name:'userBirthday',
							index:'userBirthday',
							width:'10%',
							align:'center',
						}
						,{
							name:'userTelNo',
							index:'userTelNo',
							width:'9%',
							align:'center',
						}
						,{
							name:'sidoNm',
							index:'sidoNm',
							width:'8%',
							align:'center',
						}
						,{
							name:'sigunguNm',
							index:'sigunguNm',
							width:'8%',
							align:'center',
						}
						,{
							name:'eupmyeondongNm',
							index:'eupmyeondongNm',
							width:'8%',
							align:'center',
						}
					],
		//caption : "Loading...",	// 로딩 중 일때 표시되는 텍스트
		pager : $('#pager'),
		rowNum : 25,	// 보여 줄 행의 개수
		loadonce:true,
		height : 769, // 그리드의 높이를 해상도 변경에 따라 변하도록 변경해줘야함
		autowidth : true, // 가로 크기 자동 조절
		rownumbers : true, // 행 번호
		multiselect:true // checkbox
		,loadComplete: function(data){
	        $("#nodata").remove();
	        if(data.rows.length == 0){
	            $("#grid.ui-jqgrid-btable").after("<p id='nodata' style='margin-top:3%;text-align:center;font-weight:bold;font-size:14px;'>조회 결과가 없습니다.</p>");
	        }
		}
	});
});

	// 검색 
	//	$("#search").on("click", function() {
	function onSubmit(){	
		var searchData = $("#searchData").val();
		var searchType = $("#searchType").val();
		var postData = {
			'searchData' : searchData,
			'searchType' : searchType,
		}
	
		$("#grid").jqGrid("clearGridData", true);
	
		$("#grid").setGridParam({
			datatype : "json",
			postData : postData,
			loadComplete : function(data) {
				console.log(data);
			}
		}).trigger("reloadGrid");
	}
	
	$("#searchData").keydown(function(key) {
		if (key.keyCode == 13) {
			onSubmit();
		}
	});
	
	
	
const body = document.querySelector('body');
	
	const insertModal = document.querySelector('#insertModal');
	const editModal = document.querySelector('#editModal');
	
	const btnOpenPopup = document.querySelector('.regist');
	
	btnOpenPopup.addEventListener('click', () => {
		insertModal.classList.toggle('show');
		if (insertModal.classList.contains('show')) {
			body.style.overflow = 'hidden';
		}
	});
	
	insertModal.addEventListener('click', (event) => {
		if (event.target === insertModal) {
			insertModal.classList.toggle('show');
		}
		if (!insertModal.classList.contains('show')) {
			body.style.overflow = 'auto';
		}
	});
	
	
	function opSubmit(){

		if($("#paUserName").val() == ""){
			alert("법정대리인 성명을 입력해주세요.");
			$("#paUserName").focus();
			return false;
		}
		
		if($("#paUserTelNo2").val() == ""){
			alert("법정대리인 연락처를 입력해주세요.");
			$("#paUserTelNo2").focus();
			return false;
		}
		
		if($("#paUserTelNo3").val() == ""){
			alert("법정대리인 연락처를 입력해주세요.");
			$("#paUserTelNo3").focus();
			return false;
		}
		
		if($("#schoolName").val() == ""){
			alert("기관(학교)을 입력해주세요.");
			$("#schoolName").focus();
			return false;
		}
		
		if($("#departList").val().indexOf("KR") == -1){
			alert("부서(반)을 선택해주세요.");
			$("#departList").focus();
			return false;
		}
		
		if($("#stUserSex").val().indexOf("M") == -1 && $("#stUserSex").val().indexOf("F") == -1 ){
			alert("자녀의 성별을 선택해주세요.");
			$("#stUserSex").focus();
			return false;
		}
		
		if($("#userBirthday").val() == ""){
			alert("자녀의 성별을 선택해주세요.");
			$("#userBirthday").focus();
			return false;
		}
		
		if($("#stUserName").val() == ""){
			alert("자녀의 성명을 입력해주세요.");
			$("#stUserName").focus();
			return false;
		}
		
		if(window.confirm("아이디 : "+$("#userId").val()+"\n이름 : "+$("#userName").val() +"\n구분 : "+userTypeStr+"\n"+"지역(시도) : "+sidoNm+"\n"+"지역(시군구) : "+sigunguNm+"\n"+"지역(읍면동) : "+eupmyeondongNm+"\n"+"\n입력하신 정보가 맞습니까?") ==true){

			var formData = $("#frm").serialize();
			
			$.ajax({
	            cache : false,
	            url : "/admin/user/insertUserInfo",
	            type : 'POST', 
	            data : formData, 
	            success : function(data, statusText, jqXHR) {
	            	var isRegist = data.isRegist;
	            	alert(isRegist);
	            	if(isRegist){
	            		alert("등록이 완료되었습니다.");
		            	insertModal.classList.remove('show');
		                location.reload();
	            	}else{
						alert("등록에 실패하였습니다. 관리자에게 문의 부탁드립니다.")	            		
	            	}
	            },
	            error : function(jqXHR, textStatus, errorThrown) {
	            	alert("기관 등록에 실패하였습니다. 관리자에게 문의 부탁드립니다.");
	                location.reload();
	            }
	        });
		}else{
			return false;
		}
	}
	
// 	function deleteRow(){
// 		if(window.confirm("선택하신 기관(들)을 삭제하시겠습니까?") ==true){
// 			var message = "";
// 		    var id = $("#grid").getGridParam('selarrrow');
// 		    var schoolCodeArray = [];
		    
// 		    for (var i = 0; i < id.length; i++) {
// 				var rowdata = $("#grid").getRowData(id[i]);
// 				schoolCodeArray[i] = rowdata.SCHOOL_CODE;
// 		    }
		
// 		    $.ajax({
// 				type : 'POST', //post 방식으로 전송
// 				url : '/admin/organ/deleteOrganInfo', //데이터를 주고받을 파일 주소
// 				data:JSON.stringify ({ //변수에 담긴 데이터를 전송해준다 (JSON 방식)
					
// 					"schoolCodeArray" : schoolCodeArray
// 					,"schoolCodeArrayLength" : id.length
					
// 				}),
// 				dataType : 'JSON', //데이터 타입 JSON
// 				contentType : "application/json; charset=UTF-8",
// 				success : function(data) { //파일 주고받기가 성공했을 경우. data 변수 안에 값을 담아온다.
// 					alert("삭제가 완료되었습니다.");
// 					location.reload();
// 				},
// 				error : function(error){
// 					alert("기관 삭제에 실패하였습니다. 관리자에게 문의 부탁드립니다.");
// 					location.reload();
// 		        }
// 			});
// 		}else{
// 			return false;
// 		}
// 	}
	
	
	// ESC 키 입력 시 modal 화면 사라짐
	$(document).keydown(function(e){
		var code = e.keyCode || e.which;
		if(code == 27){
			if (insertModal.classList.contains('show')) {
				insertModal.classList.remove('show');
			}
			if (editModal.classList.contains('show')) {
				insertModal.classList.remove('show');
			}
		}
	});
	
	// 숫자 검증 정규식
	function isNumeric(obj){
		var regExp = /[^0-9]/g;
		if(regExp.test(obj.value)){
			alert("숫자만 입력이 가능합니다.")
			obj.value = obj.value.substring(0, obj.value.length -1);
		}
	}
	
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
				url : "/admin/organ/ajaxSelectDepartmentList.do",
				type : "POST",
				dataType : "JSON",
				data : {
					"schoolCode" : selectedSchoolCode
				} // 검색 키워드
				,
				success : function(data) { // 성공
					// 기존에 목록이 있을 경우 select의 하위 자식 element 삭제
					$("#departList").empty();
					var departList = data.departList;
					$("#departList").append("<option selected='selected'>부서(반)을 선택해주세요</option>");
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