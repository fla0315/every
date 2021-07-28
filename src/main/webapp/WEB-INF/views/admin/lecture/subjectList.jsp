<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../inc/admin_top.jsp" %>

	<div class="card mb-4" style="width: 90%; margin: 0 auto; margin-top: 50px">
		<div class="card-header" style="font-size: 1.5em">
			<i class="fas fa-user-alt"></i>&nbsp; 수강과목 목록
		</div>
		<div class="card-body">
			<table id="datatablesSimple">
				<thead>
					<tr>
						<th style="text-align: center">과목번호</th>
						<th style="text-align: center">교과구분</th>
						<th style="text-align: center">과목명</th>
						<th style="text-align: center">과목설명</th>
						<th style="text-align: center">학점</th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${empty list}">
						<tr>
							<td colspan="5" style="text-align: center">조회된 과목 정보가 없습니다.</td>
						</tr>
					</c:if>
					<c:if test="${!empty list}">
					<c:forEach var="vo" items="${list }">          
			            <tr>
			               <td style="vertical-align: middle; text-align: center;">${vo.subjCode}</td>
			               <td style="vertical-align: middle; text-align: center;">${vo.type}</td>
			               <td style="vertical-align: middle; text-align: center;">${vo.subjName}</td>
			               <td style="vertical-align: middle; text-align: center;">${vo.explanation}</td>
			               <td style="vertical-align: middle; text-align: center;">${vo.credit}</td>
			            </tr> 
			         	</c:forEach>
					</c:if>
				</tbody>
			</table>
			<div style="text-align: right; margin-right: 30px">
				<a href="<c:url value='/admin/lecture/subjectRegister'/>">
				<button class="btn btn-primary btn-sm">
					과목등록
				</button>
				</a>
			</div>
		</div>
	</div>


<%@ include file="../../inc/bottom.jsp" %>