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
<title>㈜스마트코리아 :: 버그리포트</title>
<!-- favicon ico 에러 -->
<link rel="shortcut icon" type="image/x-icon" href="/imgs/common/logo_img_ori.png">
<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
<link rel="stylesheet" href="css/common/sb-admin-2.css">
<link rel="stylesheet" type="text/css" href="css/jquery/jquery-ui.css" />
<link rel="stylesheet" href="css/jquery/jqgrid/ui.jqgrid.css">
<link rel="stylesheet" href="/css/common/layout.css">
<!-- jQuery --> 
<script type="text/javascript" src="js/jquery/jquery.js"></script>
<script type="text/javascript" src="js/jquery/jquery-ui.js"></script>
<!-- jqGrid -->
<script type="text/javascript" src="js/jquery/jqgrid/i18n/grid.locale-kr.js"></script>
<script type="text/javascript" src="js/jquery/jqgrid/minified/jquery.jqGrid.min.js"></script>
<!-- Element Css -->
<style type="text/css">

.modal {
  /* position: absolute; */
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	display: none;
	background-color: rgba(0, 0, 0, 0.4);
}

.modal.show {
  	display: flex;
    justify-content: center;
    align-items: center;
}

.modal_body {
    /* position: absolute; */
    top: 20%;
    left: 40%;
    width: 455px;
    height: 500px;
    padding: 30px;
    text-align: center;
    background-color: rgb(255, 255, 255);
    border-radius: 10px;
    box-shadow: 0 2px 3px 0 rgb(34 36 38 / 15%);
}


/**Modal 안의 div**/
.wrap-div{
    display: flex;
}
.div-td-left{
    margin-left: 6%;
    vertical-align: center;
    padding-top: 4px;
}
.div-td-right{
    margin-left: 10%;
    padding-bottom: 5%;
}


.text-gray-333{
	color: #333333 !important;
}

.mb-4{
	height: 70px;
}

.appVersionLogList{
	padding-left: 2rem;
    padding-right: 2rem;
    padding-top: 0.8rem;
}


