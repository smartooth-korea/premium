<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="/css/common/left.css">
<!-- Sidebar -->
<ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">
    <a class="sidebar-brand d-flex align-items-center justify-content-center" href="/admin/main.do"/>
        <div>
            <img src="/imgs/common/logo_img.png" style="width: 50px;">
        </div>
        <div class="sidebar-brand-text mx-3" style="padding-top: 5px;">Smartooth</div>
    </a>
<!-- 대시보드 -->
    <hr class="sidebar-divider my-0"/>
    <li class="nav-item active">
        <c:if test="${userInfo.userType eq 'SU'}">
        <a class="nav-link" href='/admin/dashboard.do'>
            <i class="fas fa-fw fa-tachometer-alt"></i>
            <span>Dashboard</span></a>
        </c:if>
    </li>

    <div class="sidebar-heading"></div>
<!-- 유치원서비스 -->
    <c:if test="${userInfo.userType eq 'SU' || userInfo.userType eq 'MA'}">
    <hr class="sidebar-divider">
    <div class="sidebar-heading">
        <h6>유치원 서비스</h6>
    </div>
    <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseDiagnosis"
            aria-expanded="true" aria-controls="collapseDiagnosis">
            <i class="fas fa-fw fa-sitemap"></i>
            <span>등록</span>
        </a>
        <div id="collapseDiagnosis" class="collapse" aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
            <div class="bg-white py-2 collapse-inner rounded">
            <h6 class="collapse-header">
                <a href="/admin/organ/selectOrganList" class="menu-link">유치원 기관 등록 / 조회</a>
            </h6>
            <h6 class="collapse-header">
                <a href="/admin/organ/selectDepartmentList" class="menu-link">유치원 반 등록 / 조회</a>
            </h6>
            <h6 class="collapse-header">
                <a href="/admin/user/selectMeasurerUserList" class="menu-link">측정자 등록 / 조회</a>
            </h6>
            <h6 class="collapse-header">
                <a href="/admin/user/selectUserList" class="menu-link">피측정자 조회</a>
            </h6>
            <h6 class="collapse-header">
                <a href="/admin/user/registerUserListBatch" class="menu-link">피측정자 일괄등록</a>
            </h6>            
            </div>
        </div>
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseResultSheets"
            aria-expanded="true" aria-controls="collapseDiagnosis">
            <i class="fas fa-fw fa-tooth"></i>
            <span>조회</span>
        </a>
        <div id="collapseResultSheets" class="collapse" aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
            <div class="bg-white py-2 collapse-inner rounded">
                <h6 class="collapse-header">
                    <a href="/admin/statistics/selectUserMeasureList" class="menu-link">결과지 조회</a>
                </h6>
            </div>
        </div>
    </li>
    </c:if>

<!-- 치과병원서비스 -->
    <c:if test="${userInfo.userType eq 'SU' || userInfo.userType eq 'DE'}">
    <hr class="sidebar-divider">
    <div class="sidebar-heading">
        <h6>치과병원 서비스</h6>
    </div>
    <li class="nav-item">
        <c:if test="${userInfo.userType eq 'SU'}">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseDiagnosis2" aria-expanded="true" aria-controls="collapseDiagnosis">
            <i class="fas fa-fw fa-sitemap"></i>
            <span>등록</span>
        </a>
        <div id="collapseDiagnosis2" class="collapse" aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
            <div class="bg-white py-2 collapse-inner rounded">
                <h6 class="collapse-header">
                    <a href="/admin/organ/selectDentalHospitalList" class="menu-link">치과 등록 / 조회</a>
                    
                </h6>
            </div>
        </div>
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseDentistUser" aria-expanded="true" aria-controls="collapseDentistUser">
            <i class="fas fa-fw fa-user"></i>
            <span>사용자</span>
        </a>
        <div id="collapseDentistUser" class="collapse" aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
            <div class="bg-white py-2 collapse-inner rounded">
            	<h6 class="collapse-header">
             		<a href="/admin/user/selectDentalHospitalAdminUserList" class="menu-link">치과 관계자 조회 및 등록</a>
             	</h6>
			</div>
      	</div>
        </c:if>
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseResultSheets2"
            aria-expanded="true" aria-controls="collapseDiagnosis">
            <i class="fas fa-fw fa-tooth"></i>
            <span>조회</span>
        </a>
        <div id="collapseResultSheets2" class="collapse" aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
            <div class="bg-white py-2 collapse-inner rounded">
