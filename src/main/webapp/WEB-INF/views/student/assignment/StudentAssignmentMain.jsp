<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>EVERYHAKSA</title>
<link rel="shortcut icon" type="image⁄x-icon"
	href="${pageContext.request.contextPath}/resources/images/graduation-hat.png">
<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css"
	rel="stylesheet" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/styles.css" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"
	crossorigin="anonymous"></script>
<script type="text/javascript"
	src="<c:url value='/resources/js/jquery-3.6.0.min.js'/>"></script>

</head>
<body>
	<main>

			<!--  여기는 내가 제출한 과제들 다보여주기  -->
					<div class="col-xl-6">
					<div class="card mb-4">
						<div class="card-body" style="height:450px">
							<table class="table table-bordered table-striped mb-0" id="showTable">
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
									<c:if test="${empty AssignList }">
										<tr>
											<td colspan="4">제출한 과제가 없습니다.</td>
										</tr>
									</c:if>
									<c:if test="${!empty AssignList }">
										<c:forEach var="map" items="${AssignList }">
											<tr>
												<td>${map['OPEN_SUB_CODE'] }</td>
												<td>${map['SUBJ_NAME'] }</td>
												<td>${map['ASSIGN_NAME'] }</td>
												<td><fmt:formatDate value="${map['APPLY_DATE'] }" pattern="yyyy-MM-dd" /></td>
											</tr>
										</c:forEach>
									</c:if>
								</tbody>
							</table>
						</div>
					</div>
					
	</main>
</body>
</html>