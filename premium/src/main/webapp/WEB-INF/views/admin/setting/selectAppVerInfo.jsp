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
<title>㈜스마트코리아 :: 어플리케이션 버전 관리</title>
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
    width: 455px;
    height: 500px;
    padding: 30px;
    text-align: center;
    background-color: rgb(255, 255, 255);
    border-radius: 10px;
    box-shadow: 0 2px 3px 0 rgb(34 36 38 / 15%);
}


/**Modal 안의 div**/
.wrap-div{
    display: flex;
}
.div-td-left{
    margin-left: 6%;
    vertical-align: center;
    padding-top: 4px;
}
.div-td-right{
    margin-left: 10%;
    padding-bottom: 5%;
}


.text-gray-333{
	color: #333333 !important;
}

.mb-4{
	height: 70px;
}

.appVersionLogList{
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


#searchType1{
	width: 15%;
    float: left;
    font-size: 14px;
}

#searchType2{
/* 	width: 30%; */
/* 	float: left; */
/* 	margin-left: 10px; */
/*     font-size: 14px; */
    float: left;
    margin-left: 10px;
    font-size: 14px;
    width: 20%;
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
                    <!-- Page Heading -->
<!--                     <div class="d-sm-flex align-items-center justify-content-between mb-4" style="padding-top: 5px;"> -->
<%--                         <h1 class="h3 mb-0 text-gray-800"></h1> --%>
<!--                         <a href="#" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i -->
<!--                                 class="fas fa-download fa-sm text-white-50"></i> Generate Report</a> -->
<!--                     </div> -->

                    <!-- Content Row -->
                    <div class="row">

                        <!-- Earnings (Monthly) Card Example -->
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-primary shadow h-100 py-2">
                                <div class="card-body appVersionLogList">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">

<!-- 충치 갯수 차트 -->
<!-- 선생님 일 경우 , 반에 대한 정보를 -->
<!-- 부모일 경우 아이의 정보를 기입하도록 변경-->
<!-- 현재는 하드코딩으로 진행 -->
												App 버전 관리

                                             </div>
                                        </div>
                                        <div class="col-auto">
                                             <i class="fa fa-mobile  fa-2x text-gray-333"></i>
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
									    <select class="form-control seachType" id="searchType1">
									      	<option value="" selected>OS 전체</option>
									        <option value="AOS">안드로이드</option>
									        <option value="IOS">IOS</option>
									    </select>
										<select class="form-control seachType" id="searchType2">
											<option value="" selected>서비스 전체</option>
											<option value="8090">치과병원서비스</option>
											<option value="8091">유치원서비스</option>
										</select>
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
<c:if test="${userInfo.userType eq 'SU'}">
                                    <div class="regist">
	                                    <button class="btn btn-info btn-fill button" id="regist" value="등록" style="margin:0px; margin-top: 12px;" onclick="">
	                                    	등록
	                                    </button>
                                    </div>
                                    <div class="delete">
	                                    <button class="btn btn-info btn-fill button" id="delete" value="삭제" style="margin:0px; margin-top: 12px; margin-left: 20px;" onclick="deleteRow()">
	                                    	삭제
	                                    </button>
                                    </div>
</c:if>