@media screen and (min-height: 935px) and (max-height: 1080px) {
	.gridHeight{
		height: 730px;
		display: flex;
    	align-items: center;
	}
}
@media screen and (min-height: 1081px) and (max-height: 1440px){
	.gridHeight{
		display: flex;
    	align-items: center;
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

.button{
	width: 10%;
    float: left;
    margin-left: 10px;
    background-color: #333333;
    border-color: #333333;
    font-size: 14px;
}

.right-space{
    padding-top: 20px;
    padding-left: 20px;
}


.table{
	text-align: center;
	margin-top: 2%;
	margin-bottom: 0;
	width: 97%;
}

.table th{
	vertical-align: middle;
	background-color: #333333;
	font-weight: bold;	
	color: #ffffff;
}

/* .table th.tb-seq{
 	width: 150px;
 }
.table th.tb-title{
	width: auto;
}
.table th.tb-writer{
	width: 80px;
}
.table th.tb-rgstDt{
	width: 120px;
}
.table th.tb-viewCnt{
	width: 70px;
}
.table td:nth-child(2){
	text-align: left;
} */

/* .table tr{ */
/* 	border : 2px solid #000000; */
/* } */

.table th{
	vertical-align: middle;
	padding: 0;
	width: 10%;
	height: 35px;
}

/* .table td{ */
/* 	vertical-align: middle; */
/*     padding: 0; */
/*     width: 300px; */
/*     height: 38px; */
/* } */

.td-boardTitle:hover{
    cursor: pointer;
}

.td-boardRgstDt{
	font-size: 12px;
}

td.content{
	text-align: left;
	vertical-align: baseline;
	padding-left: 15px;
	height: 300px;
    text-align: left;
	overflow-x: hidden;
	overflow-y: auto;
}


.comment-div{
	width: 50%;	
}

.comment-wrap{
	display: flex;
    justify-content: center;
}

.form-control{
	margin-right: 10px;
	width: 100%;
}

textarea.comment{
    font-family: 'NanumSquareR';
    padding: 13px;
    border: 1px solid #333333;
    background: #fff;
    color: #333333;
    font-size: 13px;
    border-radius: 0.2rem;
    line-height: 18px;
    width: 95%;
    height: auto;
    resize: none;
}

.td-boardStatus{
	display: flex;
	justify-content: center;
	align-items: center;
	border-radius: 0.3rem;
	color: #ffffff;
	width: 20%;
	height: 75%;
}

.td-boardRequestStatus{
	display: flex;
	justify-content: center;
	align-items: center;
	border-radius: 0.3rem;
	color: #ffffff;
	width: 20%;
	height: 75%;
}

.cmt_nickbox {
    display: flex;
    align-items: center;
    justify-content: center;
    line-height: 14px;
    width: 150px;
}

.gall_writer {
    position: relative;
    font-size: 13px;
}

.nickname.me {
    display: flex;
    align-items: center;
    justify-content: center;
    text-align: center;
    background: #e4edff;
	border-radius: 0.3rem;
    font-size: 13px;
    height: 100%;
    width: 100%
    
}

.usertxt{
    overflow: hidden;
    margin: 0px;
    padding-left: 20px;
    padding-right: 10px;
    padding-top: 10px;
    padding-bottom: 10px;
}

.cmt_txtbox{
	display: flex;
    align-items: center;
	width: 86.5%;
}

.fr{
	width: 155px;
    text-align: center;
    font-size: 13px;
    display: flex;
    justify-content: center;
    align-items: center;
}

.deleteComment:hover{
	cursor: pointer;
}

</style>
<!-- Element Css end -->
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
<!-- Title Row -->
                    <div class="row">
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-primary shadow h-100 py-2">
                                <div class="card-body appVersionLogList">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
												버그리포트
                                             </div>
                                        </div>
                                        <div class="col-auto">
                                             <i class="fas fa-fw fa-bug"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
<!-- Content Row -->
                    <div class="row">
						<div class="col-xl-12">
                            <div class="card shadow mb-4 gridHeight">
<!-- 								<section class="main-section"> -->
<!-- Board Row -->
									<table class="table table-bordered">
										<tr>
											<th>번호</th>
											<td style="padding-left: 15px;">${boardInfo.boardSeq}</td>
											<th>작성일</th>
											<td style="padding-left: 15px;">${boardInfo.boardRgstDt}</td>
											
										</tr>
										<tr>
											<th>작성자</th>
											<td style="padding-left: 15px;">${boardInfo.userName}(${boardInfo.userId})</td>
											<th>요청 상태</th>
											<td style="padding-left: 15px; display: flex; justify-content: center; align-items: center; border: 0px; border-bottom: 1px solid #495057; padding:0px; height:45px;">${boardInfo.boardRequestStatusHtml}</td>
										</tr>	
										<tr>
											<th>제목</th>
											<td style="padding-left: 15px; text-align: left;">${boardInfo.boardTitle}</td>
											<th>작업 상태</th>
											<td style="padding-left: 15px; display: flex; justify-content: center; align-items: center; border: 0px; padding:0px; height:45px;">${boardInfo.boardStatusHtml}</td>
										</tr>		
										<tr>
											<th>내용</th>
											<td class="content" colspan="3">
												${boardInfo.boardContent}
											</td>
										</tr>		
									</table>
									<div class="commonHeight10"></div>
<!-- CRUD -->
									<div class="buttons">
										<button type="button" class="btn btn-primary" onclick="location.href='/admin/board/updateBugReport?boardSeq=${boardInfo.boardSeq}';" style="width: 60px; font-size: 14px;">수정</button>
										<button type="button" class="btn btn-primary" onclick="location.href='/admin/board/deleteBugReport.do?boardSeq=${boardInfo.boardSeq}';" style="width: 60px; font-size: 14px;">삭제</button>
									</div>
<!-- COMMENT -->
									<div class="commonHeight10"></div>
									<div id="commentContent-div" style="width: 98%; display: flex; flex-direction: column;">
										<c:forEach items="${boardCommentList}" var="commentList" varStatus="status">
											<div style="display: flex; padding: 5px 5px 0px 10px; flex-direction: row;">
												<div class="cmt_nickbox">
													<span class="nickname me">${commentList.USER_NAME}(${commentList.USER_ID})</span>
												</div>
												<div class="clear cmt_txtbox btn_reply_write_all">
													<p class="usertxt ub-word">${commentList.COMMENT_CONTENT}</p>
												</div>
												<div class="fr">
													${commentList.COMMENT_RGST_DT}
													<div class="deleteComment" onclick="deleteComment('${commentList.COMMENT_SEQ}');">
														<i class="fa fa-times" aria-hidden="true" style="margin-left:10px;"></i>
													</div>
												</div>													
											</div>
										</c:forEach>
									</div>
									<div class="commonHeight20"></div>
									<div class="comment-div">
										<form name="frm" id="frm" method="POST" action="/admin/board/insertBoardComment.do">
											<div class="comment-wrap">
												<textarea name="commentContent" id="commentContent" class="form-control" style="resize: none; font-size: 14px;" placeholder="댓글을 작성하세요."></textarea>
												<input type="button" id="commentSubmit" class="btn btn-primary" style="font-size: 14px;" value="댓글"/>
											</div>
											<input type="hidden" name="userId" value="${boardInfo.userId}" />
											<input type="hidden" name="boardSeq" value="${boardInfo.boardSeq}" />
										</form>
									</div>
<!-- 								</section>	 -->
                           	</div>
						</div>
					</div>
				</div>
			</div>   
			<input type="hidden" id="input_userId" name="input_userId" value="${userInfo.userId}" />     
<!-- Footer menu -->
			<jsp:include page="/WEB-INF/views/admin/layout/footer.jsp"></jsp:include>
		</div>
	</div>
	
<script type="text/javascript">

//댓글 삭제 후 새로고침
function deleteComment(commentSeq){
	
	$.ajax({
		type:'POST',   //post 방식으로 전송
		url:'/admin/board/deleteBoardComment.do',   //데이터를 주고받을 파일 주소
		data:JSON.stringify ({ //변수에 담긴 데이터를 전송해준다 (JSON 방식)
			"commentSeq" : commentSeq
		}),
		dataType:'JSON', //데이터 타입 JSON
		contentType : "application/json; charset=UTF-8",
		success : function(data){   //파일 주고받기가 성공했을 경우. data 변수 안에 값을 담아온다.
			var htmlStr = "";
			if(data.code == '000'){
				var commentList = data.boardCommentList;
				
				
				for(var i=0; i<commentList.length; i++){
					
					var userId = commentList[i].USER_ID;
					var userName = commentList[i].USER_NAME;
					var commentContent = commentList[i].COMMENT_CONTENT;
					var commentRgstDt = commentList[i].COMMENT_RGST_DT;
					var commentSeq = commentList[i].COMMENT_SEQ;
					commentSeq = commentSeq.replaceAll("-", "");
					
					htmlStr += "<div style='display: flex; padding: 5px 5px 0px 10px; flex-direction: row;'>";
					htmlStr += "<div class='cmt_nickbox'>";
					htmlStr += "<span class='nickname me'>";
					htmlStr += userName+"("+userId+")";
					htmlStr += "</span></div>";
					htmlStr += "<div class='clear cmt_txtbox btn_reply_write_all'><p class='usertxt ub-word'>";
					htmlStr += commentContent;
					htmlStr += "</p></div>";
					htmlStr += "<div class='fr'>";
					htmlStr += commentRgstDt;
					htmlStr += '<div class="deleteComment" onclick="deleteComment('+commentSeq+')">';
					htmlStr += "<i class='fa fa-times' aria-hidden='true' style='margin-left:10px;'></i></div></div></div>";
				}
				$("#commentContent-div").html(htmlStr); 
			}
		}
	});
}

$(document).ready(function(){
	
	// 댓글 등록
	$('#commentSubmit').click(function(){
		
		if ($("#commentContent").val() == "") {
			alert("댓글의 내용을 입력하세요.");
			$("#commentContent").focus();
			return false;
		}
		
		$("#frm").submit();
			  	
	  	setTimeout(function() {
			console.log('complite');
			alert("등록이 완료되었습니다.");
	  	}, 1000);
		
	});
	

	
});

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