<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="inc/admin_top.jsp" %>

<div class="container-fluid px-4">
	<br>
	<div class="row">
		<div class="col-xl-6" style="width: 750px;">
			<div class="card mb-4">
				<div class="card-header">
					<i class="fas fa-table me-1" style="font-size: 1.3em"></i> 학사일정
					<div style="float: right; font-size: 0.8em">
						<a href="<c:url value='/admin/mainDisplay/calendar'/>">+ 더보기</a>
					</div>
				</div>
				<div>
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
		<div class="col-xl-6" style="width: 450px;">
			<div class="card mb-4">
				<div class="card-header">
					<i class="fas fa-clipboard-list" style="font-size: 1.3em"></i> 공지사항
					<div style="float: right; font-size: 0.8em">
						<a href="<c:url value='/admin/mainDisplay/notice'/>">+ 더보기</a>
					</div>
				</div>
				<br>
				<div style="margin-left: 10px; height: 400px;">
					<table style="border-collapse: separate; border-spacing: 0 20px">
						<colgroup>
					      <col style="width:83%;" />
					      <col style="width:18%;" />
					   </colgroup>
						<thead></thead>
						<tbody>
							<tr>
								<td><a href="#">대표홈페이지 개편 이벤트 안내</a></td>
								<td style="font-size: 0.8em">2021/07/14</td>
							</tr>
							<tr>
								<td><a href="#">2021학년도 제2학기 수강신청 안내</a></td>
								<td style="font-size: 0.8em">2021/07/13</td>
							</tr>
							<tr>
								<td><a href="#">학부생 주차 일일권요금 적용 신청 안내</a></td>
								<td style="font-size: 0.8em">2021/07/11</td>
							</tr>
							<tr>
								<td><a href="#">대학행정정보시스템 파일업로드 관련 안내</a></td>
								<td style="font-size: 0.8em">2021/07/08</td>
							</tr>
							<tr>
								<td><a href="#">2021년 2학기 학자금대출 사업 안내</a></td>
								<td style="font-size: 0.8em">2021/07/02</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<div class="col-xl-6" style="width: 400px">
			<div class="card mb-4">
				<div class="card-header">
					<i class="fas fa-question-circle" style="font-size: 1.3em"></i> Q&amp;A
					<div style="float: right; font-size: 0.8em">
						<a href="<c:url value='/admin/mainDisplay/question'/>">+ 더보기</a>
					</div>
				</div>
				<br>
				<div style="margin-left: 10px; height: 300px;">
					<table style="border-collapse: separate; border-spacing: 0 20px">
						<colgroup>
					      <col style="width:10%;" />
					      <col style="width:65%;" />
					      <col style="width:25%;" />
					   </colgroup>
						<thead></thead>
						<tbody>
							<tr>
								<td>1</td>
								<td><a href="#">질문이요~!!</a></td>
								<td>2021/07/14</td>
							</tr>
							<tr>
								<td>2</td>
								<td><a href="#">등록금관련 질문합니다</a></td>
								<td>2021/07/13</td>
							</tr>
							<tr>
								<td>3</td>
								<td><a href="#">기숙사관련 질문드려요</a></td>
								<td>2021/07/11</td>
							</tr>
							<tr>
								<td>4</td>
								<td><a href="#">방학 중 강의실 사용질문</a></td>
								<td>2021/07/08</td>
							</tr>
							<tr>
								<td>5</td>
								<td><a href="#">안녕하세요. 질문있습니다!</a></td>
								<td>2021/07/02</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<div class="col-xl-6" style="width: 350px">
			<div class="card mb-4">
				<div class="card-header">
					<i class="fas fa-utensils" style="font-size: 1.3em"></i> 식단표
					<div style="float: right; font-size: 0.8em">
						<a href="<c:url value='/admin/mainDisplay/lunchMenu'/>">+ 더보기</a>
					</div>
				</div>
				<br>
				<div style="margin-left: 30px; height: 300px;">
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
					<i class="fas fa-map-marked-alt" style="font-size: 1.3em"></i> 캠퍼스맵
					<div style="float: right; font-size: 0.8em">
						<a href="<c:url value='/admin/mainDisplay/campusMap'/>">+ 더보기</a>
					</div>
				</div>
				<div style="height: 320px">
					<img alt="campus map image" src="${pageContext.request.contextPath }/resources/images/campusmap.png"
						style="margin-top:30px; width: 400px">
				</div>
				<%-- <div id="map" style="margin: 5px; width: 98%; height: 310px;"></div>
				<script type="text/javascript" src="<c:url value='/resources/js/map.js'/>" ></script> --%>
			</div>
		</div>
	</div>

</div>
<%@ include file="inc/bottom.jsp" %>                