<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="author" content="스마투스코리아" />
<meta name="description" content="Smartooth" />
<title>유치원 진단 결과지 :: Smartooth </title>
<script type="text/javascript" src="/js/jquery/jquery.js"></script>
<script type="text/javascript" src="/js/web/diagnosis.js"></script>
<link rel="shortcut icon" type="image/x-icon" href="/imgs/common/logo_img_ori.png">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="js/statistics/html2canvas.js"></script>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="/css/common/layout.css">
<link rel="stylesheet" href="/css/web/statistics/diagnosis_main_ko.css">
<!-- SUMMERNOTE LITE -->
<link rel="stylesheet" href="/summernote/summernote-lite.css">
<script src="/summernote/summernote-lite.js"></script>
<script src="/summernote/lang/summernote-ko-KR.js"></script>
</head>
<body>
<div class="container-wrap">
	<div class="container" id="container">
		<div class="input-form-backgroud row">
			<div class="input-form col-md-12 mx-auto">
				<jsp:include page="/WEB-INF/views/web/layout/statistics/menu_api.jsp"></jsp:include>
			<div class="background" id="background">
				<div class="container-top">
					<div class="container-margin"></div>
					<div id="userName" class="userName">${dataList.userName}</div>
					<div id="" class="measureDt-title">측정 일자</div>
					<div id="measuerDt" class="measureDt">
						${measureDt}
					</div>
				</div>
				<div class="contentsWrap">
			<div class="temp1" style="width: 22px;">
			</div>
					<div class="contentsWrap1 toothCondition">
						<div class="toothwrap">

							<div id="t11">
								<img id="tooth11" class="teeth" alt="영구치11번" src="/imgs/tooth/empty.png">
							</div>
							<div id="t12">
								<img id="tooth12" class="teeth" alt="영구치12번" src="/imgs/tooth/empty.png">
							</div>
							<div id="t21">
								<img id="tooth21" class="teeth" alt="영구치21번" src="/imgs/tooth/empty.png">
							</div>
							<div id="t22">
								<img id="tooth22" class="teeth" alt="영구치22번" src="/imgs/tooth/empty.png">
							</div>
							
							<div id="t16">
								<img id="tooth16" class="teeth" alt="영구치16번" src="/imgs/tooth/empty.png">
							</div>
							<div id="t55">
								<img id="tooth55" class="teeth" alt="55번치아" src="/imgs/tooth/empty.png">
							</div>
							<div id="t54">
								<img id="tooth54" class="teeth" alt="54번치아" src="/imgs/tooth/empty.png">
							</div>
							<div id="t53">
								<img id="tooth53" class="teeth" alt="53번치아" src="/imgs/tooth/empty.png">
							</div>
							<div id="t52">
								<img id="tooth52" class="teeth" alt="52번치아" src="/imgs/tooth/empty.png">
							</div>
							<div id="t51">
								<img id="tooth51" class="teeth" alt="51번치아" src="/imgs/tooth/empty.png">
							</div>
							<div id="t61">
								<img id="tooth61" class="teeth" alt="61번치아" src="/imgs/tooth/empty.png">
							</div>
							<div id="t62">
								<img id="tooth62" class="teeth" alt="62번치아" src="/imgs/tooth/empty.png">
							</div>
							<div id="t63">
								<img id="tooth63" class="teeth" alt="63번치아" src="/imgs/tooth/empty.png">
							</div>
							<div id="t64">
								<img id="tooth64" class="teeth" alt="64번치아" src="/imgs/tooth/empty.png">
							</div>
							<div id="t65">
								<img id="tooth65" class="teeth" alt="65번치아" src="/imgs/tooth/empty.png">
							</div>
							<div id="t26">
								<img id="tooth26" class="teeth" alt="영구치26번" src="/imgs/tooth/empty.png">
							</div>
							<div id="t71">
								<img id="tooth71" class="teeth" alt="71번치아" src="/imgs/tooth/empty.png">
							</div>
							<div id="t72">
								<img id="tooth72" class="teeth" alt="72번치아" src="/imgs/tooth/empty.png">
							</div>
							<div id="t73">
								<img id="tooth73" class="teeth" alt="73번치아" src="/imgs/tooth/empty.png">
							</div>
							<div id="t74">
								<img id="tooth74" class="teeth" alt="74번치아" src="/imgs/tooth/empty.png">
							</div>
							<div id="t75">
								<img id="tooth75" class="teeth" alt="75번치아" src="/imgs/tooth/empty.png">
							</div>
							<div id="t36">
								<img id="tooth36" class="teeth" alt="영구치36번" src="/imgs/tooth/empty.png">
							</div>
							<div id="t81">
								<img id="tooth81" class="teeth" alt="81번치아" src="/imgs/tooth/empty.png">
							</div>
							<div id="t82">
								<img id="tooth82" class="teeth" alt="82번치아" src="/imgs/tooth/empty.png">
							</div>
							<div id="t83">
								<img id="tooth83" class="teeth" alt="83번치아" src="/imgs/tooth/empty.png">
							</div>
							<div id="t84">
								<img id="tooth84" class="teeth" alt="84번치아" src="/imgs/tooth/empty.png">
							</div>
							<div id="t85">
								<img id="tooth85" class="teeth" alt="85번치아" src="/imgs/tooth/empty.png">
							</div>
							<div id="t46">
								<img id="tooth46" class="teeth" alt="영구치46번" src="/imgs/tooth/empty.png">
							</div>
							
							<div id="t42">
								<img id="tooth42" class="teeth" alt="영구치42번" src="/imgs/tooth/empty.png">
							</div>
							<div id="t41">
								<img id="tooth41" class="teeth" alt="영구치41번" src="/imgs/tooth/empty.png">
							</div>
							<div id="t31">
								<img id="tooth31" class="teeth" alt="영구치31번" src="/imgs/tooth/empty.png">
							</div>
							<div id="t32">
								<img id="tooth32" class="teeth" alt="영구치32번" src="/imgs/tooth/empty.png">
							</div>

						</div>
					</div>
						<div class="temp2" style="width: 24px;">
						</div>
						<div class="contentsWrap2 cavityAmount">
						<div class="cavityValueHeight-top"></div>
						<div class="cavityValue-danger-title">
							병원 내원
						</div>
						<div class="cavityValue" id="cavityDanger">
							${cavityDanger}
						</div>
						<div class="cavityValueHeight-middle"></div>
						<div class="cavityValue-caution-title">
							관리 필요
						</div>
						<div class="cavityValue" id="cavityCaution">
							${cavityCaution}
						</div>
						<div class="cavityValueHeight-bottom"></div>
						<div class="cavityValue-normal-title">
							특이사항 없음
						</div>
						<div class="cavityValue" id="cavityNormal">
							${cavityNormal}
						</div>
						<div class="commonWidth125Height25"></div>
						<div class="commonWidth125Height25"></div>
						<div class="commonWidth125Height25"></div>
						<div class="commonWidth125Height25"></div>
						<div class="commonWidth125Height25"></div>
					</div>
					<div class="temp3" style="width: 25px;"></div>
				</div>
				<div class="contentsWrap3 comment" id="comment">
					<div class="comment-top">코멘트</div>
						<div class="title">
							<div id="diag-title">
								<c:choose>
									<c:when test="${dataList.diagTitle ne null}">
										${dataList.diagTitle}
									</c:when>
								</c:choose>
							</div>
						</div>
					<div class="contents" id="contents">
						<div id="diagDescript">
							${dataList.diagDescript}
						</div>
					</div>
				</div>
				<div class="contents-bottom-div">
					<div class="contents-bottom">
						<div>*본 결과지는 참고용으로만 사용하시고 정확한 진단을 위해<br/>치과 방문을 권장합니다.</div>
					</div>
				</div>
			</div>
		</div>
		</div>
		<div style="display: flex; background-color: #ffffff; width: 375px; flex-direction: column; align-items: center; border-radius: 15px; padding:10px; height: 890px; border: 1px solid #bebebe;">
			<p style="text-align: center; "><b>진단내용</b></p>
			<div style="display: flex; flex-direction: column;">
				<textarea name="diagDescript-textarea" id="diagDescript-textarea" rows="1" cols="100" style="height: 150px;">${tmpDiagDescript}</textarea>
				<br/>
				<button id="btn_editDescript" style="font-size:14px;"><b>변경</b></button>
			</div>
		<div style="height: 15px;"></div>
			<p style="text-align: center;"><b>메모</b></p>
			<div style="display: flex; flex-direction: column;">
				<textarea id="memo-textarea" rows="1" cols="100" style="height: 150px;">${dataList.memo}</textarea>
				<br/>
				<button id="btn_editMemo"  style="font-size:14px;"><b>변경</b></button>
			</div>
			<div style="height: 15px;"></div>
			<button id="btn_downloadImg" style="font-size:14px;"><b>화면저장</b></button>
		</div>
		<div style="height: 30px;"></div>
	</div>
