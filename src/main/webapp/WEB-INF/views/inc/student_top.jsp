<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/styles.css"/>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
        <script type="text/javascript" src="<c:url value='/resources/js/jquery-3.6.0.min.js'/>"></script>
        
    </head>
    
    <body class="sb-nav-fixed">
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <!-- Navbar Brand-->
            <a class="navbar-brand ps-3" href="<c:url value='/student/studentMain'/>">학사관리시스템</a>
            <!-- Sidebar Toggle-->
            <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>
            <!-- Navbar Search-->
            <form class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
                <div class="input-group">
                <div style="color: white">${sessionScope.user_id }, 환영합니다.</div>
                    <!-- <input class="form-control" type="text" placeholder="Search for..." aria-label="Search for..." aria-describedby="btnNavbarSearch" />
                    <button class="btn btn-primary" id="btnNavbarSearch" type="button"><i class="fas fa-search"></i></button> -->
                </div>
            </form>
            <a id="chitchat" href="<c:url value='/chitchat/chitchatMain'/>"><i class="fas fa-envelope"></i></a>
            <!-- Navbar-->
            <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="#!">Settings</a></li>
                        <li><a class="dropdown-item" href="#!">Activity Log</a></li>
                        <li><hr class="dropdown-divider" /></li>
                        <li><a class="dropdown-item" href="#!">Logout</a></li>
                    </ul>
                </li>
            </ul>
        </nav>
        
        
        
        
        <!-- 사이드바 시작 -->
        <div id="layoutSidenav">
            <div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                    <div class="sb-sidenav-menu">
                        <div class="nav">
                        
                        <!-- 마이페이지 -->
                            <div class="sb-sidenav-menu-heading">마이페이지</div>
                            
	                             <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseMyPages" aria-expanded="false" aria-controls="collapsePages">
	                                <div class="sb-nav-link-icon"><i class="fas fa-book-open"></i></div>
	                                마이페이지
	                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
	                             </a>
                            
                            
                           	<div class="collapse" id="collapseMyPages" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
	                              <nav class="sb-sidenav-menu-nested nav">
	                                	  <a class="nav-link" href="<c:url value='/student/studentEdit'/>">학생정보수정</a>
	                              </nav>
                            
                                	 <nav class="sb-sidenav-menu-nested nav accordion" id="sidenavAccordionPages">
                                    	<a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseScholarship" aria-expanded="false" aria-controls="pagesCollapseAuth">
                                       	 장학금 <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                                   	 	</a>
                                    <div class="collapse" id="collapseScholarship" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordionPages">
                                        <nav class="sb-sidenav-menu-nested nav">
                                            <a class="nav-link" href="<c:url value='/scholarship/scholarshipWrite'/>">장학금 신청</a>
                                            <a class="nav-link" href="<c:url value='/scholarship/scholarshipList'/>">장학금 조회</a>
                                        </nav>
                                    </div>
                                    
                                    
                                    <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseTuition" aria-expanded="false" aria-controls="pagesCollapseError">
                                        등록금
                                    <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                                    </a>
                                    
                                    <div class="collapse" id="collapseTuition" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordionPages">
                                        <nav class="sb-sidenav-menu-nested nav">
                                            <a class="nav-link" href="<c:url value='/tuition/tuitionList'/>">등록금 조회</a>
                                        </nav>
                                    </div>
                                </nav>
                            
                            </div>
                          <!-- 마이페이지 끝 -->  
                            
                         
                           
                           
                          <!-- 수강신청 시작 -->
                          <div class="sb-sidenav-menu-heading">수강관리</div>
                              <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseSugang" aria-expanded="false" aria-controls="collapsePages">
                                <div class="sb-nav-link-icon"><i class="fas fa-book-open"></i></div>
                                수강신청
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            
                            
                            <div class="collapse" id="collapseSugang" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                            
                                <%-- <nav class="sb-sidenav-menu-nested nav accordion" id="sidenavAccordionPages">
                                
                                    <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseSub" aria-expanded="false" aria-controls="pagesCollapseAuth">
                                        수업정보
                                        <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                                    </a>
                                    
                                        <nav class="sb-sidenav-menu-nested nav">
                                            <a class="nav-link" href="<c:url value='/registration/open_registration'/>">개설과목조회</a>
                                            <a class="nav-link" href="<c:url value='/timetable/timetable'/>">강의계획서조회</a>
                                        </nav>
                                    <!-- <div class="collapse" id="collapseSub" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordionPages">
                                    </div>
                                     -->
                                </nav> --%>
                              
	                              <nav class="sb-sidenav-menu-nested nav">
                                 	 <a class="nav-link" href="<c:url value='/registration/open_registration'/>">개설과목조회</a>
	                               </nav>
                            
	                              <nav class="sb-sidenav-menu-nested nav">
                                 	  <a class="nav-link" href="<c:url value='/registration/registration_cart'/>">장바구니</a>
	                               </nav>
	                              <nav class="sb-sidenav-menu-nested nav">
                                 	  <a class="nav-link" href="<c:url value='/registration/request_registration'/>">수강신청</a>
	                               </nav>
	                               
	                              <nav class="sb-sidenav-menu-nested nav">
                                 	  <a class="nav-link" href="<c:url value='/registration/myregistration'/>">수강신청내역조회</a>
	                               </nav>
	                              <nav class="sb-sidenav-menu-nested nav">
                                 	  <a class="nav-link" href="<c:url value='/registration/cancle_registration'/>">수강취소</a>
	                               </nav>
	                              <nav class="sb-sidenav-menu-nested nav">
                                 	  <a class="nav-link" href="<c:url value='/subj_eval/subj_eval'/>">성적조회</a>
	                               </nav>
                           
                            </div>
                           <!-- 수강신청끝 -->
                            
                          
                          
                          <!-- 나의 강좌 -->
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseMySub" aria-expanded="false" aria-controls="collapsePages">
                                <div class="sb-nav-link-icon"><i class="fas fa-book-open"></i></div>
                                나의 강좌
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            
                             
                            <div class="collapse" id="collapseMySub" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav accordion" id="sidenavAccordionPages">
                                    <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseNotice" aria-expanded="false" aria-controls="pagesCollapseAuth">
                                        공지사항
                                        <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                                    </a>
                                    <div class="collapse" id="collapseNotice" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordionPages">
                                        <nav class="sb-sidenav-menu-nested nav">
                                            <a class="nav-link" href="#">공지사항조회</a>
                                        </nav>
                                    </div>
                                </nav>
                                   <nav class="sb-sidenav-menu-nested nav accordion" id="sidenavAccordionPages">
                                    <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseHomework" aria-expanded="false" aria-controls="pagesCollapseAuth">
                                        과제게시판
                                        <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                                    </a>
                                    <div class="collapse" id="collapseHomework" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordionPages">
                                        <nav class="sb-sidenav-menu-nested nav">
                                            <a class="nav-link" href="<c:url value='/student/assignment/StudentAssignment'/>">나의 과제관리</a>
                                        </nav>
                                    </div>
                                </nav>
	                              <nav class="sb-sidenav-menu-nested nav">
                                 	  <a class="nav-link" href="#">자유게시판</a>
	                               </nav>
	                              <nav class="sb-sidenav-menu-nested nav">
                                 	  <a class="nav-link" href="<c:url value='/timetable/timetable'/>"">시간표조회</a>
	                               </nav>
                            </div>
                          <!-- 나의 강좌 끝 -->
                          <!-- 수강관리 끝  -->
                          
                          
                          
                          
                          <!-- 커뮤니티 시작 -->
                          <div class="sb-sidenav-menu-heading">커뮤니티</div>
                          	
                          	<a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseMyboard" aria-expanded="false" aria-controls="collapsePages">
	                                <div class="sb-nav-link-icon"><i class="fas fa-book-open"></i></div>
	                                커뮤니티
	                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
	                             </a>
                          	
                          	 <div class="collapse" id="collapseMyboard" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordionPages">
                                        <nav class="sb-sidenav-menu-nested nav">
                                            <a class="nav-link" href="#">자유게시판</a>
                                            <a class="nav-link" href="#">거래게시판</a>
                                            <a class="nav-link" href="#">익명게시판</a>
                                        </nav>
                           	</div>
	                      
                            <!-- 커뮤니티 -->
                            
                   
                            <div class="sb-sidenav-menu-heading">쪽지함</div>
	                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseMypost" aria-expanded="false" aria-controls="collapsePages">
		                                <div class="sb-nav-link-icon"><i class="fas fa-book-open"></i></div>
		                                쪽지함
		                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
		                        </a>
                            
                            	
                          	 <div class="collapse" id="collapseMypost" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordionPages">
                                        <nav class="sb-sidenav-menu-nested nav">
                                            <a class="nav-link" href="#">수신쪽지함</a>
                                            <a class="nav-link" href="#">발신쪽지함</a>
                                            <a class="nav-link" href="#">쪽지보관함</a>
                                        </nav>
                           	</div>
                           	
                           
                        </div>
                    </div>
                    <div class="sb-sidenav-footer">
                        <div class="small">Logged in as:</div>
                        파이팅입니다
                    </div>
                </nav>
            </div>
            
            
            
<div id="layoutSidenav_content">
	<main>
	