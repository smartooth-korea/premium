<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style type="text/css">

ul{
	font-family: 'NanumSquareR';
}

.sidebar-heading{
    font-size: 14px;
}

.fas{
	margin-left: 5px;
}

.collapse-item{
	padding-left: 28px;
	font-size: 12px; font-weight: normal;	
}

h6{
	color: #318CDD;
}


</style>
<!-- Sidebar -->
<ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

    <!-- Sidebar - Brand -->
    <a class="sidebar-brand d-flex align-items-center justify-content-center" href="/admin/main.do">
        <div>
            <img src="/imgs/common/logo_img.png" style="width: 50px;">
        </div>
<!--  <sup>2</sup> -->
        <div class="sidebar-brand-text mx-3" style="padding-top: 5px;">Smartooth</div>
    </a>

    <!-- Divider -->
    <hr class="sidebar-divider my-0"/>

    <!-- Nav Item - Dashboard -->
    <li class="nav-item active">
        <a class="nav-link" href='/admin/main.do' ">
            <i class="fas fa-fw fa-tachometer-alt"></i>
            <span>Dashboard</span></a>
    </li>

    <!-- Divider -->
    <hr class="sidebar-divider">

    <!-- Heading -->
    <div class="sidebar-heading">
<!--         Interface -->
    </div>

    <!-- Nav Item - Pages Collapse Menu -->
<!--     <li class="nav-item"> -->
<!--         <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo" -->
<!--             aria-expanded="true" aria-controls="collapseTwo"> -->
<!--             <i class="fas fa-fw fa-cog"></i> -->
<!--             <span>Student List</span> -->
<!--         </a> -->
<!--         <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar"> -->
<!--             <div class="bg-white py-2 collapse-inner rounded"> -->
<!--                 <h6 class="collapse-header">Custom Components:</h6> -->
<!--                 <a class="collapse-item" href="buttons.html">Buttons</a> -->
<!--                 <a class="collapse-item" href="cards.html">Cards</a> -->
<!--             </div> -->
<!--         </div> -->
<!--     </li> -->
	<!-- Nav Item - Tables -->
<!--     <li class="nav-item"> -->
<!--         <a class="nav-link" href="/user/selectStUserInfoList.do"> -->
<!--             <i class="fas fa-fw fa-table"></i> -->
<!--             <span>Student List</span></a> -->
<!--     </li> -->
    <!-- Heading -->
    <div class="sidebar-heading">
        GENERAL
    </div>

    <!-- Divider -->
    <hr class="sidebar-divider">


    <!-- Heading -->
    <div class="sidebar-heading">
        PREMIUM
    </div>
<c:if test="${userInfo.userType eq 'SU'}">
	<li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseDiagnosis"
            aria-expanded="true" aria-controls="collapseDiagnosis">
            <i class="fas fa-fw fa-desktop"></i>
            <span>측정 데이터</span>
        </a>
        <div id="collapseDiagnosis" class="collapse" aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
            <div class="bg-white py-2 collapse-inner rounded">
            <h6 class="collapse-header" style="color: #318CDD; text-shadow: 0px 0px 0px #318CDD; font-size: 12px; font-weight: bold;">유치원 서비스</h6>
                <a class="collapse-item" href="/admin/statistics/selectUserMeasureList?userType=ST">결과지 조회</a>
            <h6 class="collapse-header" style="color: #318CDD; text-shadow: 0px 0px 0px #318CDD; font-size: 12px; font-weight: bold;">치과 서비스</h6>
            	<a class="collapse-item" href="/admin/statistics/selectUserMeasureList?userType=PA">결과지 조회</a>
<%--                  <c:if test="${userInfo.userType eq 'SU'}"> --%>
<!--                 	<a class="collapse-item" href="/admin/user/selectAdminUserList""></a> -->
<%--                 </c:if> --%>
<!--                 <a class="collapse-item" href="utilities-border.html">Borders</a> -->
<!--                 <a class="collapse-item" href="utilities-animation.html">Animations</a> -->
<!--                 <a class="collapse-item" href="utilities-other.html">Other</a> -->
            </div>
        </div>
    </li>
</c:if>

