<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:choose>
	<c:when test="${fn:contains(firstNo, 'P')}">
		교수
		<jsp:include page="../inc/prof_top.jsp"></jsp:include>
	</c:when>
	<c:when test="${fn:contains(firstNo, 'E')}">
		<jsp:include page="../inc/admin_top.jsp"></jsp:include>
	</c:when>
	<c:otherwise>
		${firstNo }
		<jsp:include page="../inc/student_top.jsp"></jsp:include>
	</c:otherwise>
</c:choose>
<style type="text/css">
body {
	padding-top: 70px;
	padding-bottom: 30px;
}
</style>
<body>
	<article>
	<div class="container col-lg-10" role="main">
		<h2>거래 게시판</h2>
		<br>
		<div class="card mb-3">
			<div class="card-header">
				<i class="fas fa-table me-1"></i> 거래 등록
			</div>
			<div class="card-body">
				
			</div>
		</div>
		<div class="card mb-5">
			<div class="card-header">
				<i class="fas fa-table me-1"></i> 거래 목록
			</div>
			<div class="card-body">
				<table id="datatablesSimple">
					<colgroup>
						<col style="width:20%;" />
						<col style="width:20%;" />
						<col style="width:20%;" />
						<col style="width:20%;" />		
						<col style="width:20%;" />		
					</colgroup>
					<thead>
						<tr>
							<th>제목</th>
							<th>판매물품</th>
							<th>가격</th>
							<th>작성자</th>
							<th>등록일</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>Tiger Nixon</td>
							<td>System Architect</td>
							<td>Edinburgh</td>
							<td>Edinburgh</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</article>
<%@ include file="../inc/bottom.jsp"%>
</body>
</html>