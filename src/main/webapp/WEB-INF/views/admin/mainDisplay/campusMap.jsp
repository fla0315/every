<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../inc/admin_top.jsp" %>

<div class="col-xl-6" style="width: 500px">
	<div class="card mb-4">
		<div class="card-header">
			<i class="fas fa-chart-bar me-1"></i> 캠퍼스맵
		</div>
		<div id="map" style="margin: 5px; width: 98%; height: 310px;"></div>
		<script type="text/javascript"
			src="<c:url value='/resources/js/map.js'/>"></script>
	</div>
</div>
<%@ include file="../../inc/bottom.jsp" %>  