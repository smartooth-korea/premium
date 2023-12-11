<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="author" content="㈜스마트코리아" />
<meta name="description" content="Smartooth" />
<title>Smartooth :: 진단지 :: main</title>
<!-- FAVICON ICO ERROR 방지 -->
<link rel="shortcut icon" type="image/x-icon" href="/imgs/common/logo_img_ori.png">
<script type="text/javascript" src="/js/jquery/jquery.js"></script>
<link rel="stylesheet" href="/css/common/layout.css">
<link rel="stylesheet" href="/css/admin/statistics/diagnosis_advice.css">
<link rel="stylesheet" href="/summernote/summernote-lite.css">
<!-- SUMMERNOTE LITE -->
<script src="/summernote/summernote-lite.js"></script>
<script src="/summernote/lang/summernote-ko-KR.js"></script>
<style type="text/css">
.menu {
    display: flex;
    margin-left: 15px;
}
</style>
</head>
	<div class="menu">
	<!-- 하드코딩 -->
		<img id="diagnosis_data_btn" class="menu-btn" src="/imgs/layout/btn/diagnosis_data_btn_enabled.png" style="width: 170px;" onclick="location.href='/premium/admin/statistics/diagnosis'">
		<img id="diagnosis_graph_btn" class="menu-btn" src="/imgs/layout/btn/diagnosis_graph_btn_disabled.png" style="width: 170px;" onclick="location.href='/premium/admin/statistics/graph'">
	</div>
	<div class="container-wrap">
		<div class="container" id="container">
			<div class="container-top">
				<div class="container-margin"></div>
				<div id="userName" class="userName">${dataList.userName}</div>
				<div>
					<div id="" class="measureDt-title">측정 일자</div>
					<div id="measuerDt" class="measureDt">${dataList.measureDt}</div>
				</div>
			</div>
	
			<div class="contentsWrap">
				<div class="contentsWrap1 toothCondition">
	
					<div id="t56">
						<img id="tooth56" class="teeth" alt="영구치56번" src="/imgs/tooth/empty.png">
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
					
					<div id="t66">
						<img id="tooth66" class="teeth" alt="영구치66번" src="/imgs/tooth/empty.png">
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
					
					<div id="t76">
						<img id="tooth76" class="teeth" alt="영구치76번" src="/imgs/tooth/empty.png">
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
					
					<div id="t86">
						<img id="tooth86" class="teeth" alt="영구치86번" src="/imgs/tooth/empty.png">
					</div>
	
				</div>
				<div class="contentsWrap2 cavityAmount">
					<div class="cavityValueHeight-top"></div>
					<div class="cavityValue-danger-title">
						병원 내원
					</div>
					<div class="cavityValue">
						${cavityDanger}
					</div>
					<div class="cavityValueHeight-middle"></div>
					<div class="cavityValue-caution-title">
						관리 필요
					</div>
					<div class="cavityValue">
						${cavityCaution}
					</div>
					<div class="cavityValueHeight-bottom"></div>
					<div class="cavityValue-normal-title">
						정 상
					</div>
					<div class="cavityValue">
						${cavityNormal}
					</div>
					<div class="commonWidth125Height25"></div>
					<div class="commonWidth125Height25"></div>
					<div class="commonWidth125Height25"></div>
					<div class="commonWidth125Height25"></div>
					<div class="commonWidth125Height25"></div>
				</div>
			</div>
			<div class="contentsWrap3 comment" id="comment">
				<div class="title">
					<div id="diag-title">
						<c:choose>
							<c:when test="${dataList.diagTitle ne null}">
								"${dataList.diagTitle}"
							</c:when>
							<c:otherwise>
								"제목을 입력해주세요"
							</c:otherwise>
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
							<div>*본 결과지는 참고용으로만 사용하시고, 정확한 진단을 위해 치과 방문을 권장합니다.</div>
				</div>
				<div class="commonHeight18"></div>
				<div style="color: #ffffff; text-align: center;">
					자문치과 : ${adviceDentistInfo.dentistName}  ${adviceDentistInfo.dentistNum}
				</div>
			</div>
		</div>
	</div>
	
	<div style="height: 15px;"></div>
	<div>
		<button id="btn_downloadImg" style="width: 90%;"><b>화면저장</b></button>
	</div>
