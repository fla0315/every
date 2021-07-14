<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../inc/admin_top.jsp" %>

	<div class="col-xl-6" style="width: 750px;">
		<div class="card mb-4">
			<div class="card-header">
				<i class="fas fa-chart-area me-1"></i> 학사일정
			</div>
			<script type="text/javascript"
				src="<c:url value='/resources/js/calendar.js'/>"></script>
			<div id="calendar" style="width: 100%"></div>
		</div>
	</div>

<%@ include file="../../inc/bottom.jsp" %>  