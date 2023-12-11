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
<title>㈜스마트코리아 부서 조회/수정/삭제 ::: main</title>
<!-- favicon ico 에러 -->
<link rel="shortcut icon" type="image/x-icon" href="/imgs/common/logo_img_ori.png">
<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
<link rel="stylesheet" href="/css/common/sb-admin-2.css">
<link rel="stylesheet" type="text/css" href="css/jquery/jquery-ui.css" />
<link rel="stylesheet" href="/css/jquery/jqgrid/ui.jqgrid.css">
<!-- jQuery --> 
<script type="text/javascript" src="js/jquery/jquery.js"></script>
<script type="text/javascript" src="js/jquery/jquery-ui.js"></script>
<!-- jqGrid -->
<script type="text/javascript" src="js/jquery/jqgrid/i18n/grid.locale-kr.js"></script>
<script type="text/javascript" src="js/jquery/jqgrid/minified/jquery.jqGrid.min.js"></script>
<!-- Element Css -->
<style type="text/css">

@font-face {
	font-family: 'NanumSquareR';
	src: url(/fonts/NanumSquareR.ttf) format('truetype');
}


body{
	font-family: 'NanumSquareR';
}

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
    width: 510px;
    height: 560px;
    padding: 30px;
    text-align: center;
    background-color: rgb(255, 255, 255);
    border-radius: 10px;
    box-shadow: 0 2px 3px 0 rgb(34 36 38 / 15%);
}


/**Modal 안의 div**/
.wrap-div{
    display: flex;
    align-items: center;
    height: 35px;
}

.div-td-left{
    padding-top: 4px;
    width: 20%;
}

.div-td-right{
    display: flex;
    flex-direction: row;
    align-items: center;
    width: 85%;
    line-height: 42px;
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

#regist{
	background-color: #333333;
    border-color: #333333;
    color: #ffffff;
}

#regist:hover{
	cursor: pointer;
	background-color: #318CDD;
    border-color: #318CDD;
    color: #ffffff;
}

.right-space{
    padding-top: 20px;
    padding-left: 20px;
}

.div-td-input{
    margin-left: 35px;
    height: 26px;
    width: 85%;
    text-align: center;
}

.ui-autocomplete {
    border: none;
    position: relative;
    background-color: #ffffff;
    list-style: none;
    font-size: 13px;
    margin-bottom: 5px;
    border: 1px solid #DDD !important;
    padding-top: 0px !important;
    z-index: 1501;
    width: 220px;
    font-weight: bold;
    line-height: 30px;
    padding-left: 5px;
}

.ui-autocomplete-input{
	text-align: center;
	width: 90%;
}

.div-td-input.main{
	margin-left: 37px;
    width: 88%;
}

.fa-plus-circle{
    margin-left: 5px;
    font-size: 22px;
    color: #333333;
}

.fa-plus-circle:hover{
	color: #318CDD;	
	cursor: pointer;
}

.fa-minus-circle{
    margin-left: 5px;
    font-size: 22px;
    color: #333333;
}

