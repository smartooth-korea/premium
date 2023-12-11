<!-- 홀딩 -->
<!-- 홀딩 -->
<!-- 홀딩 -->
<!-- 홀딩 -->
<!-- 홀딩 -->
<!-- 홀딩 -->
<!-- 홀딩 -->
<!-- 홀딩 -->
<!-- 홀딩 -->
<!-- 홀딩 -->
<!-- 홀딩 -->
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="author" content="스마투스코리아" />
<meta name="description" content="Smartooth" />
<title>㈜스마투스코리아 - 구강상태 측정 및 개인정보 수집 이용 동의서</title>
<link rel="shortcut icon" type="image/x-icon" href="/imgs/common/logo_img_ori.png">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link rel="stylesheet" href="/css/common/layout.css">
<link rel="stylesheet" href="/css/web/user/agreement.css">
<style type="text/css">

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
	z-index: 1511;
	width: 220px;
	line-height: 30px;
}

.ui-menu-item{
	margin-left: -30px;
	border-bottom: 1px dotted;
   	border-collapse: collapse;
}

.ui-helper-hidden-accessible{
	display: none;
}

#divideHr{
    margin-top: 0;
    margin-bottom: 0;
    border: 0;
    border-top: 1px solid rgba(0,0,0,.1);
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
						구강상태 측정 및 개인정보<br/>수집 이용 동의서
					</div>
				</div>
				<div class="commonHeight25"></div>
				<form method="post" id="frm" action="/web/user/insertUserInfo.do">
					<div class="row category-wrap">
						<div class="category">구강 상태 측정 서비스 제공을 위하여 아래와 같이 개인정보를 수집·이용하고 제3자에게 제공하고자 합니다. 내용을 자세히 읽으신 후 동의 여부를 결정하여 주십시오
						<!-- <div class="company-title" >㈜스마투스코리아</div>  -->
					</div>
					<div class="commonHeight20"></div>
					<div class="row category-wrap">
						<div class="category">1. 구강상태 측정에 대한 동의</div>
						<div class="commonHeight5"></div>
						<div class="box-wrap">
							<div class="div-wrap">
								본인 및 그 법정대리인은 본인의 올바른 구강관리를 위해 주식회사 스마투스코리아의 장비를 통하여 본인의 구강상태를 측정함에 동의합니다.
							</div>
							<div class="checkBox">
								<input type="checkbox" id="measureAgreement_agree" name="measureAgreement" onclick="isMeasureAgreementChecked(0);">
								<label class="label">동의함</label>
								<input type="checkbox" id="measureAgreement_disagree" name="measureAgreement" onclick="isMeasureAgreementChecked(1);">
								<label class="label">동의하지 않음</label>
							</div>
						</div>
					</div>
					<div class="commonHeight20"></div>
					<div class="category">2. 개인정보 수집 · 이용에 관한 동의</div>
					<table class="outter-table">
						<tr>
							<td class="col1">수집 · 이용 목적</td>
							<td class="col2">· 구강 상태 측정을 통한 구강관리 서비스 지원</td>
						</tr>
						<tr>
							<td class="col1">수집 · 이용 항목</td>
							<td class="col2">· 개인정보 : 성명, 생년월일, 보호자 전화번호, 구강 상태 측정 데이터</td>
						</tr>
						<tr>
							<td class="col1">보유 및 이용 기간</td>
							<td class="col2">· 수집일로부터 1년</div></td>
						</tr>
						<tr>
							<td class="td-content"  colspan="2">
								※ 귀하는 개인정보 수집 및 이용에 대하여 거부할 권리가 있습니다. 다만 거부 시 구강 관리 서비스의 제공이 불가함을 알려드립니다.
								<br/>
								※ 본인은 <u>개인정보보호법 제 15조 제1항</u>의 규정에 의거하여 본인의 <b><u>개인정보</u></b>를 제공할 것을 동의합니다.
								<div class="checkBox">
									<input type="checkbox" id="personalInfomationAgreement_agree" name="personalInfomationAgreement" onclick="isPersonalInfomationAgreementChecked(0);">
									<label class="label">동의함</label>
									<input type="checkbox" id="personalInfomationAgreement_disagree" name="personalInfomationAgreement" onclick="isPersonalInfomationAgreementChecked(1);">
									<label class="label">동의하지 않음</label>
								</div>
							</td>
						</tr>
					</table>
					<div class="commonHeight15"></div>
					<div class="category">3. 개인정보 제3자 제공 내역</div>
					<table class="outter-table">
						<tr>
							<td class="col1" style="width:20%">제공받는 기관</td>
							<td class="col2" style="width:30%; text-align: center; padding: 0px;">제공 목적</td>
							<td class="col3" style="width:30%">제공 항목</td>
							<td class="col4" style="width:20%">보유 · 이용기간</td>
						</tr>
						<tr>
							<td class="col1" id="td-schoolName">유치원이름</td>
							<td class="col2" style="text-align: center; padding: 0px;">맞춤형 의학 정보 수집</td>
							<td class="col3">성별, 연령, 구강 측정 데이터</td>
							<td class="col4">1년</td>
						</tr>
						<tr>
							<td class="td-content"  colspan="4">
								※ 위의 개인정보 제공에 대한 동의를 거부할 권리가 있습니다.
								<br/>
								그러나 동의를 거부할 경우 맞춤형 의학정보 이용에 제한을 받을 수 있습니다.
								<div class="checkBox">
									<input type="checkbox" id="medicalInfomationAgreement_agree" name="medicalInfomationAgreement" onclick="isMedicalInfomationAgreementChecked(0);">
									<label class="label">동의함</label>
									<input type="checkbox" id="medicalInfomationAgreement_agree" name="medicalInfomationAgreement" onclick="isMedicalInfomationAgreementChecked(1);">
									<label class="label">동의하지 않음</label>
								</div>
							</td>
						</tr>
					</table>
					<div class="commonHeight15"></div>
