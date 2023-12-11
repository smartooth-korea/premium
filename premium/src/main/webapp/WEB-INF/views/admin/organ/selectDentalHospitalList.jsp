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
<title>㈜스마트코리아 - 치과(기관) 조회/수정/삭제</title>

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
<style type="text/css">
.modal_body{
	width: 420px;
    height: 440px;
    padding: 30px;
    text-align: center;
    background-color: rgb(255, 255, 255);
    border-radius: 10px;
    box-shadow: 0 2px 3px 0 rgb(34 36 38 / 15%);
}

.loadingInsertDentalHospital{
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	display: none;
	background-color: rgba(0, 0, 0, 0.4);
}

.loadingInsertDentalHospital.show {
  	display: flex;
    justify-content: center;
    align-items: center;
}

#loadingInsertDentalHospitalBar{
    width: 55px;
    height: 20px;
}

#loadingInsertDentalHospitalBar_Message{
    margin-top: 25px;
    margin-bottom: 0px;
    font-size: 20px;
    font-weight: bold;
}

.loadingInsertDentalHospital_body{
	display: flex;
	width: 350px;
    height: 150px;
    padding: 30px;
    text-align: center;
    background-color: rgb(255, 255, 255);
    border-radius: 10px;
    box-shadow: 0 2px 3px 0 rgb(34 36 38 / 15%);
    justify-content: center;
    align-items: center;
    flex-direction: column;
    border-radius: 0.5rem;
    line-height: 33px;
}

.loadingInsertDentalHospital_Message{
	margin: 0px;
    font-size: 20px;
    font-weight: bold;
}


</style>
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
												치과(기관) 조회
                                             </div>
                                        </div>
                                        <div class="col-auto">
                                           	<i class="fas fa-hospital fa-2x text-gray-333"></i>
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
									      	<option value="DENTAL_HOSPITAL_NM" selected>치과명</option>
									        <option value="DENTAL_HOSPITAL_CD">치과코드</option>
									        <option value="DENTAL_HOSPITAL_SIGUNGU_NM">지역(시군구)</option>
									        <option value="DENTAL_HOSPITAL_EUPMYEONDONG_NM">지역(읍면동)</option>
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
	<h4>치과 등록</h4>
	<div style="height:30px;"></div>
		<form method="post" id="frm">
				<div class="wrap-div">
					<div class="div-td-left">
						치&nbsp;&nbsp;&nbsp;&nbsp;과&nbsp;&nbsp;&nbsp;&nbsp;명&nbsp;&nbsp;&nbsp;:
					</div>
					<input hidden="hidden" />
					<div class="div-td-right">
						<input id="dentalHospitalNm" name="dentalHospitalNm" type="text" style="text-align: center;" placeholder="입력해주세요.">
					</div>
				</div>
				<div class="wrap-div">
					<div class="div-td-left">
						치과 전화번호 :
					</div>
					<div class="div-td-right">
						<select class="input-control telNo" id="dentalHospitalTelNo1" name="dentalHospitalTelNo1" style="width:60px; height: 25px; text-align: center;">
							<option value="02" selected="selected">02</option>
							<option value="031">031</option>
							<option value="032">032</option>
							<option value="033">033</option>
							<option value="041">041</option>
							<option value="042">042</option>
							<option value="043">043</option>
							<option value="044">044</option>
							<option value="051">051</option>
							<option value="052">052</option>
							<option value="053">053</option>
							<option value="054">054</option>
							<option value="055">055</option>
							<option value="061">061</option>
							<option value="062">062</option>
							<option value="063">063</option>
							<option value="064">064</option>
							<option value="010">010</option>
							<option value="011">011</option>
							<option value="016">016</option>
							<option value="017">017</option>
							<option value="018">018</option>
							<option value="019">019</option>
						</select>
						 - <input id="dentalHospitalTelNo2" name="dentalHospitalTelNo2" type="text" style="text-align: center; width: 60px;"> - 
						<input id="dentalHospitalTelNo3" name="dentalHospitalTelNo3" type="text" style="text-align: center; width: 60px;">
					</div>
				</div>
				<div class="wrap-div">
					<div class="div-td-left">
						치과 이메일 :
					</div>
					<div class="div-td-right">
						<input id="dentalHospitalEmail" name="dentalHospitalEmail" type="text" style="text-align: center; width: 220px;" placeholder="입력해주세요.">
					</div>
				</div>
				<div class="wrap-div">
					<div class="div-td-left">
						지역(시도)&nbsp;&nbsp;&nbsp;&nbsp;:
					</div>
					<div class="div-td-right">
						<select id="sido" name="sido" class="" onchange="changeSidoInfo()" style="height: 25px;">
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
						<select id="sigungu" name="sigungu" class="" onchange="changeSigunguInfo()" style="height: 25px;">
							<option value="">선택해주세요</option>
						</select>
					</div>
				</div>
				<div class="wrap-div">
					<div class="div-td-left">
						지역(읍면동)&nbsp;&nbsp;&nbsp;&nbsp;:
					</div>
					<div class="div-td-right">
						<select id="eupmyeondong" name="eupmyeondong" class="" style="height: 25px;">
							<option value="">선택해주세요</option>
						</select>
					</div>
				</div>
				<div style="height:10px;"></div>
				<div>
					<input type="button" onclick="opSubmit();" class="btn btn-info btn-fill" value="등록">
				</div>
		</form>
	</div>
