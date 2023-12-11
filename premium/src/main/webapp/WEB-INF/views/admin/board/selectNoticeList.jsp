<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="author" content="㈜스마트코리아" />
<meta name="description" content="Smartooth" />
<title>㈜스마트코리아 - 공지사항 및 이벤트</title>
<!-- favicon ico 에러 -->
<link rel="shortcut icon" type="image/x-icon"
	href="/imgs/common/logo_img_ori.png">
<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">
<link rel="stylesheet" href="css/common/sb-admin-2.css">
<link rel="stylesheet" type="text/css" href="css/jquery/jquery-ui.css" />
<link rel="stylesheet" href="css/jquery/jqgrid/ui.jqgrid.css">
<link rel="stylesheet" href="/css/common/layout.css">
<!-- html2canvase -->
<!-- jQuery -->
<script type="text/javascript" src="js/jquery/jquery.js"></script>
<script type="text/javascript" src="js/jquery/jquery-ui.js"></script>
<!-- jqGrid -->
<script type="text/javascript"
	src="js/jquery/jqgrid/i18n/grid.locale-kr.js"></script>
<script type="text/javascript"
	src="js/jquery/jqgrid/minified/jquery.jqGrid.min.js"></script>
<!-- Element Css -->
<style type="text/css">
.text-gray-333 {
	color: #333333 !important;
}

.mb-4 {
	height: 70px;
}

.organList {
	padding-left: 2rem;
	padding-right: 2rem;
	padding-top: 0.8rem;
}

.gridHeight {
	height: 750px;
}

#searchType {
	width: 120px;
	float: left;
	font-size: 14px;
}

#searchData {
	width: 230px;
	float: left;
	margin-left: 10px;
	font-size: 14px;
}

#search {
	float: none;
}

.button {
	width: 10%;
	float: left;
	margin-left: 10px;
	background-color: #333333;
	border-color: #333333;
	font-size: 14px;
}

.right-space {
	display: flex;
	padding-top: 20px;
	padding-left: 20px;
}

.searchDt {
	width: 400px;
	text-align: center;
}

.ui-datepicker-trigger {
	margin-left: 5px;
	width: 20px;
}

.hasDatepicker {
	text-align: center;
	width: 120px;
	border-radius: 5px;
	border: 1px solid #333333;
	height: 33px;
	font-size: 15px;
}

.period {
	width: 65px;
}

/* jqGrid css */
.ui-jqgrid .ui-jqgrid-htable {
	font-family: 'NanumSquareR';
}

.ui-jqgrid-btable, .ui-pg-table {
	font-family: 'NanumSquareR';
	/* font-size: 14px; */
}

.ui-jqgrid .ui-jqgrid-btable:hover {
	cursor: pointer;
}

.ui-jqgrid .ui-state-highlight {
	color: #000000;
	background: #B0D3F2;
}

.td-boardStatus{
	display: flex;
	justify-content: center;
	align-items: center;
	border-radius: 0.3rem;
	color: #ffffff;
	width: 100%;
	height: 80%;
}

.td-boardRequestStatus{
	display: flex;
    justify-content: center;
    align-items: center;
    border-radius: 0.3rem;
    color: #ffffff;
    width: 8%;
    height: 80%;
    margin-right: 20px;
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
												공지사항 및 이벤트
											</div>
										</div>
										<div class="col-auto">
											<i class="fa fa-exclamation-triangle" aria-hidden="true"></i>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- Content Row -->
					<div class="row">
						<!-- jqGrid -->
						<div class="col-xl-12">
							<div class="card shadow mb-4 gridHeight">
								<div>
									<div class="right-space">
										<select class="form-control " id="searchType">
											<option value="boardTitle" selected>제목</option>
											<option value="userName">작성자</option>
										</select> <input type="text" id="searchData" class="form-control">
<!-- 										<div class="searchDt"> -->
<!-- 											조회 기간 &nbsp;&nbsp; -->
<!-- 											<input type="text" id="startDt" name="startDt" placeholder="시작일" /> ~ <input type="text" id="endDt" name="endDt" placeholder="종료일" /> -->
<!-- 										</div> -->
										<button class="btn btn-info btn-fill button" id="search" value="검색" onclick="onSubmit()">검색</button>
									</div>
								</div>
								<!-- Card Body -->
								<div class="card-body">
									<div class="grid-area">
										<table id="grid"></table>
										<div id="pager"></div>
									</div>
									<div class="regist">
										<button type="button" class="btn btn-info btn-fill button" style="margin: 0px; margin-top: 20px; width: 11%;" onclick="location.href='/admin/board/insertNotice';">공지사항 작성</button>
									</div>
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
		$(document).ready(function() {

			$(window).on('resize.jqGrid',function() {
				// jqGrid 반응형으로 사이즈 조정하는 function
				jQuery("#grid").jqGrid('setGridWidth',($(".grid-area").width()));
			});

			var colNameArray =
				[ 
					'등록번호', '분류', '제목', '작성자', '작성일', '이벤트 시작일', '이벤트 종료일'
				];

			$("#grid").jqGrid(
				{
					url : "/admin/board/selectNoticeList.do",
					datatype : "json",
					styleUI : 'Foundation',
					contentType : "application/json; charset=utf-8",
					colNames : colNameArray,
					colModel : [ {
						name : 'boardSeq',
						index : 'boardSeq',
						width : '12%',
						align : "center"
					}, {
						name : 'boardType',
						index : 'boardType',
						width : '10%',
						align : 'center'
					}, {
						name : 'boardTitle',
						index : 'boardTitle',
						cellattr: function () { return " style='display:flex; justify-content:center; align-items:center; border: 1px solid #ffffff;'" },
						width : '40%',
						align : 'center'
					}, {
						name : 'userName',
						index : 'userName',
						width : '13%',
						align : 'center'
					}, {
						name : 'boardRgstDt',
						index : 'boardRgstDt',
						width : '15%',
						align : 'center'
					}, {
						name : 'boardEventStartDt',
						index : 'boardEventStartDt',
						width : '15%',
						align : 'center'
					}, {
						name : 'boardEventEndDt',
						index : 'boardEventEndDt',
						width : '15%',
						align : 'center'
					}
					],
					//caption : "Loading...",	// 로딩 중 일때 표시되는 텍스트
					pager : $('#pager'),
					rowNum : 25, // 보여 줄 행의 개수
					loadonce : true,
					height : 769, // 그리드의 높이를 해상도 변경에 따라 변하도록 변경해줘야함
					autowidth : true, // 가로 크기 자동 조절
					rownumbers : true, // 행 번호
					onSelectRow : function(rowId, iRow, iCol, e) {
						var rowData = $("#grid").getRowData(rowId);
						var boardSeq = rowData.boardSeq;
						window.location.href='/admin/board/selectNoticeView.do?boardSeq='+boardSeq;
					}
				});
		});

		// 검색
		function onSubmit() {

			// 이름, 기관명, 아이디
			var searchType = $("#searchType").val();
			var searchData = $("#searchData").val();
			// 기간		
			var startDt = $("#startDt").val();
			var endDt = $("#endDt").val();

			if (startDt == null && startDt == "" && endDt != null
					&& endDt != "") {
				alert("시작일을 입력해주세요.");
				$("#startDt").focus();
				return false;
			}
			if (endDt == null && endDt == "" && startDt != null
					&& startDt != "") {
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
				,minDate : "-1Y" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
				,maxDate : "+1M" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)                    
			});
			//input을 datepicker로 선언
			$("#startDt").datepicker();
			$("#endDt").datepicker();

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