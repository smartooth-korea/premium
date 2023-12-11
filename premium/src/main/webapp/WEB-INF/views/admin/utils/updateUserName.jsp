<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="author" content="스마투스코리아" />
<meta name="description" content="Smartooth" />
<title>㈜스마투스코리아 - 원아 이름 변경</title>
<!-- favicon ico 에러 -->
<link rel="shortcut icon" type="image/x-icon" href="/imgs/common/logo_img_ori.png">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="/css/jquery/jquery-ui.css" />
<link rel="stylesheet" href="/css/jquery/jqgrid/ui.jqgrid.css">
<link rel="stylesheet" href="/css/common/layout.css">
<!-- jQuery --> 
<script type="text/javascript" src="js/jquery/jquery.js"></script>
<script type="text/javascript" src="js/jquery/jquery-ui.js"></script>
<!-- jqGrid -->
<script type="text/javascript" src="js/jquery/jqgrid/i18n/grid.locale-kr.js"></script>
<script type="text/javascript" src="js/jquery/jqgrid/minified/jquery.jqGrid.min.js"></script>
<style type="text/css">
.container{
	height: 100vh;
}

.row{
	height: 95%;
}

.footer{
	height: 2vh;
}

.title-wrap{
	text-align: center;
	margin-top: 25px;
}

.title-left > img{
	width: 130px;
}

.title-right{
	font-size: 20px;
    font-weight: bold;
	line-height: 65px;
}

.ui-autocomplete {
 	position: relative; 
 	list-style:none; 
 	text-align: center;
 	border: none; 
 	border: 1px solid #DDD !important; 
 	font-size: 15px; 
 	margin-bottom: 5px; 
 	padding-top: 2px; 
 	padding-top: 0px !important; 
 	background-color: #ffffff;  
 	line-height: 40px; 
 	width: 100%;
 	z-index: 1511; 
 	
 } 

 .ui-menu-item{ 
 	margin-left: -30px; 
 	border-bottom: 1px dotted; 
   	border-collapse: collapse; 
 } 

 .ui-helper-hidden-accessible{ 
 	display: none; 
 } 

.top{
    display: flex;
    align-items: center;
    font-weight: bold;
	height: 40px;
}

.form-control{
	display: block;
    width: 100%;
    height: calc(1.5em + 0.75rem + 2px);
    padding: 0.375rem 0.75rem;
    text-align: center;
    font-size: 1rem;
    font-weight: 400;
    line-height: 1.5;
    color: #000000;
    background-color: #fff;
    background-clip: padding-box;
    border: 1px solid #ced4da;
    border-radius: 0.25rem;
    transition: border-color .15s ease-in-out,box-shadow .15s ease-in-out;
}

.form-control::placeholder{
	color: #000000;
}

.grid-area{
	width: 100%;
}
</style>
</head>
<body>
	<div class="container" id="container">
		<div class="input-form-backgroud row">
			<div class="input-form col-md-12 mx-auto">
				<div class="title-wrap">
					<div class="title-left">
						<img alt="㈜스마투스코리아 로고" src="/imgs/common/logo_origin.png">
					</div>
					<div class="title-right">
						피측정자 이름 변경
					</div>
				</div>
				<div class="category-wrap">
					<div class="top">기관(학교)<font style="color: red; font-weight: bold;">*</font></div>
					<div class="bottom"><input type="text" id="schoolName" name="schoolName" class ="form-control" placeholder="기관(학교)를 검색 후 선택하세요."></div>
				</div>
				<div class="category-wrap">
					<div class="top">부서(반)<font style="color: red; font-weight: bold;">*</font></div>
					<div class="bottom">
						<select id="departList" name="classCode" class="form-control" onchange="onSelect()">
							<option selected='selected'>부서(반)을 선택해주세요</option>
						</select>
					</div>
				</div>
				<div class="commonHeight30"></div>
				<div class="grid-area">
					<table id="grid"></table>
					<div id="pager"></div>
				</div>
			</div>
		</div>
		<footer class="my-3 text-center text-small footer">
			<p class="mb-1">Copyright &copy; Smartooth korea 2023</p>
		</footer>
	</div>
<script>

	$(window).on('resize.jqGrid', function (){
		// jqGrid 반응형으로 사이즈 조정하는 function
		jQuery("#grid").jqGrid( 'setGridWidth', ($(".grid-area").width()));
	});

	$('#schoolName').autocomplete({
		source : function(request, response) { //source: 입력시 보일 목록
		     $.ajax({
		           url : "/organ/ajaxSelectOrganList.do"   
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
			$.ajax({
				url : "/organ/ajaxSelectDepartmentList.do",
				type : "POST",
				dataType : "JSON",
				data : {
					"schoolCode" : ui.item.schoolCode
				} // 검색 키워드
				,
				success : function(data) { // 성공
					// 기존에 목록이 있을 경우 select의 하위 자식 element 삭제
					$("#departList").empty();
					var departList = data.departList;
					$("#departList").append("<option selected='selected'>부서(반)을 선택해주세요</option>");
					for(var i=0; i<departList.length; i++){
						$("#departList").append("<option value='"+departList[i].CLASS_CODE+"'>"+departList[i].CLASS_NAME+"</option>");
					}
				},
				error : function() { //실패
					alert("관리자에게 문의해주세요.");
				}
			});
		},
		open: function() {
	        $("ul.ui-menu").width($(this).innerWidth());
	    },
		delay : 300
	});
	
	
	// jqGrid
	var colNameArray = 
		[
			'피측정자 이름'
			,'피측정자 아이디'
		];
	
	$("#grid").jqGrid({
		url : "/admin/utils/selectUserNameList.do",
		mtype: "POST",
		datatype : "json",
		contentType: "application/json; charset=utf-8",
		colNames : colNameArray,
		colModel: [
						{
							name:'userName',
							index:'userName',
							width:'100%',
							align:'center',
							editable:true
						}
						,{
							name:'userId',
							index:'userId',
							align:"center",
							key:true
						}
					],
		// caption : "...",	// jqGrid 제목(접었다 펼치기 가능)
		pager : $('#pager'),
		rowNum : 30,	// 보여 줄 행의 개수
		loadonce:true,
		height : 528, // 그리드의 높이를 해상도 변경에 따라 변하도록 변경해줘야함
		autowidth : true, // 가로 크기 자동 조절
		rownumbers : false, // 행 번호
		cellEdit:true, //그리드 수정 가능 기능
		cellsubmit : 'remote',
        cellurl : '/admin/utils/updateUserName.do',
		multiselect:false, // checkbox
		styleUI: 'Bootstrap',
		afterEditCell:function(rowid, cellname, value, iRow, iCol){
		    $("#"+rowid+"_"+cellname).blur(function(){
		        $("#grid").jqGrid("saveCell",iRow,iCol);
		    });
		}
	});

	// option 태그 클릭 시 jqGrid Reload
	function onSelect(){
		var classCode = $("#departList").val();
		var postData = {
			'classCode' : classCode,
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
</script>
</body>
</html>

