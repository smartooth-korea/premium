<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="author" content="스마투스코리아" />
<meta name="description" content="Smartooth" />
<title>㈜스마투스코리아 :: 치아 모니터링 시스템 :: 기관장용</title>
<!-- favicon ico 에러 -->
<link rel="shortcut icon" type="image/x-icon" href="/imgs/common/logo_img_ori.png">
<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- <script type="text/javascript" src="/js/premium/common/diagnosis_.js"></script> -->
<script type="text/javascript" src="js/premium/common/diagnosis_dentist.js"></script>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link rel="stylesheet" href="/css/common/layout.css">
<link rel="stylesheet" href="/css/web/statistics/integrateStatistics.css">
<style type="text/css">
	
.dropdown{
  position : relative;
  display : inline-block;
}

.dropdown-content{
    display: none;
    position: absolute;
    top: 30px;
    left: -40px;
    background: #ffffff;
    width: 100px;
    height: 55px;
    z-index: 1;
    font-size: 16px;
    text-align: center;
    border-radius: 9px;
    padding-top: 5px;
}

.dropdown-content a{
  display : block;
  color: #333333;
}

</style>
	
</head>
<body>
<!-- 						<img alt="㈜스마투스코리아 로고" src="/imgs/common/logo_origin.png"> -->
<!-- <form name="frm" method="GET" action="/web/statistics/integrateStatistics.do"> -->
	<div class="container" id="container">
		<div class="row">
			<div class="input-form">
				<div class="tab-wrap">
					<div class="nav-ul">
						<ul class="tabs">
						<c:forEach var="departmentList" items="${departmentList}" varStatus="status">
							<c:choose>
								<c:when test="${status.count eq 1}">
									<li class="tab-link current" data-tab="tab-${status.count}">${departmentList.CLASS_NAME}</li>
								</c:when>
								<c:otherwise>
									<li class="tab-link" data-tab="tab-${status.count}">${departmentList.CLASS_NAME}</li>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						</ul>
						<div id="organMeasureDt" class="organMeasureDt">
							<select id="organMeasureDtList" onchange="onSelect()">
								<c:forEach var="organMeasureDtList" items="${organMeasureDtList}">
									<option value="${organMeasureDtList}">${organMeasureDtList}</option>						
								</c:forEach>
							</select>
						</div>
						<div class="logout">
							<div class="dropdown">
								<i class="fas fa-power-off"></i>
								<div class="dropdown-content">
							        <a href="" id="setting">설정</a>
							        <a href="/web/statistics/director/logout.do">로그아웃</a>
				      			</div>
						    </div> 
						</div>
					</div>
					<c:forEach items="${departmentUserList}" var="departmentUserList" varStatus="statusWarp">
						<c:choose>
							<c:when test="${statusWarp.count eq 1}">
								<div id="tab-${departmentUserList.key+1}" class="tab-content current">
									<c:forEach items="${departmentUserList.value}" var="list" varStatus="status">
										<c:choose>
											<c:when test="${status.count eq 1}">
												<label class="btn abled" id="btn-${statusWarp.count}-${status.count}">
													<input type="radio" name="userId" class="custom-control-input" value="${list.USER_ID}"> ${list.USER_NAME}
												</label>											
											</c:when>
											<c:otherwise>
												<label class="btn" id="btn-${statusWarp.count}-${status.count}">
													<input type="radio" name="userId" class="custom-control-input" value="${list.USER_ID}"> ${list.USER_NAME}
												</label>											
											</c:otherwise>
										</c:choose>
										
									</c:forEach>							
								</div>
							</c:when>
							<c:otherwise>
									<div id="tab-${departmentUserList.key+1}" class="tab-content">
										<c:forEach items="${departmentUserList.value}" var="list" varStatus="status">
											<label class="btn" id="btn-${statusWarp.count}-${status.count}">
												<input type="radio" name="userId" class="custom-control-input" value="${list.USER_ID}"> ${list.USER_NAME}
											</label>
										</c:forEach>							
									</div>
							</c:otherwise>
						</c:choose>
						
						
					</c:forEach>
				</div>
				<div class="integrateStatistics">
					<div class="statistics graph-y">
