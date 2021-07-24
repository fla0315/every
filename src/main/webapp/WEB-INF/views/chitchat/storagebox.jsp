<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="col-xl-12">
	<div class="card mb-4">
		<div class="card-header">
			<i class="fas fa-envelope"></i> 메세지 보관함
		</div>
		<div class="card-body">
			<table class="table-bordered text-center" style="width: 100%">
				<colgroup>
					<col style="width: 10%" />
					<col style="width: 50%" />
					<col style="width: 30%" />
				</colgroup>
				<thead>
					<tr>
						<th><input type="checkbox" name="chkAll"></th>
						<th>내용</th>
						<th>보낸 사람</th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${!empty list }">
						<c:forEach var="map" items="${list }">
							<c:if test="${!(map['OFFICIAL_NO'] eq no) }">
								<c:if test="${!(empty map['KEEP_FLAG']) }">
							<tr>
								<td><input type="checkbox"/></td>
								<td class="ccdetail text-left">&nbsp;<a href="#">${map['CONTENTS'] }</a></td>
								<td>${map['OFFICIAL_NAME'] }</td>
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