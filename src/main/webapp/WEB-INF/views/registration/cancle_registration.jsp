<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/student_top.jsp"%>

<script type="text/javascript">
	$(function() {
	});
</script>


<div class="container-fluid px-4" style="background-color: white;">
	<h4 class="mt-4" style="background-color: white;">수강취소</h4>


	<div class="card mb-4">
		<div class="card-body">

			<div class="table-wrapper-scroll-y my-custom-scrollbar">
				<table class="table table-bordered table-striped mb-0">
					<thead>
						<tr>
							<th scope="col">취소</th>
							<th scope="col">년도</th>
							<th scope="col">학기</th>
							<th scope="col">과목명</th>
							<th scope="col">학부(과)</th>
							<th scope="col">학년</th>
							<th scope="col">이수구분</th>
							<th scope="col">학점</th>
							<th scope="col">담당교수</th>
							<th scope="col">강의실/시간</th>
						</tr>
					</thead>
					<tbody>

						<!-- 데이터 없을 때  -->
						<c:if test="${empty Mylist }">
							<tr>
								<td colspan="6" class="align_center">개설된 과목이 없습니다.</td>
							</tr>
						</c:if>

						<c:if test="${!empty Mylist }">
							<c:forEach var="myMap" items="${Mylist }">
								<tr class="align_center">

									<td>
										<form name="frmRegistration" method="post"
											action="<c:url value='/registration/request_registrationDelete'/>">
											<input type="hidden" name="openSubCode"
												value="${myMap['OPEN_SUB_CODE'] }"> <input
												type="submit" id="btDelete" value="삭제" class="buttons">
										</form>
									</td>
									<!-- 년도 -->
									<td><fmt:formatDate value="${myMap['OPEN_DATE']}"
											pattern="yyyy" /></td>
									<!-- 학기 -->
									<td>${myMap['SEMESTER'] }</td>
									<!-- 과목명 -->
									<td>${myMap['SUBJ_NAME'] }</td>
									<!-- 학부(과)  -->
									<td>${myMap['FACULTY_NAME'] }</td>
									<!-- 학년 -->
									<!-- 이수구분 -->
									<td>${myMap['GRADE'] }</td>
									<!-- 이수구분 -->
									<td>${myMap['TYPE'] }</td>
									<!-- 학점 -->
									<td>${myMap['CREDIT'] }</td>
									<!-- 담당교수 -->
									<td>${myMap['PROF_NAME'] }</td>
									<!-- 강의실/시간 -->
									<td>${myMap['TIMETABLE'] }</td>
								</tr>
							</c:forEach>
						</c:if>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>
<!-- --------------------------------------------------------------여기서부터 장바구니---------------------------------------------------------------------  -->
<%@ include file="../inc/bottom.jsp"%>