<!-- 그래프 -->
						<div class="graph_wrap">
							<div class="schoolName_title">
								${schoolName}  (총원 ${userCount}명)
							</div>
							<div class="graph_legend_wrap">
								<div class="graph_legend">
									<img class="img_legend" src="/imgs/layout/statistics/graph/teeth_count.jpg"> 원아별 병원내원필요 치아 개수
								</div>
								<div class="graph_legend">
									<img class="img_legend" src="/imgs/layout/statistics/graph/akhwa_count.jpg"> 원아별 구강관리 상태 (악화수치)
								</div>
							</div>
							<div class="userName_legend">
								<div class="userName_legend_left">
									원아명(개월수)
								</div>
								<div class="userName_legend_right">
									*측정두려움
								</div>
							</div>
							<div class="graph">
								<canvas id="graph"></canvas>
							</div>
						</div>
					</div>
					<div class="statistics diagnosis-y">
<!-- 결과지 -->
							<div class="diagnosis_wrap">
								<div class="diagnosis_userInfo">
<%-- 									<div id="userName" class="userName">${dataList.userName}</div> --%>
									<div id="userName" class="userName">
											${userName}
									</div>
									<div class="measuredt_wrap">
										<div id="" class="measuredt-title">측정 일자</div>
										<div id="measuredt" class="measuredt">
											${measureDt}
										</div>
									</div>
								</div>
								<div class="contentsWrap">
									<div class="tooth">
										<div class="toothMaxillary">
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
											<div id="t51">
												<img id="tooth51" class="teeth" alt="51번치아" src="/imgs/tooth/empty.png">													
											</div>
											<div id="t52">
												<img id="tooth52" class="teeth" alt="55번치아" src="/imgs/tooth/empty.png">
											</div>
											<div id="t53">
												<img id="tooth53" class="teeth" alt="53번치아" src="/imgs/tooth/empty.png">
											</div>
											<div id="t54">
												<img id="tooth54" class="teeth" alt="54번치아" src="/imgs/tooth/empty.png">
											</div>
											<div id="t55">
												<img id="tooth55" class="teeth" alt="52번치아" src="/imgs/tooth/empty.png">
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
											<div id="t26">
												<img id="tooth26" class="teeth" alt="영구치26번" src="/imgs/tooth/empty.png">
											</div>
										</div>
										<div class="toothMandibular">
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
									<div class="commonWidth75"></div>
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
								</div>
								<div class="comment" id="comment">
									<div class="comment-top">코멘트</div>
									<div id="comment-title" class="comment-title">
										<c:choose>
											<c:when test="${dataList.diagTitle ne null}">
												"${dataList.diagTitle}"
											</c:when>
											<c:otherwise>
												
											</c:otherwise>
										</c:choose>
									</div>
									<div class="diagDescript" id="diagDescript">
										${dataList.diagDescript}
									</div>
								<div class="contents-bottom-div">
										<div>* 본 결과지는 참고용으로만 사용하시고, 정확한 진단을 위해 치과 방문을 권장합니다.</div>
								</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="commonHeight10"></div>
		<footer class="smartooth-footer">
			<p class="mb-1">Copyright &copy; Smartooth 2023</p>
		</footer>
		<div class="commonHeight10"></div>
<!-- </form> -->
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chartjs-plugin-datalabels@2.0.0"></script>
<script type="text/javascript">

//첫번째 반, 첫번째 학생의 정보
var userId = "${userId}";
var userName = "${userName}";
var measureDt = "${measureDt}";
if(measureDt == null || measureDt == ""){
	measureDt = "${organMeasureDtList[0]}";
}
var schoolName = "${schoolName}";