<c:if test="${userInfo.userType eq 'SU'}">
   	<li class="nav-item">
		<a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseProducts"
            aria-expanded="true" aria-controls="collapseProducts">
            <i class="fas fa-fw fa-sitemap"></i>
            <span>기관</span>
        </a>
        <div id="collapseProducts" class="collapse" aria-labelledby="headingUtilities"data-parent="#accordionSidebar">
            <div class="bg-white py-2 collapse-inner rounded">
            <!-- 조회 등록 삭제-->
                <h6 class="collapse-header" style="color: #318CDD; text-shadow: 0px 0px 0px #318CDD; font-size: 12px; font-weight: bold;">유치원 서비스</h6>
					<a class="collapse-item" href="/admin/organ/selectOrganList">기관 등록 및 조회</a>
					<a class="collapse-item" href="/admin/organ/selectDepartmentList">부서 등록 및 조회</a>
				<h6 class="collapse-header" style="color: #318CDD; text-shadow: 0px 0px 0px #318CDD; font-size: 12px; font-weight: bold;">치과 서비스</h6>				
					<a class="collapse-item" href="/admin/organ/selectDentalHospitalList">기관 등록 및 조회</a>
				
<%-- 				<a class="collapse-item" href="/admin/organ/selectOrganList?userId=${userId}">기관 조회</a> --%>
<%-- <c:if test="${userInfo.userType eq 'SU'}"> --%>
<!--             	<a class="collapse-item" href="/admin/registOrganInfo">등록</a> -->
<%-- </c:if> --%>
<!--                 <a class="collapse-item" href="utilities-border.html">Borders</a> -->
<!--                 <a class="collapse-item" href="utilities-animation.html">Animations</a> -->
<!--                 <a class="collapse-item" href="utilities-other.html">Other</a> -->
            </div>
        </div>
    </li>
</c:if>

	 <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUser" aria-expanded="true" aria-controls="collapseUser">
            <i class="fas fa-fw fa-user"></i>
            <span>사용자</span>
        </a>
        <div id="collapseUser" class="collapse" aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
            <div class="bg-white py-2 collapse-inner rounded">
            <h6 class="collapse-header" style="color: #318CDD; text-shadow: 0px 0px 0px #318CDD; font-size: 12px; font-weight: bold;">일반사용자</h6>
                <a class="collapse-item" href="/admin/user/selectUserList?userType=ST">유치원 피측정자</a>
                <a class="collapse-item" href="/admin/user/selectUserList?userType=PA">치과 피측정자</a>
<!--                 <a class="collapse-item" href="/product/selectProductMain.do"">사용자 등록</a> -->
            <h6 class="collapse-header" style="color: #318CDD; text-shadow: 0px 0px 0px #318CDD; font-size: 12px; font-weight: bold;">관리자</h6>
             	<a class="collapse-item" href="/admin/user/selectAdminUserList">관리자 조회 및 등록</a>
                <a class="collapse-item" href="/admin/user/selectMeasurerUserList">측정자 조회 및 등록</a>
                <br/>
             	<a class="collapse-item" href="/admin/user/selectDentalHospitalAdminUserList">치과관계자 조회 및 등록</a>
                <c:if test="${userInfo.userType eq 'SU'}">
                <h6 class="collapse-header" style="color: #318CDD; text-shadow: 0px 0px 0px #318CDD; font-size: 12px; font-weight: bold;">등록</h6>
<!--                 <a class="collapse-item" href="/admin/user/registerUserListBatch"">관리자 등록</a> -->
<!--                 <a class="collapse-item" href="/admin/user/registerMeasuredUser"">개별 등록(피측정자)</a> -->
                <a class="collapse-item" href="/admin/user/registerUserListBatch">일괄 등록</a>
<!--                 	<a class="collapse-item" href="/admin/user/selectAdminUserList"">관리자 조회</a> -->
                </c:if>
<!--                 <a class="collapse-item" href="utilities-border.html">Borders</a> -->
<!--                 <a class="collapse-item" href="utilities-animation.html">Animations</a> -->
<!--                 <a class="collapse-item" href="utilities-other.html">Other</a> -->
            </div>
        </div>
    </li>

<%-- <c:if test="${userInfo.userType eq 'SU'}"> --%>
<!--     <li class="nav-item"> -->
<!--         <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseManager" aria-expanded="true" aria-controls="collapseManager"> -->
<!--             <i class="fas fa-fw fa-user"></i> -->
<!--             <span>관리자 관리</span> -->
<!--         </a> -->
<!--         <div id="collapseManager" class="collapse" aria-labelledby="headingUtilities" data-parent="#accordionSidebar"> -->
<!--             <div class="bg-white py-2 collapse-inner rounded"> -->
<!--                 <a class="collapse-item" href="/product/selectProductMain.do"">사용자 등록</a> -->
<%--                 <c:if test="${userInfo.userType eq 'SU'}"> --%>
<!--                 <a class="collapse-item" href="/admin/user/registerUserListBatch"">사용자 일괄 등록</a> -->
<!--                 	<a class="collapse-item" href="/admin/user/selectAdminUserList"">관리자 조회</a> -->
<%--                 </c:if> --%>
<!--                 <a class="collapse-item" href="utilities-border.html">Borders</a> -->
<!--                 <a class="collapse-item" href="utilities-animation.html">Animations</a> -->
<!--                 <a class="collapse-item" href="utilities-other.html">Other</a> -->
<!--             </div> -->
<!--         </div> -->
<!--     </li> -->
<%-- </c:if> --%>
	

