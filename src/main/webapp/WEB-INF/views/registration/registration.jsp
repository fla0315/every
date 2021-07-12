<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../inc/student_top.jsp" %>


				<div class="container-fluid px-4">
                        <h4 class="mt-4">개설과목조회</h4>
                        
                        
                        <div class="card mb-4">
                            <div class="card-body">
                                
        <!-- 테이블 반복 -->
            <table>
                <thead>
                <colgroup>
					<col width="60px;">
					<!-- 년도 -->
					<col width="80px;">
					<!-- 년도 -->
					<col width="80px;">
					<!-- 학기 -->
					<col width="80px;">
					<!-- 학기 -->
					<col width="80px;">
					<!-- 대학 -->
					<col width="150px;">
					<!-- 대학 -->
				</colgroup>
              	<th id="hide1">년도</th>
                 	 <td><select name="p_year" id="p_year" style="width: 100%">
						<!-- 이 부분은 추가로 DB에 날짜를 넣는 것을 추가해야할 듯  -->
                        <option value="2020">2020</option>
                        <option value="2019">2019</option>
                        <option value="2018">2018</option>
                        <option value="2017">2017</option>
                        <option value="2017">2016</option>
                        <option value="2017">2015</option>
                        <option value="2017">2014</option>
                        <option value="2017">2013</option>
                  </select></td>
                  
                  
                  
                 <th id="hide1">학기</th>
                 	 <td><select name="p_year" id="p_year" style="width: 100%">
						<!-- 계절학기 부분은 뺏음 -->
                        <option value="2020">1학기</option>
                        <option value="2019">2학기</option>
                  </select></td>
                  
                 <th id="hide1">학년</th>
                 	 <td><select name="p_year" id="p_year" style="width: 100%">
						<!-- 계절학기 부분은 뺏음 -->
                        <option value="2020">1학년</option>
                        <option value="2019">2학년</option>
                        <option value="2019">3학년</option>
                        <option value="2019">4학년</option>
                  </select></td>
                  
                  
                 <th id="hide1">이수구분</th>
                 	 <td><select name="p_year" id="p_year" style="width: 100%">
						<!-- 이 부분도 허브 할때 처럼 데이터에서 불러와야할 듯 -->
                        <option value="2020">전체</option>
                        <option value="2019">기초교양</option>
                        <option value="2019">전공심화</option>
                  </select></td>
                  
                 <th id="hide1">학부/과</th>
                 	 <td><select name="p_year" id="p_year" style="width: 100%">
						<!-- 학과의 큰 카테고리 범주-->
                        <option value="2020">항공운항학과</option>
                        <option value="2019">간호학과</option>
                  </select></td>
                  
                  
                 <th id="hide1">전공</th>
                 	 <td><select name="p_year" id="p_year" style="width: 100%">
						<!-- 학과의 큰 카테고리 범주-->
                        <option value="2020">항공운항</option>
                        <option value="2019">뭐든 전공</option>
                  </select></td>
                  
</table>
                              
                            </div>
                        </div>
                        
                        
                        
                        
                        <div class="card mb-4">
                            <div class="card-header">
                               개설과목조회
                            </div>
                            
                            
                            <div class="card-body">
                            
                            
                                <table id="datatablesSimple">
                                    <thead>
                                      <tr>
                 
					                        <th> <input type="button" value="장바구니"></th>
					                        <th>강의계획서</th>
					                        <th>년도</th>
					                        <th>학기</th>
					                        <th>과목코드</th> <!-- 경운대기준0으로 시작해서 스트링으로 변경해야할수도 -->
					                        <th>과목명</th>
					                        <th>학부(과)</th> <!-- 경호학부 -->
					                        <th>대면/비대면</th> <!-- 추가할지말지 회의 요망 -->
					                        <th>학년</th>
					                        <th>이수구분</th> <!-- 교양/핵심교양 이런거 -->
					                        <th>학점</th> <!-- 3 -->
					                        <th>시수</th> <!-- 이론3/실습0 -->
					                        <th>담당교수</th> <!-- 장익훈  -->
					                        <th>요일/교시/강의실</th> <!-- 화7, 목2,3 (제2호관 432호) -->
                  						  </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>Name</th>
                                            <th>Position</th>
                                            <th>Office</th>
                                            <th>Age</th>
                                            <th>Start date</th>
                                            <th>Salary</th>
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                      <tr>
                 
					                        <th> <input type="button" value="장바구니"></th>
					                        <th>강의계획서</th>
					                        <th>년도</th>
					                        <th>학기</th>
					                        <th>과목코드</th> <!-- 경운대기준0으로 시작해서 스트링으로 변경해야할수도 -->
					                        <th>과목명</th>
					                        <th>학부(과)</th> <!-- 경호학부 -->
					                        <th>대면/비대면</th> <!-- 추가할지말지 회의 요망 -->
					                        <th>학년</th>
					                        <th>이수구분</th> <!-- 교양/핵심교양 이런거 -->
					                        <th>학점</th> <!-- 3 -->
					                        <th>시수</th> <!-- 이론3/실습0 -->
					                        <th>담당교수</th> <!-- 장익훈  -->
					                        <th>요일/교시/강의실</th> <!-- 화7, 목2,3 (제2호관 432호) -->
                  						  </tr>
                                        
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>











<%@ include file="../inc/bottom.jsp" %>        