<!-- 만 14세 미만 -->
					<div class="under_fourteen" style="display: none;">
						<div style="display: flex;align-items: center;">
							<div class="category" style="width:88.5%">4. 미성년자(만14세 미만)의 개인정보 동의 여부</div>
							<div>
								<input type="button" id="addStudentUser" style="font-size: 13px;" value="자녀 추가">
							</div>
						</div>
						<div class="outter-table">
							<div class="div-wrap">
								<div class="divCol1">
									법정대리인 성명<font style="color: red; font-weight: bold;">*</font>
								</div>
								<div class="divCol2">
									<input type="text" id="parentUserName" name="parentUserName" class ="form-control" >
								</div>
							</div>
							<div class="div-wrap">
								<div class="divCol1">
									법정대리인 연락처<font style="color: red; font-weight: bold;">*</font>
								</div>
								<div class="divCol2">
									<select id="parentUserTelNo1" name="parentUserTelNo1" class="form-control telNo" >
													<option value="010" selected="selected">010</option>
													<option value="011">011</option>
													<option value="016">016</option>
													<option value="017">017</option>
													<option value="018">018</option>
													<option value="019">019</option>
									</select>
									-<input type="text" id="parentUserTelNo2" name="parentUserTelNo2" class ="form-control telNo" onkeyup="isNumeric(this)" onkeydown="isNumeric(this)" maxlength="4">
									-<input type="text" id="parentUserTelNo3" name="parentUserTelNo3" class ="form-control telNo" onkeyup="isNumeric(this)" onkeydown="isNumeric(this)" maxlength="4">
								</div>
							</div>
