<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../inc/prof_top.jsp"%>

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
</style>
<script type="text/javascript">
	$(function(){
		$('#openSub').change(function(){
			$('#openSubCode').val($('#openSub option:selected').val());
		});
		
		$('#btSend').click(function(){
			if($('#openSub option:selected').val()=='선택하세요'){
				alert('개설교과목 번호를 선택하세요!');
				event.preventDefault();
				return false;
				
			} else if($('#assignName').val().length<1){
				alert("과제명을 입력하세요");
				$('#assignName').focus();
				event.preventDefault();
				return false;
			} else{
				location.href="<c:url value='/professor/assign/distributeAssignReg?openSubCode="+openSubCode+"'/>";
			}
		});
	});
</script>
<article>
	<div class="container col-lg-10" role="main">
			<h2>과제 개설</h2>
			<br>
				<div class="row">
				<div class="col-xl-6">
				<div class="card mb-4">
					<div class="card-header">
						<i class="far fa-file-alt"></i> 과제 개설
					</div>
					<div class="card-body">
						<form name="frm" method="post"
							action="<c:url value='/professor/assign/distributeAssignReg'/>">
							<div class="row mb-3">
								<div class="col-md-6">
									<div class="form-floating mb-3 mb-md-0">
										<select id="openSub" name="openSub" class="dataTable-selector" style="width:100%">
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
										<label for="openSub">개설교과목번호</label>
										<input type="hidden" name="officialNo" value="${sessionScope.no }"> 
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-floating mb-3 mb-md-0">
										<input class="form-control" name="assignName" type="text" id="assignName"
											value=""/> <label for="assignName">과제명</label>
											<input type="hidden" value="" id="openSubCode" name="openSubCode">
									</div>
								</div>
							</div>
							<div class="mt-4 mb-0">
								<div class="d-grid">
									<input type="submit" id="btSend" class="btn btn-primary btn-block" value="등록">
								</div>
							</div>
						</form>
					</div>
				</div>
				</div>
					<div class="col-xl-6">
					<div class="card mb-4">
						<div class="card-header">
							<i class="far fa-file-alt"></i> 전체보기
						</div>
						<div class="card-body" style="height:450px">
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
												<a href="${pageContext.request.contextPath }/professor/assign/assignmentCheck?openSubCode=${map['OPEN_SUB_CODE'] }&assignNo=${map['ASSIGN_NO'] }" onclick="">${map['ASSIGN_NAME'] }</a></td>
												<td><fmt:formatDate value="${map['REG_DATE'] }" pattern="yyyy-MM-dd" /></td>
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
<script	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<%@ include file="../../inc/bottom.jsp"%>
