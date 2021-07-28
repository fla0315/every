<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../inc/prof_top.jsp" %>
   <div class="container-fluid px-4">
       <h1 class="mt-4">에브리대학교</h1>
       <ol class="breadcrumb mb-4">
           <li class="breadcrumb-item active">EVERYHAKSA</li>
       </ol>
       <div class="row">
       		<div class="col-xl-4">
				<div class="card mb-4">
					<div class="card-header">
						<i class="fas fa-clipboard-list" style="font-size: 1.3em"></i> 시간표
					</div>
					<div style="height: 320px">
						<table class="table-bordered text-center" style="width: 100%">
							<colgroup>
								<col style="width: 40%" />
								<col style="width: 20%" />
								<col style="width: 20%" />
								<col style="width: 20%" />
							</colgroup>
							<thead>
								<tr>
									<th>개설과목번호</th>
									<th>개설과목명</th>
									<th>요일</th>
									<th>시간</th>
								</tr>
							</thead>
							<tbody>
							</tbody>
					</table>
					</div>
				</div>
			</div>
       		<div class="col-xl-4">
				<div class="card mb-4">
					<div class="card-header">
						<i class="fas fa-chalkboard-teacher" style="font-size: 1.3em"></i> 강의실 위치
					</div>
					<div style="height: 320px">
						<table class="table-bordered text-center" style="width: 100%">
							<colgroup>
								<col style="width: 40%" />
								<col style="width: 20%" />
								<col style="width: 20%" />
								<col style="width: 20%" />
							</colgroup>
							<thead>
								<tr>
									<th>개설과목번호</th>
									<th>개설과목명</th>
									<th>건물</th>
									<th>강의실</th>
								</tr>
							</thead>
							<tbody>
							</tbody>
					</table>
					</div>
				</div>
			</div>
	       <div class="col-xl-4">
				<div class="card mb-4">
					<div class="card-header">
						<i class="fas fa-map-marked-alt" style="font-size: 1.3em"></i> 캠퍼스맵
						<div style="float: right; font-size: 0.8em">
							<a href="<c:url value='/admin/mainDisplay/campusMap'/>">+ 더보기</a>
						</div>
					</div>
					<div style="height: 320px" class="text-center">
						<img alt="campus map image" src="${pageContext.request.contextPath }/resources/images/campusmap.png"
							style="margin-top:30px; width: 400px">
					</div>
					<%-- <div id="map" style="margin: 5px; width: 98%; height: 310px;"></div>
					<script type="text/javascript" src="<c:url value='/resources/js/map.js'/>" ></script> --%>
				</div>
			</div>
		</div>
       <div class="row">
           <div class="col-xl-6">
               <div class="card mb-4">
                   <div class="card-header">
                       <i class="far fa-calendar-alt"></i>
                       학사일정
                   </div>
                   <div class="card-body">
                   		<!-- Calendar -->
						<link href="<c:url value='/resources/calendar/core/main.css'/>" rel="stylesheet" />
						<script src="<c:url value='/resources/calendar/core/main.js'/>"></script>
				  		<script src="<c:url value='/resources/calendar/interaction/main.js'/>"></script>
						<link href="<c:url value='/resources/calendar/daygrid/main.css'/>" rel="stylesheet" />
				   		<script src="<c:url value='/resources/calendar/daygrid/main.js'/>"></script>
				        <script type="text/javascript" src="<c:url value='/resources/js/calendar.js'/>" ></script>
				        <div id="calendar" style="float: left; width: 60%; margin: 10px;"></div>
						<div id="schedule" style="float: right; width: 35%; margin-top: 20px">
							<i class="fas fa-table me-1"></i>
							<span style="font-weight: bold;">07.05 ~ 07.07</span><br>
							<span>&nbsp;학사일정1</span>
							<br><br>
							<i class="fas fa-table me-1"></i>
							<span style="font-weight: bold;">07.14 ~ 07.19</span><br>
							<span>&nbsp;학사일정2</span>
							<br><br>
							<i class="fas fa-table me-1"></i>
							<span style="font-weight: bold;">07.27 ~ 07.30</span><br>
							<span>&nbsp;학사일정3</span>
						</div>
					</div>                   
                   </div>
               </div>
	           <div class="col-xl-6">
	               <div class="card mb-4">
	                   <div class="card-header">
	                       <i class="fas fa-chart-bar me-1"></i>
	                       섹션
	                   </div>
	                   <div class="card-body"></div>
	               </div>
	           </div>
           </div>
       </div>
<%@ include file="../inc/bottom.jsp" %> 