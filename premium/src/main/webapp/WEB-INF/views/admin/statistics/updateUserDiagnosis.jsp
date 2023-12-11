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
<title>㈜스마트코리아 측정 및 진단 결과 수정</title>
<!-- favicon ico 에러 -->
<link rel="shortcut icon" type="image/x-icon" href="/imgs/common/logo_img_ori.png">
<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
<link rel="stylesheet" href="css/common/sb-admin-2.css">
<link rel="stylesheet" type="text/css" href="css/jquery/jquery-ui.css" />
<link rel="stylesheet" href="css/jquery/jqgrid/ui.jqgrid.css">
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
                    <div class="row">

                        <!-- Earnings (Monthly) Card Example -->
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-primary shadow h-100 py-2">
                                <div class="card-body organList">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
												측정 및 진단 결과 수정
                                             </div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-tooth fa-2x text-gray-333"></i>
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
	                                    <button class="btn btn-info btn-fill button" id="delete" value="삭제" style="margin:0px; margin-top: 20px; margin-left: 20px;" onclick="deleteRow()">
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
		return '<input type="button" style="width: 100px; height: 26px; font-size: 13px;" value="진단 항목 수정"/>';
		//onclick="selectGraphData('+cellvalue+')"
	}
	
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
	});
	
	var colNameArray = 
		[
			'이름'
			,'아이디'
			,'기관명'
			,'부서명'
			,'측정일'
			,' '
			,''
			,''
			,''
		];

	$("#grid").jqGrid({
		url : "/premium/admin/statistics/selectUserMeasureList.do",
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
							name:'btn',
							index:'btn',
							width:'16%',
							align:'center',
							formatter:button
							
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
 
			alert("치아 측정 수치 수정 페이지 연결 예정");
			
			var rowData = $("#grid").getRowData(rowId);
			var userName = rowData.userName;
			var userId = rowData.userId;
			var measureDt = rowData.measureDt;
			var schoolName = rowData.schoolName;
			var className = rowData.className;
			//var url = '/premium/admin/statistics/diagnosis?userId='+userId+'&userName='+userName+'&measureDt='+measureDt+'&schoolName='+schoolName+'&className='+className;
			//window.open(url, '결과지', 'width=390, height=1215, scrollbars=no, resizable=no, toolbars=no, menubar=no');
			
		}
	});
});


	// 검색
	function onSubmit(){	
		var searchType = $("#searchType").val();
		var searchData = $("#searchData").val();
		var postData = {
			'searchType' : searchType,
			'searchData' : searchData,
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
	
// 	const body = document.querySelector('body');
// 	const modal = document.querySelector('.modal');
// 	const btnOpenPopup = document.querySelector('.regist');
	
// 	btnOpenPopup.addEventListener('click', () => {
// 	    modal.classList.toggle('show');
// 		if (modal.classList.contains('show')) {
// 			body.style.overflow = 'hidden';
// 		}
// 	});
	
// 	modal.addEventListener('click', (event) => {
// 		if (event.target === modal) {
// 			modal.classList.toggle('show');
// 		}
// 		if (!modal.classList.contains('show')) {
// 			body.style.overflow = 'auto';
// 		}
// 	});
	
	
// 	function changeSidoInfo(){
		
// 		var str = "";
// 		var locationList = "";
	
// 		var sido = document.getElementById("sido");
// 		var sidoCd = sido.options[sido.selectedIndex].value;
// 		var sidoNm = sido.options[sido.selectedIndex].text;
		
// 		$.ajax({
// 			type : 'POST', //post 방식으로 전송
// 			url : '/premium/admin/selectSigunguInfoList.do', //데이터를 주고받을 파일 주소
// 			data : JSON.stringify({ //변수에 담긴 데이터를 전송해준다 (JSON 방식)
	
// 				"sidoCd" : sidoCd,
// 				"sidoNm" : sidoNm
	
// 			}),
// 			dataType : 'JSON', //데이터 타입 JSON
// 			contentType : "application/json; charset=UTF-8",
// 			success : function(data) { //파일 주고받기가 성공했을 경우. data 변수 안에 값을 담아온다.
// 				locationList = data.locationInfoList;
// 				for (var i = 0; i < locationList.length; i++) {
// 					if (i == 0) {
// 						str = '<option value="">선택해주세요</option>';
// 					}
// 					str += '<option value="' + locationList[i].sggemdCd + '">'
// 							+ locationList[i].sigunguNm + '</option>';
// 				}
// 				$('#sigungu').html(str);
// 			}
// 		});
// 	}
	
// 	function changeSigunguInfo() {
// 		var str = "";
// 		var locationList = "";
	
// 		var sigungu = document.getElementById("sigungu");
// 		var sggemdCd = sigungu.options[sigungu.selectedIndex].value;
// 		var sigunguNm = sigungu.options[sigungu.selectedIndex].text;
	
// 		// ajax 넣어줘야함
// 		$.ajax({
// 			type : 'POST', //post 방식으로 전송
// 			url : '/premium/admin/selectEupmyeondognInfoList.do', //데이터를 주고받을 파일 주소
// 			data : JSON.stringify({ //변수에 담긴 데이터를 전송해준다 (JSON 방식)
	
// 				"sggemdCd" : sggemdCd,
// 				"sigunguNm" : sigunguNm
	
// 			}),
// 			dataType : 'JSON', //데이터 타입 JSON
// 			contentType : "application/json; charset=UTF-8",
// 			success : function(data) { //파일 주고받기가 성공했을 경우. data 변수 안에 값을 담아온다.
// 				locationList = data.locationInfoList;
// 				for (var i = 0; i < locationList.length; i++) {
// 					if (i == 0) {
// 						str = '<option value="">선택해주세요</option>';
// 					}
// 					str += '<option value="' + locationList[i].sggemdCd + '|'+locationList[i].addrSeqNo+'">'+ locationList[i].eupmyeondongNm + '</option>';
// 				}
// 				$('#eupmyeondong').html(str);
// 			}
// 		});
// 	}
		
	
// 	function opSubmit(){
		
// 		var sido = document.getElementById("sido");
// 		var sigungu = document.getElementById("sigungu");
// 		var eupmyeondong = document.getElementById("eupmyeondong");
// 		var schoolType = document.getElementById("schoolType");
		
// 		var sidoNm = sido.options[sido.selectedIndex].text;
// 		var sigunguNm = sigungu.options[sigungu.selectedIndex].text;
// 		var eupmyeondongNm = eupmyeondong.options[eupmyeondong.selectedIndex].text;
// 		var schoolTypeNm = schoolType.options[schoolType.selectedIndex].text;
		 
		
// 		if ($("#shcoolName").val() == "") {
// 			alert("등록할 기관명을 입력해주세요.");
// 			$("#shcoolName").focus();
// 			return false;
// 		}
		
// 		if ($("#sido").val() == "") {
// 			alert("지역(시도)을 선택해주세요.");
// 			$("#sido").focus();
// 			return false;
// 		}
// 		if ($("#sigungu").val() == "") {
// 			alert("지역(시군구)을 선택해주세요.");
// 			$("#sigungu").focus();
// 			return false;
// 		}
// 		if ($("#eupmyeondong").val() == "") {
// 			alert("지역(읍면동)을 선택해주세요.");
// 			$("#eupmyeondong").focus();
// 			return false;
// 		}
		
// 		if(window.confirm("기관명 : "+$("#schoolName").val()+"\n"+"기관종류 : "+schoolTypeNm+"\n"+"지역(시도) : "+sidoNm+"\n"+"지역(시군구) : "+sigunguNm+"\n"+"지역(읍면동) : "+eupmyeondongNm+"\n"+"\n\n 입력하신 정보가 맞습니까?") ==true){
// 			var formData = $("#frm").serialize();
// 			$.ajax({
// 	            cache : false,
// 	            url : "/premium/admin/insertOrganInfo",
// 	            type : 'POST', 
// 	            data : formData, 
// 	            success : function(data, statusText, jqXHR) {
// 	                alert("기관 등록이 완료되었습니다.");
// 	                modal.classList.toggle('show');
// 	                body.style.overflow = 'auto';
// 	                location.reload();
// 	            },
// 	            error : function(jqXHR, textStatus, errorThrown) {
// 	                alert("기관 등록에 실패하였습니다. 관리자에게 문의 부탁드립니다.");
// 	                modal.classList.toggle('show');
// 	                body.style.overflow = 'auto';
// 	                location.reload();
// 	            }
// 	        });
// 		}else{
// 			return false;
// 		}
// 	}
	
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
// 				url : '/premium/admin/deleteOrganInfo', //데이터를 주고받을 파일 주소
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