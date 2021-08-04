<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../inc/admin_top.jsp" %>

	<div class="card mb-4" style="width: 90%; margin: 0 auto; margin-top: 50px">
		<div class="card-header" style="font-size: 1.5em">
			<i class="fas fa-user-alt"></i>&nbsp; 장학금 대상자 관리
		</div>
		<div class="card-body">
			<table id="datatablesSimple">
				<thead>
					<tr>
						<th style="text-align: center">학과</th>
						<th style="text-align: center">학번</th>
						<th style="text-align: center">이름</th>
						<th style="text-align: center">장학금종류</th>
						<th style="text-align: center">금액</th>
						<th style="text-align: center">지급학기</th>
						<th style="text-align: center">지급년도</th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${empty list}">
						<tr>
							<td colspan="7" style="text-align: center">등록된 장학금 정보가 없습니다.</td>
						</tr>
					</c:if>
					<c:if test="${!empty list}">
					<c:forEach var="vo" items="${list }">          
						<c:set var="awardingYear" value="${vo.awardingDate}"/>
						<c:set var="semester" value="${fn:substring(awardingYear,5,7)}"/>
			            <tr>
			               <td style="vertical-align: middle; text-align: center;">${vo.major }</td>
			               <td style="vertical-align: middle; text-align: center;">${vo.stuNo }</td>
			               <td style="vertical-align: middle; text-align: center;">${vo.name }</td>
			               <td style="vertical-align: middle; text-align: center;">${vo.scholarshipType }</td>
			               <td style="vertical-align: middle; text-align: center;">${vo.scholarship }</td>
			               <c:if test="${semester == '07' || semester == '08'}">
			               		<td style="vertical-align: middle; text-align: center;">
					               	2학기
					            </td>
			               </c:if>
			               <c:if test="${semester == '01' || semester == '02'}">
			               		<td style="vertical-align: middle; text-align: center;">
					               	1학기
					            </td>
			               </c:if>
			               <c:if test="${awardingYear == null }">
			               		<td style="vertical-align: middle; text-align: center;">
					               	-
					            </td>
			               </c:if>
			               <c:if test="${awardingYear != null }">
			               		<td style="vertical-align: middle; text-align: center;">
					               	${fn:substring(awardingYear,0,4) }
					            </td>
			               </c:if>
			            </tr> 
			         	</c:forEach>
					</c:if>
				</tbody>
			</table>
		</div>
	</div>


<%@ include file="../../inc/bottom.jsp" %>