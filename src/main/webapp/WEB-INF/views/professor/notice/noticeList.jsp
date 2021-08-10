<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../inc/prof_top.jsp"%>

<style type="text/css">
body {
	padding-top: 70px;
	padding-bottom: 30px;
}

table a {
	color:black;
}

table a:hover{
	color:gray;
}
</style>
<script type="text/javascript">
	$(function(){
		$('#btWrite').click(function(){
			location.href="<c:url value='/professor/notice/noticeWrite'/>";
		});
		
		$('#btCheck').click(function(){
			if($('#openSub option:selected').val()!='선택하세요'){
				var openSubCode = $('#openSub option:selected').val();
				location.href="<c:url value='/professor/notice/noticeList?openSubCode="+openSubCode+"'/>";
			} else{
				alert('개설교과목 번호를 선택하세요!');
			}
		});
		
		$('#btCreate').click(function(){
			location.href="<c:url value='/custompage/custom'/>";
		});
	});
</script>
<article>
	<div class="container col-lg-10" role="main">
		<h2>공지사항</h2>
		<br>
		<div class="mb-3">
			<label for="title">개설교과목</label>
					<select id="openSub" class="dataTable-selector">
						<option>선택하세요</option>
						<c:if test="${!empty osList }">
							<c:forEach var="vo" items="${osList}">
								<c:if test="${open == vo.openSubCode }">
									<option selected>${vo.openSubCode }</option>
								</c:if>
								<c:if test="${open != vo.openSubCode }">
									<option>${vo.openSubCode }</option>
								</c:if>
							</c:forEach>
						</c:if>
					</select>
					<input type="button" id="btCheck" value="조회">
			<div class="text-end">
				<button type="button" class="btn btn-sm btn-primary" id="btCreate">개설교과목 공지 개설</button>
				<button type="button" class="btn btn-sm btn-primary" id="btWrite">등록</button>
			</div>
		</div>
		<div class="card mb-5">
			<div class="card-header">
				<i class="fas fa-table me-1"></i> 공지사항 조회
			</div>
			<div class="card-body">
				<table id="datatablesSimple">
					<colgroup>
						<col style="width:50%;" />
						<col style="width:30%;" />
						<col style="width:20%;" />
					</colgroup>
					<thead>
						<tr>
							<th>제목</th>
							<th>날짜</th>
							<th>조회수</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${empty pList }">
							<tr>
								<td colspan="4">데이터가 없습니다</td>
							</tr>
						</c:if>
						<c:if test="${!empty pList }">
							<c:forEach var="vo" items="${pList }">
								<tr>
									<td><a href="<c:url value='/professor/notice/readCount?postNo=${vo.postNo }&openSubCode=${open}'/>">${vo.title }</a></td>
									<td><fmt:formatDate value="${vo.regDate }" pattern="yyyy-MM-dd"/></td>
									<td>${vo.readCount }</td>
								</tr>
							</c:forEach>
						</c:if>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</article>
<%@ include file="../../inc/bottom.jsp"%>