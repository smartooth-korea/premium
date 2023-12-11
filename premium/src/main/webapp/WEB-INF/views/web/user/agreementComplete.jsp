<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="author" content="스마투스코리아" />
<meta name="description" content="Smartooth" />
<title>㈜스마투스코리아 - 구강상태 측정 및 개인정보 수집 이용 동의서</title>
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
						<div class="category">1. 구강 상태 측정 동의 및 개인 정보 제공을 받는 회사 : </div>
						<div class="company-title" >㈜스마투스코리아</div>
					</div>
					<div class="commonHeight20"></div>
					<div class="row category-wrap">
						<div class="category">2. 구강상태 측정에 대한 동의</div>
						<div class="commonHeight5"></div>
						<div class="box-wrap">
							<div class="a1">
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
					<div class="category">3. 개인정보 수집 · 이용에 관한 동의</div>
					<table class="outterTable">
						<tr>
							<td class="col1">수집 · 이용 목적</td>
							<td class="col2">· 구강 상태 측정을 통한 구강관리 서비스 지원</td>
						</tr>
						<tr>
							<td class="col1">수집 · 이용 목적</td>
							<td class="col2">· 개인정보 : 성명, 생년월일, 보호자 전화번호</td>
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
					<div class="category">4. 미성년자(만14세 미만)의 개인정보 동의 여부</div>
					<table class="outterTable">
						<tr>
							<td>
								<table class="innerTable">
									<tr style="border: 0px">
										<td class="css">법정대리인<br/>성명<font style="color: red; font-weight: bold;">*</font></td>
										<td><input type="text" class ="form-control" id="paUserName" name="paUserName"></td>
									</tr>
									<tr style="border: 0px">
										<td class="css">법정대리인<br/>연락처<font style="color: red; font-weight: bold;">*</font></td>
										<td>
											<select class="form-control telNo" id="paUserTelNo1" name="paUserTelNo1">
												<option value="010" selected="selected">010</option>
												<option value="011">011</option>
												<option value="016">016</option>
												<option value="017">017</option>
												<option value="018">018</option>
												<option value="019">019</option>
											</select>-
											<input type="text" class ="form-control telNo" id="paUserTelNo2" name="paUserTelNo2" onkeyup="isNumeric(this)" onkeydown="isNumeric(this)" maxlength="4">-
											<input type="text" class ="form-control telNo" id="paUserTelNo3" name="paUserTelNo3" onkeyup="isNumeric(this)" onkeydown="isNumeric(this)" maxlength="4">
										</td>
									</tr>
									<tr style="border: 0px">
										<td class="css">법정대리인과의<br/>관계</td>
										<td><input type="text" id="" class ="form-control"></td>
									</tr>														
									<tr style="border: 0px">
										<td class="css ">기관(학교)<font style="color: red; font-weight: bold;">*</font></td>
										<td><input type="text" id="schoolName" name="schoolName" class ="form-control" placeholder="기관(학교)를 검색 후 선택하세요."></td>
									</tr>														
									<tr style="border: 0px">
										<td class="css">부서(반)<font style="color: red; font-weight: bold;">*</font></td>
										<td>
											<select id="departList" name="classCode">
												<option selected='selected'>부서(반)을 선택해주세요</option>
											</select>
										</td>
									</tr>
									<tr style="border: 0px">
										<td class="css">
											법정대리인<br>생년월일<font style="color: red; font-weight: bold;">*</font>
										</td>
										<td>
											<input type="date" id="userBirthday" name="userBirthday" data-placeholder="날짜 선택">
										</td>
									</tr>
									<tr style="border: 0px">
										<td class="css">
											법정대리인<br>성별<font style="color: red; font-weight: bold;">*</font>
										</td>
										<td>
											<select id="stUserSex" name="stUserSex">
												<option selected='selected'>성별을 선택해주세요</option>
												<option value="M">남</option>
												<option value="F">여</option>
											</select>
										</td>
									</tr>																						
								</table>
							</td>
						</tr>
						<tr>
							<td class="td-content"  colspan="3">
								※ 본인<font style="color: red; font-weight: bold;">*</font>은 ( <input type ="text" id="stUserName" name="stUserName" class ="form-control" placeholder="자녀의 이름"> )의 법정 대리인으로, <u>개인정보보호법 제22조 제6항 및 동법 시행령 제 17조</u>에 따라
								개인정보의 수집·이용·제공 등에 대하여 확인하였습니다.
								<div class="checkBox">
									<input type="checkbox" id="submitAgreement_agree" name="submitAgreement" onclick="isSubmitAgreementChecked(0);">
									<label class="label">동의함</label>
									<input type="checkbox" id="submitAgreement_disagree" name="submitAgreement" onclick="isSubmitAgreementChecked(1);">
									<label class="label">동의하지 않음</label>
								</div>
							</td>
						</tr>
					</table>
					<div class="commonHeight15"></div>
					<button class="btn btn-primary btn-lg btn-block" id="submit">동의서 제출</button>
					<input type="hidden" id="schoolCode" name="schoolCode" value="">
				</form>
			</div>
		</div>
		<footer class="my-3 text-center text-small">
			<p class="mb-1">Copyright &copy; Smartooth korea 2023</p>
		</footer>
	</div>
<script>

	var clientWidth = $('body').width();
	console.log("clientWdith >>> "+clientWidth);
	
	// 숫자 정규식 검증
	function isNumeric(obj){
		var regExp = /[^0-9]/g;
		if(regExp.test(obj.value)){
			alert("숫자만 입력이 가능합니다.")
			obj.value = obj.value.substring(0, obj.value.length -1);
		}
	}
	
	// 전화번호 숫자 4자 입력 완료 시 focus 이동
	$("#paUserTelNo2").on("keyup",function(){
		if(this.value.length == 4){
			$("#paUserTelNo3").focus();
		}	
	});
	$("#paUserTelNo3").on("keyup",function(){
		if(this.value.length == 4){
			$("#paUserTelNo3").focus();
		}	
	});
	
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
	function isSubmitAgreementChecked(isAgree) {
		if(isAgree==0){
			$('#submitAgreement_disagree').prop('checked',false);
	    }
		if(isAgree==1){
			$('#submitAgreement_agree').prop('checked',false);
	    }
	}
	
	
	$('#schoolName').autocomplete({
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
	
	$("#submit").click(function(){
		
		// checkbox 체크 여부 확인
		if($('#measureAgreement_agree').is(":checked") == false){
			alert("필수 약관에 동의해주세요.");
			return false;
		}
		if($('#personalInfomationAgreement_agree').is(":checked") == false){
			alert("필수 약관에 동의해주세요.");
			return false;
		}
		if($('#submitAgreement_agree').is(":checked") == false){
			alert("필수 약관에 동의해주세요.");
			return false;	
		}
		
		$("#frm").submit();
		
	});
	
</script>
</body>

</html>