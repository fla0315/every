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
        <link rel="shortcut icon" type="image⁄x-icon" href="${pageContext.request.contextPath}/resources/images/graduation-hat.png">
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
            <div style="color: white"><%=no %>, 환영합니다.</div>
            <!-- Navbar-->
            <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="#!">회원정보수정</a></li>
                        <li><hr class="dropdown-divider" /></li>
                        <li><a class="dropdown-item" href="/every/logout">로그아웃</a></li>
                    </ul>
                </li>
            </ul>
        </nav>
        <div id="layoutSidenav">
            <div id="layoutSidenav_nav">
           
            </div>
<div id="layoutSidenav_content">
	<main>
	