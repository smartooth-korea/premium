<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="author" content="㈜스마트코리아" />
<meta name="description" content="Smartooth" />
<title>㈜스마트코리아 - 치과서비스 환자 치아 측정 값 조회</title>
<!-- favicon ico 에러 -->
<link rel="shortcut icon" type="image/x-icon" href="/imgs/common/logo_img_ori.png">
<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
<link rel="stylesheet" href="css/common/sb-admin-2.css">
<link rel="stylesheet" type="text/css" href="css/jquery/jquery-ui.css" />
<link rel="stylesheet" href="css/jquery/jqgrid/ui.jqgrid.css">
<link rel="stylesheet" href="/css/common/layout.css">
<!-- html2canvase -->
<!-- jQuery --> 
<script type="text/javascript" src="js/jquery/jquery.js"></script>
<script type="text/javascript" src="js/jquery/jquery-ui.js"></script>
<!-- jqGrid -->
<script type="text/javascript" src="js/jquery/jqgrid/i18n/grid.locale-kr.js"></script>
<script type="text/javascript" src="js/jquery/jqgrid/minified/jquery.jqGrid.min.js"></script>
<!-- Element Css -->
<style type="text/css">

.modal {
  position: absolute;
  top: 0;
  left: 0;

  width: 100%;
  height: 100%;

  display: none;

  background-color: rgba(0, 0, 0, 0.4);
}

.modal.show {
  display: block;
}

.modal_body {
  position: absolute;
  top: 50%;
  left: 50%;
  width: 400px;
  height: 470px;
  padding: 40px;
  text-align: center;
  background-color: rgb(255, 255, 255);
  border-radius: 10px;
  box-shadow: 0 2px 3px 0 rgba(34, 36, 38, 0.15);

  transform: translateX(-50%) translateY(-50%);
}


/**Modal 안의 div**/
.wrap-div{
    display: flex;
}
.div-td-left{
    margin-left: 10%;
    vertical-align: center;
    padding-top: 4px;
}
.div-td-right{
    margin-left: 10%;
    padding-bottom: 10%;
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

.gridHeight{
	height: 750px;
}

#searchType{
	width: 120px;
    float: left;
    font-size: 14px;
}

#searchData{
	width: 230px;
	float: left;
	margin-left: 10px;
    font-size: 14px;
}

#search{
	float: none;
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
	display: flex;
    padding-top: 20px;
    padding-left: 20px;
}

.searchDt{
	width: 400px;
    text-align: center;
}

.ui-datepicker-trigger{
	margin-left: 5px;
	width: 20px;
}

.hasDatepicker{
	text-align: center;
    width: 120px;
    border-radius: 5px;
    border: 1px solid #333333;
    height: 33px;
    font-size: 15px;
}

.period{
	width: 65px;
}

