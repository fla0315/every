<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../inc/student_top.jsp" %>

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
                                        <input type="text" >
                                    </td>

									<td style="padding-left:10px"><span class=""><label for="학기">이름</label></span></td>
                                    <td>
                                        <input type="text" >
                                    </td>


									<td>
                                        <button>조회</button>
                                        <button>출력</button>
                                    </td>
								</tr>
								
                                <!-- 2행완료 -->
                            </table>
							
							<hr>
							
							<table border="0" cellpadding="0" cellspacing="0" style="width:70%;">

							<tr>

								<td><span class=""><label for="학기">학번</label></span></td>
								<td>
									<input type="text" style="width: 50%;">
								</td>


								<td><span class=""><label for="학기" >이름</label></span></td>
								<td>
									<input type="text" style="width: 50%">
								</td>
								
								<td><span class=""><label for="학기">학년</label></span></td>
								<td>
								<input type="text" style="width: 50%">
								</td>
								
							</tr>
								
							<tr>
								<td><span class=""><label for="학기">학부(과)</label></span></td>
								<td>
									<input type="text" style="width: 50%">
								</td>

								<td><span class=""><label for="학기">전공</label></span></td>
								<td>
									<input type="text" style="width: 50%">
								</td>

							</tr>

						</table>

                            <hr> <br>


                            <div class="table-wrapper-scroll-y my-custom-scrollbar">
                                <table class="table table-bordered table-striped mb-0">
                                <thead>
                                <tr>
                                    <th scope="col">학기</th>
                                    <th scope="col">이수구분</th>
                                    <th scope="col">과목코드</th>
                                    <th scope="col">과목명</th>
                                    <th scope="col">학점</th>
                                    <th scope="col">담당교수</th>
                                    <th scope="col">재수강(년도/학기/과목/등급)</th>
                                    <th scope="col">요일/교시</th>
                                </tr>
                                </thead>
                                <tbody>
                                    
                                    <tr>
                                        <td>학기</td>
                                        <td>이수구분</td>
                                        <td>과목코드</td>
                                        <td>과목명</td>
                                        <td>학점</td>
                                        <td>담당교수</td>
                                        <td>재수강(년도/학기/과목/등급)</td>
                                        <td>요일/교시</td>
                                        
                                    </tr>

                                </tbody>
                            </table>
                            
                            </div>






<%@ include file="../inc/bottom.jsp" %>        
