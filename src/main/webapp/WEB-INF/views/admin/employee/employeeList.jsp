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
			<i class="fas fa-user-alt"></i>&nbsp; 임직원목록
		</div>
		<div class="card-body">
			<table id="datatablesSimple">
				<thead>
					<tr>
						<th style="text-align: center">사번</th>
						<th style="text-align: center">부서</th>
						<th style="text-align: center">이름</th>
						<th style="text-align: center">직책</th>
						<th style="text-align: center">권한</th>
						<th style="text-align: center">입사년도</th>
						<th style="text-align: center">수정</th>
						<th style="text-align: center">삭제</th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${empty list}">
						<tr>
							<td colspan="8" style="text-align: center">등록된 직원정보가 없습니다.</td>
						</tr>
					</c:if>
					<c:if test="${!empty list}">
					<c:forEach var="vo" items="${list }">          
						<c:set var="startDate" value="${vo.startDate}"/>
			            <tr>
			               <td style="vertical-align: middle; text-align: center;">${vo.empNo }</td>
			               <td style="vertical-align: middle; text-align: center;">${vo.depName }</td>
			               <td style="vertical-align: middle; text-align: center;">${vo.empName }</td>
			               <td style="vertical-align: middle; text-align: center;">${vo.positionName }</td>
			               <td style="vertical-align: middle; text-align: center;">${vo.authDesc }</td>
			               <td style="vertical-align: middle; text-align: center;">
			               	${fn:substring(startDate,0,4) }
			               </td>
			               <td style="vertical-align: middle; text-align: center;">
								<a href="<c:url value='/admin/employee/employeeEdit?empNo=${vo.empNo }'/>">
									<button class="btn btn-primary btn-sm">
										수정
									</button>
								</a>
							</td>
							<td style="vertical-align: middle; text-align: center;">
								<a href="<c:url value='/admin/employee/employeeDelete?empNo=${vo.empNo }'/>" 
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
				<a href="<c:url value='/admin/employee/employeeRegister'/>">
				<button class="btn btn-primary btn-sm">
					직원등록
				</button>
				</a>
			</div>
		</div>
	</div>


<%@ include file="../../inc/bottom.jsp" %>