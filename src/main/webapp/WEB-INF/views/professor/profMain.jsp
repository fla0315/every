<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../inc/prof_top.jsp" %>

<style type="text/css">
	.notice{
		color:black;
	}
	
	.notice:hover{
		color:gray;
	}
</style>
   <div class="container-fluid px-4">
       <h1 class="mt-4"></h1>
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
								<col style="width: 35%" />
								<col style="width: 35%" />
								<col style="width: 30%" />
							</colgroup>
							<thead>
								<tr>
									<th>개설과목번호</th>
									<th>개설과목명</th>
									<th>시간</th>
								</tr>
							</thead>
							<tbody>
								<c:if test="${empty oList}">
									<tr>
									<td colspan="4">개설된 강의가 없습니다.</td>
									</tr>
								</c:if>
								<c:if test="${!empty oList}">
									<c:forEach var="map" items="${oList }">
										<tr>
										<td>${map['OPEN_SUB_CODE'] }</td>
										<td>${map['SUBJ_NAME'] }</td>
										<td>${map['TIMETABLE_NAME'] }</td>
										</tr>
									</c:forEach>
								</c:if>
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
								<col style="width: 25%" />
								<col style="width: 35%" />
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
								<c:if test="${empty oList}">
									<tr>
									<td colspan="4">개설된 강의가 없습니다.</td>
									</tr>
								</c:if>
								<c:if test="${!empty oList}">
									<c:forEach var="map" items="${oList }">
										<tr>
										<td>${map['OPEN_SUB_CODE'] }</td>
										<td>${map['SUBJ_NAME'] }</td>
										<td>${map['BUILDING_NAME'] }</td>
										<td>${map['CLASSROOM_NAME'] }</td>
										</tr>
									</c:forEach>
								</c:if>
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
							<a href="<c:url value='/admin/campusInfo/campusMap'/>">+ 더보기</a>
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
               <div class="card mb-4" style="height:520px">
                   <div class="card-header">
                       <i class="far fa-calendar-alt"></i>
                       학사일정
                   </div>
                   <div class="card-body">
                   		<iframe src="/every/timetable/calendarMain" width="100%" height="100%"></iframe>
					</div>                   
                   </div>
               </div>
	           <div class="col-xl-6">
	               <div class="card mb-4" style="height:520px">
	                   <div class="card-header">
	                       <i class="fas fa-exclamation-circle"></i>
	                       공지사항
	                   </div>
	                   <div class="card-body">
	                   	<table class="table-bordered text-center" style="width: 100%">
							<colgroup>
								<col style="width: 20%" />
								<col style="width: 60%" />
								<col style="width: 20%" />
							</colgroup>
							<thead>
								<tr>
									<th>개설교과목번호</th>
									<th>제목</th>
									<th>등록일</th>
								</tr>
							</thead>
							<tbody>
								<c:if test="${empty nList }">
									<tr>
										<td colspan="3">데이터가 없습니다.</td>
									</tr>
								</c:if>
								<c:if test="${!empty nList }">
									<c:forEach var="map" items="${nList }">
										<tr>
											<td>${map['OPEN_SUB_CODE'] }</td>
											<td><a class="notice" href="<c:url value='/professor/notice/noticeDetail?postNo=${map["POST_NO"] }&openSubCode=${map["OPEN_SUB_CODE"] }'/>">${map['TITLE'] }</a></td>
											<td><fmt:formatDate value="${map['REG_DATE'] }" pattern="yyyy-MM-dd"/></td>
										</tr>
									</c:forEach>
								</c:if>
							</tbody>
					</table>
	                   </div>
	               </div>
	           </div>
           </div>
       </div>
<%@ include file="../inc/bottom.jsp" %> 