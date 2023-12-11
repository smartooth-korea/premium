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
<title>㈜스마트코리아 기관 조회/등록/수정/삭제 ::: main</title>
<!-- favicon ico 에러 -->
<link rel="shortcut icon" type="image/x-icon" href="/imgs/common/logo_img_ori.png">
<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
<link rel="stylesheet" href="css/common/sb-admin-2.css">
<link rel="stylesheet" type="text/css" href="css/jquery/jquery-ui.css" />
<link rel="stylesheet" href="css/jquery/jqgrid/ui.jqgrid.css">
<!-- jQuery --> 
<script type="text/javascript" src="js/jquery/jquery.js"></script>
<script type="text/javascript" src="js/jquery/jquery-ui.js"></script>
<!-- jqGrid -->
<script type="text/javascript" src="js/jquery/jqgrid/i18n/grid.locale-kr.js"></script>
<script type="text/javascript" src="js/jquery/jqgrid/minified/jquery.jqGrid.min.js"></script>

<!-- Element Css -->
<style type="text/css">

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

#regist{
	width: 100px;
    float: left;
    margin-left: 10px;
    background-color: #333333;
    border-color: #333333;
    margin-top: 50px;
    margin-left: 50px;
    font-size: 14px;
}

.wrap-top{
	padding-top: 30px;
}

.wrap{
	display: flex;
	padding-top: 2rem;
}

.right-space{
    padding-top: 20px;
    padding-left: 20px;
}

.display-control{
	width: 170px;
	/*text-align: center;*/
    padding: 0.5rem 0.75rem;
    font-size: 1rem;
    color: #333333;
    font-weight: bold;
    margin-left: 40px;
}

.input-control{
	display: block;
    width: 250px;
    height: calc(1.5em + 0.75rem + 2px);
    padding: 0.5rem 0.75rem 0.5rem 1rem;
    margin-right: 50px;
    line-height: 1.5;
    font-size: 1rem;
    font-weight: bold;
    color: #000000;
    background-color: #fff;
    background-clip: padding-box;
    border: 1px solid #495057;
    border-radius: 0.35rem;
    transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
}

</style>

<!-- Element Css end -->
<!-- ${userInfo.userType} -->

</head>
<body id="page-top">
<!-- Page Wrapper -->
   	<div id="wrapper">
		<jsp:include page="/WEB-INF/views/admin/layout/left.jsp"></jsp:include>
<!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">
<!-- Body-->
            <div id="content">
<!-- Top menu -->
			<jsp:include page="/WEB-INF/views/admin/layout/header.jsp"></jsp:include>

			
<!-- Contents -->
				<div class="container-fluid">
                    <!-- Page Heading -->
<!--                     <div class="d-sm-flex align-items-center justify-content-between mb-4" style="padding-top: 5px;"> -->
<%--                         <h1 class="h3 mb-0 text-gray-800"></h1> --%>
<!--                         <a href="#" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i -->
<!--                                 class="fas fa-download fa-sm text-white-50"></i> Generate Report</a> -->
<!--                     </div> -->

                    <!-- Content Row -->
                    <div class="row">

                        <!-- Earnings (Monthly) Card Example -->
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-primary shadow h-100 py-2">
                                <div class="card-body organList">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">

<!-- 충치 갯수 차트 -->
<!-- 선생님 일 경우 , 반에 대한 정보를 -->
<!-- 부모일 경우 아이의 정보를 기입하도록 변경-->
<!-- 현재는 하드코딩으로 진행 -->
												기관 등록

                                             </div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-building fa-2x text-gray-333"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Content Row -->

                    <div class="row">

<!-- jqGrid -->

<!--<div class="col-xl-8 col-lg-7"> -->
						<div class="col-xl-12">
                            <div class="card shadow mb-4 gridHeight">
