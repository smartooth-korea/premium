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
<script type="text/javascript" src="js/premium/common/diagnosis.js"></script>
<link rel="shortcut icon" type="image/x-icon" href="/imgs/common/logo_img_ori.png">

<link rel="stylesheet" href="/css/common/layout.css">
<link rel="stylesheet" href="/css/web/statistics/graph_main.css">
<link rel="stylesheet" href="/css/common/icons.css"/>
<script type="text/javascript" src="/js/jquery/jquery.js"></script>
<script type="text/javascript" src="/js/common/loadingoverlay.min.js"></script>
</head>
<body>
<div class="container-wrap">
	<div class="container" id="container">
		<div class="input-form-backgroud row">
			<div class="input-form col-md-12 mx-auto">
			<jsp:include page="/WEB-INF/views/web/layout/statistics/menu_en.jsp"></jsp:include>
			<div class="background">
				<div class="nametag_out">
						<div class="nametag_in"">
							<div class="userName_blank_left"></div>
							<div class="userName">${userName}</div>
							<div class="userName_blank_middle"></div>
							<div class="measureDt_wrap">
								<div class="measureDt_title">
									Measure Date
								</div>
								<div class="measureDt_select_div">
									<select id="measureDtList" onchange="onSelect()">
										<c:forEach var="item" items="${measureDtList}">
											<option value="${item}">${item}</option>						
										</c:forEach>
									</select>
								</div>
							</div>
							<div class="userName_blank_right"></div>
						</div>
					</div>
				<div class="graph_wrap_top">
						<div class="graph_wrap">
							<div class="schoolName_title">
								${schoolName}  (Total ${userCount})
							</div>
							<div class="graph_legend_wrap">
								<div class="graph_legend">
									<img class="img_legend" src="/imgs/layout/statistics/graph/teeth_count.jpg"> The number of teeth required to visit hospital
								</div>
								<div class="graph_legend">
									<img class="img_legend" src="/imgs/layout/statistics/graph/akhwa_count.jpg"> Oral care status (Deterioration value)
								</div>
							</div>
							<div class="userName_legend">
								<div class="userName_legend_left">
									Name(number of month)
								</div>
								<div class="userName_legend_right">
									*Measure fear
								</div>
							</div>
							<div class="graph">
								<canvas id="graph"></canvas>
							</div>
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
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chartjs-plugin-datalabels@2.0.0"></script>
<!-- Bootstrap core JavaScript-->
<script src="vendor/bootstrap/js/bootstrap.bundle.js"></script>
<script src="vendor/jquery-easing/jquery.easing.js"></script>
<script src="js/common/sb-admin-2.js"></script>
<script type="text/javascript">

var userCount = parseInt(${userCount});
var chartSize = userCount * 30;

var ctx = document.getElementById("graph");
	
var barChartData = {
		labels : ${userNameList},
		datasets : [
			{
				type : 'bar',
				label : 'The number of teeth required to visit hospital',
				backgroundColor : 'rgb(255, 0, 0)',
				data : ${cavityCntList},
			},
			{
				type : 'bar',
				label : 'Deterioration value',
				backgroundColor : 'rgb(255, 192, 0)',
				data : ${deteriorateScordList},
			},
			{
				type : 'bar',
				label : 'Not measurable',
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
					align : 'top',
// 					align: 'end',
					anchor: 'end',
					clamp: true,
					clip: true,
					font : { // font 설정
						size : '12px',
					},
					color : '#000000', // font color
				},
			},
			indexAxis : 'y'
		},
	});
	
	// 차트 넓이, 높이 설정
	$("#graph").css('width', '100%');
	if(userCount > 24){
		$(".graph").css('height', chartSize);
	}else{
		$(".graph").css('height', 600);
	}
	
	// 날짜 선택
	function onSelect(){
		
		var userId = "${userId}";
		var measureDt = $("#measureDtList").val();
		// 값을 가져와서 데이터를 확인하여 어떤 색으로 변경할지 정해줘야함
		
		$.ajax({
			type : 'POST', //post 방식으로 전송
			url : '/web/statistics/ajaxGraph', //데이터를 주고받을 파일 주소
	 		data:JSON.stringify ({ //변수에 담긴 데이터를 전송해준다 (JSON 방식)
	 			"userId" : userId
	 			,"measureDt" : measureDt
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
				barChartData.labels = userNameList;
				barChartData.datasets[0].data = cavityCntList;     
				barChartData.datasets[1].data = deteriorateScordList;     
				barChartData.datasets[2].data = userFearScoreList;     
				  
				myChart.update();
				// 차트 넓이, 높이 설정
				$("#graph").css('width', '100%');
				if(userCount > 24){
					$(".graph").css('height', chartSize);
				}else{
					$(".graph").css('height', 600);
				}
				
			},
			error : function(){
				alert("Failed to retrieve graph statistics data. \nPlease contact the administrator.\nE-mail:smartooth@smartooth.co");
			}
		});
	}


</script>
</html>