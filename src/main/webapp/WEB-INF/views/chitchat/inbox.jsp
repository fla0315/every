<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="col-xl-12">
	<div class="card mb-4">
		<div class="card-header">
			<i class="far fa-envelope"></i> 메세지 수신함
		</div>
		<div class="card-body">
			<table class="table-bordered text-center" style="width: 100%">
				<colgroup>
					<col style="width: 10%" />
					<col style="width: 40%" />
					<col style="width: 20%" />
					<col style="width: 20%" />
					<col style="width: 10%" />
				</colgroup>
				<thead>
					<tr>
						<th><input type="checkbox" name="chkAll"></th>
						<th>내용</th>
						<th>보낸 사람</th>
						<th>받은 날짜</th>
						<th>보관 여부</th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${empty list }">
						<tr>
							<td colspan="3">데이터가 없습니다.</td>
						</tr>
					</c:if>
					<c:if test="${!empty list }">
						<c:forEach var="map" items="${list }">
							<form name="frmStorage" method="post" action="<c:url value='/chitchat/storage'/> ">
							<c:if test="${!(map['OFFICIAL_NO'] eq no) }">
									<tr>
										<td><input type="checkbox"/>
											<input type="hidden" name="msgNo" value="${map['MSG_NO'] }" />
											<input type="hidden" name="flag" value="${map['KEEP_FLAG'] }" />
										</td>
										<td class="ccdetail text-left">&nbsp;<a href="#" onclick="window.open('${pageContext.request.contextPath }/chitchat/chitchatDetail?msgNo=${map['MSG_NO'] }&readDate=${map['READ_DATE'] }', 'detail', 'top=100, left=600, width=500, height=500, location=yes, resizable=yes')">${map['CONTENTS'] }</a></td>
										<td>${map['OFFICIAL_NAME'] }</td>
										<td><fmt:formatDate value="${map['SEND_DATE'] }" pattern="yyyy-MM-dd KK:mm:ss" /></td>
										<c:if test="${map['KEEP_FLAG']=='Y' }">
											<td><input class="btn btn-danger" type="submit" value="취소"></td>
										</c:if>
										<c:if test="${map['KEEP_FLAG']=='N' }">
											<td><input class="btn btn-success" type="submit" value="보관"></td>
										</c:if>
									</tr>
							</c:if>
							</form>
						</c:forEach>
					</c:if>
				</tbody>
			</table>
		</div>
	</div>
</div>