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
	<div class="col-xl-6">
			<div class="card mb-4">
			<div class="card-body" style="height:450px">
						<table class="table table-bordered table-striped mb-0" id="showTable">
						<thead>
							<tr>
								<th scope="col" width="25%">과목명</th>
								<th scope="col"width="25%">제목</th>
								<th scope="col" width="25%">날짜</th>
								<th scope="col"width="25%">조회수</th>
							</tr>
						</thead>
						<tbody id="noticeBody">
							<!-- 여기에 에이잭스로 뿌려줘야함 씨발!! -->
	<!-- 데이터 없을 때  -->
									<c:if test="${empty NList }">
										<tr>
											<td colspan="4" class="align_center">공지사항이 없습니다.</td>
										</tr>
									</c:if>

									<c:if test="${!empty NList }">
										<c:forEach var="notice" items="${NList }">
												<tr class="align_center">
												<!-- 년도 -->
												<td>${notice['SUBJ_NAME']}</td>
												<td>${notice['TITLE']}</td>
												<!-- 학기 -->
												<td>${notice['REG_DATE'] }</td>
												<td>${notice['READ_COUNT'] }</td>
											</tr>
										</c:forEach>
									</c:if>
						</tbody>

					</table>
				</div>
			</div>

		</div>
	</main>
</body>
</html>