<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%
String Id = (String)session.getAttribute("user_id");
String no = (String)session.getAttribute("no");
String name = (String)session.getAttribute("name");
boolean t_login = false;

if (Id!= null&&!Id.isEmpty()) { //세션에 값이 있으면
	t_login=true; //로그인이 된 경우
}
%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>EVERYHAKSA</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
        <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/styles.css'/>"/>
        <link href="<c:url value='/resources/calendar/core/main.css'/>" rel="stylesheet" />
        <link href="<c:url value='/resources/calendar/daygrid/main.css'/>" rel="stylesheet" />
        <script src="<c:url value='/resources/calendar/core/main.js'/>"></script>
        <script src="<c:url value='/resources/calendar/interaction/main.js'/>"></script>
        <script src="<c:url value='/resources/calendar/daygrid/main.js'/>"></script>
        <script src="<c:url value='/resources/js/jquery-3.6.0.min.js'/>"></script>
        <script src="<c:url value='/resources/js/id-validate.js'/>"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
		<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
		<!-- <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=46a41c1e7c20d77119a3710f087caae5&libraries=services"></script> -->
		
<style type="text/css">
	a {
		 text-decoration:none; 
		 color: black;
	}
	
</style>

</head>
    <body class="sb-nav-fixed">
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <!-- Navbar Brand-->
            <a class="navbar-brand ps-3" href="<c:url value='/'/>">Every Haksa</a>
            <!-- Sidebar Toggle-->
            <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>
            <!-- Navbar Search-->
            <form class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
                <div class="input-group">
                    <input class="form-control" type="text" placeholder="Search for..." aria-label="Search for..." aria-describedby="btnNavbarSearch" />
                    <button class="btn btn-primary" id="btnNavbarSearch" type="button"><i class="fas fa-search"></i></button>
                </div>
            </form>
            <a id="chitchat" href="<c:url value='/chitchat/chitchatMain'/>"><i class="fas fa-envelope"></i></a>
            <div style="color: white"><%=name %>, 환영합니다.</div>
            <!-- Navbar-->
            <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="#!">회원정보수정</a></li>
                        <li><hr class="dropdown-divider" /></li>
                        <li><a class="dropdown-item" href="#!">로그아웃</a></li>
                    </ul>
                </li>
            </ul>
        </nav>
        <div id="layoutSidenav">
            <div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                    <div class="sb-sidenav-menu">
                        <div class="nav" id="accordion">
                        
                        	<!-- 회원관리 -->
                            <div class="sb-sidenav-menu-heading">회원</div>
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseStudent" aria-expanded="false" aria-controls="collapseLayouts">
                                <div class="sb-nav-link-icon"><i class="fas fa-user-alt"></i></div>
                                학생
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseStudent" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                	<nav class="sb-sidenav-menu-nested nav accordion" id="sidenavAccordionPages">
                                    <a class="nav-link" href="<c:url value='/admin/student/studentList'/>">학생정보관리</a>
                                    <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseLeaveReturn" aria-expanded="false" aria-controls="pagesCollapseError">
                                        휴학/복학관리
                                    	<div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                                    </a>
                                    <div class="collapse" id="collapseLeaveReturn" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordionPages">
                                        <nav class="sb-sidenav-menu-nested nav">
                                            <a class="nav-link" href="<c:url value='/admin/student/leaveManage'/>">휴학신청관리</a>
                                            <a class="nav-link" href="<c:url value='/admin/student/returnManage'/>">복학신청관리</a>
                                        </nav>
                                    </div>
                                    <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseTuition" aria-expanded="false" aria-controls="pagesCollapseError">
                                        등록금관리
                                    	<div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                                    </a>
                                    <div class="collapse" id="collapseTuition" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordionPages">
                                        <nav class="sb-sidenav-menu-nested nav">
                                            <a class="nav-link" href="<c:url value='/admin/student/tuitionManage'/>">등록금 납부조회</a>
                                            <a class="nav-link" href="<c:url value='/admin/student/tuitionStatistic'/>">등록금 통계</a>
                                        </nav>
                                    </div>
                                    <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseScholarship" aria-expanded="false" aria-controls="pagesCollapseAuth">
                                       	 장학금관리
                                       	 <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                                   	 </a>
                                    <div class="collapse" id="collapseScholarship" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordionPages">
                                        <nav class="sb-sidenav-menu-nested nav">
                                            <a class="nav-link" href="<c:url value='/admin/student/scholarshipApproved'/>">장학금 대상조회</a>
                                            <a class="nav-link" href="<c:url value='/admin/student/scholarshipApplyList'/>">장학금 신청조회</a>
                                            <a class="nav-link" href="<c:url value='/admin/student/scholarshipStatistic'/>">장학금 통계</a>
                                        </nav>
                                    </div>
                                </nav>
                            </div>
                             <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseProf" aria-expanded="false" aria-controls="collapseLayouts">
                                <div class="sb-nav-link-icon"><i class="fas fa-user-alt"></i></div>
                                교수
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseProf" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="<c:url value='/admin/professor/professorList'/>">교수정보관리</a>
                                </nav>
                            </div>
                             <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseAdmin" aria-expanded="false" aria-controls="collapseLayouts">
                                <div class="sb-nav-link-icon"><i class="fas fa-user-alt"></i></div>
                                임직원
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseAdmin" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="<c:url value='/admin/employee/employeeList'/>">임직원정보관리</a>
                                </nav>
                            </div>
                            
                            <!-- 강의 관리 -->
                            <div class="sb-sidenav-menu-heading">강의</div>
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseLecture" aria-expanded="false" aria-controls="collapseLayouts">
                                <div class="sb-nav-link-icon"><i class="fas fa-chalkboard-teacher"></i></div>
                                강의 관리
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseLecture" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="<c:url value='/admin/lecture/subjectList'/>">과목관리</a>
                                    <a class="nav-link" href="<c:url value='/admin/lecture/lectureList'/>">강의개설관리</a>
                                    <a class="nav-link" href="<c:url value='/admin/lecture/classroomList'/>">강의실관리</a>
                                </nav>
                            </div>
                            
                            
                            <!-- 게시판 관리 -->
                            <div class="sb-sidenav-menu-heading">게시판</div>
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseMain" aria-expanded="false" aria-controls="collapseLayouts">
                                <div class="sb-nav-link-icon"><i class="fas fa-tv"></i></div>
                                메인화면
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseMain" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="<c:url value='/admin/mainDisplay/notice'/>">공지사항</a>
                                    <a class="nav-link" href="<c:url value='/admin/mainDisplay/lunchMenu'/>">식단표</a>
                                    <a class="nav-link" href="<c:url value='/admin/mainDisplay/campusMap'/>">캠퍼스맵</a>
                                    <a class="nav-link" href="<c:url value='/admin/mainDisplay/calendar'/>">학사일정</a>
                                    <a class="nav-link" href="<c:url value='/admin/mainDisplay/question'/>">Q&amp;A</a>
                                </nav>
                            </div>
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseBoard" aria-expanded="false" aria-controls="collapseLayouts">
                                <div class="sb-nav-link-icon"><i class="fas fa-clipboard"></i></div>
                                자유게시판
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseBoard" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="<c:url value='/admin/board/freeBoard'/>">게시글 관리</a>
                                    <a class="nav-link" href="<c:url value='/admin/board/freeBoardReport'/>">게시글 신고현황</a>
                                </nav>
                            </div>
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseSell" aria-expanded="false" aria-controls="collapsePages">
                                <div class="sb-nav-link-icon"><i class="fas fa-clipboard"></i></div>
                                거래게시판
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseSell" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="<c:url value='/admin/board/marketBoard'/>">거래글 관리</a>
                                    <a class="nav-link" href="<c:url value='/admin/board/marketBoardReport'/>">거래글 신고현황</a>
                                </nav>
                            </div>
                            
                            <!-- 시스템통계 -->
                            <div class="sb-sidenav-menu-heading">통계</div>
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseMember" aria-expanded="false" aria-controls="collapsePages">
                                <div class="sb-nav-link-icon"><i class="fas fa-chart-bar"></i></div>
                                회원
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseMember" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="<c:url value='/admin/chart/studentChart'/>">학생 성적 통계</a>
                                    <a class="nav-link" href="<c:url value='/admin/chart/professorChart'/>">교수 강의평가 통계</a>
                                </nav>
                            </div>
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseMajor" aria-expanded="false" aria-controls="collapsePages">
                                <div class="sb-nav-link-icon"><i class="fas fa-chart-bar"></i></div>
                                학과
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseMajor" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="<c:url value='/admin/chart/majorStuChart'/>">학과별 학생 통계</a>
                                    <a class="nav-link" href="<c:url value='/admin/chart/majorProfChart'/>">학과별 교수 통계</a>
                                </nav>
                            </div>
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseClass" aria-expanded="false" aria-controls="collapsePages">
                                <div class="sb-nav-link-icon"><i class="fas fa-chart-bar"></i></div>
                                강의
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseClass" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="<c:url value='/admin/chart/classChart'/>">강의별 학생 통계</a>
                                </nav>
                            </div>
                        </div>
                    </div>
                    <div class="sb-sidenav-footer">
                        <div class="small">Logged in as:</div>
                        Start Bootstrap
                    </div>
                </nav>
            </div>
<div id="layoutSidenav_content">
	<main>
	