<!-- 등록 모달 : Modal -->
<div id="insertModal" class="modal">
	<div class="modal_body">
		<h4>버전 정보 등록</h4>
		<div style="height:30px;"></div>
		<form method="post" id="frm">
			<div class="wrap-div">
				<div class="div-td-left">
					앱 종류&nbsp;&nbsp;&nbsp;&nbsp;:
				</div>
				<div class="div-td-right">
					<select id="appType" name="appType" class=" ">
						<option value="">선택해주세요</option>
						<option value="AOS">안드로이드</option>
						<option value="IOS">IOS</option>
					</select>
				</div>
			</div>
			<div class="wrap-div">
				<div class="div-td-left">
					서비스 종류&nbsp;&nbsp;&nbsp;&nbsp;:
				</div>
				<div class="div-td-right">
					<select id="serviceCode" name="serviceCode" class=" ">
						<option value="">선택해주세요</option>
						<option value="8090">치과병원서비스</option>
						<option value="8091">유치원서비스</option>
					</select>
				</div>
			</div>
			<div class="wrap-div">
				<div class="div-td-left">
					버전코드&nbsp;&nbsp;&nbsp;&nbsp;:
				</div>
				<div class="div-td-right">
					<input id="versionCode" name="versionCode" type="text" style="text-align: center;" placeholder="입력해주세요.">
				</div>
			</div>			
			<div class="wrap-div">
				<div class="div-td-left">
					버전이름&nbsp;&nbsp;&nbsp;&nbsp;:
				</div>
				<div class="div-td-right">
					<input id="versionName" name="versionName" type="text" style="text-align: center;" placeholder="입력해주세요.">
				</div>
			</div>	
			<div class="wrap-div">
				<div class="div-td-left">
					배포URL&nbsp;&nbsp;&nbsp;&nbsp;:
				</div>
				<div class="div-td-right">
					<input id="installUrl" name="installUrl" type="text" style="text-align: center;" placeholder="입력해주세요." value="https://www.smartooth.co/download">
				</div>
			</div>	
			<div class="wrap-div">
				<div class="div-td-left">
					강제업데이트 여부&nbsp;&nbsp;&nbsp;&nbsp;:
				</div>
				<div class="div-td-right">
					<select id="installOption" name="installOption" class=" ">
						<option value="">선택해주세요</option>
						<option value="0">일반업데이트</option>
						<option value="1">강제업데이트</option>
					</select>
				</div>
			</div>
			<div style="height:10px;"></div>
			<div>
				<input type="button" id="regist" onclick="opSubmit();"
					class="btn btn-info btn-fill" value="등록">
			</div>
		</form>
	</div>
</div>
<!-- 수정 모달 : Modal -->
<div id="editModal" class="modal">
	<div class="modal_body">
	<h4>버전 정보 등록</h4>
	<div style="height:30px;"></div>
		<form method="post" id="frm">
			<div class="wrap-div">
				<div class="div-td-left">
					앱 종류&nbsp;&nbsp;&nbsp;&nbsp;:
				</div>
				<div class="div-td-right">
					<select id="appType" name="appType" class=" ">
						<option value="">선택해주세요</option>
						<option value="AOS">안드로이드</option>
						<option value="IOS">IOS</option>
					</select>
				</div>
			</div>
			<div class="wrap-div">
				<div class="div-td-left">
					서비스 종류&nbsp;&nbsp;&nbsp;&nbsp;:
				</div>
				<div class="div-td-right">
					<select id="serviceCode" name="serviceCode" class=" ">
						<option value="">선택해주세요</option>
						<option value="8090">치과병원서비스</option>
						<option value="8091">유치원서비스</option>
					</select>
				</div>
			</div>
			<div class="wrap-div">
				<div class="div-td-left">
					버전코드&nbsp;&nbsp;&nbsp;&nbsp;:
				</div>
				<div class="div-td-right">
					<input id="versionCode" name="versionCode" type="text" style="text-align: center;" placeholder="입력해주세요.">
				</div>
			</div>			
			<div class="wrap-div">
				<div class="div-td-left">
					버전이름&nbsp;&nbsp;&nbsp;&nbsp;:
				</div>
				<div class="div-td-right">
					<input id="versionName" name="versionName" type="text" style="text-align: center;" placeholder="입력해주세요.">
				</div>
			</div>	
			<div class="wrap-div">
				<div class="div-td-left">
					배포URL&nbsp;&nbsp;&nbsp;&nbsp;:
				</div>
				<div class="div-td-right">
					<input id="installUrl" name="installUrl" type="text" style="text-align: center;" placeholder="입력해주세요.">
				</div>
			</div>	
			<div class="wrap-div">
				<div class="div-td-left">
					강제업데이트 여부&nbsp;&nbsp;&nbsp;&nbsp;:
				</div>
				<div class="div-td-right">
					<select id="installOption" name="installOption" class=" ">
						<option value="">선택해주세요</option>
						<option value="0">일반업데이트</option>
						<option value="1">강제업데이트</option>
					</select>
				</div>
			</div>
			<div style="height:10px;"></div>
			<div>
				<input type="button" id="regist" onclick="opSubmit();"
					class="btn btn-info btn-fill" value="등록">
			</div>
		</form>
	</div>
