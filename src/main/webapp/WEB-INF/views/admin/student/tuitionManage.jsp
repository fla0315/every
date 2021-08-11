<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../inc/admin_top.jsp" %>

	<div class="card mb-4" style="width: 90%; margin: 0 auto; margin-top: 50px">
		<div class="card-header" style="font-size: 1.5em">
			<i class="fas fa-user-alt"></i>&nbsp; 등록금 관리
		</div>
		<div class="card-body">
			<table id="datatablesSimple">
				<thead>
					<tr>
						<th style="text-align: center">학과</th>
						<th style="text-align: center">학번</th>
						<th style="text-align: center">이름</th>
						<th style="text-align: center">학기</th>
						<th style="text-align: center">납부금액</th>
						<th style="text-align: center">납부상태</th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${empty list}">
						<tr>
							<td colspan="6" style="text-align: center">조회된 등록금 정보가 없습니다.</td>
						</tr>
					</c:if>
					<c:if test="${!empty list}">
					<c:forEach var="vo" items="${list }">
			            <tr>
			               <td style="vertical-align: middle; text-align: center;">${vo.major }</td>
			               <td style="vertical-align: middle; text-align: center;">${vo.stuNo }</td>
			               <td style="vertical-align: middle; text-align: center;">${vo.name }</td>
			               <td style="vertical-align: middle; text-align: center;">${vo.semester }</td>
			               <td style="vertical-align: middle; text-align: center;">${vo.tuition }</td>
			               <td style="vertical-align: middle; text-align: center;">${vo.depositState }</td>
			            </tr> 
			         	</c:forEach>
					</c:if>
				</tbody>
			</table>
		</div>
	</div>


<%@ include file="../../inc/bottom.jsp" %>