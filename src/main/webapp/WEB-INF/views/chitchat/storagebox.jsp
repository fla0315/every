<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="col-xl-12">
	<div class="card mb-4">
		<div class="card-header">
			<i class="fas fa-envelope"></i> 메세지 보관함
		</div>
		<div class="card-body">
			<table class="table-bordered text-center" style="width: 100%">
				<colgroup>
					<col style="width: 50%" />
					<col style="width: 20%" />
					<col style="width: 30%" />
				</colgroup>
				<thead>
					<tr>
						<th>내용</th>
						<th>보낸 사람</th>
						<th>받은 날짜</th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${!empty list }">
						<c:forEach var="map" items="${list }">
							<c:if test="${!(map['OFFICIAL_NO'] eq no) }">
								<c:if test="${map['KEEP_FLAG'] eq 'Y' }">
							<tr>
								<td class="ccdetail text-left">&nbsp;<a href="#" onclick="window.open('${pageContext.request.contextPath }/chitchat/chitchatDetail?msgNo=${map['MSG_NO'] }', 'detail', 'top=100, left=600, width=500, height=500, location=yes, resizable=yes')">${map['CONTENTS'] }</a></td>
								<td>${map['OFFICIAL_NAME'] }</td>
								<td><fmt:formatDate value="${map['SEND_DATE'] }" pattern="yyyy-MM-dd KK:mm:ss" /><input type="hidden" name="readDate" value="${map['READ_DATE'] }" /></td>
							</tr>
								</c:if>
							</c:if>
						</c:forEach>
					</c:if>
				</tbody>
			</table>
		</div>
	</div>
</div>