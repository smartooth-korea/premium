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
<title>㈜스마트코리아 ::: 관리자 관리</title>
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
    top: 20%;
    left: 40%;
    width: 420px;
    height: 375px;
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
	font-weight: bold;
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
		height: 972px;
	}
}

#searchType{
    float: left;
    text-align: left;
    font-size: 14px;
	width: 6.5%;
}

#searchData{
	float: left;
	margin-left: 10px;
    font-size: 14px;
	width: 20%;
}

.button{
	width: 7%;
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

.userType{
    text-align: center;
	font-size: 15px;
}

.userType{
    text-align: center;
	font-size: 15px;
}

.telNo{
    width: 65px;
}

.registNum1{
    width: 85px;
}

.registNum2{
	width: 30px;
}

.addr{
	
}

/* jqGrid css */
.ui-jqgrid .ui-jqgrid-htable{
	font-family : 'NanumSquareR';
}
.ui-jqgrid-btable, .ui-pg-table  {
	font-family : 'NanumSquareR';
	/* font-size: 14px; */
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

#dentalHospitalNm{
	text-align: center;
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
	width: 250px;
	height: 30px;
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
												치과 관계자 조회 및 등록
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
									        <option value="userName" selected>이름</option>
									      	<option value="userId">아이디</option>
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




<!-- MODAL : 등록 모달 -->
<div id="insertModal" class="modal">
	<div class="modal_body">
	<h4>치과 관계자 등록</h4>
	<div style="height:30px;"></div>
		<form method="post" id="frm">
				<div class="wrap-div">
					<div class="div-td-left">
						<font color="red">＊</font>
						치과명 : &nbsp;
					</div>
					<div class="div-td-right">
						<input class="input-form" id="dentalHospitalNm" name="dentalHospitalNm" type="text" style="text-align: center;" placeholder="입력해주세요.">
						<input type="hidden" id="dentalHospitalCd" name="dentalHospitalCd" value=""/>
					</div>
				</div>
				<div class="wrap-div">
					<div class="div-td-left">
						<font color="red">＊</font>
						아이디 : &nbsp;
					</div>
					<div class="div-td-right">
						<input id="userId" name="userId" class="input-control userId" type="text" style="text-align: center;" placeholder="이메일">
					</div>
					<input type="button" id="chkBtn" class="chkBtn" value="중복확인">
				</div>
				<div class="wrap-div">
					<div class="div-td-left">
						<font color="red">＊</font>
						이름 : &nbsp;
					</div>
					<div class="div-td-right">
						<input id="userName" name="userName" class="input-control userName" type="text" style="text-align: center;">
					</div>
				</div>
				<input type="hidden" id="userType" name="userType" value="DE">
				<div class="wrap-div">
					<div class="div-td-left">
					<font color="red">＊</font>
						연락처 : &nbsp;
					</div>
					<div class="div-td-right">
						<select class="input-control telNo" id="userTelNo1" name="userTelNo1">
							<option value="010" selected="selected">010</option>
							<option value="011">011</option>
							<option value="016">016</option>
							<option value="017">017</option>
							<option value="018">018</option>
							<option value="019">019</option>
							<option value="02">02</option>
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
							<option value="0507">0507</option>
						</select> -
						<input type="text" class ="input-control telNo" id="userTelNo2" name="userTelNo2" onkeyup="isNumeric(this)" onkeydown="isNumeric(this)" maxlength="4"> - 
						<input type="text" class ="input-control telNo" id="userTelNo3" name="userTelNo3" onkeyup="isNumeric(this)" onkeydown="isNumeric(this)" maxlength="4">
					</div>
				</div>
				<div class="wrap-div">
					<div class="div-td-left">
					<font color="red">＊</font>
						주민등록번호 : &nbsp;
					</div>
					<div class="div-td-right">
						<input type="text" class ="input-control registNum1" id="registNum1" name="registNum1" onkeyup="isNumeric(this)" onkeydown="isNumeric(this)" maxlength="6"> - 
						<input type="text" class ="input-control registNum2" id="registNum2" name="registNum2" onkeyup="isNumeric(this)" onkeydown="isNumeric(this)" maxlength="1">&nbsp;******
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
<!-- MODAL -->
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
		jQuery("#grid").trigger("reloadGrid");
	});
	
	var colNameArray = 
		[
			'아이디'
			,'치과명'
			,'주소'
			,'연락처'
			,'등록일'
		];

	$("#grid").jqGrid({
		url : "/admin/user/ajaxSelectDentalHospitalAdminUserList",
		datatype : "json",
		styleUI: 'Foundation',
		contentType: "application/json; charset=utf-8",
		colNames : colNameArray,
		colModel: [
						{
							name:'userId',
							index:'userId',
							width:'20%',
							align:'left',
							cellattr: function () { return " style='font-size: 14px; padding-left: 20px'" },
						}
						,{
							name:'dentalHospitalNm',
							index:'dentalHospitalNm',
							width:'20%',
							align:"left",
							cellattr: function () { return " style='font-size: 14px; padding-left: 20px'" },
						}
						,{
							name:'dentalHospitalAddr',
							index:'dentalHospitalAddr',
							width:'20%',
							align:'left',
							cellattr: function () { return " style='font-size: 14px; padding-left: 20px'" },
						}
						,{
							name:'userTelNo',
							index:'userTelNo',
							width:'15%',
							cellattr: function () { return " style='font-size: 14px; padding-left: 20px'" },
							align:'left',
						}
						,{
							name:'userRgstDt',
							index:'userRgstDt',
							width:'15%',
							cellattr: function () { return " style='font-size: 14px; padding-left: 20px'" },
							align:'left',
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
	
	
	// 치과명 실시간 검색
	$('#dentalHospitalNm').autocomplete({
		source : function(request, response) { //source: 입력시 보일 목록
		     $.ajax({
		           url : "/admin/organ/ajaxSelectDentalHospitalList.do"   
		         , type : "POST"
		         , dataType: "JSON"
		         , data : {value: request.term}	// 검색 키워드
		         , success : function(data){ 	// 성공
		             response(
		                 $.map(data.organList, function(item) {
		                	 
		                	 var seq = item.SEQ;
		                	 var dentalHospitalCd = item.DENTAL_HOSPITAL_CD;
		                	 var dentalHospitalNm = item.DENTAL_HOSPITAL_NM;
		                	 var organAddress = item.ORGAN_ADDRESS;
		                	 
		                     return {
									label : dentalHospitalNm + '\n\n('+organAddress+')'     	// 목록에 표시되는 값
									,value : dentalHospitalNm		// 선택 시 input창에 표시되는 값
									,idx : seq // index
									,dentalHospitalCd : dentalHospitalCd // 넘겨줄 값을 여기에 넣으면 됨
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
	    	$('#dentalHospitalCd').attr("value", ui.item.dentalHospitalCd);
	    },
	    delay: 300
	});
	
	
	function opSubmit(){

		var userType = $("#userType").val();
		 
		
		if ($("#userId").val() == "") {
			alert("등록할 아이디를 입력해주세요.");
			$("#shcoolName").focus();
			return false;
		}
		
		if ($("#registNum1").val() == "") {
			alert("주민등록번호를 입력해주세요.");
			$("#registNum1").focus();
			return false;
		}
		
		if ($("#registNum2").val() == "") {
			alert("주민등록번호를 입력해주세요.");
			$("#registNum2").focus();
			return false;
		}
		
		if(window.confirm(
				"치과명 : "+$("#dentalHospitalNm").val()+"\n아이디 : "+$("#userId").val()
				+"\n연락처 : "+$("#userTelNo1").val()+"-"+$("#userTelNo2").val()+"-"+$("#userTelNo3").val()
				+"\n주민등록번호 : "+$("#registNum1").val()+"-"+$("#registNum2").val()+"******"
				+"\n입력하신 정보가 맞습니까?") ==true){

			var formData = $("#frm").serialize();
			console.log(JSON.stringify(formData));
			
			$.ajax({
	            cache : false,
	            url : "/admin/user/insertUserInfo",
	            type : 'POST', 
	            data : formData, 
	            success : function(data, statusText, jqXHR) {
            		alert("등록이 완료되었습니다.");
	            	insertModal.classList.remove('show');
	                location.reload();
	            },
	            error : function(jqXHR, textStatus, errorThrown) {
	            	alert("등록하지 하지 못하였습니다. 관리자에게 문의 부탁드립니다.");
	                location.reload();
	            }
	        });
		}else{
			return false;
		}
	}
	
	function deleteRow(){
		if(window.confirm("선택한 계정(들)을 삭제하시겠습니까?") ==true){
			var message = "";
		    var id = $("#grid").getGridParam('selarrrow');
		    var userIdArray = [];
		    
		    for (var i = 0; i < id.length; i++) {
				var rowdata = $("#grid").getRowData(id[i]);
				userIdArray[i] = rowdata.userId;
		    }
		
		    $.ajax({
				type : 'POST', //post 방식으로 전송
				url : '/admin/user/deleteAdminUserInfo', //데이터를 주고받을 파일 주소
				data:JSON.stringify ({ //변수에 담긴 데이터를 전송해준다 (JSON 방식)
					
					"userIdArray" : userIdArray
					,"userIdArrayLength" : id.length
					
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
	
	// 숫자 검증 정규식
	function isNumeric(obj){
		var regExp = /[^0-9]/g;
		if(regExp.test(obj.value)){
			alert("숫자만 입력이 가능합니다.")
			obj.value = obj.value.substring(0, obj.value.length -1);
		}
	}
	
	
	
	// 아이디 중복확인
	$('#chkBtn').click(function(){
		var userId = $("#userId").val();
		
		// 이메일 검증 정규식
		var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;

		if(userId == null || userId == ""){
			alert("아이디를 입력해주세요.");
			$("#userId").focus();
			return false;
		}else{
			if(!regExp.test(userId)){
				alert("이메일 형식에 맞게 입력해주세요.");
				$("#userId").val("");
				$("#userId").focus();
				return false;
			}
		}
		$.ajax({
            type : 'POST', 
            url : "/admin/user/duplicateChkId",
            data : JSON.stringify({ //변수에 담긴 데이터를 전송해준다 (JSON 방식)
            	"userId" : userId
			}), 
			dataType : 'JSON', //데이터 타입 JSON
			contentType : "application/json; charset=UTF-8",
            success : function(data, statusText, jqXHR) {
            	var isDuplicated = data.duplicateId;
            	if(isDuplicated){
					alert("이미 사용중이거나 탈퇴한 아이디입니다.");
					$("#userId").val("");
					$("#userId").focus();
					return false;
            	}else{
            		alert("사용 가능한 아이디입니다.")
            	}
            },
            error : function(jqXHR, textStatus, errorThrown) {
                alert("아이디 중복 조회 실패하였습니다. 관리자에게 문의 부탁드립니다.");
                return false;
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