<%-- <c:if test="${userInfo.userType eq 'SU'}">	 --%>
<c:if test="${userInfo.userType eq 'SU'}">	
	<li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseDiagnosisEdit" aria-expanded="true" aria-controls="collapseDiagnosisEdit">
            
            <i class="fas fa-fw fa-tooth"></i>
            <span>측정 관리</span>
        </a>
        <div id="collapseDiagnosisEdit" class="collapse" aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
            <div class="bg-white py-2 collapse-inner rounded">
            <h6 class="collapse-header" style="color: #318CDD; text-shadow: 0px 0px 0px #318CDD; font-size: 12px; font-weight: bold;">학교 서비스</h6>
				<a class="collapse-item" href="/admin/statistics/selectMeasureOrganList">측정 예정 기관 등록 및 조회</a>
			<h6 class="collapse-header" style="color: #318CDD; text-shadow: 0px 0px 0px #318CDD; font-size: 12px; font-weight: bold;">치과 서비스</h6>
				<a class="collapse-item" href="/admin/statistics/selectMeasureOrganList">측정 기관 등록 및 조회</a>
<!-- 				<a class="collapse-item" href="#">측정 결과 값 조회</a> -->
            </div>
        </div>
    </li>
</c:if>

<!-- 	<li class="nav-item"> -->
<!--         <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseAnalytics" aria-expanded="true" aria-controls="collapseAnalytics"> -->
<!--             <i class="fas fa-fw fa-signal"></i> -->
<!--             <span>분석</span> -->
<!--         </a> -->
<!--         <div id="collapseAnalytics" class="collapse" aria-labelledby="headingUtilities" data-parent="#accordionSidebar"> -->
<!--             <div class="bg-white py-2 collapse-inner rounded"> -->
<!-- <!--                 <a class="collapse-item" href="/admin/statistics/updateUserDiagnosis">진단 결과 수정</a> -->
<!--                 <a class="collapse-item" href="#">치아 상태 확인</a> -->
<!--             </div> -->
<!--         </div> -->
<!--     </li> -->
<%-- </c:if> --%>

<!-- Divider -->
<hr class="sidebar-divider">
<c:if test="${userInfo.userType eq 'SU'}">
    <!-- Nav Item - Utilities Collapse Menu -->
    <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities" aria-expanded="true" aria-controls="collapseUtilities">
            <i class="fas fa-fw fa-cog"></i>
            <span>설정</span>
        </a>
        <div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
            <div class="bg-white py-2 collapse-inner rounded">
                <h6 class="collapse-header menu-name">어플리케이션</h6>
               		<a class="collapse-item" href="/admin/setting/selectAppVerInfo">관리</a>
<!--                 <h6 class="collapse-header">ETC</h6> -->
<!--                 <a class="collapse-item" href="utilities-border.html">Borders</a> -->
<!--                 <a class="collapse-item" href="utilities-animation.html">Animations</a> -->
<!--                 <a class="collapse-item" href="utilities-other.html">Other</a> -->
            </div>
        </div>
    </li>


    <!-- Divider -->
    <hr class="sidebar-divider d-none d-md-block">

    <!-- Sidebar Toggler (Sidebar) -->
    <div class="text-center d-none d-md-inline">
        <button class="rounded-circle border-0" id="sidebarToggle"></button>
    </div>

<!-- Sidebar Message -->
<!--     <div class="sidebar-card d-none d-lg-flex"> -->
<!--         <img class="sidebar-card-illustration mb-2" src="imgs/undraw_rocket.svg" alt="..."> -->
<!--         <p class="text-center mb-2"><strong>SB Admin Pro</strong> is packed with premium features, components, and more!</p> -->
<!--         <a class="btn btn-success btn-sm" href="https://startbootstrap.com/theme/sb-admin-pro">Upgrade to Pro!</a> -->
<!--     </div> -->
</c:if>
</ul>
<!-- End of Sidebar -->