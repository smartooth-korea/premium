<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>㈜스마투스코리아 :: 이메일 인증 성공</title>
<!-- Custom fonts for this template-->
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
<!-- Custom styles for this template-->
<link rel="stylesheet" href="css/common/sub.css">
<link rel="stylesheet" href="css/common/sb-admin-2.css">
<style type="text/css">
#wrapper{
	height: 100vh;
	display: flex;
	align-items: center;
	justify-content: center;
}

#success-wrapper{
	height: 15rem;
}

#contents-title{
	display: flex;
    align-items: center;
    justify-content: center;
    font-size: 1.6rem;
    height: 50%;
}

#contents-contents{
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 1rem;
    height: 50%;
}
</style>
</head>
<body id="page-top">
    <div id="wrapper">
        <div id="content-wrapper" class="d-flex flex-column">
            <div id="content">
                <div class="container-fluid">
                    <div id="success-wrapper" class="text-center">
                        <div id="contents-title">
                        	이메일 인증이 완료 되었습니다.
                       	</div>
                       	<div id="contents-contents">
                        	실행 중이던 어플리케이션에서 확인 버튼을 클릭해주시기 바랍니다.
                       	</div>
                    </div>
                </div>
            </div>
            <footer class="sticky-footer bg-white">
                <div class="container my-auto">
                    <div class="copyright text-center my-auto">
                        <span>Copyright © Smartooth KOREA</span>
                    </div>
                </div>
            </footer>
        </div>
    </div>
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                    <a class="btn btn-primary" href="login.html">Logout</a>
                </div>
            </div>
        </div>
    </div>

</body></html>