<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../inc/admin_top.jsp" %>

<script type="text/javascript">
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

	<div class="card mb-4" style="width: 90%; margin: 0 auto; margin-top: 50px">
		<div class="card-header" style="font-size: 1.5em">
			<i class="fas fa-user-alt"></i>&nbsp; 개설강의목록
		</div>
		<div class="card-body">
			<table id="datatablesSimple">
				<thead>
					<tr>
						<th style="text-align: center">학과</th>
						<th style="text-align: center">교과구분</th>
						<th style="text-align: center">과목명</th>
						<th style="text-align: center">담당교수</th>
						<th style="text-align: center">시간표</th>
						<th style="text-align: center">강의실</th>
						<th style="text-align: center">수정</th>
						<th style="text-align: center">삭제</th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${empty list}">
						<tr>
							<td colspan="8" style="text-align: center">개설된 강의 정보가 없습니다.</td>
						</tr>
					</c:if>
					<c:if test="${!empty list}">
					<c:forEach var="map" items="${list }">          
			            <tr>
			               <td style="vertical-align: middle; text-align: center;">${map['DEPARTMENT']}</td>
			               <td style="vertical-align: middle; text-align: center;">${map['SUBJECTTYPE']}</td>
			               <td style="vertical-align: middle; text-align: center;">${map['SUBJECTNAME']}</td>
			               <td style="vertical-align: middle; text-align: center;">${map['PROFNAME']}</td>
			               <td style="vertical-align: middle; text-align: center;">${map['TIMETABLENAME']}</td>
			               <td style="vertical-align: middle; text-align: center;">${map['BUILDINGNAME']} ${map['CLASSROOMNAME']}</td>
			               <td style="vertical-align: middle; text-align: center;">
								<a href="<c:url value='/admin/lecture/lectureEdit?openSubCode=${map["OPENSUBCODE"] }'/>">
									<button class="btn btn-primary btn-sm">
										수정
									</button>
								</a>
							</td>
							<td style="vertical-align: middle; text-align: center;">
								<a href="<c:url value='/admin/lecture/lectureDelete?openSubCode=${map["OPENSUBCODE"] }'/>" 
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
			</table>
			<div style="text-align: right; margin-right: 30px">
				<a href="<c:url value='/admin/lecture/lectureRegister'/>">
				<button class="btn btn-primary btn-sm">
					강의등록
				</button>
				</a>
			</div>
		</div>
	</div>


<%@ include file="../../inc/bottom.jsp" %>