</div>
</body>
<script type="text/javascript">

$(document).ready(function() {
	
	// 버튼 클릭시 스크린샷 후 저장
	$("#btn_downloadImg").click(function(e){
		html2canvas(document.getElementById("background"), {scale:6}).then(function(canvas) {
            var el = document.createElement("a")
            el.href = canvas.toDataURL("image/jpeg");
    		var measureDt = "${dataList.measureDt}";
    		var userName = "${dataList.userName}";
    		var schoolName = "${schoolName}";
    		var className = "${className}";
            el.download = schoolName+"_"+className+"_"+userName+"_"+measureDt+".png"; //다운로드 할 파일명 설정
            el.click();
        });
    });
	
	
	// 진단 내용 에디터
	$("#diagDescript-textarea").summernote({
		width: 345,
		minHeight: 150,
		height: 250,
		focus: false,                  // 에디터 로딩후 포커스를 맞출지 여부
		lang: "ko-KR",					// 한글 설정
		placeholder: "진단내용을 입력해주세요.",	//placeholder 설정
		toolbar: [
			["view", ["codeview"]],
			["help", ["help"]]
		]
	});

	
	// 비고 에디터
	$("#memo-textarea").summernote({
		width: 345,
		minHeight: 150,
		height: 250,
		focus: false,                  // 에디터 로딩후 포커스를 맞출지 여부
		lang: "ko-KR",					// 한글 설정
		placeholder: "특이사항(메모)을 입력해주세요.",	//placeholder 설정
		toolbar: [
			["view", ["codeview"]],
			["help", ["help"]]
		]
	});
	
	
	// 세션 만료 시 창 닫기
	if('${session}' == 'expired') {
		alert("세션이 만료되어 로그아웃합니다. \n다시 로그인 해주시기 바랍니다.");
		window.close();
	}
	
	// 값을 가져와서 데이터를 확인하여 어떤 색으로 변경할지 정해줘야함
	var dataList = new Array();
	var index = 0;
	var diagDescript = "${dataList.diagDescript}";
	var cautionLevel = "${cautionLevel}";
	var dangerLevel = "${dangerLevel}"; 
	
	
	dataList.push({
		userId:"${dataList.userId}"
		
		,t55:"${dataList.t34}"
		,t54:"${dataList.t35}"
		,t53:"${dataList.t36}"
		,t52:"${dataList.t37}"
		,t51:"${dataList.t38}"

		,t61:"${dataList.t39}"
		,t62:"${dataList.t40}"
		,t63:"${dataList.t41}"
		,t64:"${dataList.t42}"
		,t65:"${dataList.t43}"
		
		,t75:"${dataList.t46}"
		,t74:"${dataList.t47}"
		,t73:"${dataList.t48}"
		,t72:"${dataList.t49}"
		,t71:"${dataList.t50}"
		
		,t81:"${dataList.t51}"
		,t82:"${dataList.t52}"
		,t83:"${dataList.t53}"
		,t84:"${dataList.t54}"
		,t85:"${dataList.t55}"

		// 영구치
		,t16:"${dataList.t33}"
		,t26:"${dataList.t44}"
		,t36:"${dataList.t45}"
		,t46:"${dataList.t56}"
		
		
		
		// 영구치 상악
		,t12:"${dataList.t07}"
		,t11:"${dataList.t08}"
		,t21:"${dataList.t09}"
		,t22:"${dataList.t10}"
		
		// 영구치 하악
		,t32:"${dataList.t23}"
		,t31:"${dataList.t24}"
		,t41:"${dataList.t25}"
		,t42:"${dataList.t26}"
		
		
// 		,t51:"${dataList.t33}"
// 		,t52:"${dataList.t34}"
// 		,t53:"${dataList.t35}"
// 		,t54:"${dataList.t36}"
// 		,t55:"${dataList.t37}"
// 		,t61:"${dataList.t38}"
// 		,t62:"${dataList.t49}"
// 		,t63:"${dataList.t40}"
// 		,t64:"${dataList.t41}"
// 		,t65:"${dataList.t42}"
// 		,t71:"${dataList.t43}"
// 		,t72:"${dataList.t44}"
// 		,t73:"${dataList.t45}"
// 		,t74:"${dataList.t46}"
// 		,t75:"${dataList.t47}"
// 		,t81:"${dataList.t48}"
// 		,t82:"${dataList.t49}"
// 		,t83:"${dataList.t50}"
// 		,t84:"${dataList.t51}"
// 		,t85:"${dataList.t52}"
// 		// 영구치
// 		,t16:"${dataList.t03}"
// 		,t26:"${dataList.t14}"
// 		,t36:"${dataList.t19}"
// 		,t46:"${dataList.t30}"
// 		// 영구치 상악
// 		,t12:"${dataList.t07}"
// 		,t11:"${dataList.t08}"
// 		,t21:"${dataList.t09}"
// 		,t22:"${dataList.t10}"
// 		// 영구치 하악
// 		,t32:"${dataList.t23}"
// 		,t31:"${dataList.t24}"
// 		,t41:"${dataList.t25}"
// 		,t42:"${dataList.t26}"
		
		
		,cavityNormal:"${cavityNormal}"
		,cavityCaution:"${cavityCaution}"
		,cavityDanger:"${cavityDanger}"

	});
	
	// 	치아 색상 변경		
	changeToothColorByLevel(dataList, index, cautionLevel, dangerLevel);
	
	
});
	

