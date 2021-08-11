<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../inc/student_top.jsp" %>


<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.6.0.min.js'/>"></script>
<script type="text/javascript">
	
	$(function(){
	
		
		
		
	}); 
	

</script>

	<div class="card mb-4">
		<div class="card-body">
						<h4 class="mt-4" style="background-color: white;">장바구니</h4> <br>
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
									<c:if test="${empty Clist }">
										<tr>
											<td colspan="6" class="align_center">개설된 과목이 없습니다.</td>
										</tr>
									</c:if>

									<c:if test="${!empty Clist }">
										<c:forEach var="CMap" items="${Clist }">
												<tr class="align_center">
											
											<td>
												<form name="frmCart" method="post" action="<c:url value='/registration/open_registrationCartDelete'/>">
													<input type="hidden" name="openSubCode"  value="${CMap['OPEN_SUB_CODE'] }">
													<input type="submit" id="btDelete" value="취소" class="buttons">
												</form>
											</td>
												<!-- 년도 -->
												<td>${CMap['OPEN_YEAR']}</td>
												<!-- 학기 -->
												<td>${CMap['SEMESTER'] }</td>
												<!-- 과목명 -->
												<td>${CMap['SUBJ_NAME'] }</td>
												<!-- 학부(과)  -->
												<td>${CMap['DEPT_NAME'] }</td>
												<!-- 학년 -->
												<!-- 이수구분 -->
												<td>${CMap['GRADE'] }</td>
												<!-- 이수구분 -->
												<td>${CMap['TYPE'] }</td>
												<!-- 학점 -->
												<td>${CMap['CREDIT'] }</td>
												<!-- 담당교수 -->
												<td>${CMap['PROF_NAME'] }</td>
												<!-- 강의실/시간 -->
												<td>${CMap['TIMETABLE'] }</td>
											</tr>
										</c:forEach>
									</c:if>
								</tbody>
							</table>
						</div>
			</div></div>

						






<%@ include file="../inc/bottom.jsp" %>        
