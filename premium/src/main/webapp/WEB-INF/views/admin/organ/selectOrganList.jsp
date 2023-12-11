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
<title>㈜스마트코리아 - 유치원 및 어린이집(기관) 조회/수정/삭제</title>

<!-- favicon ico 에러 -->
<link rel="shortcut icon" type="image/x-icon" href="/imgs/common/logo_img_ori.png">
<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
<link rel="stylesheet" href="css/common/sb-admin-2.css">
<link rel="stylesheet" type="text/css" href="css/jquery/jquery-ui.css" />
<link rel="stylesheet" href="/css/jquery/jqgrid/ui.jqgrid.css">
<link rel="stylesheet" href="/css/admin/organ/selectOrganList.css">
<!-- jQuery --> 
<script type="text/javascript" src="js/jquery/jquery.js"></script>
<script type="text/javascript" src="js/jquery/jquery-ui.js"></script>
<!-- jqGrid -->
<script type="text/javascript" src="js/jquery/jqgrid/i18n/grid.locale-kr.js"></script>
<script type="text/javascript" src="js/jquery/jqgrid/minified/jquery.jqGrid.min.js"></script>
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
                                <div class="card-body organList">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">

<!-- 충치 갯수 차트 -->
<!-- 선생님 일 경우 , 반에 대한 정보를 -->
<!-- 부모일 경우 아이의 정보를 기입하도록 변경-->
<!-- 현재는 하드코딩으로 진행 -->		
													유치원 및 학교 조회
                                             </div>
                                        </div>
                                        <div class="col-auto">
	                                            <i class="fas fa-child fa-2x text-gray-333"></i>
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
	<h4>유치원 및 학교 등록</h4>
	<div style="height:30px;"></div>
		<form method="post" id="frm">
				<div class="wrap-div">
					<div class="div-td-left">
						기&nbsp;&nbsp;&nbsp;&nbsp;관&nbsp;&nbsp;&nbsp;&nbsp;명&nbsp;&nbsp;&nbsp;:
					</div>
					<input hidden="hidden" />
					<div class="div-td-right">
						<input id="schoolName" name="schoolName" type="text" style="text-align: center;" placeholder="입력해주세요.">
					</div>
				</div>
				<div class="wrap-div">
					<div class="div-td-left">
						기 관 종 류&nbsp;&nbsp;&nbsp;&nbsp;:
					</div>
					<div class="div-td-right">
						<select id="schoolType" name="schoolType" class=" ">
							<!-- 옵션 값을 조회 이 페이지 들어오기전에 가져와야한다. 그 후 셀렉트 박스에서 값이 선택되면 ajax로 나머지 지역 읍면동을 만들어준다 -->
							<option value="">선택해주세요</option>
							<option value="KG">어린이집, 유치원</option>
							<option value="EL">초등학교</option>
							<option value="MD">중학교</option>
							<option value="HI">고등학교</option>
						</select>
					</div>
				</div>
				<div class="wrap-div">
					<div class="div-td-left">
						지역(시도)&nbsp;&nbsp;&nbsp;&nbsp;:
					</div>
					<div class="div-td-right">
						<select id="sido" name="sido" class="" onchange="changeSidoInfo()">
							<option value="">선택해주세요</option>
							<c:forEach var="sidoList" items="${sidoList}">
								<option value="${sidoList.sidoCd}">${sidoList.sidoNm}</option>
							</c:forEach>
						</select>
					</div>
				</div>
				<div class="wrap-div">
					<div class="div-td-left">지역(시군구)&nbsp;&nbsp;&nbsp;&nbsp;:</div>
					<div class="div-td-right">
						<select id="sigungu" name="sigungu" class="" onchange="changeSigunguInfo()">
							<option value="">선택해주세요</option>
						</select>
					</div>
				</div>
				<div class="wrap-div">
					<div class="div-td-left">
						지역(읍면동)&nbsp;&nbsp;&nbsp;&nbsp;:
					</div>
					<div class="div-td-right">
						<select id="eupmyeondong" name="eupmyeondong" class="">
							<option value="">선택해주세요</option>
						</select>
					</div>
				</div>
				<div class="wrap-div">
					<div class="div-td-left">
						자 문 치 과&nbsp;&nbsp;&nbsp;&nbsp;:
					</div>
					<div class="div-td-right">
						<input id="dentistName" name="dentistName" type="text" style="text-align: center;" placeholder="입력해주세요.">
					</div>
				</div>
				<div class="wrap-div">
					<div class="div-td-left">
						자문치과 전화번호&nbsp;&nbsp;&nbsp;&nbsp;:
					</div>
					<div class="div-td-right">
						<input id="dentistNum" name="dentistNum" type="text" style="text-align: center;" placeholder="입력해주세요.">
					</div>
				</div>
				<div style="height:10px;"></div>
				<div>
					<input type="button" onclick="opSubmit();"
						class="btn btn-info btn-fill" value="등록">
				</div>
		</form>
	</div>
