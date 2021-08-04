<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../inc/admin_top.jsp" %>
<script type="text/javascript">
	$(function(){
		$('.btnChange').each(function(index, item) {
			$(item).click(function(){
				var result = confirm('변경하시겠습니까?');
				
				if(!result) {
					return false;
				} 
				
			});
		});
	}); 
</script>

	<div class="card mb-4" style="width: 90%; margin: 0 auto; margin-top: 50px">
		<div class="card-header" style="font-size: 1.5em">
			<i class="fas fa-user-alt"></i>&nbsp; 강의실목록
		</div>
		<div class="card-body">
			<table id="datatablesSimple">
				<thead>
					<tr>
						<th style="text-align: center">건물명</th>
						<th style="text-align: center">강의실번호</th>
						<th style="text-align: center">강의실</th>
						<!-- <th style="text-align: center">사용중인강의</th>
						<th style="text-align: center">사용시간</th> -->
						<th style="text-align: center">사용가능여부</th>
						<th style="text-align: center">사용상태변경</th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${empty list}">
						<tr>
							<td colspan="4" style="text-align: center">강의실 정보가 없습니다.</td>
						</tr>
					</c:if>
					<c:if test="${!empty list}">
					<c:forEach var="vo" items="${list }">
					<c:set var="subjName" value="${vo.subjName}"/>         
					<c:set var="timetable" value="${vo.timetableName}"/>         
			            <tr>
			               <td style="vertical-align: middle; text-align: center;">${vo.buildingName }</td>
			               <td style="vertical-align: middle; text-align: center;">${vo.classroomCode }</td>
			               <td style="vertical-align: middle; text-align: center;">${vo.classroomName }</td>
			               <%-- <c:if test="${subjName == null }">
			               		<td style="vertical-align: middle; text-align: center;">
					               	-
					            </td>
			               </c:if>
			               <c:if test="${subjName != null }">
			               		<td style="vertical-align: middle; text-align: center;">
					               	${subjName }
					            </td>
			               </c:if>
			               <c:if test="${timetable == null }">
			               		<td style="vertical-align: middle; text-align: center;">
					               	-
					            </td>
			               </c:if>
			               <c:if test="${timetable != null }">
			               		<td style="vertical-align: middle; text-align: center;">
					               	${timetable }
					            </td>
			               </c:if> --%>
			               <td style="vertical-align: middle; text-align: center;">${vo.usable }</td>
			               <td style="vertical-align: middle; text-align: center;">
								<a href="<c:url value='/admin/lecture/changeUsable?classroomCode=${vo.classroomCode }&usable=${vo.usable}'/>"
									class="btnChange">
									<button class="btn btn-primary btn-sm">
										변경
									</button>
								</a>
							</td>
			            </tr> 
			         	</c:forEach>
					</c:if>
				</tbody>
			</table>
		</div>
	</div>

<%@ include file="../../inc/bottom.jsp" %>