</div>
<!-- 로딩바 -->
<div id="loadingInsertDentalHospital" class="loadingInsertDentalHospital">
	<div class="loadingInsertDentalHospital_body">
        <img src="/imgs/common/spin_progress.gif" id="loadingInsertDentalHospitalBar">
        <p class="loadingInsertDentalHospital_Message">치과 등록 중 입니다
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
			'치과 명'
			,'치과 코드'
			,'치과 전화번호'
			,'치과 이메일'
			,'지역(시도)'
			,'지역(시군구)'
			,'지역(읍면동)'
		];

	$("#grid").jqGrid({
		url : "/admin/organ/selectDentalHospitalList.do",
		datatype : "json",
		styleUI: 'Foundation',
		contentType: "application/json; charset=utf-8",
		colNames : colNameArray,
		colModel: [
						{
							name:'dentalHospitalNm',
							index:'dentalHospitalNm',
							width:'20%',
							align:'center',
							editable:true
						}
						,{
							name:'dentalHospitalCd',
							index:'dentalHospitalCd',
							width:'20%',
							align:"center",
							key:true
						}
						,{
							name:'dentalHospitalTelNo',
							index:'dentalHospitalTelNo',
							width:'15%',
							align:'center',
							editable:true
						}
						,{
							name:'dentalHospitalEmail',
							index:'dentalHospitalEmail',
							width:'20%',
							align:'center',
							editable:true
						}
						,{
							name:'organSidoNm',
							index:'organSidoNm',
							width:'10%',
							align:'center',
							editable:true
						}
						,{
							name:'organSigunguNm',
							index:'organSigunguNm',
							width:'10%',
							align:'center',
							editable:true
						}
						,{
							name:'organEupmyeondongNm',
							index:'organEupmyeondongNm',
							width:'10%',
							align:'center',
							editable:true
						}
					],
		//caption : "Loading...",	// 로딩 중 일때 표시되는 텍스트
		pager : $('#pager'),
		rowNum : 25,	// 보여 줄 행의 개수
		loadonce:true,
		height : 769, // 그리드의 높이를 해상도 변경에 따라 변하도록 변경해줘야함
		autowidth : true, // 가로 크기 자동 조절
		rownumbers : true, // 행 번호
		cellEdit:true, //그리드 수정 가능 기능
		cellsubmit : 'remote',
        cellurl : '/admin/organ/upDentalHospitalInfo.do',
		multiselect:false, // checkbox
		styleUI: 'Bootstrap',
		afterEditCell:function(rowid, cellname, value, iRow, iCol){
		    $("#"+rowid+"_"+cellname).blur(function(){
		        $("#grid").jqGrid("saveCell",iRow,iCol);
		    });
		},
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
	
	// Enter Key 입력 시 검색
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
	

	// 시도 로딩
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
	
	
	// 시군구 로딩
	function changeSigunguInfo() {
		
		var str = "";
		var locationList = "";
		var sigungu = document.getElementById("sigungu");
		var sggemdCd = sigungu.options[sigungu.selectedIndex].value;
		var sigunguNm = sigungu.options[sigungu.selectedIndex].text;

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
	
	
	// 치과 등록
	function opSubmit(){
		
		// 치과명
		var dentalHospitalNm = $("#dentalHospitalNm").val();
		// 치과 이메일
		var dentalHospitalEmail = $("#dentalHospitalEmail").val();
		// 치과 전화번호
		var dentalHospitalTelNo1 = document.getElementById("dentalHospitalTelNo1");
		dentalHospitalTelNo1 = dentalHospitalTelNo1.options[dentalHospitalTelNo1.selectedIndex].text;
		var dentalHospitalTelNo2 = $("#dentalHospitalTelNo2").val();
		var dentalHospitalTelNo3 = $("#dentalHospitalTelNo3").val();
		
		// 주소
		var sido = document.getElementById("sido");
		var sigungu = document.getElementById("sigungu");
		var eupmyeondong = document.getElementById("eupmyeondong");
		var sidoNm = sido.options[sido.selectedIndex].text;
		var sigunguNm = sigungu.options[sigungu.selectedIndex].text;
		var eupmyeondongNm = eupmyeondong.options[eupmyeondong.selectedIndex].text;
		var eupmyeondongCd = eupmyeondong.options[eupmyeondong.selectedIndex].value;
		

		if ($("#dentalHospitalNm").val() == "") {
			alert("등록할 치과명을 입력해주세요.");
			$("#shcoolName").focus();
			return false;
		}
		
		if ($("#dentalHospitalTelNo").val() == "") {
			alert("치과 전화번호를 입력해주세요.");
			$("#dentalHospitalTelNo").focus();
			return false;
		}
		
		if ($("#dentalHospitalEmail").val() == "") {
			alert("치과 이메일을 입력해주세요.");
			$("#dentalHospitalEmail").focus();
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
		
		
		if(window.confirm("치과명 : "+dentalHospitalNm+"\n"
				+"치과전화번호 : "+dentalHospitalTelNo1+"-"+dentalHospitalTelNo2+"-"+dentalHospitalTelNo3+"\n"
				+"치과 이메일 : "+dentalHospitalEmail+"\n"
				+"지역(시도) : "+sidoNm+"\n"+"지역(시군구) : "+sigunguNm+"\n"+"지역(읍면동) : "+eupmyeondongNm+"\n"
				+"\n"+"\n입력하신 정보가 맞습니까?") ==true){
			
			
			const body = document.querySelector('body');
			const loadingInsertDentalHospital = document.querySelector('#loadingInsertDentalHospital');
			
			loadingInsertDentalHospital.classList.toggle('show');
			if (loadingInsertDentalHospital.classList.contains('show')) {
				body.style.overflow = 'hidden';
			}
			// 치과 등록 모달 hidden
			insertModal.classList.remove('show');
			
			$.ajax({
	            type : 'POST', 
	            url : "/admin/organ/insertDentalHospitalInfo.do",
	            data : JSON.stringify({ //변수에 담긴 데이터를 전송해준다 (JSON 방식)
	            	"dentalHospitalNm" : dentalHospitalNm,
	            	"dentalHospitalTelNo" : dentalHospitalTelNo1+"-"+dentalHospitalTelNo2+"-"+dentalHospitalTelNo3,
	            	"dentalHospitalEmail" : dentalHospitalEmail,
	            	"sidoNm" : sidoNm,
	            	"sigunguNm" : sigunguNm,
	            	"eupmyeondongNm" : eupmyeondongNm,
	            	"eupmyeondongCd" : eupmyeondongCd,
				}), 
				dataType : 'JSON', //데이터 타입 JSON
				processData : false,
				contentType : "application/json; charset=UTF-8",
	            success : function(data, statusText, jqXHR) {
	                alert("기관 등록이 완료되었습니다.");
	                loadingInsertDentalHospital.classList.remove('show');
	                body.style.overflow = 'auto';
	                location.reload();
	            },
	            error : function(jqXHR, textStatus, errorThrown) {
	                alert("기관 등록에 실패하였습니다. 관리자에게 문의 부탁드립니다.");
	                loadingInsertDentalHospital.classList.remove('show');
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
	    var dentalHospitalCdArray = [];
	    
	    for (var i = 0; i < id.length; i++) {
			var rowdata = $("#grid").getRowData(id[i]);
			dentalHospitalCdArray[i] = rowdata.dentalHospitalCd;
	    }
		
	    if(dentalHospitalCdArray == ""){
	    	alert("선택하신 기관(학교)가 없습니다.")
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