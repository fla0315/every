<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="col-xl-12">
	<div class="card mb-4">
		<div class="card-header">
			<i class="fas fa-envelope"></i> 메세지 발신함
		</div>
		<div class="card-body">
			<table class="table-bordered text-center" style="width: 100%">
				<colgroup>
					<col style="width: 10%" />
					<col style="width: 40%" />
					<col style="width: 15%" />
					<col style="width: 15%" />
					<col style="width: 10%" />
					<col style="width: 10%" />
				</colgroup>
				<thead>
					<tr>
						<th><input type="checkbox" name="chkAll"></th>
						<th>내용</th>
						<th>받는 사람</th>
						<th>수신 확인</th>
						<th>발신 취소</th>
						<th>삭제</th>
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
						<c:if test="${empty map['DEL_FLAG'] }">
						<form name="cancel" method="post" action=" ">
							<c:if test="${map['OFFICIAL_NO'] eq no }">
							<tr>
								<td><input type="checkbox"/>
									<input type="hidden" name="msgNo" value="${map['MSG_NO'] }" />
								</td>
								<td class="ccdetail text-left">&nbsp;<a href="#" onclick="window.open('${pageContext.request.contextPath }/chitchat/chitchatDetail?msgNo=${map['MSG_NO'] }', 'detail', 'top=100, left=600, width=500, height=500, location=yes, resizable=yes')">${map['CONTENTS'] }</a></td>
								<td>${map['RECEIVERNAME'] }</td>
								<c:if test="${empty map['READ_DATE'] }">
									<td>읽지 않음</td>
									<td><input class="btn btn-secondary" id="cancel" type="submit" value="취소" formaction="<c:url value='/chitchat/cancel'/>"></td>
								</c:if>
								<c:if test="${!empty map['READ_DATE'] }">
									<td>
										<fmt:formatDate value="${map['READ_DATE'] }" pattern="yyyy-MM-dd KK:mm:ss" />
									</td>
									<td style="color:red">취소 불가</td>
								</c:if>
									<td><input class="btn btn-secondary" id="deleteSent" type="submit" value="삭제" formaction="<c:url value='/chitchat/delete'/>"></td>
							</tr>
							</c:if>
						</form>
						</c:if>
						</c:forEach>
					</c:if>
				</tbody>
			</table>
		</div>
	</div>
</div>
<script type="text/javascript">
	$('#cancel').click(function(){
		if(!confirm("발송 취소하시겠습니까?")){
			return false;
		}
	});
	
	$('#deleteSent').click(function(){
		if(!confirm("삭제하시겠습니까?")){
			return false;
		}
	});
</script>