<%--                 <c:if test="${userInfo.userType eq 'SU'}"> --%>
<!--                 <h6 class="collapse-header"> -->
<!--                     <a href="/admin/statistics/selectUserMeasureList?userType=PA" class="menu-link">결과지 조회</a> -->
<!--                 </h6> -->
<%--                 </c:if> --%>
                <h6 class="collapse-header">
                    <a href="/admin/statistics/selectDentUserMeasureList" class="menu-link">결과 조회</a>
                </h6>            
            </div>  
        </div>      
    </li>
    </c:if>

    <c:if test="${userInfo.userType eq 'DL' || userInfo.userType eq 'SU'}">
    <hr class="sidebar-divider">
    <div class="sidebar-heading">
        <h6>딜러</h6>
    </div>    
    <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseDealer"
            aria-expanded="true" aria-controls="collapseDiagnosis">
            <i class="fas fa-fw fa-sitemap"></i>
            <span>기관</span>
        </a>
        <div id="collapseDealer" class="collapse" aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
            <div class="bg-white py-2 collapse-inner rounded">
                <h6 class="collapse-header">
                    <a href="/admin/organ/selectDealerRequestList" class="menu-link">담당 기관 추가 요청 / 조회</a>
                </h6>
            </div>
        </div> 
    </li>
<!-- 딜러 목록 -->
    <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUser" aria-expanded="true" aria-controls="collapseUser">
            <i class="fas fa-fw fa-user"></i>
            <span>사용자</span>
        </a>
        <div id="collapseUser" class="collapse" aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
            <div class="bg-white py-2 collapse-inner rounded">
                <h6 class="collapse-header">
                    <a href="/admin/user/selectDealerList" class="menu-link">딜러 목록</a>
                </h6>
        	</div>
       	</div>
    </li> 
    </c:if>

<!-- 버그리포트 -->
	<c:if test="${userInfo.userType eq 'SU' or 'BUG'}">
	<hr class="sidebar-divider">
	<div class="sidebar-heading">
        <h6>게시판</h6>
    </div>
    	<li class="nav-item">
            <a class="nav-link collapsed" href="/admin/board/selectNoticeList">
                <i class="fa fa-exclamation-triangle notice" aria-hidden="true"></i>
                <span>공지사항</span>
            </a>
    	</li>        
		<li class="nav-item">
            <a class="nav-link collapsed" href="/admin/board/selectBugReportList">
                <i class="fas fa-fw fa-bug"></i>
                <span>버그리포트</span>
            </a>
    	</li>
    </c:if>
	
	
<!-- 애플리케이션 버전 관리 -->
    <c:if test="${userInfo.userType eq 'SU'}">
    <hr class="sidebar-divider">
    <div class="sidebar-heading">
        <h6>설정</h6>
    </div>        
        <li class="nav-item">
            <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities" aria-expanded="true" aria-controls="collapseUtilities">
                <i class="fas fa-fw fa-cog"></i>
                <span>애플리케이션</span>
            </a>
            <div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
                <div class="bg-white py-2 collapse-inner rounded">
                    <h6 class="collapse-header">
                        <a href="/admin/setting/selectAppVerInfo" class="menu-link">버전 관리</a>
                    </h6>                   
                </div>
            </div>
        </li>
<!-- sidebar 축소 -->    
        <div class="text-center d-none d-md-inline">
            <button class="rounded-circle border-0" id="sidebarToggle"></button>
        </div>
    </c:if>    

    <hr class="sidebar-divider">
</ul>