/* jqGrid css */
.ui-jqgrid .ui-jqgrid-htable{
	font-family : 'NanumSquareR';
}
.ui-jqgrid-btable, .ui-pg-table  {
	font-family : 'NanumSquareR';
	/* font-size: 14px; */
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
												치과서비스 환자 치아 측정 값 조회
                                             </div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fa fa-file fa-2x text-gray-333" aria-hidden="true"></i>
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
									<div class="right-space">
									    <select class="form-control " id="searchType">
									        <option value="userName" selected>이름</option>
									      	<option value="userId" >아이디</option>
									      	<option value="schoolName" >기관명</option>

<!-- 지역 검색이 되도록 나중에 변경 -->
<!-- <option value="SIGUNGU_NM">지역(시군구)</option> -->
<!-- <option value="EUPMYEONDONG_NM">지역(읍면동)</option> -->

									    </select>
									    <input type ="text" id="searchData" class ="form-control">
									    <div class="searchDt">
									    		조회 기간	&nbsp;&nbsp;			    	
									    	<input type="text" id="startDt" name="startDt" placeholder="시작일"/> ~ <input type="text" id="endDt" name="endDt" placeholder="종료일"/>
									    </div>
									    <button class="btn btn-info btn-fill button period" id="search" value="1개월" onclick="settingDate('weeks')">
									      1개월
									    </button>
									    <button class="btn btn-info btn-fill button period" id="search" value="3개월" onclick="settingDate('months')">
									      3개월
									    </button>
									    <button class="btn btn-info btn-fill button period" id="search" value="1년" onclick="settingDate('years')">
									      1년
									    </button>
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
	                                    <button class="btn btn-info btn-fill button" id="regist" value="등록" style="margin:0px; margin-top: 20px;" onclick="">
	                                    	등록
	                                    </button>
                                    </div>
                                    <div class="delete">
	                                    <button class="btn btn-info btn-fill button" id="delete" value="삭제" style="margin:0px; margin-top: 20px; margin-left: 20px; float: left;" onclick="deleteRow()">
	                                    	삭제
	                                    </button>
                                    </div>
</c:if> 




<!-- Modal -->
<!-- <div class="modal"> -->
<!-- 	<div class="modal_body"> -->
<!-- 	<h4>사용자 등록</h4> -->
<!-- 	<div style="height:30px;"></div> -->
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
	
	// 그래프버튼
	var button = function(cellvalue, options, rowObject){
		return '<input type="button" style="width: 50px; height: 26px; font-size: 13px;" value="보기"/>';
		//onclick="selectGraphData('+cellvalue+')"
	}
	
	var userId = "${userId}";
	
	$(window).on('resize.jqGrid', function (){
		// jqGrid 반응형으로 사이즈 조정하는 function
		jQuery("#grid").jqGrid( 'setGridWidth', ($(".grid-area").width()));
		// jQuery("#grid").jqGrid( 'setGridHeight', ($(".a1").height()));
		
	});


	var colOptions =  [
		{colName : '이름', name:'userName', index:'userName', align:'center', width:'15%'},
		{colName : '아이디', name:'userId', index:'userId', align:'center', width:'15%'},
		{colName : '검사일', name:'measureDt', index:'measureDt', align:'center', width:'15%'},
		{colName : '검사자', name:'measureName', index:'measureName', align:'center', width:'15%'},
		{colName : '등록일', name:'userRgstDt', index:'userRgstDt', align:'center', width:'15%'},
	<c:choose>		
	<c:when test="${userInfo.userType eq 'SU'}">
		{colName : '치과이름', name:'schoolName', index:'schoolName', align:'center', width:'15%'},	
	</c:when>
	<c:otherwise>
		{colName : '치과이름', name:'schoolName', index:'schoolName', align:'center', width:'15%', hidden:true},	
	</c:otherwise>
	</c:choose>
		{colName : '', name:'schoolCode', index:'schoolCode', align:'center', width:'10%', hidden:true},
		{colName : '', name:'userType', index:'userType', align:'center', width:'10%', hidden:true},
		{colName : '', name:'className', index:'className', align:'center', width:'10%', hidden:true},
		{colName : '', name:'userRealId', index:'userRealId', align:'center', width:'10%', hidden:true}
	];
	
	
	$("#grid").jqGrid({
		url : "/admin/statistics/selectDentUserMeasureList.do",
		datatype : "json",
		styleUI: 'Foundation',
		contentType: "application/json; charset=utf-8",
		colNames : colOptions.map(function(item){return item.colName;}),
		colModel : colOptions,
		//caption : "Loading...",	// 로딩 중 일때 표시되는 텍스트
		pager : $('#pager'),
		rowNum : 25,	// 보여 줄 행의 개수
		loadonce:true,
		height : 769, // 그리드의 높이를 해상도 변경에 따라 변하도록 변경해줘야함
		autowidth : true, // 가로 크기 자동 조절
		rownumbers : true, // 행 번호
		multiselect:true, // checkbox
		
		ondblClickRow : function(rowId, iRow, iCol, e){ 
 		
			var rowData = $("#grid").getRowData(rowId);
			var userName = rowData.userName;
			var userId = rowData.userRealId;
			var measureDt = rowData.measureDt;
			var schoolCode = rowData.schoolCode;
			var schoolName = rowData.schoolName;
			var className = rowData.className;
			var url = 'http://premium.smartooth.co:8093/admin/statistics/diagnosis.do?userId='+userId+'&measureDt='+measureDt;
 			//var url = 'http://localhost:8093/admin/statistics/diagnosis.do?userId='+userId+'&measureDt='+measureDt;
			window.open(url, '결과지', 'width=435, height=660, scrollbars=no, resizable=no, toolbars=no, menubar=no');
		},

		onCellSelect : function(rowId, iCol, cellcontent, e) {
			if (iCol == 2) {
				var rowData = $("#grid").getRowData(rowId);
				var userName = rowData.userName;
				var userId = rowData.userRealId;
				var measureDt = rowData.measureDt;
				var schoolCode = rowData.schoolCode;
				var schoolName = rowData.schoolName;
				var className = rowData.className;
				var url = 'http://premium.smartooth.co:8093/admin/statistics/diagnosis.do?userId='+userId+'&measureDt='+measureDt;
				//var url = 'http://localhost:8093/admin/statistics/diagnosis.do?userId='+userId+'&measureDt='+measureDt;
				window.open(url, '결과지', 'width=435, height=660, scrollbars=no, resizable=no, toolbars=no, menubar=no');
			}
		},
		loadComplete: function(data){
	        $("#nodata").remove();
	        if(data.rows.length == 0){
	            $("#grid.ui-jqgrid-btable").after("<p id='nodata' style='margin-top:3%;text-align:center;font-weight:bold;font-size:14px;'>조회 결과가 없습니다.</p>");
	        }
		}
	});
});

	// 1달전, 3개월전, 1년전 날짜 세팅
	function settingDate(date){
		
		var today = new Date();
		//오늘 년, 월, 일
		var day = today.getDate();
		var month = today.getMonth();
		var year = today.getFullYear();
		var today = new Date().toISOString().substring(0, 10);
		
		//1달 전
		var weeks = new Date(new Date().setMonth(month-1)).toISOString().substring(0, 10);
		//3달 전
		var months = new Date(new Date().setMonth(month-3)).toISOString().substring(0, 10);
		//일년 전
		var years = new Date(new Date().setYear(year-1)).toISOString().substring(0, 10);

		if(date=="weeks"){
			$("#startDt").val(weeks);
		}else if(date == "months"){
			$("#startDt").val(months);
		}else if(date == "years"){
			$("#startDt").val(years);
		}
		$("#endDt").val(today);
	}
	
	// 검색
	function onSubmit(){	
		
		// 이름, 기관명, 아이디
		var searchType = $("#searchType").val();
		var searchData = $("#searchData").val();
		// 기간		
		var startDt = $("#startDt").val();
		var endDt = $("#endDt").val();
		
		if(startDt == null && startDt == "" && endDt != null && endDt != ""){
			alert("시작일을 입력해주세요.");
			$("#startDt").focus();
			return false;
		}
		if(endDt == null && endDt == "" && startDt != null && startDt != ""){
			alert("종료일을 입력해주세요.");
			$("#endDt").focus();
			return false;
		}
		
		var postData = {
			'searchType' : searchType,
			'searchData' : searchData,
			'startDt' : startDt,
			'endDt' : endDt
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
	
	$(function() {
         //모든 datepicker에 대한 공통 옵션 설정
         $.datepicker.setDefaults({
             dateFormat: 'yy-mm-dd' //Input Display Format 변경
             ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
             ,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시
             ,changeYear: true //콤보박스에서 년 선택 가능
             ,changeMonth: true //콤보박스에서 월 선택 가능                
             ,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
             ,buttonImage: "/imgs/icon/calendar.png" //버튼 이미지 경로
             ,buttonImageOnly: true //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
             ,buttonText: "날짜 선택" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트                
             ,yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
             ,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'] //달력의 월 부분 텍스트
             ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
             ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
             ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트
             ,minDate: "-1Y" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
             ,maxDate: "+1M" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)                    
		});

         //input을 datepicker로 선언
		$("#startDt").datepicker();
		$("#endDt").datepicker();
         
         //From의 초기값을 오늘 날짜로 설정
         //$('#startDt').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)
         //To의 초기값을 내일로 설정
         //$('#endDt').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)
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