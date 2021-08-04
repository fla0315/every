<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../inc/student_top.jsp" %>

<div class="container-fluid px-4">
	<br>
	<div class="row">
	
	
	
		<div class="col-xl-6" style="width: 750px;">
			<div class="card mb-4">
				<div class="card-header">
					<i class="fas fa-table me-1" style="font-size: 1.3em"></i> 시간표
					<div style="float: right; font-size: 0.8em">
						<a style="text-decoration: none; font-weight: bold;" href="<c:url value='/timetable/timetable'/>">더보기</a>
					</div>
				</div>
				<div style="width: 100%; height: 400px;">
				<iframe src="/every/timetable/timetableMain" width="100%" height="100%"></iframe>
				</div>
			</div>
		</div>
		
		
		
		<div class="col-xl-6" style="width: 750px;">
			<div class="card mb-4">
				<div class="card-header">
					<i class="fas fa-table me-1" style="font-size: 1.3em"></i> 공지사항
					<div style="float: right; font-size: 0.8em">
						<a href="<c:url value='#'/>">+ 더보기</a>
					</div>
				</div>
				<div>
					
				</div>
			</div>
		</div>
		
		
		
		<div class="col-xl-6" style="width: 750px;">
			<div class="card mb-4">
				<div class="card-header">
					<i class="fas fa-table me-1" style="font-size: 1.3em"></i> 학사일정
					<div style="float: right; font-size: 0.8em">
						<a href="<c:url value='#'/>">+ 더보기</a>
					</div>
				</div>
				<div>
					
				</div>
			</div>
		</div>
		<div class="col-xl-6" style="width: 750px;">
			<div class="card mb-4">
				<div class="card-header">
					<i class="fas fa-table me-1" style="font-size: 1.3em"></i> 수강내역
					<div style="float: right; font-size: 0.8em">
						<a href="<c:url value='#'/>">+ 더보기</a>
					</div>
				</div>
				<div>
					<div style="width: 100%; height: 400px;">
				<iframe src="/every/registration/myregistration" width="100%" height="100%"></iframe>
				</div>
				</div>
			</div>
		</div>
	
		
	</div>

</div>
<%@ include file="../inc/bottom.jsp" %>                