<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../inc/admin_top.jsp" %>

<h1 class="mt-4">캠퍼스맵</h1>
<div class="col-xl-6"  style="margin: 0 auto; border: 1px solid gray">
	<div>
		<img alt="campus map image" src="${pageContext.request.contextPath }/resources/images/campusmap.png"
			style="width: 650px">
		<!-- <div id="map" style="margin: 5px; width: 98%; height: 310px;"></div> -->
		<script type="text/javascript"
			src="<c:url value='/resources/js/map.js'/>"></script>
		<div style="text-align: center">
			<i class="fas fa-map-marker-alt"></i> 서울 강남구 테헤란로 124 4층(2호선 강남역1번 출구에서 276m)	
		</div><br>
		<div style="background-color:gray; text-align: center">
			<input type="button" value="지도보기(카카오맵)" id="print" onclick="window.open('https://map.kakao.com/?itemId=11567570')"/>
			<input type="button" value="캠퍼스맵 프린트" id="print" onclick="window.print()"/>
		</div>
	</div>
</div>


<%@ include file="../../inc/bottom.jsp" %>  