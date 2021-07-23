<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../inc/student_top.jsp" %>


<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.6.0.min.js'/>"></script>
<script type="text/javascript">
	
	$(function(){
		
		$('#search').click(function(){
			var sum =0;
			var count=0;
			$('tr #credit').each(function(idx,item){
				sum += Number($(this).text());
			});
			$('input[name=sumCredit]').val(sum);
			
			
			$('tr #credit').each(function(idx,item){
				count+=1;
			});
			$('input[name=sumCount]').val(count);
			
		});	
	}); 
	

</script>


   <div class="container-fluid px-4" style="background-color: white;">
        <h4 class="mt-4" style="background-color: white;">수강신청내역조회</h4>
        
        <!-- 개설교과과정 조회 페이지 -->
        <div class="card mb-4">
            <div class="card-body">
                
			
                <table border="0" cellpadding="0" cellspacing="0" style="width:100%;">
                    <tr>
                        <td class="">
                        
                            <!-- ********************** 검색조건 테이블 시작 ********************** -->
                            <table border="0" cellspacing="5">
                                <tr>
                                    <td><span class=""><label for="년도">년도</label></span></td>
                                    <td>
                                        <div id="">
                                            <select >
                                            	<option value="">- 전체 -</option>
                                                <option value=''>2021</option>
                                                <option value=''>2020</option>
                                                <option value=''>2019</option>
                                                <option value=''>2018</option>
                                            </select>
                                         
                                        </div>
                                    </td>

                                    <td style="padding-left:10px"><span class=""><label for="학기">학기</label></span></td>
                                    <td>
                                        <select id="" name="" title="학기" class="" >
                                            <option value="">- 전체 -</option>
                                            <option value="">1학기</option>
                                            <option value="">2학기</option>
                                        </select>
                                    </td>

  									<td style="padding-left:10px"><span class=""><label for="학기">학번</label></span></td>
                                    <td>
                                        <input type="text" value="${map['STU_NO']}" readonly>
                                    </td>

									<td style="padding-left:10px"><span class=""><label for="학기">이름</label></span></td>
                                    <td>
                                        <input type="text" value="${map['NAME']}" readonly>
                                    </td>


									<td>
                                        <button  type="button" id="search">조회</button>
                                    </td>
								</tr>
								
                                <!-- 2행완료 -->
                            </table>
                            <hr> <br>
							<label>신청과목</label> <input  name="sumCount" type="text" value=""  readonly="readonly">
							<label>신청학점</label> <input name="sumCredit" type="text" value="" readonly="readonly"><br>

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
										<th scope="col">강의계획서</th>
									</tr>
								</thead>
                 <tbody>

									<!-- 데이터 없을 때  -->
									<c:if test="${empty list }">
									<c:set var="totalCredit" value="0" />
										<tr>
											<td colspan="6" class="align_center">개설된 과목이 없습니다.</td>
										</tr>
									</c:if>

									<c:if test="${!empty list }">
										<c:forEach var="map" items="${list }">
										<c:set var="sum" value="${map['CREDIT']}" />
											<tr class="align_center">

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
												<td id="credit">${map['CREDIT'] }</td>
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
                            </div>






<%@ include file="../inc/bottom.jsp" %>        
