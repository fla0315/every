<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../inc/admin_top.jsp" %>
<script type="text/javascript">

document.addEventListener('DOMContentLoaded', function() {
	var calendarEl = document.getElementById('calendar');
					    
	var calendar = new FullCalendar.Calendar(calendarEl, {
		plugins: ['interaction', 'dayGrid'],
		header: {
			left: 'prev, next',
			center: 'title',
			right: 'today'
		},
		
		editable:true,
		events: [
		    ${str}
		]
	});
					    
	calendar.render();
}); 

$(function(){
	$('.btnDel').each(function(index, item) {
		$(item).click(function(){
			var result = confirm('삭제하시겠습니까?');
			
			if(!result) {
				return false;
			} 
			
		});
	});
});


</script>


	<h1 class="mt-4">학사일정</h1>

	<div class="col-xl-6" style="float: left; width: 450px; margin: 20px">
		<div class="card mb-4">
			<div class="card-header">
				<i class="far fa-calendar-alt me-1"></i> 학사일정
			</div>
			<div id="calendar" style="float: left; width: 100%"></div>
		</div>
	</div>
	<div class="card-body" style="float: right; width: 800px">
			<table id="datatablesSimple">
				<colgroup>
					  <col style="width:8%;" />
					  <col style="width:27%;" />
					  <col style="width:15%;" />
					  <col style="width:15%;" />
					  <col style="width:10%;" />
					  <col style="width:10%;" />
				</colgroup>
				<thead>
					<tr>
						<th style="text-align: center;">번호</th>
						<th style="text-align: center;">내용</th>
						<th style="text-align: center;">시작일</th>
						<th style="text-align: center;">종료일</th>
						<th style="text-align: center;">수정</th>
						<th style="text-align: center;">삭제</th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${empty allList}">
						<tr>
							<td colspan="5" style="text-align: center">등록된 학사일정이 없습니다.</td>
						</tr>
					</c:if>
					<c:if test="${!empty allList}">
					<c:forEach var="map" items="${allList }">
			            <tr>
			               <td style="vertical-align: middle; text-align: center;">${map['CALNO'] }</td>
			               <td style="vertical-align: middle; text-align: center;">${map['CONTENTS'] }</td>
			               <td style="vertical-align: middle; text-align: center;">
			               ${fn:substring(map['SDATE'],0,10) }
			               </td>
			               <td style="vertical-align: middle; text-align: center;">
			               ${fn:substring(map['EDATE'],0,10) }
			               </td>
			               <td style="vertical-align: middle; text-align: center;">
								<a href="<c:url value='/admin/campusInfo/calendarEdit?calNo=${map["CALNO"] }'/>">
									<button class="btn btn-primary btn-sm">
										수정
									</button>
								</a>
							</td>
							<td style="vertical-align: middle; text-align: center;">
								<a href="<c:url value='/admin/campusInfo/calendarDelete?calNo=${map["CALNO"] }'/>" 
									class="btnDel">
									<button class="btn btn-danger btn-sm" >
										삭제
									</button>
								</a>
							</td>
			            </tr> 
			         	</c:forEach>
					</c:if>
				</tbody>
			</table><br>
			<div style="text-align: right; margin-right: 30px">
				<a href="<c:url value='/admin/campusInfo/calendarRegister'/>">
				<button class="btn btn-success btn-sm">
					학사일정등록
				</button>
				</a>
			</div>
		</div>

<%@ include file="../../inc/bottom.jsp" %>  