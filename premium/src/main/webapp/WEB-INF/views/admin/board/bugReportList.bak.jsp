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
		display: flex;
    	align-items: center;
	}
}
@media screen and (min-height: 1081px) and (max-height: 1440px){
	.gridHeight{
		display: flex;
    	align-items: center;
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

.right-space{
    padding-top: 20px;
    padding-left: 20px;
}


.table{
	text-align: center;
	margin-top: 2%;
	width: 97%;
}

.table th{
	vertical-align: middle;
	background-color: #333333;
	font-weight: bold;	
	color: #ffffff;
}

.table th.tb-seq{
 	width: 150px;
 }
.table th.tb-title{
	width: auto;
}
.table th.tb-writer{
	width: 120px;
}
.table th.tb-rgstDt{
	width: 120px;
}
.table th.tb-status{
	width: 70px;
}
.table td:nth-child(2){
	text-align: left;
}

/* .table tr{ */
/* 	border : 2px solid #000000; */
/* } */

.table th, .table td {
    vertical-align: middle;
    height: 35px;
    padding: 0;
    border: 1px solid #495057;
}

.td-boardTitle:hover{
    cursor: pointer;
}

.td-boardRgstDt{
	font-size: 12px;
}

.tb-boardStatus{
	display: flex;
    justify-content: center;
    align-items: center;
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
												버그리포트 목록
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
<!-- 								<section class="main-section"> -->
<!-- Board Row -->
									<table class="table table-bordered">
										<tr>
											<th class="tb-seq">번호</th>
											<th class="tb-title">제목</th>
											<th class="tb-writer">작성자</th>
											<th class="tb-rgstDt">작성일</th>
											<th class="tb-status">상태</th>
										</tr>
										<c:forEach items="${ list }" var="board">
										<tr class="">
											<td>${board.boardSeq }</td>
											<td class="td-boardTitle" style="padding-left: 15px;" onclick="location.href='/admin/board/bugReportView.do?boardSeq=${board.boardSeq}'">
													${board.boardTitle}
												<!-- 댓글 표시 -->
<%-- 												<c:if test="${ board.isNew < (2 / 24)}"> --%>
												<i class="fas fa-fw fa-bug"></i>
<%-- 												</c:if> --%>
											</td>
											<td>${board.userName}</td>
											<td class="td-boardRgstDt">${board.boardRgstDt}</td>
											<td class="tb-boardStatus" style="border: 0px;">
												${board.boardStatusHtml}
											</td>
										</tr>
										</c:forEach>
									</table>
					
									<div class="btns">
										<button type="button" class="btn btn-primary" onclick="location.href='/admin/board/insertBugReport';">버그리포트 작성</button>
									</div>
<!-- 								</section>	 -->
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
	
	$("#grid").jqGrid({
		url : "/admin/statistics/selectUserMeasureList.do?userType=${userType}",
		datatype : "json",
		styleUI: 'Foundation',
		contentType: "application/json; charset=utf-8",
		colNames : colNameArray,
		colModel: [
						{
							name:'userName',
							index:'userName',
							width:'16%',
							align:"center"
						}
						,{
							name:'userId',
							index:'userId',
							width:'16%',
							align:'center'
						}
						,{
							name:'schoolName',
							index:'schoolName',
							width:'16%',
							align:'center'
						}
						,{
							name:'className',
							index:'className',
							width:'16%',
							align:'center'
						}
						,{
							name:'measureDt',
							index:'measureDt',
							width:'16%',
							align:'center'
						}
						,{
							name:'schoolCode',
							index:'schoolCode',
							align:'center',
							hidden:true
							
						}
						,{
							name:'classCode',
							index:'classCode',
							align:'center',
							hidden:true
						}
						,{
							name:'userType',
							index:'userType',
							align:'center',
							hidden:true
						}
					],
		//caption : "Loading...",	// 로딩 중 일때 표시되는 텍스트
		pager : $('#pager'),
		rowNum : 25,	// 보여 줄 행의 개수
		loadonce:true,
		height : 769, // 그리드의 높이를 해상도 변경에 따라 변하도록 변경해줘야함
		autowidth : true, // 가로 크기 자동 조절
		rownumbers : true, // 행 번호
		multiselect:true, // checkbox
		loadComplete: function(data){
	        $("#nodata").remove();
	        if(data.rows.length == 0){
	            $("#grid.ui-jqgrid-btable").after("<p id='nodata' style='margin-top:3%;text-align:center;font-weight:bold;font-size:14px;'>조회 결과가 없습니다.</p>");
	        }
		},
		ondblClickRow : function(rowId, iRow, iCol, e){ 
			var rowData = $("#grid").getRowData(rowId);
			if (rowData.userType == '학생') {
				var userName = rowData.userName;
				var userId = rowData.userId;
				var measureDt = rowData.measureDt;
				var schoolCode = rowData.schoolCode;
				var schoolName = rowData.schoolName;
				var className = rowData.className;
	//			var url = '/admin/statistics/diagnosis?userId='+userId+'&userName='+userName+'&measureDt='+measureDt+'&schoolName='+schoolName+'&schoolCode='+schoolCode+'&className='+className;
				var url = 'http://premium.smartooth.co:8094/admin/school/statistics/diagnosis.do?userId='+userId+'&measureDt='+measureDt+'&schoolCode='+schoolCode;
// 				var url = 'http://localhost:8094/admin/school/statistics/diagnosis.do?userId='+userId+'&measureDt='+measureDt+'&schoolCode='+schoolCode;
				window.open(url, '결과지', 'width=780, height=930, scrollbars=no, resizable=no, toolbars=no, menubar=no');
			} else {
				alert('준비중');
			}
		}
		
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