$(document).ready(function(){

	// 측정 일자 입력
	$('#measuredt').text(measureDt);
	// 측정 일자 목록 checked
	$('#organMeasureDtList').val(measureDt).prop("selected",true);
	
	
	var ctx = document.getElementById("graph");
	var barChartData = {
		// labels : ${userNameList}, // ['홍길동','성춘향','이몽룡','변사또','방자','향단','정주현','김득식','아리','아나그란데'],
		labels : [],
		datasets : [
			{
				type : 'bar',
				label : '병원 내원 필요 치아 개수',
				backgroundColor : 'rgb(255, 0, 0)',
				data : [],
				//data : ${cavityCntList},
			},
			{
				type : 'bar',
				label : '악화수치',
				backgroundColor : 'rgb(255, 192, 0)',
				data : [],
				//data : ${deteriorateScordList}, // [5,0,0,0,0,0,0,0,0,0],
			},
			{
				type : 'bar',
				label : '두려움으로 인한 측정 불가',
				backgroundColor : 'rgb(123, 123, 123)',
				data : [],
				//data : ${userFearScoreList}, // [5,0,0,0,0,0,0,0,0,0],
			},
		],
	};
	
	const myChart = new Chart(document.getElementById('graph'), {
		plugins : [ ChartDataLabels ],
		type : 'bar', // 차트 타입 지정
		data : barChartData,
		options : {
			maintainAspectRatio : false,
			plugins : {
				legend : { // 범례 사용 안 함
					display : false,
				},
				tooltip : { // 기존 툴팁 사용 안 함
					enabled : false
				},
				animation : { // 차트 애니메이션 사용 안 함 (옵션)
					duration : 10,
				},
				datalabels : { // datalables 플러그인 세팅
					font: {
    	          		weight: 'bold'
        	        },
					formatter : function(value, context) {
						// 출력 텍스트
						// var idx = context.dataIndex; // 각 데이터 인덱스
						// return context.chart.data.labels[idx] + value + '%';
						if(value == 0){
							value = "";
						}
						return value;
					},
					// 도넛 차트에서 툴팁이 잘리는 경우 사용
					// align : 'top',
					align: 'end',
					anchor: 'end',
					font : { // font 설정
						size : '12px',
					},
					color : '#000000', // 그래프 수치 글자색
				},
			},
			indexAxis : 'y'
		},
	});

	// 그래프 생성
	$.ajax({
		type : 'POST', //post 방식으로 전송
		url : '/web/statistics/director/ajaxGraph', //데이터를 주고받을 파일 주소
 		data:JSON.stringify ({ //변수에 담긴 데이터를 전송해준다 (JSON 방식)
 			"userId" : userId
 			,"measureDt" : measureDt
 			, "selectType" : "DI"
 		}),
		dataType : 'JSON', //데이터 타입 JSON
		contentType : "application/json; charset=UTF-8",
		success : function(data) { 
			
			var userId = data.userId;
			var userName = data.userName;
			var schoolCode = data.schoolCode;
			var userNameList = data.userNameList;
			var cavityCntList = data.cavityCntList;
			var deteriorateScordList = data.deteriorateScordList;
			var userFearScoreList = data.userFearScoreList;
			userCount =  parseInt(data.userCount);
			
			// 피측정자 명수 등록			
			$(".schoolName_title").text(schoolName+" (총원 "+userCount+"명)");
			// 피측정자 이름 목록 등록
			barChartData.labels = userNameList;
			barChartData.datasets[0].data = cavityCntList;     
			barChartData.datasets[1].data = deteriorateScordList;     
			barChartData.datasets[2].data = userFearScoreList;     
			  
			myChart.update();
			$(".graph").css('width', '101%');
			if(userCount > 20){
				$(".graph").css('height', '150vh');
			}else{
				$(".graph").css('height', '100%');
			}
		},
		error : function(){
			alert("그래프 통계 자료 조회에 실패했습니다. \n관리자에게 문의해주시기 바랍니다.");
		}
	});
	
	// 결과지 생성
	diagnosis(userId, userName, measureDt);
	
})

