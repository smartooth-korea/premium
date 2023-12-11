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
<title>㈜스마트코리아 사용자 관리</title>
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
.container-fluid{
	height: 91vh;
}

.row{
	height: 95%;
}

.card{
	height: 97%;
}

.card-title {
    margin-bottom: 1.5rem;
}

p{
	margin-top: 0;
    margin-bottom: 1rem;
    padding-left: 15px;
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
    width: 500px;
    height: 480px;
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

.telNo{
    width: 75px;
}

.userType{
    text-align: center;
	font-size: 15px;
}

.userType{
    text-align: center;
	font-size: 15px;
}

.ui-autocomplete {
	border: none;
	position: relative;
	background-color: #ffffff; 
	list-style:none;
	font-size: 14px;
	margin-bottom: 5px;
	padding-top: 2px;
	border: 1px solid #DDD !important;
	padding-top: 0px !important;
	line-height: 30px;
	text-align: center;
	width: 290px;
}

.ui-menu-item{
	margin-left: -30px;
	border-bottom: 1px dotted;
   	border-collapse: collapse;
}

.ui-front{
	z-index: 9999;
}

.ui-helper-hidden-accessible{
	display: none;
}

#schoolName{
	width : 290px; 
}

/* datepicker 설정 */
input[type="date"] {
    background: url(/imgs/icon/icon-calendar.png) no-repeat;
    background-size: 20px 20px;
    height: 35px;
    width: 130px;
    padding-left: 15px;
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

@import url("//fonts.googleapis.com/earlyaccess/nanumgothic.css" );
input[type=password]{
	font-family:"Nanum Gothic", sans-serif !important;
}

input.form-control{
	width: 30%;
}

a.btn-primary{
	margin-left: 30px;
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
<!--                     <div class="row"> -->

                        <!-- Earnings (Monthly) Card Example -->
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-primary shadow h-100 py-2">
                                <div class="card-body organList">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
												사용자 정보 수정
                                             </div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-user fa-2x text-gray-333"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
<!--                     </div> -->
                    <!-- Content Row -->
                    <div class="row">
<!-- jqGrid -->
<!--<div class="col-xl-8 col-lg-7"> -->
						<div class="col-xl-12" style="align-content: center;">
                            <div class="card">
								<!--<img class="card-img-top" src="imgs/login/bg_login.jpg" alt="Card image cap">-->
								<div class="card-body">
								  <h5 class="card-title">사용자 정보 수정</h5>
								  <p class="card-text">사용자 아이디 : <input type ="text" id="userId" value="${userInfo.userId.replace('undefined', '')}" class ="form-control" disabled></p>
								  <p class="card-text">사용자 비밀번호 : <input type ="password" id="userPwd" value="" class ="form-control"></p>
								  <p class="card-text">비밀번호 확인 : <input type ="password" id="userPwd2" value="" class ="form-control"></p>
								  <a href="#" onclick="onPwdSave();" class="btn btn-primary">비밀번호 저장</a>
								  <br/><br/><br/>
								  <p class="card-text">사용자 이름 : <input type ="text" id="userName" value="${userInfo.userName.replace('undefined', '')}" class ="form-control"></p>
								  <p class="card-text">사용자 연락처 : <input type ="text" id="userTelNo" value="${userInfo.userTelNo.replace('undefined', '')}" class ="form-control"></p>
								  <p class="card-text">사용자 이메일 : <input type ="text" id="userEmail" value="${userInfo.userEmail.replace('undefined', '')}" class ="form-control"></p>
								  <a href="#" onclick="onProfileSave();" class="btn btn-primary">사용자 정보 수정(저장)</a>
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
		var userInfo = "${userInfo}";
	});

	function onPwdSave() {
		var userId = $('#userId').val();
		var regExpPw = /^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+]).{8,16}$/;
		var strPwd1 = $('#userPwd').val();
		var strPwd2 = $('#userPwd2').val();

		if(strPwd1 != strPwd2){
			alert("The passwords entered do not match.");
			return false;
		}else{
			if(!regExpPw.test(strPwd1)){
				//alert("8-16 characters including English/special characters/numbers");
				alert("8-16자 사이의 영어/특수문자/숫자를 포함한 문자를 사용하여 암호를 설정하시기 바랍니다.");
				return false;
			}else{
				$.ajax({
					type:'POST',   //post 방식으로 전송
					url:'/admin/user/updateAdminUserPwd.do',   //데이터를 주고받을 파일 주소
					data:JSON.stringify ({
						"userId" : userId
						,"userPwd" : strPwd1
					}),   //위의 변수에 담긴 데이터를 전송해준다.
					dataType:'JSON',   //json 파일 형식으로 값을 담아온다.
					contentType : "application/json; charset=UTF-8",
					success : function(data){   //파일 주고받기가 성공했을 경우. data 변수 안에 값을 담아온다.
						//alert("Your password has been changed."); 
						alert("비밀번호가 변경되었습니다."); 
						window.close();
			 		
					},
					error:function(request,status,error){
						alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"
								+"\n"
								+"\n"
								+"An 서버 에러가 발생했습니다. 관리자에게 문의해주시기 바랍니다\n"
								+"\n"
								+"\n"+"smartooth.system@gmail.com"
								+"\n"
								+"\n"
								+"\n");
					}
				});
			}
		}
	}

	function onProfileSave() {
		var userId = $('#userId').val();
		var userName = $('#userName').val();
		var userEmail = $('#userEmail').val();
		var userTelNo = $('#userTelNo').val();
		var regExpEmail = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;

		var isValid = true;
		var errMsg = '';
		if (userName == '') {
			isValid = false;
			errMsg = '이름을 입력해 주세요.'
			document.getElementById('userName').focus();
		}
		if (userEmail == '') {
			isValid = false;
			errMsg = '이메일을 입력해 주세요.'
			document.getElementById('userEmail').focus();
		}
		if (userTelNo == '') {
			isValid = false;
			errMsg = '연락처를 입력해 주세요.'
			document.getElementById('userTelNo').focus();
		}

		if (!isValid) {
			alert(errMsg);
			return false;
		} else if(!regExpEmail.test(userEmail)){
			//alert("8-16 characters including English/special characters/numbers");
			alert("이메일 형식으로 입력해 주세요.");
			document.getElementById('userEmail').focus();
			return false;
		}else{
			$.ajax({
				type:'POST',   //post 방식으로 전송
				url:'/admin/user/updateAdminUserInfo.do',   //데이터를 주고받을 파일 주소
				data:JSON.stringify ({
					"userId" : userId
					,"userName" : userName
					,"userEmail" : userEmail
					,"userTelNo" : userTelNo
				}),   //위의 변수에 담긴 데이터를 전송해준다.
				dataType:'JSON',   //json 파일 형식으로 값을 담아온다.
				contentType : "application/json; charset=UTF-8",
				success : function(data){   //파일 주고받기가 성공했을 경우. data 변수 안에 값을 담아온다.
					//alert("Your password has been changed."); 
					if (data.code == "000") {
						alert("회원정보가 변경되었습니다."); 
						window.close(); 
					} else {
						alert(data.msg); 
						window.close(); 
					}
		 		
				},
				error:function(request,status,error){
					alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"
							+"\n"
							+"\n"
							+"An 서버 에러가 발생했습니다. 관리자에게 문의해주시기 바랍니다\n"
							+"\n"
							+"\n"+"smartooth.system@gmail.com"
							+"\n"
							+"\n"
							+"\n");
				}
			});
		}
	}

	// 검색 
	//	$("#search").on("click", function() {
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
	
	
	function opSubmit(){

		if($("#paUserName").val() == ""){
			alert("법정대리인 성명을 입력해주세요.");
			$("#paUserName").focus();
			return false;
		}
		
		if($("#paUserTelNo2").val() == ""){
			alert("법정대리인 연락처를 입력해주세요.");
			$("#paUserTelNo2").focus();
			return false;
		}
		
		if($("#paUserTelNo3").val() == ""){
			alert("법정대리인 연락처를 입력해주세요.");
			$("#paUserTelNo3").focus();
			return false;
		}
		
		if($("#schoolName").val() == ""){
			alert("기관(학교)을 입력해주세요.");
			$("#schoolName").focus();
			return false;
		}
		
		if($("#departList").val().indexOf("KR") == -1){
			alert("부서(반)을 선택해주세요.");
			$("#departList").focus();
			return false;
		}
		
		if($("#stUserSex").val().indexOf("M") == -1 && $("#stUserSex").val().indexOf("F") == -1 ){
			alert("자녀의 성별을 선택해주세요.");
			$("#stUserSex").focus();
			return false;
		}
		
		if($("#userBirthday").val() == ""){
			alert("자녀의 성별을 선택해주세요.");
			$("#userBirthday").focus();
			return false;
		}
		
		if($("#stUserName").val() == ""){
			alert("자녀의 성명을 입력해주세요.");
			$("#stUserName").focus();
			return false;
		}
		
		if(window.confirm("아이디 : "+$("#userId").val()+"\n이름 : "+$("#userName").val() +"\n구분 : "+userTypeStr+"\n"+"지역(시도) : "+sidoNm+"\n"+"지역(시군구) : "+sigunguNm+"\n"+"지역(읍면동) : "+eupmyeondongNm+"\n"+"\n입력하신 정보가 맞습니까?") ==true){

			var formData = $("#frm").serialize();
			
			$.ajax({
	            cache : false,
	            url : "/admin/user/insertUserInfo",
	            type : 'POST', 
	            data : formData, 
	            success : function(data, statusText, jqXHR) {
	            	var isRegist = data.isRegist;
	            	alert(isRegist);
	            	if(isRegist){
	            		alert("등록이 완료되었습니다.");
		            	insertModal.classList.remove('show');
		                location.reload();
	            	}else{
						alert("등록에 실패하였습니다. 관리자에게 문의 부탁드립니다.")	            		
	            	}
	            },
	            error : function(jqXHR, textStatus, errorThrown) {
	            	alert("기관 등록에 실패하였습니다. 관리자에게 문의 부탁드립니다.");
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
	    	$.ajax({
				url : "/admin/organ/ajaxSelectDepartmentList.do",
				type : "POST",
				dataType : "JSON",
				data : {
					"schoolCode" : selectedSchoolCode
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
		delay : 300
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