</div>
<!-- 수정 모달 : Modal -->
<div id="editModal" class="modal">
	<div class="modal_body">
	<h4>기관 등록</h4>
	<div style="height:30px;"></div>
		<form method="post" id="frm">
				<div class="wrap-div">
					<div class="div-td-left">
						기&nbsp;&nbsp;&nbsp;&nbsp;관&nbsp;&nbsp;&nbsp;&nbsp;명&nbsp;&nbsp;&nbsp;:
					</div>
					<input hidden="hidden" />
					<div class="div-td-right">
						<input id="schoolName" name="schoolName" type="text" style="text-align: center;" placeholder="입력해주세요.">
					</div>
				</div>
				<div class="wrap-div">
					<div class="div-td-left">
						기 관 종 류&nbsp;&nbsp;&nbsp;&nbsp;:
					</div>
					<div class="div-td-right">
						<select id="schoolType" name="schoolType" class=" ">
							<!-- 옵션 값을 조회 이 페이지 들어오기전에 가져와야한다. 그 후 셀렉트 박스에서 값이 선택되면 ajax로 나머지 지역 읍면동을 만들어준다 -->
							<option value="">선택해주세요</option>
							<option value="KG">어린이집, 유치원</option>
							<option value="EL">초등학교</option>
							<option value="MD">중학교</option>
							<option value="HI">고등학교</option>
							<option value="DE">치과</option>
						</select>
					</div>
				</div>
				<div class="wrap-div">
					<div class="div-td-left">
						지역(시도)&nbsp;&nbsp;&nbsp;&nbsp;:
					</div>
					<div class="div-td-right">
						<select id="sido" name="sido" class="" onchange="changeSidoInfo()">
							<option value="">선택해주세요</option>
							<c:forEach var="sidoList" items="${sidoList}">
								<option value="${sidoList.sidoCd}">${sidoList.sidoNm}</option>
							</c:forEach>
						</select>
					</div>
				</div>
				<div class="wrap-div">
					<div class="div-td-left">지역(시군구)&nbsp;&nbsp;&nbsp;&nbsp;:</div>
					<div class="div-td-right">
						<select id="sigungu" name="sigungu" class="" onchange="changeSigunguInfo()">
							<option value="">선택해주세요</option>
						</select>
					</div>
				</div>
				<div class="wrap-div">
					<div class="div-td-left">
						지역(읍면동)&nbsp;&nbsp;&nbsp;&nbsp;:
					</div>
					<div class="div-td-right">
						<select id="eupmyeondong" name="eupmyeondong" class="">
							<option value="">선택해주세요</option>
						</select>
					</div>
				</div>
				<div class="wrap-div">
					<div class="div-td-left">
						자 문 치 과&nbsp;&nbsp;&nbsp;&nbsp;:
					</div>
					<div class="div-td-right">
						<input id="dentistName" name="dentistName" type="text" style="text-align: center;" placeholder="입력해주세요.">
					</div>
				</div>
				<div class="wrap-div">
					<div class="div-td-left">
						자문치과 전화번호&nbsp;&nbsp;&nbsp;&nbsp;:
					</div>
					<div class="div-td-right">
						<input id="dentistNum" name="dentistNum" type="text" style="text-align: center;" placeholder="입력해주세요.">
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
<!-- Footer menu -->
			<jsp:include page="/WEB-INF/views/admin/layout/footer.jsp"></jsp:include>
		</div>
	</div>
	
