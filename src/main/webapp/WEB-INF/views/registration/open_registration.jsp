<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../inc/student_top.jsp" %>

   <div class="container-fluid px-4" style="background-color: white;">
        <h4 class="mt-4" style="background-color: white;">개설과목조회</h4>
        
        
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







                                    <td style="padding-left:10px"><span class=""><label for="학년">학년</label></span></td>
                                    <td>
                                        <select style="vertical-align: middle;" id="searchCuriShyy" name="searchCuriShyy" title="학년" class="" notnull="true">
                                            <option value="">- 전체 -</option>
                                            <option value="">1학년</option>
                                            <option value="">2학년</option>
                                            <option value="">3학년</option>
                                            <option value="">4학년</option>
                                        </select>
                                    </td>


                                    <td><span class="ctl_label"><label for="searchCptnDcd">이수구분</label></span></td>
                                    
                                    <td>
                                        <select id="searchCptnDcd" name="searchCptnDcd" class="ctl_select" tabindex="1" title="이수구분">
                                            <option value = "">- 전체 -</option>
                                            <option value = "">기초교양</option>
                                            <option value = "">전공선택</option>
                                            <option value = "">필수교양</option>
                                        </select>
                                    </td>
                                </tr>
                                <!-- 1행 완료 -->

                                <!-- 2행 시작 -->
                                <tr>
                                    <td><span class=""><label for="학과">학과</label></span></td>
                                    
                                    <td>
                                        <select id="" name="" class="" tabindex="1" title="학과">
                                            <option value = "">- 전체 -</option>
                                            <option value="">항공운항</option>
                                            <option value="">간호학과</option>
                                            <option value="">컴퓨터공학과</option>
                                        </select>
                                    </td>




                                    <td style="padding-left:10px"><span class=""><label for="전공">전공</label></span></td>
                                    <td>
                                        
                                        <select id="" name="" class="" tabindex="1" title="전공" style="text-align: center;">
                                            <option value = "">- 전체 -</option>
                                            <option value="">항공운항</option>
                                            <option value="">간호학과</option>
                                            <option value="">컴퓨터공학과</option>
                                            <option value="">아동사회복지학과</option>
                                            
                                        </select>
                                    </td>


                                    <td style="padding-left:10px"><span class="ctl_label"><label for="searchSbNo">교과목번호/명</label></span></td>
                                    <td>
                                        <input type="text" id="searchSbNo" name="searchSbNo" value="" class="ctl_input" title="교과목번호/명"
                                        style="width:60px" size="30" tabindex="1" />
                                        <a href=#> <i class="fas fa-search"></i></a> 
                                        <button><i class="fas fa-search"></i></button>
                                        <input type="text" id="searchNm" name="searchNm" value="" class="ctl_input" style="width:120px"  readonly="readonly" size="30" tabindex="2" />
                                    </td>

                                    <td><input type="button" value="조회"></td>

                                </tr>
                                <!-- 2행완료 -->

                            </table>


                            <hr> <br>


                            <div class="table-wrapper-scroll-y my-custom-scrollbar">
                                <table class="table table-bordered table-striped mb-0">
                                <thead>
                                <tr>
                                    <th scope="col">장바구니</th>
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
                                    
                                    <tr>
                                        <td>장바구니</td>
                                        <td>년도</td>
                                        <td>학기</td>
                                        <td>과목명</td>
                                        <td>학부(과)</td>
                                        <td>학년</td>
                                        <td>이수구분</td>
                                        <td>학점</td>
                                        <td>담당교수</td>
                                        <td>강의실/시간</td>
                                        
                                    </tr>

                                </tbody>
                            </table>
                            
                            </div>






<%@ include file="../inc/bottom.jsp" %>        
