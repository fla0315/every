<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../inc/student_top.jsp" %>

<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>

<div class="container-fluid px-4" style="background-color: white;">
	<h4 class="mt-4" style="background-color: white;">등록금 조회</h4>
	<br>

	<div class="card mb-4">
		<div class="card-body">
			<table border="0" cellpadding="0" cellspacing="0"
				style="width: 80%; margin: 0 auto;">

				<tr>
					<td><span class=""><label for="학기">학번</label></span></td>
					<td><input type="text" style="width: 50%;"></td>

					<td><span class=""><label for="학기">이름</label></span></td>
					<td><input type="text" style="width: 50%"></td>

					<td><span class=""><label for="학기">학년</label></span></td>
					<td><input type="text" style="width: 50%"></td>

				</tr>
				
				<tr>
					<td><span> &nbsp;</span></td>
				</tr>
				<tr style="margin-top: 20">
					<td><span class=""><label for="학기">학부(과)</label></span></td>
					<td><input type="text" style="width: 50%"></td>

					<td><span class=""><label for="학기">전공</label></span></td>
					<td><input type="text" style="width: 50%"></td>
					<td><span class=""><label for="학기"> </label></span></td>
					<td>
						<button>조회</button>
						<button>출력</button>

					</td>
					<!-- 등록금번호 학번 학기 금액, 납부여부, 납부일   -->
				</tr>
			</table>
		</div>
	</div>

	<hr><br>

	<div class="container">
		<table class="box2">
			<caption>등록금 조회</caption>
			<colgroup>
				<col style="width: 10%;" />
				<col style="width: 10%;" />
				<col style="width: 15%;" />
				<col style="width: 15%;" />
				<col style="width: 10%;" />
				<col style="width: 10%;" />
			</colgroup>
			<thead>
				<tr>
					<th scope="col">번호</th>
					<th scope="col">학기</th>
					<th scope="col">학번</th>
					<th scope="col">금액</th>
					<th scope="col">납입구분</th>
					<th scope="col">납부일자</th>
				</tr>
			</thead>
			<tbody>
			<input type="text" name="stuNo" value="${map['STU_NO'] }">
			 <h6>No.${map['STU_NO']}</h6><!-- 데이터 긁어올 예정 -->
				<c:if test="${empty list }">
					<tr>
						<td colspan="6" class="align_center">조회된 등록금이 없습니다.</td>
					</tr>
				</c:if>
				<c:if test="${!empty list }">
					<c:forEach var="map" items="${list }">
						<tr class="align_center">
							<td>${map['NO'] }</td>
							<td class="align_left" name="studentId">${map['STUDENT_ID'] }</td>
							<td>${map['STUDENT_ID'] }</td>
							<td>${map['TUITION'] }</td>
							<td>${map['DEPOSIT_STATE']}</td>
							<td>${map['DEPOSIT_DATE']}</td>
						</tr>
					</c:forEach>
				</c:if>
			</tbody>
		</table>
	</div>
</div>
<%@ include file="../inc/bottom.jsp" %>        
				