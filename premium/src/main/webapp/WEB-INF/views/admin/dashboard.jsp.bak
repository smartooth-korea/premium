<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="author" content="㈜스마트코리아" />
<meta name="description" content="Smartooth" />
<title>㈜스마트코리아 관리자 페이지 ::: dashboard</title>
<!-- favicon ico 에러 -->
<link rel="shortcut icon" type="image/x-icon" href="/imgs/common/logo_img_ori.png">

<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
<link rel="stylesheet" href="/css/common/sb-admin-2.css">
<link rel="stylesheet" href="/css/common/layout.css">
<style type="text/css">
body{
	font-family: 'NanumSquareR';
}

.tmp{
	width: 33%;
}
	
.container, .container-fluid, .container-sm, .container-md, .container-lg, .container-xl{
	padding-left: 1.5rem;
	padding-right : 1.5rem;
	padding-top : 0px;
	padding-bottom : 0px;
}

.col-xl-8{
	padding-right: 0.75rem;
    padding-left: 0.75rem;
}

</style>
<script type="text/javascript" src="/js/jquery/jquery.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	
    function number_format(number, decimals, dec_point, thousands_sep) {
        // *     example: number_format(1234.56, 2, ',', ' ');
        // *     return: '1 234,56'
        number = (number + '').replace(',', '').replace(' ', '');
        var n = !isFinite(+number) ? 0 : +number,
            prec = !isFinite(+decimals) ? 0 : Math.abs(decimals),
            sep = (typeof thousands_sep === 'undefined') ? ',' : thousands_sep,
            dec = (typeof dec_point === 'undefined') ? '.' : dec_point,
            s = '',
            toFixedFix = function(n, prec) {
                var k = Math.pow(10, prec);
                return '' + Math.round(n * k) / k;
            };
        // Fix for IE parseFloat(0.55).toFixed(0) = 0;
        s = (prec ? toFixedFix(n, prec) : '' + Math.round(n)).split('.');
        if (s[0].length > 3) {
            s[0] = s[0].replace(/\B(?=(?:\d{3})+(?!\d))/g, sep);
        }
        if ((s[1] || '').length < prec) {
            s[1] = s[1] || '';
            s[1] += new Array(prec - s[1].length + 1).join('0');
        }
        return s.join(dec);
    }

    var today = new Date().toISOString().substring(0, 10);
    $.ajax({
        url : "/admin/statistics/selectDashboardGraph2.do"   
        , type : "POST"
		, dataType: "JSON"
        , data : JSON.stringify({ //변수에 담긴 데이터를 전송해준다 (JSON 방식)
                        // "startDt" : sdt,
                        "schoolCode" : "",
                        "endDt" : today
                    })
		, dataType : 'JSON' //데이터 타입 JSON
		, contentType : "application/json; charset=UTF-8"
		, success : function(data){ 	// 성공
            var j = 0;
            var item = document.getElementById('item_dent_hospital');
            item.innerHTML = "";
            var hospitalInnerText = '';
            for (j = 0; j< data.rows.length; j++) {
                hospitalInnerText = hospitalInnerText + '<a class="dropdown-item" href="#" onclick="searchHospital(\'' + data.rows[j].SCHOOL_CODE + '\', \'' + data.rows[j].SCHOOL_NAME + '\');">' + data.rows[j].SCHOOL_NAME + '</a>';
            }
            item.innerHTML = hospitalInnerText;     
            
            if (data.rows.length > 0) {
                searchHospital(data.rows[0].SCHOOL_CODE, data.rows[0].SCHOOL_NAME);
            }
        }
		,error : function (req, status, error) {
            var err = req.responseJSON.value;
		    alert("관리자에게 문의해주세요." + err);
		}
	});

    var item10 = document.getElementById('item_dent_measure_count_view');
    item10.innerHTML = "";
    var hospitalInnerText = '';
    hospitalInnerText = hospitalInnerText + '<a class="dropdown-item" href="#" onclick="searchMeasureCount(1);">최근 1개월</a>';
    hospitalInnerText = hospitalInnerText + '<a class="dropdown-item" href="#" onclick="searchMeasureCount(2);">최근 2개월</a>';
    item10.innerHTML = hospitalInnerText;  
    searchMeasureCount(1);

});
</script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
<script type="text/javascript">

   function searchMeasureCount(month_cnt) {
	   
       //오늘 년, 월, 일
       var today = new Date();
       var day = today.getDate();
       var month = today.getMonth();
       var year = today.getFullYear();
       var today = new Date().toISOString().substring(0, 10);
     
       var sdt = new Date(new Date().setMonth(month-month_cnt)).toISOString().substring(0, 10);
       var g1_title = "치과병원 서비스 일일 사용자 수 (최근 " + month_cnt + "개월간)";
       var g2_title = "치과병원 서비스 누적 사용자 수 (최근 " + month_cnt + "개월간)";
       document.getElementById("d_month").innerHTML = "(최근 " + month_cnt + "개월간)";
       $("#graph1_title").val(g1_title);
       
       $.ajax({
           url : "/admin/statistics/selectDashboardGraph1.do"   
           , type : "POST"
           , dataType: "JSON"
           , data : JSON.stringify({ //변수에 담긴 데이터를 전송해준다 (JSON 방식)
                       "startDt" : sdt,
                       "schoolCode" : "",
                       "endDt" : today
                   })
           , dataType : 'JSON' //데이터 타입 JSON
           , contentType : "application/json; charset=UTF-8"
           , success : function(data){ 	// 성공
               $('#myChart').remove();
               $('#eleMyDentChart1').append('<canvas id="myChart"><canvas>');
               $('#myChart2').remove();
               $('#eleMyDentChart2').append('<canvas id="myChart2"><canvas>');                                
               var lbl = [];
               var cnt = [];
               var tcnt = [];
               var j = 0;
               var tcnt_pre = data.totalCnt; 
               for (j = 0; j< data.rows.length; j++) {
                   lbl[j] = data.rows[j].measureDt;
                   cnt[j] = data.rows[j].totalCount;
                   tcnt[j] = tcnt_pre + cnt[j];
                   tcnt_pre = tcnt[j];
               }
               var context10 = document.getElementById('myChart').getContext('2d');
               var myChart10 = new Chart(context10, {
                   type: 'line', // 차트의 형태
                   data: { // 차트에 들어갈 데이터
                       labels: lbl,
                       datasets: [
                           { //데이터
                               label: g1_title, //차트 제목
                               fill: false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
                               data: cnt,
                               backgroundColor: [
                                   //색상
                                   'rgba(255, 159, 64, 0.2)'
                               ],
                               borderColor: [
                                   //경계선 색상
                                   'rgba(255, 159, 64, 1)'
                               ],
                               borderWidth: 3 //경계선 굵기
                           }
                       ]
                   },
                   options: {
                       scales: {
                           yAxes: [
                               {
                                   ticks: {
                                       beginAtZero: true
                                   }
                               }
                           ]
                       }
                   }
               });
               var context101 = document.getElementById('myChart2').getContext('2d');
               var myChart101 = new Chart(context101, {
                   type: 'line', // 차트의 형태
                   data: { // 차트에 들어갈 데이터
                       labels: lbl,
                       datasets: [
                           { //데이터
                               label: g2_title, //차트 제목
                               fill: false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
                               data: tcnt,
                               backgroundColor: [
                                   //색상
                                   'rgba(75, 192, 192, 0.2)',
                               ],
                               borderColor: [
                                   //경계선 색상
                                   'rgba(75, 192, 192, 1)'
                               ],
                               borderWidth: 3 //경계선 굵기
                           }
                       ]
                   },
                   options: {
                       scales: {
                           yAxes: [
                               {
                                   ticks: {
                                       beginAtZero: true
                                   }
                               }
                           ]
                       }
                   }
               });
           }
           ,error : function (req, status, error) {
               var err = req.responseJSON.value;
               alert("관리자에게 문의해주세요." + err);
           }
                   
       });
       
       
       
		$.ajax({
			url : "/admin/statistics/selectSwitchUserGraph.do"   
           	,type : "POST"
           	,dataType: "JSON"
           	,data : JSON.stringify({ //변수에 담긴 데이터를 전송해준다 (JSON 방식)
                       "startDt" : sdt,
                       "schoolCode" : "",
                       "endDt" : today
		})
			,dataType : 'JSON' //데이터 타입 JSON
			,contentType : "application/json; charset=UTF-8"
			,success : function(data){ 	// 성공
			// 기존 일반 회원 전환 삭제
           	$('#switchUserRegistChart').remove();
               $('#eleSwitchUserRegistChart').append('<canvas id="switchUserRegistChart"><canvas>');
               
               var context101 = document.getElementById('myChart2').getContext('2d');
               var myChart101 = new Chart(context101, {
                   type: 'bar', // 차트의 형태
                   data: { // 차트에 들어갈 데이터
                       labels: lbl,
                       datasets: [
                           { //데이터
                               label: g2_title, //차트 제목
                               fill: false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
                               data: tcnt,
                               backgroundColor: [
                                   //색상
                                   'rgba(75, 192, 192, 0.2)',
                               ],
                               borderColor: [
                                   //경계선 색상
                                   'rgba(75, 192, 192, 1)'
                               ],
                               borderWidth: 3 //경계선 굵기
                           }
                       ]
                   },
                   options: {
                       scales: {
                           yAxes: [
                               {
                                   ticks: {
                                       beginAtZero: true
                                   }
                               }
                           ]
                       }
                   }
               });
               
               
           },error : function (req, status, error) {
               var err = req.responseJSON.value;
               alert("관리자에게 문의해주세요." + err);
           }
       
   }

   function searchHospital(hospital_code, hospital_name) {
    // var cvs = document.getElementById('myDentChart');
    // cvs.clearRect(0, 0, cvs.width, cvs.height);
    $.ajax({
        url : "/admin/statistics/selectDashboardGraph1.do"   
        , type : "POST"
		, dataType: "JSON"
        , data : JSON.stringify({ //변수에 담긴 데이터를 전송해준다 (JSON 방식)
	            	"startDt" : "",
	            	"schoolCode" : hospital_code,
	            	"endDt" : ""
				})
		, dataType : 'JSON' //데이터 타입 JSON
		, contentType : "application/json; charset=UTF-8"
		, success : function(data){ 	// 성공
            var lbl = [];
            var cnt = [];
            var j = 0;
            for (j = 0; j< data.rows.length; j++) {
                lbl[j] = data.rows[j].measureDt;
                cnt[j] = data.rows[j].totalCount;
            }
            $('#myDentChart').remove();
            $('#eleMyDentChart').append('<canvas id="myDentChart"><canvas>');
		    var context2 = document
                .getElementById('myDentChart')
                .getContext('2d');
            var myChart2 = new Chart(context2, {
                type: 'line', // 차트의 형태
                data: { // 차트에 들어갈 데이터
                    labels: lbl,
                    datasets: [
                        { //데이터
                            label: hospital_name, //차트 제목
                            fill: false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
                            data: cnt,
                            backgroundColor: [
                                //색상
                                'rgba(255, 99, 132, 0.2)'
                            ],
                            borderColor: [
                                //경계선 색상
                                'rgba(255, 99, 132, 1)'
                            ],
                            borderWidth: 3 //경계선 굵기
                        }/* ,
                        {
                            label: 'test2',
                            fill: false,
                            data: [
                                8, 34, 12, 24
                            ],
                            backgroundColor: 'rgb(157, 109, 12)',
                            borderColor: 'rgb(157, 109, 12)'
                        } */
                    ]
                },
                options: {
                    scales: {
                        yAxes: [
                            {
                                ticks: {
                                    beginAtZero: true,
                                    stepSize: 1
                                }
                            }
                        ]
                    }
                }
            });
		}
		,error : function (req, status, error) {
            var err = req.responseJSON.value;
		    alert("관리자에게 문의해주세요." + err);
		}
		         
	});
   }
</script>
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
                    <!-- Page Heading -->
                    <div class="d-sm-flex align-items-center justify-content-between mb-4" style="padding-top: 5px;">
                        <h1 class="h3 mb-0 text-gray-800">
                       		<!-- 평균 충치 개수 위 제목  -->
                       	</h1>
<!--                         <a href="#" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i -->
<!--                                 class="fas fa-download fa-sm text-white-50"></i> Generate Report</a> -->
                    </div>

                    <!-- Content Row -->
					
                    <div class="row">

                        <!-- Area Chart -->
                        <div class="col-xl-8 col-lg-7">
                            <div class="card shadow mb-4">
                                <!-- Card Header - Dropdown -->
                                <div
                                    class="card-header py-3 d-flex flex-row align-items-center justify-content-between">


                                    <h5 class="m-0 font-weight-bold text-primary" id="graph1_title">
										치과병원 서비스 사용자 수 <span id="d_month">(최근 1개월간)</span>
									</h6>
                                    <div class="dropdown no-arrow">
                                        <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink"
                                            data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            <i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
                                        </a>
                                        <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in"
                                            aria-labelledby="dropdownMenuLink" id="item_dent_measure_count_view">
                                            <!--<div class="dropdown-header">정렬</div>
                                            <a class="dropdown-item" href="#">이름(오름차순)</a>
                                            <a class="dropdown-item" href="#">이름(내림차순)</a>
                                            <div class="dropdown-divider"></div>
                                            <a class="dropdown-item" href="#">개수(오름차순)</a>
                                            <a class="dropdown-item" href="#">개수(내림차순)</a>-->
                                        </div>
                                    </div>
                                </div>
                                <!-- Card Body -->
                                <div class="card-body">
                                    <div class="chart-area" style="height: 560px;" id="eleMyDentChart2">
                                        <!--차트가 그려질 부분-->
                                        <canvas id="myChart2"></canvas>
                                    </div>
                                    <div class="chart-area" style="height: 560px;" id="eleMyDentChart1">
                                        <!--차트가 그려질 부분-->
                                        <canvas id="myChart"></canvas>
                                    </div>
                                </div>
                            </div>
                        </div>

						<div class="tmp">
	                        <!-- Pie Chart -->
	                        <div class="">
	                            <div class="card shadow mb-4">
	                                <div
	                                    class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
	                                    <h5 class="m-0 font-weight-bold text-primary" id="graph2_title">병원별 일일 사용자 수 (최근 1개월간)</h6>
<!-- 	                                    <div class="dropdown no-arrow"> -->
<!-- 	                                        <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink" -->
<!-- 	                                            data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> -->
<!-- 	                                            <i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i> -->
<!-- 	                                        </a> -->
<!-- 	                                        <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in"aria-labelledby="dropdownMenuLink" id="item_dent_hospital"> -->
<!-- 	                                            <div class="dropdown-header">Dropdown Header:</div> -->
<!-- 	                                            <a class="dropdown-item" href="#">Action</a> -->
<!-- 	                                            <a class="dropdown-item" href="#">Another action</a> -->
<!-- 	                                            <div class="dropdown-divider"></div> -->
<!-- 	                                            <a class="dropdown-item" href="#">Something else here</a> -->
<!-- 	                                        </div> -->
<!-- 	                                    </div> -->
	                                </div>
	                                <!-- Card Body -->
	                                <div class="card-body">
	                                    <div class="chart-pie pt-4 pb-2" id="eleMyDentChart">
	                                        <canvas id="myDentChart"></canvas>
	                                    </div>
	                                </div>
	                            </div>
	                        </div>
	                        
	                        <!-- 일반 회원 전환  -->
	                        <div class="">
	                            <div class="card shadow mb-4">
	                                <div
	                                    class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
	                                    <h5 class="m-0 font-weight-bold text-primary" id="graph2_title">일반 회원 전환</h6>
	                                    <div class="dropdown no-arrow">
	                                        <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink"
	                                            data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	                                            <i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
	                                        </a>
	                                        <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in"aria-labelledby="dropdownMenuLink" id="item_dent_hospital">
	                                            <div class="dropdown-header">Dropdown Header:</div>
	                                            <a class="dropdown-item" href="#">Action</a>
	                                            <a class="dropdown-item" href="#">Another action</a>
	                                            <div class="dropdown-divider"></div>
	                                            <a class="dropdown-item" href="#">Something else here</a>
	                                        </div>
	                                    </div>
	                                </div>
	                                <!-- Card Body -->
	                                <div class="card-body">
	                                    <div class="chart-pie pt-4 pb-2" id="eleSwitchUserRegistChart">
	                                        <canvas id="switchUserRegistChart"></canvas>
	                                    </div>
	                                </div>
	                            </div>
	                        </div>
                        </div>
                    </div>
	                <!-- /.container-fluid -->
                </div>
			</div>        
<!-- Footer menu -->
			<jsp:include page="/WEB-INF/views/admin/layout/footer.jsp"></jsp:include>
		</div>
	</div>
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