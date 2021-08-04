<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../inc/prof_top.jsp" %>
<!-- 과제 조회창 -->
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">

<script type="text/javascript">
	$(function(){	//개설과목별 과제목록 조회
		$('#btCheck').click(function(){
			if($('#openSub option:selected').val()!='선택하세요'){
				var openSubCode = $('#openSub option:selected').val();
				location.href="<c:url value='/professor/assign/assignmentCheck?openSubCode="+openSubCode+"'/>";
			} else{
				alert('개설교과목 번호를 선택하세요!');
			}
		});
	});
</script>

<style type="text/css">
body {
	padding-top: 70px;
	padding-bottom: 30px;
}

.ccdetail a {
	color:black;
}

.ccdetail a:hover{
	color:gray;
}

.red a {
	color:red;
}

</style>
	<article>
		<div class="container col-lg-10" role="main">
			<h2>과제 조회</h2>
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
						<!-- 개설교과목 번호/이름 교수님 번호로 조회해 for문 돌리기 -->
					</select>
					<input type="button" id="btCheck" value="조회">
				</div>
				<div class="row">
				<div class="col-xl-6">
					<div class="card mb-4">
						<div class="card-header">
							<i class="far fa-file-alt"></i> 개설교과목별 목록 / ${open }
						</div>
						<div class="card-body" style="height:600px">
							<table class="table-bordered text-center" style="width: 100%">
								<colgroup>
									<col style="width: 20%" />
									<col style="width: 20%" />
									<col style="width: 40%" />
									<col style="width: 20%" />
								</colgroup>
								<thead>
									<tr>
										<th>개설교과목번호</th>
										<th>교과목명</th>
										<th>과제명</th>
										<th>등록일</th>
									</tr>
								</thead>
								<tbody>
									<c:if test="${empty aList }">
										<tr>
											<td colspan="4">데이터가 없습니다.</td>
										</tr>
									</c:if>
									<c:if test="${!empty aList }">
										<c:forEach var="map" items="${aList }">
											<tr>
												<td>${map['OPEN_SUB_CODE'] }</td>
												<td>${map['SUBJ_NAME'] }</td>
												<td class="ccdetail text-left">&nbsp;
												<a href='<c:url value="/professor/assign/assignmentCheck?openSubCode=${open}&assignNo=${map['ASSIGN_NO'] }"/>'>${map['ASSIGN_NAME'] }</a></td>
												<td><fmt:formatDate value="${map['REG_DATE'] }" pattern="yyyy-MM-dd" /></td>
											</tr>
										</c:forEach>
									</c:if>
								</tbody>
							</table>
						</div>
					</div>
					</div>
					<div class="col-xl-6">
					<div class="card mb-4">
						<div class="card-header">
							<i class="far fa-file-alt"></i> 과제별 목록
						</div>
						<div class="card-body" style="height:600px">
							<table class="table-bordered text-center" id="datatablesSimple" style="width: 100%">
								<colgroup>
									<col style="width: 20%" />
									<col style="width: 20%" />
									<col style="width: 15%" />
									<col style="width: 25%" />
									<col style="width: 10%" />
								</colgroup>
								<thead>
									<tr>
										<th>학번</th>
										<th>이름</th>
										<th>제출여부</th>
										<th>제출시간</th>
										<th data-sortable=false>점수</th>
									</tr>
								</thead>
								<tbody>
									<c:if test="${empty sList }">
										<tr>
											<td colspan="5">데이터가 없습니다.</td>
										</tr>
									</c:if>
									<c:if test="${!empty sList }">
										<c:forEach var="map" items="${sList }">
												<tr>
													<td>${map['STU_NO'] }</td>
													<td class="ccdetail">${map['NAME'] }</td>
											<c:forEach var="vo" items="${assignList }">
													<c:if test="${vo.stuNo eq map['STU_NO'] }">
														<td>O</td>
														<td><fmt:formatDate value="${vo.applyDate }" pattern="yyyy-MM-dd hh:mm:ss" /></td>
															<c:if test="${vo.assignPoint=='' }"><td class="red"><a href="#" onclick="window.open('${pageContext.request.contextPath }/professor/assign/assignDetail?stuNo=${vo.stuNo}&assignNo=${vo.assignNo}', 'detail', 'top=100, left=600, width=480, height=350, location=yes, resizable=yes')">미채점</a></td></c:if>
															<c:if test="${vo.assignPoint>0 }"><td class="ccdetail"><a href="#" onclick="window.open('${pageContext.request.contextPath }/professor/assign/assignDetail?stuNo=${vo.stuNo}&assignNo=${vo.assignNo}', 'detail', 'top=100, left=600, width=480, height=350, location=yes, resizable=yes')">${vo.assignPoint }</a></td></c:if>
													</c:if>
											</c:forEach>
												</tr>
										</c:forEach>
									</c:if>
								</tbody>
							</table>
						</div>
					</div>
					</div>
				</div>
               </div>
	</article>

<%@ include file="../../inc/bottom.jsp" %>