.fa-minus-circle:hover{
    color: #318CDD;	
	cursor: pointer;
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
                                <div class="card-body organList">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">

<!-- 충치 갯수 차트 -->
<!-- 선생님 일 경우 , 반에 대한 정보를 -->
<!-- 부모일 경우 아이의 정보를 기입하도록 변경-->
<!-- 현재는 하드코딩으로 진행 -->
												부서 조회

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
									        <option value="CLASS_NAME">부서명</option>
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

<!-- Modal -->
<div class="modal">
	<div class="modal_body">
	<h4>부서 등록</h4>
		<div style="height:30px;"></div>
		<form id="frm" method="post">
		<div class="wrap-div">
			<div class="div-td-left">
				기&nbsp;&nbsp;&nbsp;&nbsp;관&nbsp;&nbsp;&nbsp;&nbsp;명&nbsp;&nbsp;&nbsp;:
			</div>
			<div class="div-td-right">
				<input class="div-td-input" type="text" id="schoolName" name="schoolName" placeholder="기관명(유치원 이름)">
			</div>
		</div>
		<div class="wrap-div">
			<div class="div-td-left">
				부&nbsp;&nbsp;&nbsp;&nbsp;서&nbsp;&nbsp;&nbsp;&nbsp;명&nbsp;&nbsp;&nbsp;:
			</div>
			<div class="div-td-right">
				<input class="div-td-input main" type="text" id="className_0" name="className"  placeholder="부서명(반 이름)">
			</div>
			<i class="fa fa-plus-circle" id="add_input" aria-hidden="true"></i>
		</div>
		<input type="hidden" id="schoolCode" name="schoolCode" value="">
		</form>
		<div style="height:10px;"></div>
		<div>
			<input type="button" id="regist" onclick="opSubmit();"
				class="btn btn-info btn-fill" value="등록">
		</div>
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

var inputSeq = 1;

// 동적 div>input 태그 생성
$('#add_input').click(function(){
	
 	// 동일한 값을 보내기 위해선 NAME 을 일치 시켜야함
 	let wrapDiv = document.createElement('div');
 	let divTdLeft = document.createElement('div');
 	let divTdRight = document.createElement('div');
 	let iTag = document.createElement("i");
 	let inputTag = document.createElement("input");

 	wrapDiv.setAttribute("class","wrap-div");
 	wrapDiv.setAttribute("id","wrap-div"+inputSeq);
 	wrapDiv.setAttribute("style","display: flex; align-items: center; height: 35px;");
 	
 	divTdLeft.setAttribute("class","div-td-left");
 	divTdLeft.setAttribute("style","width: 21%;");
 	
 	divTdRight.setAttribute("class","div-td-right");
 	divTdRight.setAttribute("style","display: flex; flex-direction: row; align-items: center; width: 85%; line-height: 42px;");
 	
	inputTag.setAttribute("class","div-td-input main");
	inputTag.setAttribute("name", "className");
	inputTag.setAttribute("id", "className_"+inputSeq);
	inputTag.setAttribute("placeholder", "부서명(반 이름)");
	
	iTag.setAttribute("id", "add_input"+inputSeq);
	iTag.setAttribute("class", "fa fa-minus-circle");
	iTag.setAttribute("aria-hidden", "true");
	iTag.setAttribute("onclick","removeWrapDiv("+inputSeq+")")
 	
	divTdRight.appendChild(inputTag);
	wrapDiv.appendChild(divTdLeft);
	wrapDiv.appendChild(divTdRight);
 	wrapDiv.appendChild(iTag);
 	
 	document.querySelector("#frm").append(wrapDiv);
 	
});

// 동적 div>input 제거
function removeWrapDiv(inputSeq){
	$('#wrap-div'+inputSeq).remove();
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
			'기관명'
			,'부서명'
			,'기관코드'
			,'부서코드'
		];

	$("#grid").jqGrid({
		url : "/admin/organ/selectDepartmentList.do",
		mtype: "POST",
		datatype : "json",
		contentType: "application/json; charset=utf-8",
		colNames : colNameArray,
		colModel: [
						{
							name:'schoolName',
							index:'schoolName',
							width:'25%',
							align:'center',
						}
						,{
							name:'className',
							index:'className',
							width:'25%',
							align:'center',
							editable:true
						}
						,{
							name:'schoolCode',
							index:'schoolCode',
							width:'25%',
							align:"center",
						}
						,{
							name:'classCode',
							index:'classCode',
							width:'25%',
							align:'center',
							key:true
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
        cellurl : '/admin/organ/updateDepartInfo.do',
		multiselect:true, // checkbox
		styleUI: 'Bootstrap',
		oadComplete: function(data){
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
	const modal = document.querySelector('.modal');
	const btnOpenPopup = document.querySelector('.regist');
	
	btnOpenPopup.addEventListener('click', () => {
	    modal.classList.toggle('show');
		if (modal.classList.contains('show')) {
			body.style.overflow = 'hidden';
		}
	});
	
	modal.addEventListener('click', (event) => {
		if (event.target === modal) {
			modal.classList.toggle('show');
		}
		if (!modal.classList.contains('show')) {
			body.style.overflow = 'auto';
		}
	});
	
	
	// 부서등록
	function opSubmit(){
		
		var schoolCode = $("#schoolCode").val();
		
		if ($("#schoolName").val() == "") {
			alert("등록할 기관명을 입력하여 검색한 뒤 선택해주세요.");
			$("#shcoolName").focus();
			return false;
		}
		
		if ($("input[id*='className_']").val() == "") {
			alert("부서명(반 이름을) 입력해주세요.");
			return false;
		}
		
		var size = $("input[name=className]").length;
		//배열 생성
		var classNameArray = new Array(size);
		//배열에 값 주입
		for(var i=0; i<size; i++){                          
			classNameArray[i] = $("input[name=className]").eq(i).val();
		}
		
		
		$.ajax({
            type : 'POST', 
            url : "/admin/organ/insertDepartmentInfo",
            data : JSON.stringify({ //변수에 담긴 데이터를 전송해준다 (JSON 방식)
            	"schoolCode" : schoolCode,
            	"classNameArray" : classNameArray
			}), 
			dataType : 'JSON', //데이터 타입 JSON
			contentType : "application/json; charset=UTF-8",
            success : function(data, statusText, jqXHR) {
                alert("기관 등록이 완료되었습니다.");
                modal.classList.toggle('show');
                body.style.overflow = 'auto';
                location.reload();
            },
            error : function(jqXHR, textStatus, errorThrown) {
                alert("기관 등록에 실패하였습니다. 관리자에게 문의 부탁드립니다.");
                modal.classList.toggle('show');
                body.style.overflow = 'auto';
                location.reload();
            }
        });
	}
	
	function deleteRow(){
		if(window.confirm("선택하신 기관(들)을 삭제하시겠습니까?") ==true){
			var message = "";
		    var id = $("#grid").getGridParam('selarrrow');
		    var classCodeArray = [];
		    
		    for (var i = 0; i < id.length; i++) {
				var rowdata = $("#grid").getRowData(id[i]);
				classCodeArray[i] = rowdata.classCode;
		    }
		
		    $.ajax({
				type : 'POST', //post 방식으로 전송
				url : '/admin/organ/deleteDepartInfo.do', //데이터를 주고받을 파일 주소
				data:JSON.stringify ({ //변수에 담긴 데이터를 전송해준다 (JSON 방식)
					"classCodeArray" : classCodeArray
					,"classCodeArrayLength" : id.length
				}),
				dataType : 'JSON', //데이터 타입 JSON
				contentType : "application/json; charset=UTF-8",
				success : function(data) { //파일 주고받기가 성공했을 경우. data 변수 안에 값을 담아온다.
					alert("삭제가 완료되었습니다.");
					location.reload();
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