<!-- 자녀 html -->
							<hr id="divideHr">
							<div class="inner-student-div">
								<div class="div-wrap">
									<div class="divCol1">
										유치원, 어린이집<font style="color: red; font-weight: bold;">*</font>
									</div>
									<div class="divCol2">
										<input type="text" id="schoolName1" name="schoolName1" class ="form-control schoolName" placeholder="유치원, 어린이집을 검색 후 선택하세요.">
									</div>
								</div>
								<div class="div-wrap">
									<div class="divCol1">
										소속 반<font style="color: red; font-weight: bold;">*</font>
									</div>
									<div class="divCol2">
										<select id="departList1" name="classCode1" class="departList">
											<option selected='selected'>부서(반)을 선택해주세요</option>
										</select>
									</div>
								</div>
								<div class="div-wrap">
									<div class="divCol1">
										자녀 성명<font style="color: red; font-weight: bold;">*</font>
									</div>
									<div class="divCol2">
										<input type="text" id="parentUserName" name="parentUserName" class ="form-control" >
									</div>
								</div>
								<div class="div-wrap">
									<div class="divCol1">
										자녀 생년월일<font style="color: red; font-weight: bold;">*</font>
									</div>
									<div class="divCol2">
										<input type="date" id="studentUserBirthday" name="studentUserBirthday" class="userBirthday"data-placeholder="날짜 선택">
									</div>
								</div>
								<div class="div-wrap">
									<div class="divCol1">
										자녀 성별<font style="color: red; font-weight: bold;">*</font>
									</div>
									<div class="divCol2" style="text-align: center;">
										<input type="radio" name="studentUserSex" value="M">&nbsp;남</input>
													&nbsp; &nbsp; &nbsp;
										<input type="radio" name="studentUserSex" value="F">&nbsp;여</input>
									</div>
								</div>
							</div>
							<hr id="divideHr">
							<div id="appendHtml"></div>
							<hr id="divideHr">
							<div class="commonHeight15"></div>
							<div>
								<div style="font-size: 14px; padding: 15px;">
									※ 본인<font style="color: red; font-weight: bold;">*</font>은 ( <input type ="text" id="studentUserName" name="studentUserName" class ="studentUserName" placeholder="자녀의 이름"> )의 법정 대리인으로, <u>개인정보보호법 제22조 제6항 및 동법 시행령 제 17조</u>에 따라
									개인정보의 수집·이용·제공 등에 대하여 확인하였습니다.
								</div>
								<div class="checkBox">
									<input type="checkbox" id="ageAgreement_agree" name="submitAgreement" onclick="isSubmitAgreementChecked(0);">
									<label class="label">동의함</label>
									<input type="checkbox" id="ageAgreement_disagree" name="submitAgreement" onclick="isSubmitAgreementChecked(1);">
									<label class="label">동의하지 않음</label>
								</div>
							</div>
							</div>
						</div>
					</div>
				<input type="hidden" id="schoolCode" name="schoolCode" value="">
				<input type="hidden" id="userType" name="userType" value="">
				<div class="commonHeight15"></div>
				<button class="btn btn-primary btn-lg btn-block" id="submit">동의서 제출</button>
				</form>
			</div>
		</div>
	</div>
<script>

	var msg = "${msg}";
	if(msg!=null && msg!=""){
		alert(msg);
	}

	// 숫자 정규식 검증
	function isNumeric(obj){
		var regExp = /[^0-9]/g;
		if(regExp.test(obj.value)){
			alert("숫자만 입력이 가능합니다.")
			obj.value = obj.value.substring(0, obj.value.length -1);
		}
	}
	
	// 체크박스 중복되지 않도록 하는 기능
	function isMeasureAgreementChecked(isAgree) {
		if(isAgree==0){
			$('#measureAgreement_disagree').prop('checked',false);
	    }
		if(isAgree==1){
			$('#measureAgreement_agree').prop('checked',false);
	    }
	}
	function isPersonalInfomationAgreementChecked(isAgree) {
		if(isAgree==0){
			$('#personalInfomationAgreement_disagree').prop('checked',false);
	    }
		if(isAgree==1){
			$('#personalInfomationAgreement_agree').prop('checked',false);
	    }
	}
	function isMedicalInfomationAgreementChecked(isAgree) {
		if(isAgree==0){
			$('#medicalInfomationAgreement_agree').prop('checked',false);
	    }
		if(isAgree==1){
			$('#medicalInfomationAgreement_agree').prop('checked',false);
	    }
	}
	function isSubmitAgreementChecked(isAgree) {
		if(isAgree==0){
			$('#ageAgreement_disagree').prop('checked',false);
	    }
		if(isAgree==1){
			$('#ageAgreement_disagree').prop('checked',false);
	    }
	}
	
// 	// 14세 미만 혹은 이상 체크
// 	function agreementAgeChk(isOverFourteen){
// 		if(isOverFourteen == 'N'){
	
	$('#over_fourteen').prop('checked',false);
	$('.under_fourteen').css('display', 'block');
	$('.over_fourteen').css('display', 'none');
	