<div style="height: 30px;"></div>	
	<p style="margin-left: 15px;">진 단 내 용</p>
	<div style="display: flex; margin-left: 15px;">
		<textarea name="diagDescript-textarea" id="diagDescript-textarea" rows="1" cols="100">${dataList.diagDescript}</textarea>
		<button id="btn_editDescript"><b>변경</b></button>
	</div>
<div style="height: 15px;"></div>
	<p style="margin-left: 15px;">비 고</p>
	<div style="display: flex; margin-left: 15px;">
		<textarea id="memo-textarea" rows="1" cols="100">${dataList.memo}</textarea>
		<button id="btn_editMemo"><b>변경</b></button>
	</div>
<div style="height: 30px;"></div>
<!-- Bootstrap core JavaScript-->
<script src="vendor/bootstrap/js/bootstrap.bundle.js"></script>
<script src="vendor/jquery-easing/jquery.easing.js"></script>
<script src="js/common/sb-admin-2.js"></script>
<script src="js/premium/common/diagnosis.js"></script>
<script src="js/premium/admin/statistics/html2canvas.js"></script>
<script type="text/javascript">
	
$(document).ready(function() {
	
	
	// 진단 내용 div의 높이
	var diagDescriptHeight = parseInt(document.getElementById('diagDescript').offsetHeight);
	console.log("diagDescriptHeight >>> " + diagDescriptHeight);
	// 스크롤이 넘어가지 않았을 때의 높이
	var originalHeight = 265;
	
	
	var variableHeight = parseInt(diagDescriptHeight-originalHeight);
	if(variableHeight < 0){
// 		variableHeight = originalHeight-diagDescriptHeight;
		variableHeight = 0;
	}
	
	var containerHeight = parseInt(document.getElementById("container").clientHeight);
	var commentHeight = parseInt(document.getElementById("comment").clientHeight);
	var contentsHeight = parseInt(document.getElementById("contents").clientHeight);
	
	
	
	// container 높이 변경 (5px)
	$("#container").css("height", containerHeight + variableHeight + 28);
	// comment 높이 변경 (5px)
	$("#comment").css("height", commentHeight + variableHeight - 5);
	// contents 높이 변경 (5px)
	$("#contents").css("height", contentsHeight + variableHeight + 15);
	
	
	// 로딩 시 에디터로 포커싱되는 것을 다시 위로 올리는 작업
	$("#menu").focus();
	
	// 진단 내용 에디터
	$('#diagDescript-textarea').summernote({
		width: 345,
		minHeight: 150,
		focus: false,                  // 에디터 로딩후 포커스를 맞출지 여부
		lang: "ko-KR",					// 한글 설정
		placeholder: '최대 2048자까지 쓸 수 있습니다',	//placeholder 설정
		toolbar: [
			['view', ['codeview']],
			['help', ['help']]
		]
	});

	// 비고 에디터
	$('#memo-textarea').summernote({
		width: 345,
		minHeight: 150,
		focus: false,                  // 에디터 로딩후 포커스를 맞출지 여부
		lang: "ko-KR",					// 한글 설정
		placeholder: '특이사항을 입력해주세요.',	//placeholder 설정
		toolbar: [
			['view', ['codeview']],
			['help', ['help']]
		]
	});
	
	
	// 세션 만료 시 창 닫기
	if('${session}' == 'expired') {
		alert("세션이 만료되어, 로그아웃 되었습니다. \n다시 로그인 해주시기 바랍니다.");
		window.close();
	}
	
	 // 세로 스크롤바
    (function($) {
        $.fn.hasScrollbar = function() {
            return this.get(0) ? this.get(0).scrollHeight > this.innerHeight() : false;
        }
    })($);

    // 사옹예
    if($("#diagDescript").hasScrollbar()){
        // 세로 스크롤바가 있을 경우 처리
        console.log("스크롤바가없네요");
    }else{
    	document.getElementById('diagDescript').style.margin = "0px 0px 0px 15px";
    }
	

	// 값을 가져와서 데이터를 확인하여 어떤 색으로 변경할지 정해줘야함
	var dataList = new Array();
	var index = 0;
	var diagDescript = '${dataList.diagDescript}';
	var cautionLevel = "${cautionLevel}";
	var dangerLevel = "${dangerLevel}"; 
	
	dataList.push({
		userId:"${dataList.userId}"
		,t51:"${dataList.t08}"
		,t52:"${dataList.t07}"
		,t53:"${dataList.t06}"
		,t54:"${dataList.t05}"
		,t55:"${dataList.t04}"
		// 영구치
		,t56:"${dataList.t03}"
		,t61:"${dataList.t09}"
		,t62:"${dataList.t10}"
		,t63:"${dataList.t11}"
		,t64:"${dataList.t12}"
		,t65:"${dataList.t13}"
		// 영구치
		,t66:"${dataList.t14}"
		,t71:"${dataList.t24}"
		,t72:"${dataList.t23}"
		,t73:"${dataList.t22}"
		,t74:"${dataList.t21}"
		,t75:"${dataList.t20}"
		// 영구치
		,t76:"${dataList.t19}"
		,t81:"${dataList.t25}"
		,t82:"${dataList.t26}"
		,t83:"${dataList.t27}"
		,t84:"${dataList.t28}"
		,t85:"${dataList.t29}"
		// 영구치
		,t86:"${dataList.t30}"
		,cavityNormal:"${cavityNormal}"
		,cavityCaution:"${cavityCaution}"
		,cavityDanger:"${cavityDanger}"
		,memo:"${dataList.memo}"	
		,measureDt:"${dataList.measureDt}"
		,diagDescript: diagDescript
		,diagTitle:"${dataList.diagTitle}"
	});
	
	// 	치아 색상 변경		
	changeToothColorByLevel(dataList, index, cautionLevel, dangerLevel);
	
	
	// 버튼 클릭시 스크린샷 후 저장
	$("#btn_downloadImg").click(function(e){
		html2canvas(document.getElementById("container")).then(function(canvas) {
        // html2canvas(document.body).then(function(canvas) {
            var el = document.createElement("a")
            el.href = canvas.toDataURL("image/jpeg");
    		var schoolName = '${schoolName}';
    		var className = '${className}';
            var userName = $("#userName").html();
    		var measureDt = '${dataList.measureDt}';
    		
            el.download = schoolName+'_'+className+'_'+userName+'_'+measureDt+'.png'; //다운로드 할 파일명 설정
            el.click();
        });
    });
    
		
	
	
	// 진단 내용 변경 
    $("#btn_editDescript").click(function(e){
    	
    	var summernoteContent = $('#diagDescript-textarea').summernote('code');
    	var element = document.getElementById('diagDescript');
		element.innerHTML = summernoteContent;
		
		var userId = '${dataList.userId}';
		var measureDt = '${dataList.measureDt}';
		var summernoteContent = $("#diagDescript-textarea").val();
		
		$.ajax({
			type:'POST',   //post 방식으로 전송
			url:'/premium/admin/statistics/updateDiagDescript.do',   //데이터를 주고받을 파일 주소
			data:JSON.stringify ({ //변수에 담긴 데이터를 전송해준다 (JSON 방식)
			
				"userId" : userId
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
    	
    	var summernoteContent = $('#memo-textarea').summernote('code');
		
		var userId = '${dataList.userId}';
		var measureDt = '${dataList.measureDt}';
		
		$.ajax({
			type:'POST',   //post 방식으로 전송
			url:'/premium/admin/statistics/updateMemo.do',   //데이터를 주고받을 파일 주소
			data:JSON.stringify ({ //변수에 담긴 데이터를 전송해준다 (JSON 방식)
			
				"userId" : userId
				,"measureDt" : measureDt
				,"memo" : summernoteContent
				
			}),
			dataType:'JSON', //데이터 타입 JSON
			contentType : "application/json; charset=UTF-8",
			success : function(data){   //파일 주고받기가 성공했을 경우. data 변수 안에 값을 담아온다.
				$('#message').html(data);  //현재 화면 위 id="message" 영역 안에 data안에 담긴 html 코드를 넣어준다. 
			}
		});
	});
	
});
	
	
	</script>
</html>