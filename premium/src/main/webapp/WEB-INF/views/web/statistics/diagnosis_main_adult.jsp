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
<title>Smartooth :: 치아 모니터링 시스템 :: 진단지</title>
<script type="text/javascript" src="/js/jquery/jquery.js"></script>
<!-- <script type="text/javascript" src="js/premium/common/diagnosis.js"></script> -->
<script type="text/javascript" src="js/premium/common/diagnosis_dentist.js"></script>
<link rel="shortcut icon" type="image/x-icon" href="/imgs/common/logo_img_ori.png">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="/css/common/layout.css">
<link rel="stylesheet" href="/css/web/statistics/diagnosis_main_ko.css">
<style type="text/css">
.input-form-backgroud{
	position: relative;
}

.input-form {
    background: #ffffff;
    padding-right: 0px;
    padding-left: 0px;
    box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
    min-width: 375px;
    max-width: 375px;
    border-radius: 20px;
    height: 908px;
    opacity: 50%;
}

.modal{
    background-image: url(/imgs/common/UnderConstruction.jpg);
    background-size: 100% 100%;
    background-repeat: no-repeat;
    display: flex;
    background-color: white;
    z-index: 100;
    position: absolute;
    top: 221px;
    left: 12px;
    height: 450px;
    width: 351px;
    border-radius: 10px;
    font-weight: bold;
    font-size: 24px;
    text-align: center;
    align-items: center;
    justify-content: center;
}


</style>
</head>
<body>
<div class="container-wrap">
	<div class="container" id="container">
		<div class="input-form-backgroud row">
			
			<div class="modal">
				현재 성인용 치아의 <br/>결과 진단지는 작업중입니다.
			</div>
			
			<div class="input-form col-md-12 mx-auto">
<%-- 			<c:choose> --%>
<%-- 			    <c:when test="${urlType eq 'dentist'}"> --%>
<%-- 					<jsp:include page="/WEB-INF/views/web/layout/statistics/menu_dentist_ko.jsp"></jsp:include> --%>
<%-- 			    </c:when> --%>
<%-- 			    <c:otherwise> --%>
<%-- 					<jsp:include page="/WEB-INF/views/web/layout/statistics/menu_ko.jsp"></jsp:include> --%>
<%-- 			    </c:otherwise> --%>
<%-- 			</c:choose> --%>
			<div class="background">
				<div class="container-top">
					<div class="container-margin"></div>
					<div id="userName" class="userName"><%-- ${dataList.userName} --%>스마투스</div>
					<div id="" class="measureDt-title">측정 일자</div>
					<div id="measuerDt" class="measureDt">
					<select id="measureDtList" onchange="onSelect()">
<%-- 						<c:forEach var="item" items="${measureDtList}"> --%>
<%-- 							<option value="${item}">${item}</option>						 --%>
<%-- 						</c:forEach> --%>
						<option value="2019-01-01">2019-01-01</option>
					</select>
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
							<%-- ${cavityDanger} --%>0
						</div>
						<div class="cavityValueHeight-middle"></div>
						<div class="cavityValue-caution-title">
							관리 필요
						</div>
						<div class="cavityValue" id="cavityCaution">
							<%-- ${cavityCaution} --%>0
						</div>
						<div class="cavityValueHeight-bottom"></div>
						<div class="cavityValue-normal-title">
							정 상
						</div>
						<div class="cavityValue" id="cavityNormal">
							<%-- ${cavityNormal} --%>32
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
<%-- 								<c:choose> --%>
<%-- 									<c:when test="${dataList.diagTitle ne null}"> --%>
<%-- 										${dataList.diagTitle} --%>
<%-- 									</c:when> --%>
<%-- 								</c:choose> --%>
						
							</div>
						</div>
					<div class="contents" id="contents">
						<div id="diagDescript">
<%-- 							${dataList.diagDescript} --%>
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
		<footer class="my-3 text-center text-small">
			<p class="mb-1">Copyright &copy; Smartooth 2023</p>
		</footer>
	</div>
</div>
</body>
<script type="text/javascript">
document.cookie = "lang=ko";
document.cookie = "urlType=${urlType}";
// $(document).ready(function() {
	
// 	// 세션 만료 시 창 닫기
// 	if('${session}' == 'expired') {
// 		alert("세션이 만료되어, 로그아웃 되었습니다. \n다시 로그인 해주시기 바랍니다.");
// 		window.close();
// 	}
	
// 	// 값을 가져와서 데이터를 확인하여 어떤 색으로 변경할지 정해줘야함
// 	var dataList = new Array();
// 	var index = 0;
// 	var diagDescript = '${dataList.diagDescript}';
// 	var cautionLevel = "${cautionLevel}";
// 	var dangerLevel = "${dangerLevel}"; 
	
	
// 	dataList.push({
// 		userId:"${dataList.userId}"
		
// 		,t55:"${dataList.t34}"
// 		,t54:"${dataList.t35}"
// 		,t53:"${dataList.t36}"
// 		,t52:"${dataList.t37}"
// 		,t51:"${dataList.t38}"

// 		,t61:"${dataList.t39}"
// 		,t62:"${dataList.t40}"
// 		,t63:"${dataList.t41}"
// 		,t64:"${dataList.t42}"
// 		,t65:"${dataList.t43}"
		
// 		,t75:"${dataList.t46}"
// 		,t74:"${dataList.t47}"
// 		,t73:"${dataList.t48}"
// 		,t72:"${dataList.t49}"
// 		,t71:"${dataList.t50}"
		
// 		,t81:"${dataList.t51}"
// 		,t82:"${dataList.t52}"
// 		,t83:"${dataList.t53}"
// 		,t84:"${dataList.t54}"
// 		,t85:"${dataList.t55}"

