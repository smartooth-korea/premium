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
<title>Smartooth :: 치아 모니터링 시스템 :: 그래프</title>
<!-- FAVICON ICO ERROR 방지 -->
<link rel="shortcut icon" type="image/x-icon"href="/imgs/common/logo_img_ori.png">
<link rel="stylesheet" href="/css/common/layout.css">
<link rel="stylesheet" href="/css/admin/statistics/graph.css">
<link rel="stylesheet" href="/css/common/icons.css"/>
<script type="text/javascript" src="/js/jquery/jquery.js"></script>
<script type="text/javascript" src="/js/common/loadingoverlay.min.js"></script>
</head>
<body>
<div class="container" id="container">
<jsp:include page="/WEB-INF/views/admin/layout/statistics/menu.jsp"></jsp:include>
	<div class="nametag_out">
		<div class="nametag_in"">
			<div class="userName_blank_left"></div>
			<div class="userName">${userName}</div>
			<div class="userName_blank_middle"></div>
			<div class="measureDt_wrap">
				<div class="measureDt_title">측정 일자</div>
				<div class="measureDt_select_div">
					${measureDt}
				</div>
			</div>
			<div class="userName_blank_right"></div>
		</div>
	</div>
	<div class="graph_wrap_top">
		<div id="graph_wrap" class="graph_wrap">
			<div class="schoolName_title">
				
				<c:choose>
					<c:when test="${schoolName} eq '연세꿈꾸는치과'">
				    	스마투스코리아 (총원 ${userCount}명)
				    </c:when> 
					<c:otherwise>
						${schoolName} (총원 ${userCount}명)
					</c:otherwise>
				</c:choose>
				
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
</div>
	<div style="height: 15px;"></div>
	<div>
		<button id="btn_downloadImg" style="width: 90%;"><b>화면저장</b></button>
	</div>
<!-- <script src="https://cdn.jsdelivr.net/npm/chart.js@4.2.1"></script> -->
<!-- <script src="https://cdn.jsdelivr.net/npm/chart.js@3.0.0/dist/chart.min.js"></script> -->
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chartjs-plugin-datalabels@2.0.0"></script>
<!-- Bootstrap core JavaScript-->
<script src="vendor/bootstrap/js/bootstrap.bundle.js"></script>
<script src="vendor/jquery-easing/jquery.easing.js"></script>
<script src="js/common/sb-admin-2.js"></script>
<script src="js/premium/admin/statistics/html2canvas.js"></script>
<script type="text/javascript">

var userId = "${userId}";
var userName = "${userName}";
var schoolCode= "${schoolCode}";
var schoolName = "${schoolName}";
var className = "${className}";
var measureDt = "${measureDt}";
var userCount = parseInt(${userCount});
var clientHeight = document.body.clientHeight;
var chartSize = clientHeight * 0.77;
var ctx = document.getElementById("graph");

function moveDiagnosis(){
	location.href = "/admin/statistics/diagnosis?userId="+userId+"&userName="+userName+"&measureDt="+measureDt+"&schoolName="+schoolName+"&schoolCode="+schoolCode+"&className="+className;
}


function moveGraph(){
	location.href = "/admin/statistics/graph?userId="+userId+"&userName="+userName+"&measureDt="+measureDt+"&schoolName="+schoolName+"&schoolCode="+schoolCode+"&className="+className;
}

var barChartData = {
		labels : ${userNameList},
		datasets : [
			{
				type : 'bar',
				label : '병원 내원 필요 치아 개수',
				backgroundColor : 'rgb(255, 0, 0)',
				data : ${cavityCntList},
			},
			{
				type : 'bar',
				label : '악화수치',
				backgroundColor : 'rgb(255, 192, 0)',
				data : ${deteriorateScordList},
			},
			{
				type : 'bar',
				label : '두려움으로 인한 측정 불가',
				backgroundColor : 'rgb(123, 123, 123)',
				data : ${userFearScoreList},
			},
		],
	};
	
	
	const myChart = new Chart(document.getElementById('graph'), {
		plugins : [ ChartDataLabels ], // chartjs-plugin-datalabels 불러오기
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
					duration : 0,
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
					color : '#000000', // font color
				},
			},
			indexAxis : 'y'
// 			,scales: {
// 				y: {
// 					max: 20,
// 					min: 0,
// 					ticks: {
// 						display: false,
// 						stepSize: 25
// 					},
// 					grid: {
// 						drawTicks: false,
// 						drawBorder: false,
// 						color: 'rgba(255, 255, 255, 0.2)'
// 					}
// 				}
// 			}
		},
	});
	
	// 차트 높이 설정
	$("#graph").css('width', '95%');
	
	if(userCount > 20){
		$(".container").css('height', '200vh');
		$(".graph").css('height', '180vh');
	}else{
		$(".graph").css('height', chartSize);
	}
	
	// 날짜 선택
	function onSelect(){
		
		var measureDt = $("#measureDtList").val();
		// 값을 가져와서 데이터를 확인하여 어떤 색으로 변경할지 정해줘야함
		
		$.ajax({
			// type : 'GET', //post 방식으로 전송
			type : 'POST', //post 방식으로 전송
			// url : '/admin/statistics/ajaxGraph?userId='+userId+'&schoolCode='+schoolCode+'&measureDt='+measureDt, //데이터를 주고받을 파일 주소
			url : '/admin/statistics/ajaxGraph',
	 		data:JSON.stringify ({ //변수에 담긴 데이터를 전송해준다 (JSON 방식)
	 			"userId" : userId
	 			,"schoolCode" : schoolCode
	 			,"measureDt" : measureDt
	 		}),
	 		dataType:'JSON',   //json 파일 형식으로 값을 담아온다.
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
				barChartData.labels = userNameList;
				barChartData.datasets[0].data = cavityCntList;     
				barChartData.datasets[1].data = deteriorateScordList;     
				barChartData.datasets[2].data = userFearScoreList;     
				  
				myChart.update();
				// 차트 높이 설정
				// $("#graph").css('height', chartSize);
				// 차트 가로 설정				
				$(".graph").css('width', '95%');

				if(userCount > 20){
					$(".container").css('height', '200vh');
					$(".graph").css('height', '180vh');
				}else{
					$(".graph").css('height', chartSize);
				}
				
				
			},
			error : function(){
				alert("그래프 통계 자료 조회에 실패했습니다. \n관리자에게 문의해주시기 바랍니다.");
			}
		});
	}

	// 버튼 클릭시 스크린샷 후 저장
	$("#btn_downloadImg").click(function(e){
		html2canvas(document.getElementById("container")).then(function(canvas) {
            var el = document.createElement("a")
            el.href = canvas.toDataURL("image/jpeg");
    		var measureDt = "${dataList.measureDt}";
    		el.download = schoolName+"_진단지_그래프.png"; //다운로드 할 파일명 설정
            el.click();
        });
    });
	
</script>
</body>
</html>