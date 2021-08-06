<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../inc/prof_top.jsp"%>

<style type="text/css">
body {
	padding-top: 70px;
	padding-bottom: 30px;
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
				<button type="button" class="btn btn-sm btn-primary" id="btCreate">개설</button>
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
						<col style="width:20%;" />
						<col style="width:20%;" />
						<col style="width:40%;" />
						<col style="width:20%;" />		
					</colgroup>
					<thead>
						<tr>
							<th>번호</th>
							<th>과목명</th>
							<th>제목</th>
							<th>날짜</th>
						</tr>
					</thead>
					<tfoot>
						<tr>
							<th>Name</th>
							<th>Position</th>
							<th>Office</th>
							<th>Age</th>
						</tr>
					</tfoot>
					<tbody>
						<tr>
							<td>Tiger Nixon</td>
							<td>System Architect</td>
							<td>Edinburgh</td>
							<td>Edinburgh</td>
						</tr>
						<tr>
							<td>Garrett Winters</td>
							<td>Accountant</td>
							<td>Tokyo</td>
							<td>Tokyo</td>
						</tr>
						<tr>
							<td>Ashton Cox</td>
							<td>Junior Technical Author</td>
							<td>San Francisco</td>
							<td>San Francisco</td>
						</tr>
						<tr>
							<td>Cedric Kelly</td>
							<td>Senior Javascript Developer</td>
							<td>Edinburgh</td>
							<td>Edinburgh</td>
						</tr>
						<tr>
							<td>Airi Satou</td>
							<td>Accountant</td>
							<td>Tokyo</td>
							<td>Tokyo</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</article>
<%@ include file="../../inc/bottom.jsp"%>