function onSelect(){ // 날짜 선택
	
	var userId = "${dataList.userId}";
	var userName = "${dataList.userName}";
	var measureDt = $("#measureDtList").val();
	// 값을 가져와서 데이터를 확인하여 어떤 색으로 변경할지 정해줘야함
	var index = 0;
	var dataList = new Array();
	var diagDescript = "${dataList.diagDescript}";
	var cautionLevel = "${cautionLevel}";
	var dangerLevel = "${dangerLevel}"; 
	
	$.ajax({
		type : 'POST',
		url : '/web/statistics/ajaxDiagnosis',
		data:JSON.stringify ({
			"userId" : userId
			,"userName" : userName
			,"measureDt" : measureDt
		}),
		dataType:'JSON',
		contentType : "application/json; charset=UTF-8",
		success : function(data) { 
			var code = data.code;
			if(code == '999'){
				// 세션 만료 시
				alert("세션이 만료되어 로그아웃합니다. \n다시 로그인 해주시기 바랍니다.");
				location.href = "/login";
				return;
			}else if(code == '000'){
				// 조회 성공 시
				dataList.push({
					userId: data.dataList.userId
					
					,t55:data.dataList.t34
					,t54:data.dataList.t35
					,t53:data.dataList.t36
					,t52:data.dataList.t37
					,t51:data.dataList.t38

					,t61:data.dataList.t39
					,t62:data.dataList.t40
					,t63:data.dataList.t41
					,t64:data.dataList.t42
					,t65:data.dataList.t43
					
					,t75:data.dataList.t46
					,t74:data.dataList.t47
					,t73:data.dataList.t48
					,t72:data.dataList.t49
					,t71:data.dataList.t50
					
					,t81:data.dataList.t51
					,t82:data.dataList.t52
					,t83:data.dataList.t53
					,t84:data.dataList.t54
					,t85:data.dataList.t55

					// 영구치
					,t16:data.dataList.t33
					,t26:data.dataList.t44
					,t36:data.dataList.t45
					,t46:data.dataList.t56
					
					
					// 영구치 상악
					,t12:data.dataList.t07
					,t11:data.dataList.t08
					,t21:data.dataList.t09
					,t22:data.dataList.t10
					
					// 영구치 하악
					,t32:data.dataList.t23
					,t31:data.dataList.t24
					,t41:data.dataList.t25
					,t42:data.dataList.t26
					
				});
				
				// 정상, 주의, 충치 개수 변경
				$("#cavityNormal").html(data.cavityNormal);
				$("#cavityCaution").html(data.cavityCaution);
				$("#cavityDanger").html(data.cavityDanger);
				$("#diag-title").html(data.dataList.diagTitle);
				$("#diagDescript").html(data.dataList.diagDescript);
				
				// 	치아 색상 변경		
				changeToothColorByLevel(dataList, index, cautionLevel, dangerLevel);
				// container 높이 재조정			
				// resetContainerHeight();
			}
			
			
			
		},
		error : function(){
			alert("측정 자료 조회에 실패했습니다. \n관리자에게 문의해주시기 바랍니다.");
		}
	});
}


