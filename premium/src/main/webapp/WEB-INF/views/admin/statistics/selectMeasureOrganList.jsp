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
<title>㈜스마트코리아 - 측정 기관 목록 조회</title>
<!-- favicon ico 에러 -->
<link rel="shortcut icon" type="image/x-icon" href="/imgs/common/logo_img_ori.png">
<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="/css/common/layout.css">
<link rel="stylesheet" type="text/css" href="/css/common/sb-admin-2.css">
<link rel="stylesheet" type="text/css" href="css/jquery/jquery-ui.css" />
<link rel="stylesheet" href="/css/jquery/jqgrid/ui.jqgrid.css">
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
    width: 440px;
    height: 380px;
    padding: 50px;
    text-align: center;
    background-color: rgb(255, 255, 255);
    border-radius: 10px;
    box-shadow: 0 2px 3px 0 rgb(34 36 38 / 15%);
}


/**Modal 안의 div**/
.wrap-div{
    display: flex;
    justify-content: center;
    width: 342px;
}

.div-td-left{
    display: flex;
    align-items: center;
}

.div-td-right{
    display: flex;
    align-items: center;
    margin-left: 10px;
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

.right-space{
    padding-top: 20px;
    padding-left: 20px;
}

.ui-jqgrid .ui-state-highlight {
    background: #ffffff;
    color: #000000;
    border: 1px solid #dddddd;	
}

.ui-jqgrid::hover {
	background: #ffffff;
    color: #000000;
    border: 1px solid #dddddd;
}

.calcBtn{
	background-color: #333333;
    border-color: #333333;
    color: #fff;
    border: 1px solid transparent;
    padding: 0.375rem 0.75rem;
    border-radius: 0.35rem;
    width: 80px;
}

.ui-autocomplete {
	border: none;
	position: relative;
	background-color: #ffffff; 
	list-style:none;
	font-size: 11.5px;
	margin-bottom: 5px;
	padding-top: 2px;
	border: 1px solid #DDD !important;
	padding-top: 0px !important;
	padding-left: 5px;
    padding-right: 5px;
	z-index: 1511;
	line-height: 30px;
	width: 220px;
}

.ui-menu-item{
	margin-left: -30px;
	border-bottom: 1px dotted;
   	border-collapse: collapse;
}

.ui-helper-hidden-accessible{
	display: none;
}

.input-form{
    text-align: center;
    border-radius: 5px;
    border: 1px solid #333333;
    height: 30px;
    width: 250px;
}

input:focus{
	border-radius: 5px;
    border: 1px solid #333333;
}

/* datepicker 설정 */
input[type="date"] {
position: relative;
    background: url(/imgs/icon/icon-calendar.png) no-repeat;
    background-size: 20px 20px;
    background-position: right;
    height: 35px;
    width: 130px;
    padding-left: 17px;
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
		<jsp:include page="/WEB-INF/views/admin/layout/left.jsp"></jsp:include>
<!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">
<!-- Body-->
            <div id="content">
<!-- Top menu -->
			<jsp:include page="/WEB-INF/views/admin/layout/header.jsp"></jsp:include>


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
                                <div class="card-body organList">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">

<!-- 충치 갯수 차트 -->
<!-- 선생님 일 경우 , 반에 대한 정보를 -->
<!-- 부모일 경우 아이의 정보를 기입하도록 변경-->
<!-- 현재는 하드코딩으로 진행 -->
												측정 기관 목록 조회

                                             </div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-building fa-2x text-gray-333"></i>
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
									      	<option value="SCHOOL_NAME" selected>기관명</option>
									        <option value="SCHOOL_CODE">기관코드</option>
									        <option value="ORGAN_SIGUNGU_NM">지역(시군구)</option>
									        <option value="ORGAN_EUPMYEONDONG_NM">지역(읍면동)</option>
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
	<h4>측정 기관 등록</h4>
	<div class="commonHeight40"></div>
		<form method="post" id="frm">
				<div class="wrap-div">
					<div class="div-td-left">
						측정자명 : 
					</div>
					<div class="div-td-right">
						<input class="input-form" id="userName" name="userName" type="text" style="text-align: center;" placeholder="입력해주세요.">
					</div>
				</div>
				<div class="commonHeight20"></div>
				<div class="wrap-div">
					<div class="div-td-left">
						기관명 :
					</div>
					<div class="div-td-right">
						<input class="input-form" id="schoolName" name="schoolName" type="text" style="text-align: center;" placeholder="입력해주세요.">
					</div>
				</div>
				<div class="commonHeight20"></div>
				<div class="wrap-div">
					<div class="div-td-left">
						측정일(예정일) :
					</div>
					<div class="div-td-right">
						<input type="date" id="measureDt" name="measureDt" class="input-control" data-placeholder="날짜 선택">
					</div>
				</div>
				<div class="commonHeight30"></div>
				<div>
					<input type="button" onclick="opSubmit();"
						class="btn btn-info btn-fill" value="등록">
				</div>
				<input type="hidden" id="userId" name="userId" value=""/>
				<input type="hidden" id="schoolCode" name="schoolCode" value=""/>
		</form>
	</div>
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

function fn_graphBatch(rowid, schoolCode, measureDt){
	
	$.ajax({
		type : 'POST', //post 방식으로 전송
		url : '/admin/statistics/graphBatch.do', //데이터를 주고받을 파일 주소
 		data:JSON.stringify ({ //변수에 담긴 데이터를 전송해준다 (JSON 방식)
 			"schoolCode" : schoolCode
			,"measureDt" : measureDt
 		}),
 		dataType:'JSON',   //json 파일 형식으로 값을 담아온다.
		contentType : "application/json; charset=UTF-8",
		success : function(data) { //파일 주고받기가 성공했을 경우. data 변수 안에 값을 담아온다.
			alert("성공");
		}
	});
	
}

$(document).ready(function(){
	var userId = "${userId}";
	
	$(window).on('resize.jqGrid', function (){
		// jqGrid 반응형으로 사이즈 조정하는 function
		jQuery("#grid").jqGrid( 'setGridWidth', ($(".grid-area").width()));
		// jQuery("#grid").jqGrid( 'setGridHeight', ($(".a1").height()));
	});
	
	var colNameArray = 
		[
			'측정자명'
			,'측정자아이디'
			,'측정일'
			,'기관이름'
			,'기관코드'
			,'시도'
			,'시군구'
			,'읍면동'
			,'통계여부'
			,''
		];

	$("#grid").jqGrid({
		url : "/admin/statistics/selectMeasureOrganList.do",
		datatype : "json",
		styleUI: 'Foundation',
		contentType: "application/json; charset=utf-8",
		colNames : colNameArray,
		colModel: [
						{
							name:'userName',
							index:'userName',
							width:'17%',
							align:"center"
						},
						{
							name:'userId',
							index:'userId',
							width:'17%',
							align:"center"
						}
						,{
							name:'measureDt',
							index:'measureDt',
							width:'10%',
							align:"center",
							key: true
						}
						,{
							name:'schoolName',
							index:'schoolName',
							width:'17%',
							align:'center'
						}
						,{
							name:'schoolCode',
							index:'schoolCode',
							width:'13%',
							align:"center",
							key: true
						}
						,{
							name:'organSidoNm',
							index:'organSidoNm',
							width:'9%',
							align:'center'
						}
						,{
							name:'organSigunguNm',
							index:'organSigunguNm',
							width:'9%',
							align:'center'
						}
						,{
							name:'organEupmyeondongNm',
							index:'organEupmyeondongNm',
							width:'9%',
							align:'center'
						}
						,{
							name:'isGraphBatched',
							index:'isGraphBatched',
							width:'9%',
							align:'center'
						}
						,{
							name:'isGraphBatched',
							index:'isGraphBatched',
							width:'7%',
							align:'center',
							formatter: calcBtn
						}
					],
		//caption : "Loading...",	// 로딩 중 일때 표시되는 텍스트
		pager : $('#pager'),
		rowNum : 25,	// 보여 줄 행의 개수
		loadonce:true,
		height : 769, // 그리드의 높이를 해상도 변경에 따라 변하도록 변경해줘야함
		autowidth : true, // 가로 크기 자동 조절
		rownumbers : true, // 행 번호
		multiselect:false // checkbox
		,loadComplete: function(data){
	        $("#nodata").remove();
	        if(data.rows.length == 0){
	            $("#grid.ui-jqgrid-btable").after("<p id='nodata' style='margin-top:3%;text-align:center;font-weight:bold;font-size:14px;'>조회 결과가 없습니다.</p>");
	        }
		}
	});
	
	function calcBtn(cellvalue, options, rowObject){
		var str = "";
		var row_id = options.rowId;
		var idx = rowObject.idx;
	
		var schoolCode = rowObject.schoolCode;
		var measureDt = rowObject.measureDt;
		
		str += "<div class='btn-group'>";
		str += "<button type='button' class='btn btn-info btn-fill calcBtn' onclick=\"javascript:fn_graphBatch('" + row_id + "','"+schoolCode+"','"+measureDt+"')\">측정 완료 </button>";
		str += "</div>";
		return str;
	}
	
	
});


	// 검색 
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
	
	
	$('#userName').autocomplete({
		source : function(request, response) { //source: 입력시 보일 목록
		     $.ajax({
		           url : "/admin/user/ajaxSelectMeasureUserList.do"   
		         , type : "POST"
		         , dataType: "JSON"
		         , data : {value: request.term}	// 검색 키워드
		         , success : function(data){ 	// 성공
		             response(
		                 $.map(data.measureUserList, function(item) {
		                	 
		                	 var seq = item.SEQ;
		                	 var measureId = item.USER_ID;
		                	 var measureName = item.USER_NAME;
		                	 
		                     return {
									label : measureName + '\n\n('+measureId+')'     	// 목록에 표시되는 값
									,value : measureName		// 선택 시 input창에 표시되는 값
									,idx : seq // index
 									,measureId : measureId
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
	    	$('#userId').attr("value", ui.item.measureId);
	    },
	    delay: 300
	});
	
	
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
	    },
	    delay: 300
	});
	
	
	// 측정 기관 등록
	function opSubmit(){
		
		if ($("#userName").val() == "") {
			alert("측정자명을 입력해주세요.");
			$("#userName").focus();
			return false;
		}
		
		if ($("#schoolName").val() == "") {
			alert("등록할 기관명을 입력해주세요.");
			$("#schoolName").focus();
			return false;
		}
		
		if ($("#measureDt").val() == "") {
			alert("측정일(예정일)을 입력해주세요.");
			$("#sido").focus();
			return false;
		}
		
		var userId = $("#userId").val();
		var userName = $("#userName").val();
		var schoolCode = $("#schoolCode").val();
		var schoolName = $("#schoolName").val();
		var measureDt = $("#measureDt").val();
		
		if(window.confirm("측정자명 : "+userName+"\n"
				+"기관명 : "+schoolName+"\n"
				+"측정일(예정일) : "+$("#measureDt").val()+"\n"
				+"\n입력하신 정보가 맞습니까?") ==true){
			
			$.ajax({
	            type : 'POST', 
	            url : "/admin/organ/ajaxInserMeasureOrganLog.do",
	            data : JSON.stringify({ //변수에 담긴 데이터를 전송해준다 (JSON 방식)
	            	"userId" : userId,
	            	"schoolCode" : schoolCode,
	            	"measureDt" : measureDt
				}), 
				dataType : 'JSON', //데이터 타입 JSON
				contentType : "application/json; charset=UTF-8",
	            success : function(data, statusText, jqXHR) {
	                alert("측정자 등록이 완료 되었습니다.");
	                insertModal.classList.toggle('show');
	                body.style.overflow = 'auto';
	                location.reload();
	            },
	            error : function(jqXHR, textStatus, errorThrown) {
	                alert("측정자 등록에 실패하였습니다. 관리자에게 문의 부탁드립니다.");
	                insertModal.classList.toggle('show');
	                body.style.overflow = 'auto';
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