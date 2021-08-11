<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../inc/admin_top.jsp" %>

	<div class="card mb-4" style="width: 90%; margin: 0 auto; margin-top: 50px">
		<div class="card-header" style="font-size: 1.5em">
			<i class="fas fa-user-alt"></i>&nbsp; 교수목록
		</div>
		<div class="card-body">
			<table id="datatablesSimple">
				<thead>
					<tr>
						<th style="text-align: center">교수번호</th>
						<th style="text-align: center">학과</th>
						<th style="text-align: center">이름</th>
						<th style="text-align: center">직책</th>
						<th style="text-align: center">부임년도</th>
						<th style="text-align: center">퇴임년도</th>
						<th style="text-align: center">수정</th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${empty list}">
						<tr>
							<td colspan="7" style="text-align: center">등록된 교수 정보가 없습니다.</td>
						</tr>
					</c:if>
					<c:if test="${!empty list}">
					<c:forEach var="vo" items="${list }">          
						<c:set var="profStartDate" value="${vo.profStartDate}"/>
						<c:set var="profEndDate" value="${vo.profEndDate}"/>
			            <tr>
			               <td style="vertical-align: middle; text-align: center;">${vo.profNo }</td>
			               <td style="vertical-align: middle; text-align: center;">${vo.deptName }</td>
			               <td style="vertical-align: middle; text-align: center;">${vo.profName }</td>
			               <td style="vertical-align: middle; text-align: center;">${vo.positionName }</td>
			               <td style="vertical-align: middle; text-align: center;">
			               	${fn:substring(profStartDate,0,4) }
			               </td>
			               <c:if test="${profEndDate == null }">
			               		<td style="vertical-align: middle; text-align: center;">
					               	-
					            </td>
			               </c:if>
			               <c:if test="${profEndDate != null }">
			               		<td style="vertical-align: middle; text-align: center;">
					               	${fn:substring(profEndDate,0,4) }
					            </td>
			               </c:if>
			               <td style="vertical-align: middle; text-align: center;">
								<a href="<c:url value='/admin/professor/professorEdit?profNo=${vo.profNo }'/>">
									<button class="btn btn-primary btn-sm">
										수정
									</button>
								</a>
							</td>
			            </tr> 
			         	</c:forEach>
					</c:if>
				</tbody>
			</table>
			<br>
			<div style="text-align: right; margin-right: 30px">
				<a href="<c:url value='/admin/professor/professorRegister'/>">
				<button class="btn btn-success btn-sm">
					교수등록
				</button>
				</a>
			</div>
		</div>
	</div>


<%@ include file="../../inc/bottom.jsp" %>