// 진단 내용 변경 
$("#btn_editDescript").click(function(e){
	
	var summernoteContent = $("#diagDescript-textarea").summernote("code");
	var element = document.getElementById("diagDescript");
	element.innerHTML = summernoteContent;
	
	var measureDt = "${dataList.measureDt}";
	var summernoteContent = $("#diagDescript-textarea").val();
	
	$.ajax({
		type:'POST',   //post 방식으로 전송
		url:'/admin/school/statistics/updateDiagDescript.do',   //데이터를 주고받을 파일 주소
		data:JSON.stringify ({ //변수에 담긴 데이터를 전송해준다 (JSON 방식)
			"userId" : '${userId}'
			,"measureDt" : measureDt
			,"diagDescript" : summernoteContent
			
		}),
		dataType:'JSON', //데이터 타입 JSON
		contentType : "application/json; charset=UTF-8",
		success : function(data){   //파일 주고받기가 성공했을 경우. data 변수 안에 값을 담아온다.
			
		}
	});
});



// 비고 값 변경
$("#btn_editMemo").click(function(e){
	
	var summernoteContent = $("#memo-textarea").summernote("code");
	var measureDt = "${dataList.measureDt}";
	
	$.ajax({
		type:'POST',   //post 방식으로 전송
		url:'/admin/school/statistics/updateMemo.do',   //데이터를 주고받을 파일 주소
		data:JSON.stringify ({ //변수에 담긴 데이터를 전송해준다 (JSON 방식)
			"userId" : '${userId}'
			,"measureDt" : measureDt
			,"memo" : summernoteContent
		}),
		dataType:'JSON', //데이터 타입 JSON
		contentType : "application/json; charset=UTF-8",
		success : function(data){   //파일 주고받기가 성공했을 경우. data 변수 안에 값을 담아온다.
			$("#message").html(data);  //현재 화면 위 id="message" 영역 안에 data안에 담긴 html 코드를 넣어준다. 
		}
	});
});

</script>
</html>