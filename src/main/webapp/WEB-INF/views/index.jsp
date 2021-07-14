<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="inc/admin_top.jsp" %>

<div class="container-fluid px-4">
	<br>
	<div class="row">
		<div class="col-xl-6" style="width: 750px;">
			<div class="card mb-4">
				<div class="card-header">
					<i class="fas fa-chart-area me-1"></i> 학사일정
				</div>
				<script type="text/javascript" src="<c:url value='/resources/js/calendar.js'/>" ></script>
				<div id="calendar" style="width: 100%"></div>
			</div>
		</div>
		<div class="col-xl-6" style="width: 450px;">
			<div class="card mb-4">
				<div class="card-header">
					<i class="fas fa-chart-area me-1"></i> 공지사항
				</div>
				<br>
				<div style="margin-left: 10px; height: 350px;">
					<ul style="list-style-type: decimal;">
						<li>공지사항1</li>
						<li>공지사항2</li>
						<li>공지사항3</li>
						<li>공지사항4</li>
						<li>공지사항5</li>
					</ul>
				</div>
			</div>
		</div>
		<div class="col-xl-6" style="width: 400px">
			<div class="card mb-4">
				<div class="card-header">
					<i class="fas fa-chart-bar me-1"></i> Q&A
				</div>
				<br>
				<div style="margin-left: 10px; height: 300px;">
					<ul style="list-style-type: decimal;">
						<li>질문글1</li>
						<li>질문글2</li>
						<li>질문글3</li>
						<li>질문글4</li>
						<li>질문글5</li>
					</ul>
				</div>
			</div>
		</div>
		<div class="col-xl-6" style="width: 350px">
			<div class="card mb-4">
				<div class="card-header">
					<i class="fas fa-chart-bar me-1"></i> 식단표
				</div>
				<br>
				<div style="margin-left: 10px; height: 300px;">
					<span>7월 13일</span><br>
					<br>
					<span>버섯된장찌개</span><br>
					<span>고추잡채</span><br>
					<span>소세지볶음</span><br>
					<span>김치</span><br>
					<span>소세지(닭,돼지:국내산)</span><br>
					<span>918kcal/30g</span>
				</div>
			</div>
		</div>
		<div class="col-xl-6" style="width: 450px">
			<div class="card mb-4">
				<div class="card-header">
					<i class="fas fa-chart-bar me-1"></i> 캠퍼스맵
				</div>
				<div id="map" style="margin: 5px; width: 98%; height: 310px;"></div>
				<script type="text/javascript" src="<c:url value='/resources/js/map.js'/>" ></script>
			</div>
		</div>
	</div>

</div>
<%@ include file="inc/bottom.jsp" %>                