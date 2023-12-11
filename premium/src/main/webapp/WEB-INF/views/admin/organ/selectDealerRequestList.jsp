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
<title>㈜스마트코리아 - 딜러 요청 리스트</title>

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

.searchType {
    display: flex;
    float: left;
    text-align: center;
    font-size: 14px;
    width: 10%;
    border: 1px solid;
    height: 33px;
    border-radius: 5px;
    font-weight: 400;
    line-height: 1.5;
    color: #495057;
    font-size: 13.5px;
    align-items: center;
    padding-left: 15px;
}

.searchData {
    float: left;
    margin-left: 10px;
    font-size: 14px;
    width: 20%;
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
												딜러가 담당한 치과(기관) 조회
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
										<div class="searchType">
											요청상태
										</div>
										<select class="form-control searchData" id="statusType">
											<option value="" selected>전체</option>
											<option value="0">요청</option>
											<option value="1">수락</option>
											<option value="2">거절</option>
											<option value="3">취소</option>
											<option value="4">삭제</option>
										</select>
									    <input type ="text" id="searchData" class ="form-control-sm" style="display: none;">
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
									<c:if test="${userInfo.userType eq 'DL'}">
										<div class="regist">
											<button class="btn btn-info btn-fill button" id="regist" value="등록" style="margin:0px; margin-top: 12px;" onclick="">
												등록
											</button>
										</div>
									</c:if>									
									<c:if test="${userInfo.userType eq 'SU'}">									
										<div class="delete">
											<button class="btn btn-info btn-fill button" id="delete" value="삭제" style="margin:0px; margin-top: 12px;" onclick="deleteRow()">
												삭제
											</button>
										</div>
									</c:if>

<!-- 등록 모달 : Modal -->
<div id="insertModal" class="modal">
	<div class="modal_body">
	<h4 id="modal_title">치과 등록</h4>
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
						 - <input id="dentalHospitalTelNo2" name="dentalHospitalTelNo2" type="number" style="text-align: center; width: 60px;" maxlength="4"> - 
						<input id="dentalHospitalTelNo3" name="dentalHospitalTelNo3" type="number" style="text-align: center; width: 60px;" maxlength="4">
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
				<div class="wrap-div" id="divDisplayAddr" style="display: none;">
					<div class="div-td-left">
						치과 주소 :
					</div>
					<div class="div-td-right">
						<input id="dentalHospitalAddr" name="dentalHospitalAddr" type="text" style="text-align: center; width: 220px;" placeholder="입력해주세요." disabled>
					</div>
				</div>
				<div id="divSelectAddr" style="display: block;">
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
				</div>
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
				<div style="height:10px;"></div>
				<div>
					<input id="btn_reg" type="button" onclick="opSubmit();"
						class="btn btn-info btn-fill" value="등록">
				</div>
		</form>
	</div>
</div>
<!-- 등록 모달 : Modal -->
<div id="selectModal" class="modal">
	<div class="modal_body">
	<h4>선택</h4>
	<div style="height:30px;"></div>
		<c:if test="${userInfo.userType eq 'SU'}">	
			<div>
				<input type="button" onclick="onConfirm();"
					class="btn btn-info btn-fill" value="수락">
			</div>			
			<br/>
			<div>
				<input type="button" onclick="onReject();"
					class="btn btn-info btn-fill" value="거절">
			</div>			
			<br/>
			<div>
				<input type="button" onclick="deleteRow();"
					class="btn btn-info btn-fill" value="삭제">
			</div>
		</c:if>
		<c:if test="${userInfo.userType eq 'DL'}">	
			<div>
				<input type="button" onclick="onEdit();"
					class="btn btn-info btn-fill" value="수정">
			</div>		
			<br/>	
			<div>
				<input type="button" onclick="onCancel();"
					class="btn btn-info btn-fill" value="취소">
			</div>
		</c:if>		
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
	function onSearchSel() {
		var selType = document.getElementById('searchType');
		var selIndex = selType.options[selType.selectedIndex].value;


		var selStatus = document.getElementById('statusType');
		var searchData = document.getElementById('searchData');
		if (selType.selectedIndex == 0) {
			selStatus.style.display = "";
			searchData.style.display = "none";
		} else {
			selStatus.style.display = "none";
			searchData.style.display = "";
		}
		searchData.value = "";
	}
	function ShowAddress(){
		document.getElementById("divDisplayAddr").style.display = "";
		document.getElementById("divSelectAddr").style.display = "none";
		
	}

	function HideAddress(){
		document.getElementById("divDisplayAddr").style.display = "none";
		document.getElementById("divSelectAddr").style.display = "";
		
	}	
$(document).ready(function(){
	var userId = "${userInfo.userId}";
	$(window).on('resize.jqGrid', function (){
		// jqGrid 반응형으로 사이즈 조정하는 function
		jQuery("#grid").jqGrid( 'setGridWidth', ($(".grid-area").width()));
		// jQuery("#grid").jqGrid( 'setGridHeight', ($(".a1").height()));
	});

	var colOptions =  [
		{colName : '번호', name:'idx', index:'idx', align:'center', hidden:true},
	<c:if test="${userInfo.userType eq 'SU'}">
		{colName : '딜러ID', name:'userId', index:'userId', align:'center', width:'10%'},
	</c:if>
		{colName : '치과명', name:'dentalHospitalNm', index:'dentalHospitalNm', align:'center', width:'15%'},
		{colName : '치과 전화번호', name:'dentalHospitalTelNo', index:'dentalHospitalTelNo', align:'center', width:'15%'},
		{colName : '치과 이메일', name:'dentalHospitalEmail', index:'dentalHospitalEmail', align:'center', width:'15%'},
		{colName : '지역(시도)', name:'organSidoNm', index:'organSidoNm', align:'center', width:'10%'},
		{colName : '지역(시군구)', name:'organSigunguNm', index:'organSigunguNm', align:'center', width:'10%'},
		{colName : '지역(읍면동)', name:'organEupmyeondongNm', index:'organEupmyeondongNm', align:'center', width:'10%'},
		{colName : '요청상태', name:'status', index:'status', align:'center', width:'10%'},
		{colName : '요청일자', name:'requestDt', index:'requestDt', align:'center', width:'10%'}
	];
	

	$("#grid").jqGrid({
		url : "/admin/organ/selectDealerRequestList.do",
		datatype : "json",
		styleUI: 'Foundation',
		contentType: "application/json; charset=utf-8",
		colNames : colOptions.map(function(item){return item.colName;}),
		colModel : colOptions,
	//caption : "Loading...",	// 로딩 중 일때 표시되는 텍스트
		pager : $('#pager'),
		rowNum : 15,	// 보여 줄 행의 개수
		loadonce:true,
		height : 769, // 그리드의 높이를 해상도 변경에 따라 변하도록 변경해줘야함
		autowidth : true, // 가로 크기 자동 조절
		rownumbers : true, // 행 번호
		cellEdit : false, //그리드 수정 가능 기능
		cellsubmit : 'remote',
		cellurl : '/admin/organ/update.do',
		multiselect:false, // checkbox
		styleUI: 'Bootstrap',
		afterEditCell:function(rowid, cellname, value, iRow, iCol){
			$("#"+rowid+"_"+cellname).blur(function(){
				$("#grid").jqGrid("saveCell",iRow,iCol);
			});
		},
		ondblClickRow : function(rowId, iRow, iCol, e){ 
 		
			/*
			var rowData = $("#grid").getRowData(rowId);
			var userId = rowData.userId;
			var dentalHospitalNm = rowData.dentalHospitalNm;
			var dentalHospitalTelNo = rowData.dentalHospitalTelNo;
			var dentalHospitalEmail = rowData.dentalHospitalEmail;
			var organSidoNm = rowData.organSidoNm;
			var organSigunguNm = rowData.organSigunguNm;
			var organEupmyeondongNm = rowData.organEupmyeondongNm;
			var status = rowData.status;
			insertModal.classList.toggle('show');
			if (insertModal.classList.contains('show')) {
				body.style.overflow = 'hidden';
			}
			var telNo = dentalHospitalTelNo.split('-');
			document.getElementById('dentalHospitalNm').value = dentalHospitalNm;
			document.getElementById('dentalHospitalTelNo1').value = telNo[0];
			document.getElementById('dentalHospitalTelNo2').value = telNo[1];
			document.getElementById('dentalHospitalTelNo3').value = telNo[2];
			document.getElementById('dentalHospitalEmail').value = dentalHospitalEmail;
			// 등록된 주소 이름으로는 수정처리를 할 수가 없다.
			// 기존 주소는 이름을 그대로 보여주고, 새로 설정할 경우, 설정된 값으로 다시 입력하는 것으로 한다.
			//document.getElementById('sido').value = organSidoNm;
			//document.getElementById('sigungu').value = organSigunguNm;
			//document.getElementById('eupmyeondong').value = organEupmyeondongNm;
			*/
			document.getElementById('modal_title').value = '치과 수정';
			document.getElementById('btn_reg').innerText = '수정';
			selectRowData = $("#grid").getRowData(rowId);
			ShowAddress();
			selectModal.classList.toggle('show');
			if (selectModal.classList.contains('show')) {
				body.style.overflow = 'hidden';
			}
		},
		onCellSelect : function(rowId, iCol, cellcontent, e){ 
			document.getElementById('modal_title').innerText = '치과 수정';
			document.getElementById('btn_reg').value = '수정';
			selectRowData = $("#grid").getRowData(rowId);
			ShowAddress();
		},loadComplete: function(data){
	        $("#nodata").remove();
	        if(data.rows.length == 0){
	            $("#grid.ui-jqgrid-btable").after("<p id='nodata' style='margin-top:3%;text-align:center;font-weight:bold;font-size:14px;'>조회 결과가 없습니다.</p>");
	        }
		}
	});
});

var selectRowData;
	function onEdit(){	
		if (selectRowData == null || selectRowData == '') {
			alert("선택하신 기관(학교)가 없습니다.")
	    	return false;
		}
		if (selectRowData.status != '요청' ) {
			alert("선택하신 기관(학교)은 요청상태가 아닙니다.\n수정은 요청상태에서만 가능합니다.");
	    	return false;
		}
		var userId = selectRowData.userId;
		var dentalHospitalNm = selectRowData.dentalHospitalNm;
		var dentalHospitalTelNo = selectRowData.dentalHospitalTelNo;
		var dentalHospitalEmail = selectRowData.dentalHospitalEmail;
		var organSidoNm = selectRowData.organSidoNm;
		var organSigunguNm = selectRowData.organSigunguNm;
		var organEupmyeondongNm = selectRowData.organEupmyeondongNm;
		var status = selectRowData.status;
		// alert(status);
		if (selectModal.classList.contains('show')) {
				selectModal.classList.remove('show');
			}
		insertModal.classList.toggle('show');
		if (insertModal.classList.contains('show')) {
				body.style.overflow = 'hidden';
			}

		var telNo = dentalHospitalTelNo.split('-');
		document.getElementById('dentalHospitalNm').value = dentalHospitalNm;
		document.getElementById('dentalHospitalTelNo1').value = telNo[0];
		document.getElementById('dentalHospitalTelNo2').value = telNo[1];
		document.getElementById('dentalHospitalTelNo3').value = telNo[2];
		document.getElementById('dentalHospitalEmail').value = dentalHospitalEmail;
		document.getElementById('dentalHospitalAddr').value = organSidoNm + ' ' + organSigunguNm + ' ' + organEupmyeondongNm;
		// 등록된 주소 이름으로는 수정처리를 할 수가 없다.
		// 기존 주소는 이름을 그대로 보여주고, 새로 설정할 경우, 설정된 값으로 다시 입력하는 것으로 한다.
		//document.getElementById('sido').value = organSidoNm;
		//document.getElementById('sigungu').value = organSigunguNm;
		//document.getElementById('eupmyeondong').value = organEupmyeondongNm;

	}

	// 검색 
	function onSubmit(){	
		var searchData = $("#searchData").val();
		var searchType = $("#searchType").val();
		var statusType = $("#statusType").val();
		if (searchType == "STATUS") {
			searchData = statusType;
		}
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
	// const editModal = document.querySelector('#editModal');
	const selectModal = document.querySelector('#selectModal');
	
	// const btnOpenPopup = document.querySelector('.regist');
	
	// btnOpenPopup.addEventListener('click', () => {
	// 	document.getElementById('modal_title').innerText = '치과 등록';
	// 	document.getElementById('btn_reg').value = '등록';
	// 	HideAddress();
	// 	document.getElementById('dentalHospitalNm').value = '';
	// 	document.getElementById('dentalHospitalTelNo1').value = '';
	// 	document.getElementById('dentalHospitalTelNo2').value = '';
	// 	document.getElementById('dentalHospitalTelNo3').value = '';
	// 	document.getElementById('dentalHospitalEmail').value = '';
	// 	document.getElementById('dentalHospitalAddr').value = '';

	// 	insertModal.classList.toggle('show');
	// 	if (insertModal.classList.contains('show')) {
	// 		body.style.overflow = 'hidden';
	// 	}
	// });
	
	insertModal.addEventListener('click', (event) => {
		if (event.target === insertModal) {
			insertModal.classList.toggle('show');
		}
		if (!insertModal.classList.contains('show')) {
			body.style.overflow = 'auto';
		}
	});

	selectModal.addEventListener('click', (event) => {
		if (event.target === selectModal) {
			selectModal.classList.toggle('show');
		}
		if (!selectModal.classList.contains('show')) {
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
		
// 		if ($("#dentalHospitalEmail").val() == "") {
// 			alert("치과 이메일을 입력해주세요.");
// 			$("#dentalHospitalEmail").focus();
// 			return false;
// 		}
		
		var btnText = document.getElementById('btn_reg').value;
		if (btnText == '등록') {
			var sidoNm = sido.options[sido.selectedIndex].text;
			var sigunguNm = sigungu.options[sigungu.selectedIndex].text;
			var eupmyeondongNm = eupmyeondong.options[eupmyeondong.selectedIndex].text;
			var eupmyeondongCd = eupmyeondong.options[eupmyeondong.selectedIndex].value;

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
				$.ajax({
					type : 'POST', 
					url : "/admin/organ/insertDealerRequestInfo.do",
					data : JSON.stringify({ //변수에 담긴 데이터를 전송해준다 (JSON 방식)
						"dentalHospitalNm" : dentalHospitalNm,
						"dentalHospitalTelNo" : dentalHospitalTelNo1+"-"+dentalHospitalTelNo2+"-"+dentalHospitalTelNo3,
						"dentalHospitalEmail" : dentalHospitalEmail,
						"sidoNm" : sidoNm,
						"sigunguNm" : sigunguNm,
						"eupmyeondongNm" : eupmyeondongNm,
						"eupmyeondongCd" : eupmyeondongCd,
						"userId" : "${userInfo.userId}",
						"memo" : "test memo"
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
		} else {		
			if(window.confirm("치과명 : "+dentalHospitalNm+"\n"
					+"치과전화번호 : "+dentalHospitalTelNo1+"-"+dentalHospitalTelNo2+"-"+dentalHospitalTelNo3+"\n"
					+"치과 이메일 : "+dentalHospitalEmail+"\n"
					+"치과 주소 : "+document.getElementById('dentalHospitalAddr').value
					+"\n"+"\n입력하신 정보가 맞습니까?") ==true){
				$.ajax({
					type : 'POST', 
					url : "/admin/organ/updateDealerRequestInfo.do",
					data : JSON.stringify({ //변수에 담긴 데이터를 전송해준다 (JSON 방식)
						"dentalHospitalNm" : dentalHospitalNm,
						"dentalHospitalTelNo" : dentalHospitalTelNo1+"-"+dentalHospitalTelNo2+"-"+dentalHospitalTelNo3,
						"dentalHospitalEmail" : dentalHospitalEmail,
						"sidoNm" : selectRowData.organSidoNm,
						"sigunguNm" : selectRowData.organSigunguNm,
						"eupmyeondongNm" : selectRowData.organEupmyeondongNm,
						"eupmyeondongCd" : eupmyeondongCd,
						"userId" : "${userInfo.userId}",
						"memo" : "test memo",
						"idx" : selectRowData.idx
					}), 
					dataType : 'JSON', //데이터 타입 JSON
					contentType : "application/json; charset=UTF-8",
					success : function(data, statusText, jqXHR) {
						alert("기관 수정이 완료되었습니다.");
						insertModal.classList.toggle('show');
						body.style.overflow = 'auto';
						location.reload();
					},
					error : function(jqXHR, textStatus, errorThrown) {
						alert("기관 수정에 실패하였습니다. 관리자에게 문의 부탁드립니다.");
						insertModal.classList.toggle('show');
						body.style.overflow = 'auto';
						location.reload();
					}
				});
			}else{
				return false;
			}
		}
	}
	
	function deleteRow(){

		if (selectRowData == null || selectRowData == '') {
			alert("선택하신 기관(학교)가 없습니다.")
	    	return false;
		}
		if (selectRowData.status != '요청' ) {
			alert("선택하신 기관(학교)은 요청상태가 아닙니다.\n삭제는 요청상태에서만 가능합니다.");
	    	return false;
		}

		if (selectModal.classList.contains('show')) {
			selectModal.classList.remove('show');
		}

		if(window.confirm("선택하신 기관(들)을 삭제하시겠습니까?") == true){
 		    $.ajax({
 				type : 'POST', //post 방식으로 전송
 				url : '/admin/organ/deleteDealerRequestInfo.do', //데이터를 주고받을 파일 주소
 				data:JSON.stringify ({ //변수에 담긴 데이터를 전송해준다 (JSON 방식)
					"idx" : selectRowData.idx
 					,"status" : "4"
 				}),
 				dataType : 'JSON', //데이터 타입 JSON
 				contentType : "application/json; charset=UTF-8",
 				success : function(data) { //파일 주고받기가 성공했을 경우. data 변수 안에 값을 담아온다.
 					var code = data.code;
 					if(code == "failure"){
 						alert("삭제에 실패했습니다.");
 					}else{
 						alert("삭제 처리가 완료되었습니다.");
 						location.reload();
 					}
 				},
 				error : function(error){
 					alert("삭제 처리에 실패하였습니다. 관리자에게 문의 부탁드립니다.");
 					location.reload();
 		        }
 			});
 		}else{
 			return false;
 		}
	}


	function onCancel(){

		if (selectRowData == null || selectRowData == '') {
			alert("선택하신 기관(학교)가 없습니다.")
	    	return false;
		}
		if (selectRowData.status != '요청' ) {
			alert("선택하신 기관(학교)은 요청상태가 아닙니다.\n취소는 요청상태에서만 가능합니다.");
	    	return false;
		}

		if (selectModal.classList.contains('show')) {
			selectModal.classList.remove('show');
		}
		
 	    if(window.confirm("선택하신 기관의 등록 요청을 취소하시겠습니까?") == true){
 		    $.ajax({
 				type : 'POST', //post 방식으로 전송
 				url : '/admin/organ/updateDealerRequestState.do', //데이터를 주고받을 파일 주소
 				data:JSON.stringify ({ //변수에 담긴 데이터를 전송해준다 (JSON 방식)
					"idx" : selectRowData.idx
 					,"status" : "3"
 				}),
 				dataType : 'JSON', //데이터 타입 JSON
 				contentType : "application/json; charset=UTF-8",
 				success : function(data) { //파일 주고받기가 성공했을 경우. data 변수 안에 값을 담아온다.
 					var code = data.code;
 					if(code == "failure"){
 						alert("취소에 실패했습니다.");
 					}else{
 						alert("취소 처리가 완료되었습니다.");
 						location.reload();
 					}
 				},
 				error : function(error){
 					alert("취소 처리에 실패하였습니다. 관리자에게 문의 부탁드립니다.");
 					location.reload();
 		        }
 			});
 		}else{
 			return false;
 		}

	}

	function onConfirm(){

		if (selectRowData == null || selectRowData == '') {
			alert("선택하신 기관(학교)가 없습니다.")
	    	return false;
		}
		if (selectRowData.status != '요청' ) {
		 	alert("선택하신 기관(학교)은 요청상태가 아닙니다.\n수락은 요청상태에서만 가능합니다.");
	     	return false;
		}

		if (selectModal.classList.contains('show')) {
			selectModal.classList.remove('show');
		}

		if(window.confirm("선택하신 기관(들)을 수락하시겠습니까?") == true){
			$.ajax({
				type : 'POST', //post 방식으로 전송
				url : '/admin/organ/updateDealerRequestState.do', //데이터를 주고받을 파일 주소
				data:JSON.stringify ({ //변수에 담긴 데이터를 전송해준다 (JSON 방식)
					"idx" : selectRowData.idx
					,"status" : "1"
				}),
				dataType : 'JSON', //데이터 타입 JSON
				contentType : "application/json; charset=UTF-8",
				success : function(data) { //파일 주고받기가 성공했을 경우. data 변수 안에 값을 담아온다.
					selectRowData.organEupmyeondongCd = data.organEupmyeondongCd;
					//var code = data.code;
					//if(code == "failure"){
					//	alert("수락 처리에 실패 했습니다.");
					//}else{
					//	alert("수락 처리가 완료되었습니다.");
					//	location.reload();
					//}
					onHospitalReg(selectRowData);
				},
				error : function(error){
					alert("수락 처리에 실패하였습니다. 관리자에게 문의 부탁드립니다.");
					location.reload();
				}
			});
		}else{
			return false;
		}

	}

	function onReject(){

		if (selectRowData == null || selectRowData == '') {
			alert("선택하신 기관(학교)가 없습니다.")
	    	return false;
		}
		if (selectRowData.status != '요청' ) {
			alert("선택하신 기관(학교)은 요청상태가 아닙니다.\n거절은 요청상태에서만 가능합니다.");
	    	return false;
		}

		if (selectModal.classList.contains('show')) {
			selectModal.classList.remove('show');
		}

		if(window.confirm("선택하신 기관(들)을 거절하시겠습니까?") == true){
			$.ajax({
				type : 'POST', //post 방식으로 전송
				url : '/admin/organ/updateDealerRequestState.do', //데이터를 주고받을 파일 주소
				data:JSON.stringify ({ //변수에 담긴 데이터를 전송해준다 (JSON 방식)
					"idx" : selectRowData.idx
					,"status" : "2"
				}),
				dataType : 'JSON', //데이터 타입 JSON
				contentType : "application/json; charset=UTF-8",
				success : function(data) { //파일 주고받기가 성공했을 경우. data 변수 안에 값을 담아온다.
					var code = data.code;
					if(code == "failure"){
						alert("거절 처리에 실패 했습니다.");
					}else{
						alert("거절 처리가 완료되었습니다.");
						location.reload();
					}
				},
				error : function(error){
					alert("거절 처리에 실패하였습니다. 관리자에게 문의 부탁드립니다.");
					location.reload();
				}
			});
		}else{
			return false;
		}

	}

	function onHospitalReg(info) {
		$.ajax({
	            type : 'POST', 
	            url : "/admin/organ/insertDentalHospitalInfo.do",
	            data : JSON.stringify({ //변수에 담긴 데이터를 전송해준다 (JSON 방식)
	            	"dentalHospitalNm" : info.dentalHospitalNm,
	            	"dentalHospitalTelNo" : info.dentalHospitalTelNo,
	            	"dentalHospitalEmail" : info.dentalHospitalEmail,
	            	"sidoNm" : info.organSidoNm,
	            	"sigunguNm" : info.organSigunguNm,
	            	"eupmyeondongNm" : info.organEupmyeondongNm,
	            	"eupmyeondongCd" : info.organEupmyeondongCd,
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
	}
	
	// ESC 키 입력 시 modal 화면 사라짐
	$(document).keydown(function(e){
		var code = e.keyCode || e.which;
		if(code == 27){
			if (insertModal.classList.contains('show')) {
				insertModal.classList.remove('show');
			}
			// if (editModal.classList.contains('show')) {
			// 	insertModal.classList.remove('show');
			// }
			if (selectModal.classList.contains('show')) {
				selectModal.classList.remove('show');
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