// 결과지 생성
function diagnosis(userId, userName, measureDt){
	
	// 결과지 파라미터	
	var dataList = new Array();
	var index = 0;
	// 결과지 데이터 파라미터
	var cautionLevel = "${cautionLevel}";
	var dangerLevel = "${dangerLevel}";
// 	measureDt = $("#organMeasureDtList").val();
	
	$.ajax({
		type : 'POST',
		url : '/web/statistics/director/ajaxDiagnosis',
		data:JSON.stringify ({ //변수에 담긴 데이터를 전송해준다 (JSON 방식)
 			"userId" : userId
 			,"userName" : userName
			,"measureDt" : measureDt
 		}),
		dataType : 'JSON', //데이터 타입 JSON
		contentType : "application/json; charset=UTF-8",
		success : function(data) { 
			var code = data.code;
			if(code == '999'){
				// 세션 만료 시
				alert("세션이 만료되었습니다.");
				location.href = "/";
				return;
			}else if(code == '000'){
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
					
	// 				,t51: data.dataList.t08
	// 				,t52: data.dataList.t07
	// 				,t53: data.dataList.t06
	// 				,t54: data.dataList.t05
	// 				,t55: data.dataList.t04
	// 				// 영구치
	// 				,t56: data.dataList.t03
	// 				,t61: data.dataList.t09
	// 				,t62: data.dataList.t10
	// 				,t63: data.dataList.t11
	// 				,t64: data.dataList.t12
	// 				,t65: data.dataList.t13
	// 				// 영구치
	// 				,t66: data.dataList.t14
	// 				,t71: data.dataList.t24
	// 				,t72: data.dataList.t23
	// 				,t73: data.dataList.t22
	// 				,t74: data.dataList.t21
	// 				,t75: data.dataList.t20
	// 				// 영구치
	// 				,t76: data.dataList.t19
	// 				,t81: data.dataList.t25
	// 				,t82: data.dataList.t26
	// 				,t83: data.dataList.t27
	// 				,t84: data.dataList.t28
	// 				,t85: data.dataList.t29
	// 				// 영구치
	// 				,t86: data.dataList.t30
				});
				// 피측정자 이름 등록
				$("#userName").html(data.dataList.userName);			
				// 정상, 주의, 충치 개수 변경
				$("#cavityNormal").html(data.cavityNormal);
				$("#cavityCaution").html(data.cavityCaution);
				$("#cavityDanger").html(data.cavityDanger);
				$("#comment-title").html(data.dataList.diagTitle);
				$("#diagDescript").html(data.dataList.diagDescript);
				// 	치아 색상 변경		
				changeToothColorByLevel(dataList, index, cautionLevel, dangerLevel);
			}
		},
		error : function(){
			alert("측정 자료 조회에 실패했습니다. \n관리자에게 문의해주시기 바랍니다.");
		}
	});
	
}


//탭 클릭시 변경
$('ul.tabs li').click(function(){
	var tab_id = $(this).attr('data-tab');

	$('ul.tabs li').removeClass('current');
	$('.tab-content').removeClass('current');

	$(this).addClass('current');
	$("#"+tab_id).addClass('current');
});

// 이름 클릭시 diagnosis 결과지 호출
$("input:radio[name=userId]").click(function(){

	var labelId = event.target.parentElement.id;
	var userId = $('input[name=userId]:checked').val();
	// 버튼 활성화/비활성화
	$(".btn").removeClass("abled");
	$("#"+labelId).addClass("abled");
	// 결과지 생성
	diagnosis(userId, "", measureDt);
	
});


// 날짜 선택 시 반안의 목록 및 결과지의 내용을 바꿔줘야한다
function onSelect(){ // 날짜 선택
	
	var measureDt = $("#organMeasureDtList").val();
	//alert(measureDt);
	window.location.href="integrateStatistics.do?measureDt="+measureDt;
	
}

// 상단 로그아웃 버튼 드롭 다운 기능
$('.logout').click(function(e){
	// 드롭다운 메뉴를 클릭했을 때 펼쳐지도록
	if($('.dropdown-content').css('display') == 'none'){
		$('.dropdown-content').css('display', 'block');	
	}else{
		$('.dropdown-content').css('display', 'none');
	}
});
// 상단 로그아웃 버튼 이외 클릭 이벤트 발생시 드롭 다운 display : none 으로 처리
$('html').click(function(e) {   
	if(e.target.className != 'fas fa-power-off'){   
		$('.dropdown-content').css('display', 'none');	
	}
});

$('#setting').click(function(e) {   
	alert("추후 기능이 제공될 예정입니다.");
	return false;
});




</script>
</body>

</html>