<!-- Card Header - Dropdown -->
							<form method="post" id="frm" action="/admin/organ/insertOrganInfo">
								<div class="wrap-top">
	                                <div class="wrap">
	                                	<div class="display-control">기 관 명&nbsp;&nbsp;&nbsp;&nbsp;: </div>
	                                	<input hidden="hidden"/>
	                                	 <input id="schoolName" name="schoolName" type="text" class="input-control" placeholder="입력해주세요.">
									</div>
									<div class="wrap">
										<div class="display-control">기 관 종 류&nbsp;&nbsp;&nbsp;&nbsp;: </div>
	                                	<select id="schoolType" name="schoolType" class="input-control ">
										<!-- 옵션 값을 조회 이 페이지 들어오기전에 가져와야한다. 그 후 셀렉트 박스에서 값이 선택되면 ajax로 나머지 지역 읍면동을 만들어준다 -->
											<option value="">선택해주세요</option>
											<option value="KG"> 어린이집, 유치원</option>
											<option value="EL"> 초등학교</option>
											<option value="MD"> 중학교</option>
											<option value="HI"> 고등학교</option>
											<option value="DE"> 치과</option>
										</select>
									 </div>
									<div class="wrap">
										<div class="display-control">지역(시도)&nbsp;&nbsp;&nbsp;&nbsp;: </div>
	                                	<select id="sido" name="sido" class="input-control " onchange="changeSidoInfo()">
										<!-- 옵션 값을 조회 이 페이지 들어오기전에 가져와야한다. 그 후 셀렉트 박스에서 값이 선택되면 ajax로 나머지 지역 읍면동을 만들어준다 -->
											<option value="">선택해주세요</option>
												<c:forEach var="sidoList" items="${sidoList}">
													<option value="${sidoList.sidoCd}">${sidoList.sidoNm}</option>
												</c:forEach>
										</select>
									 </div>
									<div class="wrap">
										<div class="display-control">지역(시군구)&nbsp;&nbsp;&nbsp;&nbsp;: </div>
	                                	<select id="sigungu" name="sigungu" class="input-control" onchange="changeSigunguInfo()">
											<option value="">선택해주세요</option>
										</select>
									 </div>
									 <div class="wrap">
	                                	<div class="display-control">지역(읍면동)&nbsp;&nbsp;&nbsp;&nbsp;: </div>
	                                	<select id="eupmyeondong" name="eupmyeondong" class="input-control ">
									      	<option value="">선택해주세요</option>
										</select>
	                               	 </div>
									 <div>
									 	<input type="button" id="regist" onclick="opSubmit();" class="btn btn-info btn-fill" value="등록">
	                               	 </div>
	                              </div>
								</form>        
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
	
	function changeSidoInfo(){
		var str = "";
		var locationList = "";

		var sido = document.getElementById("sido");
		var sidoCd = sido.options[sido.selectedIndex].value;
		var sidoNm = sido.options[sido.selectedIndex].text;

		$.ajax({
			type : 'POST', //post 방식으로 전송
			url : '/admin/selectSigunguInfoList.do', //데이터를 주고받을 파일 주소
			data : JSON.stringify({ //변수에 담긴 데이터를 전송해준다 (JSON 방식)

				"sidoCd" : sidoCd,
				"sidoNm" : sidoNm

			}),
			dataType : 'JSON', //데이터 타입 JSON
			contentType : "application/json; charset=UTF-8",
			success : function(data) { //파일 주고받기가 성공했을 경우. data 변수 안에 값을 담아온다.
				locationList = data.locationInfoList;
				for (var i = 0; i < locationList.length; i++) {
					if (i == 0) {
						str = '<option value="">선택해주세요</option>';
					}
					str += '<option value="' + locationList[i].sggemdCd + '">'
							+ locationList[i].sigunguNm + '</option>';
				}
				$('#sigungu').html(str);
			}
		});
	}

	function changeSigunguInfo() {
		var str = "";
		var locationList = "";

		var sigungu = document.getElementById("sigungu");
		var sggemdCd = sigungu.options[sigungu.selectedIndex].value;
		var sigunguNm = sigungu.options[sigungu.selectedIndex].text;

		// ajax 넣어줘야함
		$.ajax({
			type : 'POST', //post 방식으로 전송
			url : '/admin/selectEupmyeondognInfoList.do', //데이터를 주고받을 파일 주소
			data : JSON.stringify({ //변수에 담긴 데이터를 전송해준다 (JSON 방식)

				"sggemdCd" : sggemdCd,
				"sigunguNm" : sigunguNm

			}),
			dataType : 'JSON', //데이터 타입 JSON
			contentType : "application/json; charset=UTF-8",
			success : function(data) { //파일 주고받기가 성공했을 경우. data 변수 안에 값을 담아온다.
				locationList = data.locationInfoList;
				for (var i = 0; i < locationList.length; i++) {
					if (i == 0) {
						str = '<option value="">선택해주세요</option>';
					}
					str += '<option value="' + locationList[i].sggemdCd + '|'+locationList[i].addrSeqNo+'">'+ locationList[i].eupmyeondongNm + '</option>';
				}
				$('#eupmyeondong').html(str);
			}
		});
	}
	
	
	function opSubmit(){
		
		var sido = document.getElementById("sido");
		var sigungu = document.getElementById("sigungu");
		var eupmyeondong = document.getElementById("eupmyeondong");
		var schoolType = document.getElementById("schoolType");
		
		var sidoNm = sido.options[sido.selectedIndex].text;
		var sigunguNm = sigungu.options[sigungu.selectedIndex].text;
		var eupmyeondongNm = eupmyeondong.options[eupmyeondong.selectedIndex].text;
		var schoolTypeNm = schoolType.options[schoolType.selectedIndex].text;
		 
		
		if ($("#shcoolName").val() == "") {
			alert("등록할 기관명을 입력해주세요.");
			$("#shcoolName").focus();
			return false;
		}
		
		if ($("#sido").val() == "") {
			alert("지역(시도)을 선택해주세요.");
			$("#sido").focus();
			return false;
		}
		if ($("#sigungu").val() == "") {
			alert("지역(시군구)을 선택해주세요.");
			$("#sigungu").focus();
			return false;
		}
		if ($("#eupmyeondong").val() == "") {
			alert("지역(읍면동)을 선택해주세요.");
			$("#eupmyeondong").focus();
			return false;
		}
		
		if(window.confirm("기관명 : "+$("#shcoolName").val()+"\n"+"기관종류 : "+schoolTypeNm+"\n"+"지역(시도) : "+sidoNm+"\n"+"지역(시군구) : "+sigunguNm+"\n"+"지역(읍면동) : "+eupmyeondongNm+"\n"+"\n\n 입력하신 정보가 맞습니까?") ==true){
			$("#frm").submit();
		}else{
			return false;
		}
		
		
		
	}
		
		
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