<script type="text/javascript">
$(document).ready(function(){
	var userId = "${userId}";
	
	$(window).on('resize.jqGrid', function (){
		// jqGrid 반응형으로 사이즈 조정하는 function
		jQuery("#grid").jqGrid( 'setGridWidth', ($(".grid-area").width()));
		// jQuery("#grid").jqGrid( 'setGridHeight', ($(".a1").height()));
	});
	
	var colNameArray = 
		[
			'유치원 코드'
			,'유치원 이름'
			,'지역(시도)'
			,'지역(시군구)'
			,'지역(읍면동)'
		];

	$("#grid").jqGrid({
		url : "/admin/organ/selectOrganList.do",
		datatype : "json",
		styleUI: 'Foundation',
		contentType: "application/json; charset=utf-8",
		colNames : colNameArray,
		colModel: [
						{
							name:'schoolCode',
							index:'schoolCode',
							width:'20%',
							align:"center",
						}
						,{
							name:'schoolName',
							index:'schoolName',
							width:'20%',
							align:'center',
						}
						,{
							name:'organSidoNm',
							index:'organSidoNm',
							width:'20%',
							align:'center',
						}
						,{
							name:'organSigunguNm',
							index:'organSigunguNm',
							width:'20%',
							align:'center',
						}
						,{
							name:'organEupmyeondongNm',
							index:'organEupmyeondongNm',
							width:'20%',
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
		multiselect:true, // checkbox
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
	

	function changeSidoInfo(){
		
		var str = "";
		var locationList = "";
	
		var sido = document.getElementById("sido");
		var sidoCd = sido.options[sido.selectedIndex].value;
		var sidoNm = sido.options[sido.selectedIndex].text;
		
		$.ajax({
			type : 'POST', //post 방식으로 전송
			url : '/admin/selectSigunguInfoList.do', //데이터를 주고받을 파일 주소
			data : JSON.stringify({ //변수에 담긴 데이터를 전송해준다 (JSON 방식)
	
				"sidoCd" : sidoCd,
				"sidoNm" : sidoNm
	
			}),
			dataType : 'JSON', //데이터 타입 JSON
			contentType : "application/json; charset=UTF-8",
			success : function(data) { //파일 주고받기가 성공했을 경우. data 변수 안에 값을 담아온다.
				locationList = data.locationInfoList;
				for (var i = 0; i < locationList.length; i++) {
					if (i == 0) {
						str = '<option value="">선택해주세요</option>';
					}
					str += '<option value="' + locationList[i].sggemdCd + '">'
							+ locationList[i].sigunguNm + '</option>';
				}
				$('#sigungu').html(str);
			}
		});
	}
	
	function changeSigunguInfo() {
		var str = "";
		var locationList = "";
	
		var sigungu = document.getElementById("sigungu");
		var sggemdCd = sigungu.options[sigungu.selectedIndex].value;
		var sigunguNm = sigungu.options[sigungu.selectedIndex].text;
	
		// ajax 넣어줘야함
		$.ajax({
			type : 'POST', //post 방식으로 전송
			url : '/admin/selectEupmyeondognInfoList.do', //데이터를 주고받을 파일 주소
			data : JSON.stringify({ //변수에 담긴 데이터를 전송해준다 (JSON 방식)
	
				"sggemdCd" : sggemdCd,
				"sigunguNm" : sigunguNm
	
			}),
			dataType : 'JSON', //데이터 타입 JSON
			contentType : "application/json; charset=UTF-8",
			success : function(data) { //파일 주고받기가 성공했을 경우. data 변수 안에 값을 담아온다.
				locationList = data.locationInfoList;
				for (var i = 0; i < locationList.length; i++) {
					if (i == 0) {
						str = '<option value="">선택해주세요</option>';
					}
					str += '<option value="' + locationList[i].sggemdCd + '|'+locationList[i].ogSeqNo+'">'+ locationList[i].eupmyeondongNm + '</option>';
				}
				$('#eupmyeondong').html(str);
			}
		});
	}
		
	
	function opSubmit(){
		
		var schoolName = $("#schoolName").val();
		var schoolType = document.getElementById("schoolType");
		var sido = document.getElementById("sido");
		var sigungu = document.getElementById("sigungu");
		var eupmyeondong = document.getElementById("eupmyeondong");
		
		var schoolTypeStr = schoolType.options[schoolType.selectedIndex].text;
		var schoolType = schoolType.options[schoolType.selectedIndex].value;
		var sidoNm = sido.options[sido.selectedIndex].text;
		var sigunguNm = sigungu.options[sigungu.selectedIndex].text;
		var eupmyeondongNm = eupmyeondong.options[eupmyeondong.selectedIndex].text;
		var eupmyeondongCd = eupmyeondong.options[eupmyeondong.selectedIndex].value;
		
		var dentistName = $("#dentistName").val();
		var dentistNum = $("#dentistNum").val()

		if ($("#shcoolName").val() == "") {
			alert("등록할 기관명을 입력해주세요.");
			$("#shcoolName").focus();
			return false;
		}
		
		if ($("#sido").val() == "") {
			alert("지역(시도)을 선택해주세요.");
			$("#sido").focus();
			return false;
		}
		if ($("#sigungu").val() == "") {
			alert("지역(시군구)을 선택해주세요.");
			$("#sigungu").focus();
			return false;
		}
		if ($("#eupmyeondong").val() == "") {
			alert("지역(읍면동)을 선택해주세요.");
			$("#eupmyeondong").focus();
			return false;
		}
		
// 		if($("#dentistName").val() != null && $("#dentistName").val() == ""){
// 			alert("자문치과의 전화번호를 입력해주세요.");
// 			$("#dentistName").focus();
// 			return false;
// 		}
		
		
		if(window.confirm("기관명 : "+schoolName+"\n"+"기관 종류 : "+schoolTypeStr+"\n"+"지역(시도) : "+sidoNm+"\n"+"지역(시군구) : "+sigunguNm+"\n"+"지역(읍면동) : "+eupmyeondongNm+"\n"+"자문치과 : "+dentistName+"\n"+"자문치과번호 : "+dentistNum+"\n"+"\n입력하신 정보가 맞습니까?") ==true){
			$.ajax({
	            type : 'POST', 
	            url : "/admin/organ/insertOrganInfo",
	            data : JSON.stringify({ //변수에 담긴 데이터를 전송해준다 (JSON 방식)
	            	"schoolName" : schoolName,
	            	"schoolType" : schoolType,
	            	"sidoNm" : sidoNm,
	            	"sigunguNm" : sigunguNm,
	            	"eupmyeondongNm" : eupmyeondongNm,
	            	"eupmyeondongCd" : eupmyeondongCd,
	            	"dentistName" : dentistName,
	            	"dentistNum" : dentistNum,
				}), 
				dataType : 'JSON', //데이터 타입 JSON
				contentType : "application/json; charset=UTF-8",
	            success : function(data, statusText, jqXHR) {
	                alert("기관 등록이 완료되었습니다.");
	                insertModal.classList.toggle('show');
	                body.style.overflow = 'auto';
	                location.reload();
	            },
	            error : function(jqXHR, textStatus, errorThrown) {
	                alert("기관 등록에 실패하였습니다. 관리자에게 문의 부탁드립니다.");
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
				
		var message = "";
	    var id = $("#grid").getGridParam('selarrrow');
	    var schoolCodeArray = [];
	    
	    for (var i = 0; i < id.length; i++) {
			var rowdata = $("#grid").getRowData(id[i]);
			schoolCodeArray[i] = rowdata.schoolCode;
	    }
		
	    if(schoolCodeArray == ""){
	    	alert("선택하신 기관(학교)가 없습니다.")
	    	return false;
	    }

	    if(window.confirm("선택하신 기관(들)을 삭제하시겠습니까?") == true){
		    $.ajax({
				type : 'POST', //post 방식으로 전송
				url : '/admin/organ/deleteOrganInfo', //데이터를 주고받을 파일 주소
				data:JSON.stringify ({ //변수에 담긴 데이터를 전송해준다 (JSON 방식)
					"schoolCodeArray" : schoolCodeArray
					,"schoolCodeArrayLength" : id.length
				}),
				dataType : 'JSON', //데이터 타입 JSON
				contentType : "application/json; charset=UTF-8",
				success : function(data) { //파일 주고받기가 성공했을 경우. data 변수 안에 값을 담아온다.
					var code = data.code;
					if(code == "failure"){
						alert("해당 기관의 부서 및 사용자가 존재하므로 삭제가 불가능합니다.\n삭제하시길 원하실 경우 관리자에게 문의주세요.");
					}else{
						alert("삭제가 완료되었습니다.");
						location.reload();
					}
				},
				error : function(error){
					alert("기관 삭제에 실패하였습니다. 관리자에게 문의 부탁드립니다.");
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