// 		// 영구치
// 		,t16:"${dataList.t33}"
// 		,t26:"${dataList.t44}"
// 		,t36:"${dataList.t45}"
// 		,t46:"${dataList.t56}"
		
		
		
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
		
		
// // 		,t51:"${dataList.t33}"
// // 		,t52:"${dataList.t34}"
// // 		,t53:"${dataList.t35}"
// // 		,t54:"${dataList.t36}"
// // 		,t55:"${dataList.t37}"
// // 		,t61:"${dataList.t38}"
// // 		,t62:"${dataList.t49}"
// // 		,t63:"${dataList.t40}"
// // 		,t64:"${dataList.t41}"
// // 		,t65:"${dataList.t42}"
// // 		,t71:"${dataList.t43}"
// // 		,t72:"${dataList.t44}"
// // 		,t73:"${dataList.t45}"
// // 		,t74:"${dataList.t46}"
// // 		,t75:"${dataList.t47}"
// // 		,t81:"${dataList.t48}"
// // 		,t82:"${dataList.t49}"
// // 		,t83:"${dataList.t50}"
// // 		,t84:"${dataList.t51}"
// // 		,t85:"${dataList.t52}"
// // 		// 영구치
// // 		,t16:"${dataList.t03}"
// // 		,t26:"${dataList.t14}"
// // 		,t36:"${dataList.t19}"
// // 		,t46:"${dataList.t30}"
// // 		// 영구치 상악
// // 		,t12:"${dataList.t07}"
// // 		,t11:"${dataList.t08}"
// // 		,t21:"${dataList.t09}"
// // 		,t22:"${dataList.t10}"
// // 		// 영구치 하악
// // 		,t32:"${dataList.t23}"
// // 		,t31:"${dataList.t24}"
// // 		,t41:"${dataList.t25}"
// // 		,t42:"${dataList.t26}"
		
		
// 		,cavityNormal:"${cavityNormal}"
// 		,cavityCaution:"${cavityCaution}"
// 		,cavityDanger:"${cavityDanger}"

// 	});
	
// 	// 	치아 색상 변경		
// 	changeToothColorByLevel(dataList, index, cautionLevel, dangerLevel);
	
	
// });
	

// function onSelect(){ // 날짜 선택
	
// 	var urlType = "${urlType}";
// 	var userId = "${dataList.userId}";
// 	var userName = "${dataList.userName}";
// 	var measureDt = $("#measureDtList").val();
// 	// 값을 가져와서 데이터를 확인하여 어떤 색으로 변경할지 정해줘야함
// 	var index = 0;
// 	var dataList = new Array();
// 	var diagDescript = '${dataList.diagDescript}';
// 	var cautionLevel = "${cautionLevel}";
// 	var dangerLevel = "${dangerLevel}"; 
	
// 	$.ajax({
// 		type : 'POST',
// 		url : '/web/statistics/ajaxDiagnosis',
// 		data:JSON.stringify ({
// 			"userId" : userId
// 			,"userName" : userName
// 			,"measureDt" : measureDt
// 		}),
// 		dataType:'JSON',
// 		contentType : "application/json; charset=UTF-8",
// 		success : function(data) { 
// 			var code = data.code;
// 			if(code == '999'){
// 				// 세션 만료 시
// 				alert("세션이 만료되었습니다.");
// 				location.href = "/";
// 				return;
// 			}else if(code == '000'){
// 				// 조회 성공 시
// 				dataList.push({
// 					userId: data.dataList.userId
					
// 					,t55:data.dataList.t34
// 					,t54:data.dataList.t35
// 					,t53:data.dataList.t36
// 					,t52:data.dataList.t37
// 					,t51:data.dataList.t38

// 					,t61:data.dataList.t39
// 					,t62:data.dataList.t40
// 					,t63:data.dataList.t41
// 					,t64:data.dataList.t42
// 					,t65:data.dataList.t43
					
// 					,t75:data.dataList.t46
// 					,t74:data.dataList.t47
// 					,t73:data.dataList.t48
// 					,t72:data.dataList.t49
// 					,t71:data.dataList.t50
					
// 					,t81:data.dataList.t51
// 					,t82:data.dataList.t52
// 					,t83:data.dataList.t53
// 					,t84:data.dataList.t54
// 					,t85:data.dataList.t55

// 					// 영구치
// 					,t16:data.dataList.t33
// 					,t26:data.dataList.t44
// 					,t36:data.dataList.t45
// 					,t46:data.dataList.t56
					
					
// 					// 영구치 상악
// 					,t12:data.dataList.t07
// 					,t11:data.dataList.t08
// 					,t21:data.dataList.t09
// 					,t22:data.dataList.t10
					
// 					// 영구치 하악
// 					,t32:data.dataList.t23
// 					,t31:data.dataList.t24
// 					,t41:data.dataList.t25
// 					,t42:data.dataList.t26
					
// 				});
				
// 				// 정상, 주의, 충치 개수 변경
// 				$("#cavityNormal").html(data.cavityNormal);
// 				$("#cavityCaution").html(data.cavityCaution);
// 				$("#cavityDanger").html(data.cavityDanger);
// 				$("#diag-title").html(data.dataList.diagTitle);
// 				$("#diagDescript").html(data.dataList.diagDescript);
				
// 				// 	치아 색상 변경		
// 				changeToothColorByLevel(dataList, index, cautionLevel, dangerLevel);
// 				// container 높이 재조정			
// 				resetContainerHeight();
// 			}
			
			
			
// 		},
// 		error : function(){
// 			alert("측정 자료 조회에 실패했습니다. \n관리자에게 문의해주시기 바랍니다.");
// 		}
// 	});
// }
</script>
</html>