</div>

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
	
	var userId = "${userInfo.userId}";
	document.getElementById("input_userId").value = userId;
	
	$(window).on('resize.jqGrid', function (){
		// jqGrid 반응형으로 사이즈 조정하는 function
		jQuery("#grid").jqGrid( 'setGridWidth', ($(".grid-area").width()));
		// jQuery("#grid").jqGrid( 'setGridHeight', ($(".a1").height()));
	});

	var colOptions =  [
		{colName : '순번', name:'seq', index:'0', align:'center', width:'5%'},
		{colName : 'OS', name:'appType', index:'1', align:'center', width:'10%'},
		{colName : '버전코드', name:'versionCode', index:'2', align:'center', width:'5%'},
		{colName : '버전이름', name:'versionName', index:'3', align:'center', width:'10%'},
		{colName : '서비스코드', name:'serviceCode', index:'4', align:'center', width:'8%'},
		{colName : '서비스이름', name:'serviceName', index:'5', align:'center', width:'10%'},
		{colName : '등록일', name:'regDate', index:'9', align:'center', width:'15%'},
		{colName : '강제업데이트', name:'installOptionName', index:'7', align:'center', width:'9%'},
		{colName : '배포URL', name:'installUrl', index:'8', align:'center', width:'20%'},
		{colName : '등록아이디', name:'regId', index:'10', align:'center', width:'8%'},
		{colName : '강제업데이트코드', name:'installOption', index:'8', align:'center', width:'0%', hidden:true}
	];	

	$("#grid").jqGrid({
		url : "/admin/setting/ajaxSelectAppVersion.do",
		datatype : "json",
		styleUI: 'Foundation',
		contentType: "application/json; charset=utf-8",
		colNames : colOptions.map(function(item){return item.colName;}),
		colModel : colOptions,
		//caption : "Loading...",	// 로딩 중 일때 표시되는 텍스트
		pager : $('#pager'),
		rowNum : 25,	// 보여 줄 행의 개수
		sortable: true,
		loadonce:true,
		height : 769, // 그리드의 높이를 해상도 변경에 따라 변하도록 변경해줘야함
		autowidth : true, // 가로 크기 자동 조절
		rownumbers : true, // 행 번호
		multiselect: false, // checkbox
		loadComplete: function(data){
	        $("#nodata").remove();
	        if(data.rows.length == 0){
	            $("#grid.ui-jqgrid-btable").after("<p id='nodata' style='margin-top:3%;text-align:center;font-weight:bold;font-size:14px;'>조회 결과가 없습니다.</p>");
	        }
		}
	});
});

	// 검색 
	function onSubmit(){	
		var searchType1 = $("#searchType1").val();
		var searchType2 = $("#searchType2").val();
		var postData = {
			'appType' : searchType1,
			'serviceCode' : searchType2,
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
		
		var appType = document.getElementById("appType");
		var serviceCode = document.getElementById("serviceCode");
		var installOption = document.getElementById("installOption");

		var versionCode = document.getElementById("versionCode");
		var versionName = document.getElementById("versionName");
		var installUrl = document.getElementById("installUrl");
		
		var selAppType = appType.options[appType.selectedIndex].value;
		var selServiceCode = serviceCode.options[serviceCode.selectedIndex].value;
		var selServiceName = serviceCode.options[serviceCode.selectedIndex].text;
		var selInstallOption = installOption.options[installOption.selectedIndex].value;

		if (selAppType == "") {
			alert("배포할 앱 형태를 선택하세요.");
			$("#appType").focus();
			return false;
		}
		
		if (selServiceCode == "") {
			alert("배포할 앱의 서비스를 선택하세요.");
			$("#serviceCode").focus();
			return false;
		}
		if (installOption == "") {
			alert("배포할 앱의 강제업데이트여부를 선택하세요.");
			$("#installOption").focus();
			return false;
		}
		if (versionCode == "") {
			alert("버전코드를 입력하세요.");
			$("#versionCode").focus();
			return false;
		}
		if (selServiceName == "") {
			alert("버전이름을 입력하세요.");
			$("#selServiceName").focus();
			return false;
		}

		var jsonString = JSON.stringify({ //변수에 담긴 데이터를 전송해준다 (JSON 방식)
	            	"appType" : selAppType,
	            	"versionCode" : versionCode.value,
	            	"versionName" : versionName.value,
	            	"serviceCode" : selServiceCode,
	            	"serviceName" : selServiceName,
	            	"installOption" : selInstallOption,
	            	"installUrl" : installUrl.value,
	            	"regId" : document.getElementById("input_userId").value
		});
		
// 		if($("#dentistName").val() != null && $("#dentistName").val() == ""){
// 			alert("자문치과의 전화번호를 입력해주세요.");
// 			$("#dentistName").focus();
// 			return false;
// 		}
		
		
		if(window.confirm("버전타입 : "+ appType.options[appType.selectedIndex].text + 
		"\n"+"버전코드 : " + versionCode + 
		"\n"+"버전이름 : " + versionName + 
		"\n"+"서비스이름 : " + selServiceName + 
		"\n"+"배포옵션 : " + installOption.options[installOption.selectedIndex].text + 
		"\n"+"배포URL : " + installUrl + 
		"\n입력하신 정보가 맞습니까?") ==true){
			$.ajax({
	            type : 'POST', 
	            url : "/admin/setting/insertAppVersionInfo.do",
	            data : jsonString, 
				dataType : 'JSON', //데이터 타입 JSON
				contentType : "application/json; charset=UTF-8",
	            success : function(data, statusText, jqXHR) {
	                alert("앱 버전 정보 등록이 완료되었습니다.");
	                insertModal.classList.toggle('show');
	                body.style.overflow = 'auto';
	                location.reload();
	            },
	            error : function(jqXHR, textStatus, errorThrown) {
	                alert("앱 버전 정보 등록에 실패하였습니다. 관리자에게 문의 부탁드립니다.");
	                insertModal.classList.toggle('show');
	                body.style.overflow = 'auto';
	                location.reload();
	            }
	        });
		}else{
			return false;
		}
	}
	
	function deleteRow(){

		var id = $("#grid").getGridParam('selrow');
		var rowdata = $("#grid").getRowData(id);
		var selRow = rowdata.seq;
		if (isNaN(selRow)) {
			alert('삭제할 데이터를 선택해 주세요.');
			return;
		}
				
		if(window.confirm("[" + selRow + "]번의 데이터을 삭제하시겠습니까?") == true){
			var message = "";
		    var id = $("#grid").getGridParam('selrow');
			var rowdata = $("#grid").getRowData(id);
		    
		    // for (var i = 0; i < id.length; i++) {
			// 	var rowdata = $("#grid").getRowData(id[i]);
			// 	seqArray[i] = rowdata.seq;
		    // }
		
		    $.ajax({
				type : 'POST', //post 방식으로 전송
				url : '/admin/setting/deleteAppVersionInfo.do', //데이터를 주고받을 파일 주소
				data:JSON.stringify ({ //변수에 담긴 데이터를 전송해준다 (JSON 방식)
					"seq" : selRow
				}),
				dataType : 'JSON', //데이터 타입 JSON
				contentType : "application/json; charset=UTF-8",
				success : function(data) { //파일 주고받기가 성공했을 경우. data 변수 안에 값을 담아온다.
					alert("삭제가 완료되었습니다.");
					location.reload();
				},
				error : function(error){
					alert("삭제에 실패하였습니다. 관리자에게 문의 부탁드립니다.");
					location.reload();
		        }
			});
		}else{
			return false;
		}
	}
	
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