// 	    }
// 		if(isOverFourteen=='Y'){
// 			$('#under_fourteen').prop('checked',false);
// 			$('.over_fourteen').css('display', 'block');
// 			$('.under_fourteen').css('display', 'none');
// 	    }
// 	}	
	
	// 기관 이름 검색
	$('#schoolName1').autocomplete({
		source : function(request, response) { //source: 입력시 보일 목록
			$.ajax({
				//url : "/organ/ajaxSelectOrganList.do"   
		        url : "/organ/ajaxSelectSchoolList.do"   
		        ,type : "POST"
		        ,dataType: "JSON"
		        ,data : {value: request.term}	// 검색 키워드
		        ,success : function(data){ 	// 성공
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
	    	$('#td-schoolName').attr("value", ui.item.schoolName);
	    	schoolName1
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
					$("#departList1").empty();
					var departList = data.departList;
					$("#departList1").append("<option selected='selected'>부서(반)을 선택해주세요</option>");
					for(var i=0; i<departList.length; i++){
						$("#departList1").append("<option value='"+departList[i].CLASS_CODE+"'>"+departList[i].CLASS_NAME+"</option>");
					}
				},
				error : function() { //실패
					alert("관리자에게 문의해주세요.");
				}
			});
		},
		delay : 300
	});
	
	
	$('#schoolName2').autocomplete({
		source : function(request, response) { //source: 입력시 보일 목록
			$.ajax({
				//url : "/organ/ajaxSelectOrganList.do"   
		        url : "/organ/ajaxSelectSchoolList.do"   
		        ,type : "POST"
		        ,dataType: "JSON"
		        ,data : {value: request.term}	// 검색 키워드
		        ,success : function(data){ 	// 성공
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
					$("#departList2").empty();
					var departList = data.departList;
					$("#departList2").append("<option selected='selected'>부서(반)을 선택해주세요</option>");
					for(var i=0; i<departList.length; i++){
						$("#departList2").append("<option value='"+departList[i].CLASS_CODE+"'>"+departList[i].CLASS_NAME+"</option>");
					}
				},
				error : function() { //실패
					alert("관리자에게 문의해주세요.");
				}
			});
		},
		delay : 300
	});
	
	
	
	// 자녀 추가	
	$("#addStudentUser").click(function(){
		
		var html = "<div class='commonHeight5'></div>"
		+"<div class='div-wrap'>"
		+"<div class='divCol1'>자녀 성명<font style='color: red; font-weight: bold;'>*</font></div>"
		+"<div class='divCol2'><input type='text' id='studentUserName' name='studentUserName' class ='form-control' ></div>"
		+"</div>"
		+"<div class='div-wrap'>"
		+"<div class='divCol1'>자녀 생년월일<font style='color: red; font-weight: bold;'>*</font></div>"
		+"<div class='divCol2'><input type='date' id='studentUserBirthday' name='studentUserBirthday' class='userBirthday'data-placeholder='날짜 선택'></div>"
		+"</div>"
		+"<div class='div-wrap'>"
		+"<div class='divCol1'>자녀 성별<font style='color: red; font-weight: bold;'>*</font></div>"
		+"<div class='divCol2' style='text-align: center;'><input type='radio' name='studentUserSex' value='M'>&nbsp;남</input>&nbsp; &nbsp; &nbsp;<input type='radio' name='studentUserSex' value='F'>&nbsp;여</input></div>"
		+"</div>";
		
		$("#appendHtml").append(html);
		
	});
	
	
	// 전송
	$("#submit").click(function(){
		
	    	// 회원 유형 : 환자	    	
	    	$('#userType').attr("value", 'ST');
	    	
	    	// checkbox 체크 여부 확인
			if($('#measureAgreement_agree').is(":checked") == false){
				alert("필수 약관에 동의해주세요.");
				return false;
			}
			if($('#personalInfomationAgreement_agree').is(":checked") == false){
				alert("필수 약관에 동의해주세요.");
				return false;
			}
			// 14세 미만일 경우 미성년자의 개인정보 동의 여부 확인
			if($('#ageAgreement_agree').is(":checked") == false){
				alert("필수 약관에 동의해주세요.");
				return false;	
			}
			
			if($("#parentUserName").val() == ""){
				alert("법정대리인 성명을 입력해주세요.");
				$("#parentUserName").focus();
				return false;
			}
			
			if($("#parentUserTelNo2").val() == ""){
				alert("법정대리인 연락처를 입력해주세요.");
				$("#parentUserTelNo2").focus();
				return false;
			}
			if($("#parentUserTelNo3").val() == ""){
				alert("법정대리인 연락처를 입력해주세요.");
				$("#parentUserTelNo3").focus();
				return false;
			}
			
			if($("#schoolName1").val() == ""){
				alert("기관(학교)을 입력해주세요.");
				$("#schoolName1").focus();
				return false;
			}
			
			if($("#departList1").val().indexOf("KR") == -1){
				alert("부서(반)을 선택해주세요.");
				$("#departList1").focus();
				return false;
			}
			
			if($("#studentUserSex").val().indexOf("M") == -1 && $("#studentUserSex").val().indexOf("F") == -1 ){
				alert("자녀의 성별을 선택해주세요.");
				$("#studentUserSex").focus();
				return false;
			}
			
			if($("#studentUserBirthday").val() == ""){
				alert("자녀의 성별을 선택해주세요.");
				$("#studentUserBirthday").focus();
				return false;
			}
			
			if($("#studentUserName").val() == ""){
				alert("자녀의 성명을 입력해주세요.");
				$("#studentUserName").focus();
				return false;
			}
		
			alert("동의서에 작성해주신 전화번호를 사용하여\n부모님의 아이디, 자녀의 아이디가 생성되오니\n정확한 입력 부탁드립니다.");
			
			if(window.confirm("법정대리인 성명 : "+$("#parentUserName").val()+"\n법정대리인 연락처: "+$("#parentUserTelNo1").val()+"-"+$("#parentUserTelNo2").val()+"-"+$("#parentUserTelNo3").val()
				+"\n법정대리인과의 관계 : "+$("#relationship").val()+"\n기관(학교) : "+$("#schoolName1").val()+"\n부서(반) : "+$("#departList1 option:selected").text()
				+"\n자녀 성명 : "+$("#studentUserName").val() +"\n자녀의 생년월일 : "+$("#studentUserBirthday").val()+"\n자녀의 성별 : "+$("#studentUserSex option:selected").text()+"\n\n입력하신 정보가 맞으실 경우 확인을 눌러주세요.\n아닐 경우 취소를 눌러주세요.") == true) {

				$("#frm").attr("action","/web/user/insertUserInfo.do").submit();
				
	   		 }else{
				return false;
			}
	    }else{
	    	
			// 회원 유형 : 환자	    	
	    	$('#userType').attr("value", 'PT');
	    	
	    	// checkbox 체크 여부 확인
			if($('#measureAgreement_agree').is(":checked") == false){
				alert("필수 약관에 동의해주세요.");
				return false;
			}
			if($('#personalInfomationAgreement_agree').is(":checked") == false){
				alert("필수 약관에 동의해주세요.");
				return false;
			}
			
			if($("#studentUserName").val() == ""){
				alert("성명을 입력해주세요.");
				$("#studentUserName").focus();
				return false;
			}
			
			if($("#userTelNo2").val() == ""){
				alert("연락처를 입력해주세요.");
				$("#userTelNo2").focus();
				return false;
			}
			if($("#userTelNo3").val() == ""){
				alert("연락처를 입력해주세요.");
				$("#userTelNo3").focus();
				return false;
			}
			
			if($("#schoolName2").val() == ""){
				alert("기관을 입력해주세요.");
				$("#schoolName2").focus();
				return false;
			}
			
			if($("#departList2").val().indexOf("KR") == -1){
				alert("부서을 선택해주세요.");
				$("#departList2").focus();
				return false;
			}
			
			if($("#userSex").val().indexOf("M") == -1 && $("#userSex").val().indexOf("F") == -1 ){
				alert("성별을 선택해주세요.");
				$("#userSex").focus();
				return false;
			}
			
			if($("#userBirthday").val() == ""){
				alert("생년월일을 선택해주세요.");
				$("#userBirthday").focus();
				return false;
			}
			
			alert("동의서에 작성해주신 전화번호를 사용하여\n아이디가 자동으로 생성되오니\n정확한 입력 부탁드립니다.");
			
			if(window.confirm("성명 : "+$("#studentUserName").val()+"\n연락처: "+$("#userTelNo1").val()+"-"+$("#userTelNo2").val()+"-"+$("#userTelNo3").val()
				+"\n기관 : "+$("#schoolName2").val()+"\n부서(반) : "+$("#departList2 option:selected").text()
				+"\n생년월일 : "+$("#userBirthday").val()+"\n성별 : "+$("#userSex option:selected").text()+"\n\n입력하신 정보가 맞으실 경우 확인을 눌러주세요.\n아닐 경우 취소를 눌러주세요.") ==true) {
				
				$("#frm").attr("action","/web/user/insertUserInfo.do").submit();
				//$("#frm").submit();
			}else{
				return false;
			}
		}
	});
	
</script>
</body>
</html>