<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../inc/admin_top.jsp" %>
<script type="text/javascript">
	$(function(){
		$('.btnApproved').each(function(index, item) {
			$(item).click(function(){
				var result = confirm('승인하시겠습니까?');
				
				if(!result) {
					return false;
				} 
				
			});
		});
	}); 
</script>

	<div class="card mb-4" style="width: 90%; margin: 0 auto; margin-top: 50px">
		<div class="card-header" style="font-size: 1.5em">
			<i class="fas fa-user-alt"></i>&nbsp; 장학금 신청목록
		</div>
		<div class="card-body">
			<table id="datatablesSimple">
				<thead>
					<tr>
						<th style="text-align: center">학과</th>
						<th style="text-align: center">학번</th>
						<th style="text-align: center">이름</th>
						<th style="text-align: center">신청학기</th>
						<th style="text-align: center">신청장학금 </th>
						<th style="text-align: center">승인여부</th>
						<th style="text-align: center">승인</th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${empty list}">
						<tr>
							<td colspan="7" style="text-align: center">신청된 장학금 정보가 없습니다.</td>
						</tr>
					</c:if>
					<c:if test="${!empty list}">
					<c:forEach var="vo" items="${list }">
						<c:set var="applyingYear" value="${fn:substring(vo.awardingDate,0,4)}"/>
						<c:set var="semester" value="${fn:substring(vo.awardingDate,5,7)}"/>          
			            <tr>
			               <td style="vertical-align: middle; text-align: center;">${vo.major }</td>
			               <td style="vertical-align: middle; text-align: center;">${vo.stuNo }</td>
			               <td style="vertical-align: middle; text-align: center;">${vo.name }</td>
			               <c:if test="${semester == '07' || semester == '08'}">
			               		<td style="vertical-align: middle; text-align: center;">
					               	${applyingYear }년 2학기
					            </td>
			               </c:if>
			               <c:if test="${semester == '01' || semester == '02'}">
			               		<td style="vertical-align: middle; text-align: center;">
					               	${applyingYear }년 1학기
					            </td>
			               </c:if>
			               <td style="vertical-align: middle; text-align: center;">${vo.scholarshipType }</td>
			               <td style="vertical-align: middle; text-align: center;">${vo.approved }</td>
			               <td style="vertical-align: middle; text-align: center;">
								<a href="<c:url value='/admin/student/changeApproved?awardNo=${vo.awardNo }'/>"
									class="btnApproved">
									<button class="btn btn-primary btn-sm">
										승인
									</button>
								</a>
							</td>
			            </tr> 
			         	</c:forEach>
					</c:if>
				</tbody>
			</table>
		</div>
		<div style="text-align: right; margin-right: 30px">
				<a href="<c:url value='/admin/student/scholarshipApply'/>">
				<button class="btn btn-primary btn-sm">
					장학금 신청
				</button>
				</a>
		</div>
	</div>


<%@ include file="../../inc/bottom.jsp" %>