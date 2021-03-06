<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/student_top.jsp"%>

<script type="text/javascript">
	$(function(){
		var openSubCode = []
		$('#btCTR').click(function(){
			$(".cart .cart_code span").each(function(idx,item){
				var id = $(this).text();
				openSubCode.push(id);
				
			});
			//여기서 나온 값을 컨트롤러로 보낼 것
			console.log(openSubCode);
			$.ajax({
				url : "<c:url value='/registration/request_registrationCartInsert'/>",
				type : "post",
				dataType : "json",
				data: "openSubCode="+openSubCode,
				success : function(data){
					alert('성공');
					location.reload();
				},
				error : function(){
					alert('수강신청 성공');
					location.reload();
				}
			});
		});
	});  
</script>


<div class="container-fluid px-4" style="background-color: white;">
	<h4 class="mt-4" style="background-color: white;">수강신청</h4>


	<div class="card mb-4">
		<div class="card-body">

			<table border="0" cellpadding="0" cellspacing="0"
				style="width: 100%;">
				<tr>
					<td class="">
						<!-- ********************** 검색조건 테이블 시작 ********************** -->
						<table border="0" cellspacing="5">
							<tr>
								<!-- 년도는 5개로 고정 -->
								<td><span class=""><label for="년도">년도</label></span></td>
								<td>
									<!-- 년도  -->
									<div id="">
										<select>
											<option value=''>2021</option>
										</select>

									</div>
								</td>

								<!-- 학기 -->
								<td style="padding-left: 10px"><span class=""><labelfor="학기">학기</label></span></td>

								<td><select id="searchCptnDcd" name="searchCptnDcd"
									class="ctl_select" tabindex="1" title="이수구분">
										<option value="">1학기</option>
								</select></td>

								<td style="padding-left: 10px"><span class=""><label
										for="학년">학년</label></span></td>
								<td><select style="vertical-align: middle;"
									id="searchCuriShyy" name="searchCuriShyy" title="학년" class=""
									notnull="true">
										<option value="">ALL</option>
										<option value="">1</option>
										<option value="">2</option>
										<option value="">3</option>
										<option value="">4</option>
								</select></td>

								<!-- 이수구분 -->
								<td><span class="ctl_label"> <label
										for="searchCptnDcd">이수구분</label></span></td>
								<td><select id="searchCptnDcd" name="searchCptnDcd"
									class="ctl_select" tabindex="1" title="이수구분">
										<option value="">ALL</option>
										<c:forEach var="typeMap" items="${typeMap }">
											<option value="${typeMap['TYPE_CODE']}">${typeMap['TYPE'] }</option>
										</c:forEach>
								</select></td>
							</tr>
							<!-- 1행 완료 -->

							<!-- 2행 시작 -->
							<tr>
								<td><span class=""><label for="학과">학과</label></span></td>

								<td><select id="searchCptnDcd" name="searchCptnDcd"
									class="ctl_select" tabindex="1" title="이수구분">
										<option value="">ALL</option>
										<c:forEach var="fMap" items="${facultyMap }">
											<option value="${fMap['FACULTY_NO']}">${fMap['FACULTY_NAME'] }</option>
										</c:forEach>
								</select></td>

								<%--  <td style="padding-left:10px"><span class=""><label for="전공">전공</label></span></td>
                                    <td>
                                          <select id="searchCptnDcd" name="searchCptnDcd" class="ctl_select" tabindex="1" title="이수구분">
									            <option value="">ALL</option>
									            <c:forEach var="fMap" items="${facultyMap }">
										            <option value="${fMap['FACULTY_NO']}">${fMap['FACULTY_NAME'] }</option>            	
									            </c:forEach>                     
                                        </select>
                                    </td> --%>


								<td style="padding-left: 10px"><span class="ctl_label">
										<label for="searchSbNo">교과목번호/명</label>
								</span></td>

								<td><input type="text" id="searchSbNo" name="searchSbNo"
									value="" class="ctl_input" title="교과목번호/명" style="width: 60px"
									size="30" tabindex="1" />
									<button>
										<i class="fas fa-search"></i>
									</button> 
									<input type="text" id="searchNm" name="searchNm" value="" class="ctl_input" style="width: 120px" readonly="readonly" size="30" tabindex="2" /></td>

								<td><input type="button" value="조회"></td>

							</tr>
							<!-- 2행완료 -->

						</table>

						<hr> <br>
						<div class="table-wrapper-scroll-y my-custom-scrollbar">
							<table class="table table-bordered table-striped mb-0">
								<thead>
									<tr>
										<th scope="col">수강신청</th>
										<th scope="col">년도</th>
										<th scope="col">학기</th>
										<th scope="col">과목명</th>
										<th scope="col">학부(과)</th>
										<th scope="col">학년</th>
										<th scope="col">이수구분</th>
										<th scope="col">학점</th>
										<th scope="col">총원</th>
										<th scope="col">담당교수</th>
										<th scope="col">강의실/시간</th>
										<th scope="col">강의계획서</th>
									</tr>
								</thead>
								<tbody>

									<!-- 데이터 없을 때  -->
									<c:if test="${empty list }">
										<tr>
											<td colspan="6" class="align_center">개설된 과목이 없습니다.</td>
										</tr>
									</c:if>

									<c:if test="${!empty list }">
										<c:forEach var="map" items="${list }">
											<tr class="align_center">



												<td>
													<form name="frmRegistration" method="post"
														action="<c:url value='/registration/request_registrationInsert'/>">
														<input type="hidden" name="openSubCode"
															value="${map['OPEN_SUB_CODE'] }"> <input
															type="submit" value="수강신청" class="buttons">
													</form>
												</td>
												<!-- 년도 -->
												<td><fmt:formatDate value="${map['OPEN_DATE']}"
														pattern="yyyy" /></td>
												<!-- 학기 -->
												<td>${map['SEMESTER'] }</td>
												<!-- 과목명 -->
												<td>${map['SUBJ_NAME'] }</td>
												<!-- 학부(과)  -->
												<td>${map['FACULTY_NAME'] }</td>
												<!-- 학년 -->
												<!-- 이수구분 -->
												<td>${map['GRADE'] }</td>
												<!-- 이수구분 -->
												<td>${map['TYPE'] }</td>
												<!-- 학점 -->
												<td>${map['CREDIT'] }</td>
												<!-- 총원 -->
												<td>1 / ${map['PERSONNEL'] }</td>
												<!-- 담당교수 -->
												<td>${map['PROF_NAME'] }</td>
												<!-- 강의실/시간 -->
												<td>${map['TIMETABLE'] }</td>
												<!-- 강의계획서 -->
												<td><input type="button" id="btSyllabus" value="강의계획서"></td>
											</tr>
										</c:forEach>
									</c:if>
								</tbody>
							</table>
						</div> <!-- --------------------------------------------------------------수강신청을 위한 개설교과목 조회 끝---------------------------------------------------------------------  -->





						<br>
					<hr>
						<h4 class="mt-4" style="background-color: white;">수강신청</h4> <br>
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
						</div> <!-- --------------------------------------------------------------여기서부터 장바구니---------------------------------------------------------------------  -->


						<br>
					<hr>
						<h4 class="mt-4" style="background-color: white;">장바구니</h4> <br>
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
										<th scope="col">강의실/시간</th>
									</tr>
								</thead>
								<tbody>

									<!-- 데이터 없을 때  -->
									<c:if test="${empty Clist }">
										<tr>
											<td colspan="9" class="align_center">장바구니가 비었습니다</td>
										</tr>
									</c:if>

									<c:if test="${!empty Clist }">
										<c:forEach var="CMap" items="${Clist }">
											<tr class="align_center cart">

												<td style="display: none;" class="cart_code">
													 <span>${CMap['OPEN_SUB_CODE']}</span>
												</td>
												<!-- 년도 -->
												<td>${CMap['SUBJ_YEAR']}</td>
												<!-- 학기 -->
												<td>${CMap['SEMESTER'] }</td>
												<!-- 과목명 -->
												<td>${CMap['SUBJ_NAME'] }</td>
												<!-- 학부(과)  -->
												<td>${CMap['FACULTY_NAME'] }</td>
												<!-- 학년 -->
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
									<tr>
										<td colspan="9">
											<form name="frmCartInsert" method="post"
												action="<c:url value='/registration/request_registrationCartInsert'/>">
												<input type="button" id="btCTR" value="수강신청">
											</form>
										</td>
									</tr>

								</tbody>
							</table>
						</div> <%@ include file="../inc/bottom.jsp"%>