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
         <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script type="text/javascript" src="<c:url value='/resources/js/scripts.js'/>"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script type="text/javascript" src="<c:url value='/resources/js/chart-area-demo.js'/>"></script>
        <script type="text/javascript" src="<c:url value='/resources/js/chart-bar-demo.js'/>"></script>
        <script type="text/javascript" src="<c:url value='/resources/js/chart-pie-demo.js'/>"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
        <script type="text/javascript" src="<c:url value='/resources/js/datatables-simple-demo.js'/>"></script>
		<!-- <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=46a41c1e7c20d77119a3710f087caae5&libraries=services"></script> -->
		
<style type="text/css">
	a {
		 text-decoration:none; 
		 color: black;
	}
	
</style>

</head>
    <body class="sb-nav-fixed">
        
        <div id="layoutSidenav">
            <div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                    <div class="sb-sidenav-menu">
                        <div class="nav" id="accordion">
                        
                        	<!-- 회원관리 -->
                            <div class="sb-sidenav-menu-heading">회원관리</div>
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseStudent" aria-expanded="false" aria-controls="collapseLayouts">
                                <div class="sb-nav-link-icon"><i class="fas fa-user-alt"></i></div>
                                학생
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseStudent" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="<c:url value='/admin/student/studentList'/>">학생정보관리</a>
                                    <a class="nav-link" href="#">휴학/복학</a>
                                    <a class="nav-link" href="#">등록금</a>
                                    <a class="nav-link" href="#">장학금</a>
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
                                    <a class="nav-link" href="#">강의등록</a>
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
                            
                            <!-- 게시판 관리 -->
                            <div class="sb-sidenav-menu-heading">게시판 관리</div>
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseMain" aria-expanded="false" aria-controls="collapseLayouts">
                                <!-- 넌 아이콘 -->
                                <div class="sb-nav-link-icon"><i class="fas fa-home"></i></div>
                                메인화면
                                 <!-- 넌 옆끝에 표기되는 화살표 -->
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
                            <div class="sb-sidenav-menu-heading">시스템통계</div>
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
                         <div class="nav2" id="accordion2">
                        
                        	<!-- 회원관리 -->
                            <div class="sb-sidenav-menu-heading">회원관리</div>
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseStudent" aria-expanded="false" aria-controls="collapseLayouts">
                                <div class="sb-nav-link-icon"><i class="fas fa-user-alt"></i></div>
                                학생
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseStudent" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="<c:url value='/admin/student/studentList'/>">학생정보관리</a>
                                    <a class="nav-link" href="#">휴학/복학</a>
                                    <a class="nav-link" href="#">등록금</a>
                                    <a class="nav-link" href="#">장학금</a>
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
                                    <a class="nav-link" href="#">강의등록</a>
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
                            
                            <!-- 게시판 관리 -->
                            <div class="sb-sidenav-menu-heading">게시판 관리</div>
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseMain" aria-expanded="false" aria-controls="collapseLayouts">
                                <!-- 넌 아이콘 -->
                                <div class="sb-nav-link-icon"><i class="fas fa-home"></i></div>
                                메인화면
                                 <!-- 넌 옆끝에 표기되는 화살표 -->
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
                            <div class="sb-sidenav-menu-heading">시스템통계</div>
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
                  
                </nav>
            </div>

        </div>
          </body>
</html>
	