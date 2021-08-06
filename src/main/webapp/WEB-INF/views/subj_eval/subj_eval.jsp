<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/student_top.jsp"%>

<script type="text/javascript">
$(function(){
	var num = 0;
	$('#btGrade').click(function(){
		$(".evalFlag span").each(function(idx,item){
			if($(this).text()=='[강의평가 미완료]'){
				num++
			};
		});
		if(num>0){
			alert('모든강의평가를 완료해주세요');
			event.preventDefault();
		}else{
			$("#gradeTable").show();
		}
	});
});
  
</script>


<div class="container-fluid px-4" style="background-color: white;">
	<h4 class="mt-4" style="background-color: white;">성적조회</h4>
	<br>

	<div class="card mb-4">
		<div class="card-body">

			<div class="table-wrapper-scroll-y my-custom-scrollbar">
				<table class="table table-bordered table-striped mb-0">
					<thead>
						<tr>
							<th scope="col">년도</th>
							<th scope="col">학기</th>
							<th scope="col">과목명</th>
							<th scope="col">학부(과)</th>
							<th scope="col">학년</th>
							<th scope="col">이수구분</th>
							<th scope="col">학점</th>
							<th scope="col">담당교수</th>
							<th scope="col">구분</th>
							<th scope="col">강의실/시간</th>
							<th scope="col">강의평가구분</th>
							<th scope="col">강의평가</th>
						</tr>
					</thead>
					<tbody>

						<c:forEach var="gMap" items="${Glist }">
							<c:set var="count" value="${gMap[COUNT]}" />
						</c:forEach>

						<!-- 데이터 없을 때  -->
						<c:if test="${empty Mylist }">
							<tr>
								<td colspan="6" class="align_center">개설된 과목이 없습니다.</td>
							</tr>
						</c:if>


						<c:if test="${!empty Mylist }">
							<c:forEach var="myMap" items="${Mylist }">
								<tr class="align_center">
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
									<!-- 강의평가구문 -->
									<td>${myMap['CLASSIFICATION'] }</td>
									<!-- 강의실/시간 -->
									<td>${myMap['TIMETABLE'] }</td>
									<!-- 강의평가구분 -->
									<td class="evalFlag">
										<c:if test="${myMap['LECTURE_EVAL_FLAG']=='Y'}">
											<span>[강의평가 완료]</span>						
										</c:if>		
										<c:if test="${myMap['LECTURE_EVAL_FLAG']=='N'}">
											<span>[강의평가 미완료]</span>						
										</c:if>		
									</td>
									
									<td>
										<%-- <form name="frmRegistration" method="post"	action="<c:url value='/subj_eval/subj_eval_survey?openSubCode='/>${myMap['OPEN_SUB_CODE'] }"> --%>
										<form name="frmRegistration" method="post"
											onclick="window.open('${pageContext.request.contextPath }/subj_eval/subj_eval_survey?openSubCode=${myMap['OPEN_SUB_CODE'] }', 'detail', 'top=100, left=600, width=800, height=600, location=yes, resizable=yes')">
											<input type="hidden" name="openSubCode"
												value="${myMap['OPEN_SUB_CODE'] }"> <input
												type="submit" id="btSurvey" value="강의평가" class="buttons">
										</form>
									</td>
								</tr>
							</c:forEach>
						</c:if>
					</tbody>
				</table>
			</div>
		</div>
	</div>


	<!-- --------------------------------------------------------------성적조회---------------------------------------------------------------------  -->








	<br>
	<hr>
	<h4 class="mt-4"  style="background-color: white;">성적조회</h4>
	<form name="frmSearchGrade" method="post" action="<c:url value='/subj_eval/searchMyGrade'/>">
		<input type="button" id="btGrade" value="성적조회">
	<br>

	<div class="table-wrapper-scroll-y my-custom-scrollbar">
		<table class="table table-bordered table-striped mb-0" id="gradeTable" style="display: none;">
			<thead>
				<tr>
					<th scope="col">년도</th>
					<th scope="col">학기</th>
					<th scope="col">과목코드</th>
					<th scope="col">과목명</th>
					<th scope="col">담당교수</th>
					<th scope="col">이수구분</th>
					<th scope="col">학점</th>
					<th scope="col">실점</th>
					<th scope="col">평점</th>
					<th scope="col">표기성적</th>
					<th scope="col">개설학과</th>
				</tr>
			</thead>
			<tbody>

				<!-- 데이터 없을 때  -->
				<c:if test="${empty MyGradeList }">
					<tr>
						<td colspan="9" class="align_center">성적 조회를 위해서는 모든 과목의 강의평가를 실시해주세요.</td>
					</tr>
				</c:if>

				<c:if test="${!empty MyGradeList }">
					<c:forEach var="gradeMap" items="${MyGradeList }">
						<tr class="align_center cart">

							<td style="display: none;" class="cart_code"><span>${gradeMap['SUB_CODE']}</span>
							</td>
							<!-- 년도 -->
							<td><fmt:formatDate value="${gradeMap['OPEN_DATE']}"
									pattern="yyyy" /></td>
							<!-- 학기 -->
							<td>${gradeMap['SEMESTER'] }</td>
							<!-- 과목코드 -->
							<td>${gradeMap['OPEN_SUB_CODE']}</td>
							<!-- 과목명 -->
							<td>${gradeMap['SUBJ_NAME'] }</td>
							<!-- 담당교수 -->
							<td>${gradeMap['PROF_NAME'] }</td>
							<!-- 이수구분 -->
							<td>${gradeMap['TYPE'] }</td>
							<!-- 학점 -->
							<td>${gradeMap['CREDIT'] }</td>
							<!-- 실점 -->
							<td>${gradeMap['TOTAL_GRADE'] }</td>
							
							<!-- 평점 a,b,c -->
							<td>
								<c:if test="${!empty gradeMap['TOTAL_GRADE']}">
                  					<fmt:parseNumber var="grade" type="number" value="${gradeMap['TOTAL_GRADE'] }" integerOnly="true"/>
                  					<c:choose>
                  						<c:when test="${grade>=95 }">
                  							A+
                  						</c:when>
                  						<c:when test="${grade>=90 }">
                  							A
                  						</c:when>
                  						<c:when test="${grade>=85 }">
                  							B+
                  						</c:when>
                  						<c:when test="${grade>=80 }">
                  							B
                  						</c:when>
                  						<c:when test="${grade>=75 }">
                  							C+
                  						</c:when>
                  						<c:when test="${grade>=70 }">
                  							C
                  						</c:when>
                  						<c:when test="${grade>=60 }">
                  							D
                  						</c:when>
                  						<c:when test="${grade<60 }">
                  							F
                  						</c:when>
                  					</c:choose>
                  				</c:if>
							</td>
							<!-- 표기성적 -->
							<td>
								<c:if test="${!empty gradeMap['TOTAL_GRADE']}">
                  					<fmt:parseNumber var="grade" type="number" value="${gradeMap['TOTAL_GRADE'] }" integerOnly="true"/>
                  					<c:choose>
                  						<c:when test="${grade>=95 }"> <!-- A+ -->
                  							4.5
                  						</c:when>
                  						<c:when test="${grade>=90 }"> <!-- A -->
                  							4.0
                  						</c:when>
                  						<c:when test="${grade>=85 }"> <!-- B+ -->
                  							3.5
                  						</c:when>
                  						<c:when test="${grade>=80 }"> <!-- B -->
                  							3.0
                  						</c:when>
                  						<c:when test="${grade>=75 }"> <!-- C+ -->
                  							2.5
                  						</c:when>
                  						<c:when test="${grade>=70 }"> <!-- C -->
                  							2.0
                  						</c:when>
                  						<c:when test="${grade>=60 }"> <!-- D -->
                  							1.0
                  						</c:when>
                  						<c:when test="${grade<60 }"> <!-- f -->
                  							0
                  						</c:when>
                  					</c:choose>
                  				</c:if>
							</td>
							<!-- 개설학과 학부 -->
							<td>${gradeMap['FACULTY_NAME'] }</td>
						</tr>
					</c:forEach>
				</c:if>
			</tbody>
		</table>
		</form>
	</div>





















	<%@ include file="../inc/bottom.jsp"%>