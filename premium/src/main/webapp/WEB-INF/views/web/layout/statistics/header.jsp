<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script> -->
<nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">
	
<!-- 뒤로가기 앞으로가기 버튼 -->
<!-- 	<button id="backBtn" type="button" class="btn btn-primary" onclick="history.go(-1);"> -->
<!-- 		<i class="fas fa-arrow-left fa-sm"></i> -->
<!--     </button>&nbsp;&nbsp;&nbsp; -->
    
<!--     <button id="backBtn" type="button" class="btn btn-primary" onclick="history.forwad();"> -->
<!-- 		<i class="fas fa-arrow-right fa-sm"></i> -->
<!--     </button> -->

<!-- 메뉴버튼 -->
<!--     <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3"> -->
<!--         <i class="fa fa-bars"></i> -->
<!--     </button> -->
	<div id="login_logo_background">
		<img id="logo_img" src="/imgs/common/login_logo_background_ffffff.png" alt="㈜스마투스코리아 로고" style="width: 20vh;">
		<br/>
		<div class="text-xs font-weight-bold text-primary text-uppercase mb-1" style="font-size: 14px; padding-left: 8px;">치아 모니터링 시스템</div>
	</div>

    <!-- Topbar Search -->
    <form
        class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
        <div class="input-group">
            <input type="text" id="searchInput" class="form-control bg-light border-0 small" placeholder="검색" aria-label="Search" aria-describedby="basic-addon2">
            <div class="input-group-append">
                <button id="searchBtn" type="button" class="btn btn-primary" onclick="seachClick();">
                    <i class="fas fa-search fa-sm"></i>
                </button>
            </div>
        </div>
    </form>

	<ul>
        <!-- Nav Item - User Information -->
        <li class="nav-item dropdown no-arrow" style="list-style: none;">
            <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <!-- USER_ID -->
                <span class="mr-2 d-none d-lg-inline text-gray-600 small" style="padding-top: 7px; padding-right: 2.5px; font-size: 15px;">
<!----- 사용자 이름 ----->
                	${userInfo[0].userName}
                </span>
                <img class="img-profile rounded-circle"
                    src="imgs/undraw_profile.svg">
            </a>
            <!-- Dropdown - User Information -->
            <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
<!-- 개인 정보 -->
<!--                 <a class="dropdown-item" href="#"> -->
<!--                     <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i> -->
<!--                     Profile -->
<!--                 </a> -->
<!--                 <a class="dropdown-item" href="#"> -->
<!--                     <i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i> -->
<!--                     Settings -->
<!--                 </a> -->
<!--                 <a class="dropdown-item" href="#"> -->
<!--                     <i class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i> -->
<!--                     Activity Log -->
<!--                 </a> -->
<!--                 <div class="dropdown-divider"></div> -->
                <span class="dropdown-item" onclick="location.href='/logout.do'" data-toggle="modal" data-target="#logoutModal">
	                    <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
	                    Logout
                </span>
            </div>
        </li>
    </ul>

</nav>
<script type="text/javascript">
	function seachClick(){

		alert("검색 기능은 추후 진행될 예정입니다.");
		$("input#searchInput").val('');
		
		return;	
	}		
</script>
<!-- End of Topbar -->